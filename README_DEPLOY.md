# Despliegue en GitHub Pages

## ✅ Despliegue Automático (Recomendado)

El sitio se despliega **automáticamente** cada vez que haces push a la rama `main` gracias a GitHub Actions.

### ¿Cómo funciona?

1. **Haces cambios** en los archivos Markdown (`docs/*.md`)
2. **Haces commit y push:**
   ```bash
   git add .
   git commit -m "Descripción de cambios"
   git push origin main
   ```
3. **GitHub Actions construye y despliega automáticamente** en 2-3 minutos
4. El sitio se actualiza en: `https://fjavier-hernandez.github.io/pi_asir/`

### Verificar el despliegue

- Ve a la pestaña **Actions** en GitHub para ver el progreso
- Si el workflow falla, revisa los logs en la pestaña Actions

---

## ⚠️ Despliegue Manual (Solo si es necesario)

**NO es necesario hacer deploy manual** si el workflow automático está funcionando.

Si necesitas hacer un deploy manual por alguna razón:

```bash
# Asegúrate de tener las dependencias instaladas
pip install -r requirements.txt

# Hacer deploy
mkdocs gh-deploy --force
```

### Solución de problemas comunes

#### Error: "fatal: refusing to merge unrelated histories"

Si aparece este error, el workflow automático lo maneja automáticamente con `--force`.

#### Error: "Permission denied"

Asegúrate de que tu token de Git tenga permisos de escritura en el repositorio.

#### El sitio no se actualiza

1. Verifica que el workflow de GitHub Actions se ejecutó correctamente
2. Ve a **Settings → Pages** en GitHub y verifica que la fuente sea `gh-pages`
3. Espera 1-2 minutos adicionales para que se propague el cambio

---

## 📝 Notas Importantes

- **No edites manualmente** el contenido de la rama `gh-pages` - se sobrescribe automáticamente
- Los archivos en el directorio `site/` están en `.gitignore` porque se generan automáticamente
- Si haces cambios locales, siempre haz push a `main` y deja que GitHub Actions haga el deploy

---

## 🔧 Configuración del Workflow

El workflow está configurado en `.github/workflows/ci.yml` y:
- Se ejecuta automáticamente en cada push a `main`
- Puede ejecutarse manualmente desde la pestaña Actions (botón "Run workflow")
- Usa `mkdocs gh-deploy --force` para evitar conflictos

