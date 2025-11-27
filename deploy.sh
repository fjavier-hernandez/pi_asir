#!/bin/bash
# Script para desplegar MkDocs a GitHub Pages
# NOTA: Este script es solo para despliegues manuales.
# El despliegue automático se hace mediante GitHub Actions.

set -e

echo "🚀 Iniciando despliegue manual de MkDocs a GitHub Pages..."
echo ""

# Verificar que estamos en la rama main
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  Advertencia: No estás en la rama main (estás en: $CURRENT_BRANCH)"
    read -p "¿Continuar de todos modos? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Despliegue cancelado"
        exit 1
    fi
fi

# Verificar que no hay cambios sin commitear
if ! git diff-index --quiet HEAD --; then
    echo "⚠️  Advertencia: Tienes cambios sin commitear"
    echo "   Es recomendable hacer commit de tus cambios antes de desplegar"
    read -p "¿Continuar de todos modos? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Despliegue cancelado"
        exit 1
    fi
fi

# Verificar que requirements.txt existe
if [ ! -f "requirements.txt" ]; then
    echo "❌ Error: No se encuentra requirements.txt"
    echo "   Asegúrate de estar en el directorio raíz del proyecto"
    exit 1
fi

# Verificar que mkdocs.yml existe
if [ ! -f "mkdocs.yml" ]; then
    echo "❌ Error: No se encuentra mkdocs.yml"
    echo "   Asegúrate de estar en el directorio raíz del proyecto"
    exit 1
fi

echo "📦 Instalando dependencias..."
pip install -q -r requirements.txt

echo ""
echo "🔨 Construyendo y desplegando el sitio..."
mkdocs gh-deploy --force --message "Manual deploy: $(date '+%Y-%m-%d %H:%M:%S')"

echo ""
echo "✅ Despliegue completado!"
echo "   El sitio debería estar disponible en unos minutos en:"
echo "   https://fjavier-hernandez.github.io/pi_asir/"
echo ""
echo "💡 Nota: Para despliegues automáticos, simplemente haz push a main"
echo "   y GitHub Actions se encargará del resto."

