# Snackbar Flutter - Web Demo

This folder contains the production build of the interactive demo for Snackbar Flutter package.

## 🚀 Deployment Instructions

### Option 1: Root Directory
If deploying to root (e.g., `https://yourdomain.com/`):
1. Update `index.html` line 16:
   ```html
   <base href="/">
   ```
2. Upload all files to your hosting root directory

### Option 2: Subdirectory
If deploying to a subdirectory (e.g., `https://yourdomain.com/snackbar_flutter/`):
1. Update `index.html` line 16:
   ```html
   <base href="/snackbar_flutter/">
   ```
   Replace `/snackbar_flutter/` with your actual subdirectory path.
   **Important:** Path must start AND end with `/`

2. Upload all files to your subdirectory

### Option 3: GitHub Pages
Already configured for `/snackbar_flutter/` path. Just enable GitHub Pages from repository settings.

## 📁 What to Upload

Upload **ALL** files and folders in this directory:
- index.html
- main.dart.js
- flutter.js
- flutter_bootstrap.js
- flutter_service_worker.js
- version.json
- manifest.json
- favicon.png
- assets/ (folder)
- canvaskit/ (folder)
- icons/ (folder)

## 🔧 Troubleshooting

**Issue:** Blank white screen or assets not loading
**Solution:** Check that base href in index.html matches your actual URL path

**Issue:** 404 errors in console
**Solution:** Ensure all files are uploaded and paths are correct

## 📝 After Deployment

Once deployed, update the package README.md with your live demo URL:
```markdown
[![Live Demo](https://img.shields.io/badge/Live-Demo-blue?style=for-the-badge&logo=flutter)](YOUR_DEMO_URL)
```
