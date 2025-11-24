## 1.0.1

* 🐛 **Bug Fixes:**
  - Fixed unnecessary import in custom_snackbar.dart
  - Applied Dart formatter to all files
  - Improved static analysis score (50/50)

## 1.0.0

* 🎉 **First stable release!**
* ✨ **New Features:**
  - Custom dismiss directions (left, right, top, bottom, any)
  - Text color customization (title & message colors)
  - Font size customization (title & message)
  - Font weight customization (title & message)
  - Custom builder support for complete design control
* 📱 **Interactive Web Demo:**
  - Live demo with iPhone 17 Pro Max frame
  - Real-time style testing in browser
  - All 24 styles showcased
* 🐛 **Bug Fixes:**
  - Fixed yellow underline issue on text widgets
  - Improved text decoration handling
* 📚 **Documentation:**
  - Comprehensive README with all features
  - Live demo link for interactive testing
  - Complete API documentation

## 0.0.2

* Added `replaceExisting` parameter to control multiple snackbars
  - Default is `true` - only one snackbar at a time (previous one is removed)
  - Set to `false` to allow multiple snackbars simultaneously
* Added `CustomSnackBar.dismiss()` method to manually dismiss current snackbar
* Updated example app with toggle control for replace existing feature

## 0.0.1

* Initial release with 24 different snackbar styles
* 10 predefined types (Success, Error, Warning, Info, Primary, Secondary, Dark, Light, Gradient, Custom)
* Flexible positioning (Top/Bottom)
* Smooth animations (slide, fade, scale)
* Interactive features (dismissible, tap callbacks, action buttons)
* Fully customizable (colors, icons, titles, messages)
* Lightweight with no external dependencies
