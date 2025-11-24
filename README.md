# Snackbar Flutter

A highly customizable Flutter package for displaying beautiful snackbar notifications with **24 different pre-built styles**. From classic designs to modern glassmorphism, neon effects, and pixel art - this package has it all!

[![Live Demo](https://img.shields.io/badge/Live-Demo-blue?style=for-the-badge&logo=flutter)](https://goutam.uk/snackbar_flutter/)

## 🎯 Try it Live!

**[👉 Click here for Interactive Demo](https://goutam.uk/snackbar_flutter/)**

Test all 24 snackbar styles in your browser! The demo includes:
- 📱 iPhone 17 Pro Max frame preview
- 🎨 Real-time style switching
- 🎭 Customizable colors, positions, and dismiss directions
- ⚙️ All configuration options

## 📁 Package Structure

The package is organized with clean separation of concerns:

```
lib/
├── snackbar_flutter.dart          # Main library export file
└── src/
    ├── custom_snackbar.dart        # Main CustomSnackBar class
    ├── enums/
    │   ├── snackbar_type.dart      # Type enums (success, error, etc.)
    │   ├── snackbar_position.dart  # Position enums (top, bottom)
    │   └── snackbar_style.dart     # Style enums (24 styles)
    ├── widgets/
    │   └── snackbar_widget.dart    # Main snackbar widget with animations
    ├── styles/
    │   ├── all_styles.dart         # All 24 style implementations
    │   └── style_factory.dart      # Factory to build styles
    ├── painters/
    │   ├── bubble_tail_painter.dart
    │   ├── stripe_painter.dart
    │   └── dot_pattern_painter.dart
    ├── clippers/
    │   └── diagonal_clipper.dart
    └── utils/
        └── snackbar_helpers.dart   # Helper methods for colors/icons/titles
```

## ✨ Features

- 🎨 **24+ Pre-built Styles**: Classic, Frosted, Minimal, Gradient, Floating, Material You, iOS, Outlined, Compact, Expanded, Icon Only, Neon, Neumorphic, Card, Pill, Banner, Grunge, Bubble, Striped, Pixel, Glass, 3D, Dotted, and Diagonal
- 🎯 **10 Built-in Types**: Success, Error, Warning, Info, Primary, Secondary, Dark, Light, Gradient, and Custom
- 📍 **Flexible Positioning**: Top or Bottom
- 🎭 **Smooth Animations**: Slide, fade, and scale animations
- 👆 **Interactive**: Dismissible by swipe (left, right, top, bottom, any direction), tap callbacks, and action buttons
- 🎨 **Fully Customizable**: Custom colors, icons, titles, messages, fonts, and complete custom builders
- 🎨 **Text Customization**: Custom title & message colors, font sizes, and font weights
- 🚀 **Easy to Use**: Simple one-line implementation
- ⚡ **Lightweight**: No external dependencies except Flutter
- 🌐 **Live Demo**: Interactive web demo available at [goutam.uk/snackbar_flutter](https://goutam.uk/snackbar_flutter/)
- 📦 **Repository**: [GitHub](https://github.com/goutam2597/snackbar_flutter)

## 📱 Demo

**[🌐 Try the Interactive Web Demo](https://goutam.uk/snackbar_flutter/)**

Preview all 24 styles with iPhone frame, real-time customization, and all configuration options!

## 🚀 Getting Started

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  snackbar_flutter: ^0.0.1
```

Or install it from the command line:

```bash
flutter pub add snackbar_flutter
```

### Import

```dart
import 'package:snackbar_flutter/snackbar_flutter.dart';
```

## 📖 Usage

### Basic Usage

```dart
CustomSnackBar.show(
  context: context,
  message: 'This is a success message!',
  type: SnackBarType.success,
  style: SnackBarStyle.classic,
);
```

### With All Options

```dart
CustomSnackBar.show(
  context: context,
  message: 'Your profile has been updated successfully!',
  type: SnackBarType.success,
  style: SnackBarStyle.gradient,
  position: SnackBarPosition.top,
  duration: const Duration(seconds: 4),
  title: 'Profile Updated',
  customIcon: Icons.person,
  customColor: Colors.purple,
  onTap: () {
    print('Snackbar tapped!');
  },
  actionLabel: 'UNDO',
  onActionPressed: () {
    print('Action button pressed!');
  },
  dismissible: true,
  width: 350,
  margin: EdgeInsets.all(20),
  replaceExisting: true, // Only one snackbar at a time
  dismissDirection: SnackBarDismissDirection.left, // Dismiss by swiping left
  titleColor: Colors.white,
  messageColor: Colors.white70,
  titleFontSize: 16,
  messageFontSize: 14,
  titleFontWeight: FontWeight.bold,
  messageFontWeight: FontWeight.normal,
);
```

### With Custom Builder (Full Control)

```dart
CustomSnackBar.show(
  context: context,
  message: 'Custom message',
  title: 'Custom title',
  customBuilder: (context, title, message, color, icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(message, style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
```

## 🎨 Available Styles

### 1. Classic
Traditional filled design with icon and title
```dart
style: SnackBarStyle.classic
```

### 2. Frosted Glass
Modern glassmorphism effect
```dart
style: SnackBarStyle.frosted
```

### 3. Minimal
Clean design with left border accent
```dart
style: SnackBarStyle.minimal
```

### 4. Gradient
Beautiful gradient background
```dart
style: SnackBarStyle.gradient
```

### 5. Floating
Elevated with prominent shadow
```dart
style: SnackBarStyle.floating
```

### 6. Material You
Google Material Design 3 style
```dart
style: SnackBarStyle.material
```

### 7. iOS Style
Apple iOS notification style
```dart
style: SnackBarStyle.ios
```

### 8. Outlined
Transparent with colored border
```dart
style: SnackBarStyle.outlined
```

### 9. Compact
Single-line minimal space
```dart
style: SnackBarStyle.compact
```

### 10. Expanded
Large with action button support
```dart
style: SnackBarStyle.expanded
```

### 11. Icon Only
Just the icon, no text container
```dart
style: SnackBarStyle.iconOnly
```

### 12. Neon Glow
Glowing neon effect
```dart
style: SnackBarStyle.neon
```

### 13. Neumorphic
Soft 3D neumorphic design
```dart
style: SnackBarStyle.neumorphic
```

### 14. Card
Material card with elevation
```dart
style: SnackBarStyle.card
```

### 15. Pill
Rounded pill shape
```dart
style: SnackBarStyle.pill
```

### 16. Banner
Full-width banner style
```dart
style: SnackBarStyle.banner
```

### 17. Grunge
Bold textured appearance
```dart
style: SnackBarStyle.grunge
```

### 18. Bubble
Chat bubble with tail
```dart
style: SnackBarStyle.bubble
```

### 19. Striped
Diagonal stripe pattern
```dart
style: SnackBarStyle.stripe
```

### 20. Pixel Art
Retro pixel game style
```dart
style: SnackBarStyle.pixel
```

### 21. Glass
Advanced glassmorphism
```dart
style: SnackBarStyle.glass
```

### 22. 3D Effect
Three-dimensional shadow
```dart
style: SnackBarStyle.threeDimensional
```

### 23. Dotted
Polka dot pattern
```dart
style: SnackBarStyle.dotted
```

### 24. Diagonal Cut
Angular diagonal edges
```dart
style: SnackBarStyle.diagonal
```

## 🎯 Types

Choose from 10 predefined types, each with its own color and icon:

```dart
SnackBarType.success   // Green - Checkmark
SnackBarType.error     // Red - Error icon
SnackBarType.warning   // Orange - Warning icon
SnackBarType.info      // Blue - Info icon
SnackBarType.primary   // Purple - Star icon
SnackBarType.secondary // Gray - Notification icon
SnackBarType.dark      // Dark gray - Dark mode icon
SnackBarType.light     // Light gray - Light mode icon
SnackBarType.gradient  // Purple gradient - Gradient icon
SnackBarType.custom    // Blue - Custom widget icon
```

## 📍 Positioning

```dart
SnackBarPosition.top     // Display at top of screen
SnackBarPosition.bottom  // Display at bottom of screen (default)
```

## ⚙️ Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `context` | `BuildContext` | **required** | Build context |
| `message` | `String` | **required** | Snackbar message text |
| `type` | `SnackBarType` | `info` | Type of snackbar (affects color/icon) |
| `style` | `SnackBarStyle` | `classic` | Visual style of the snackbar |
| `position` | `SnackBarPosition` | `bottom` | Position on screen |
| `duration` | `Duration` | `3 seconds` | How long to display |
| `title` | `String?` | `null` | Optional title (auto-generated from type if null) |
| `customIcon` | `IconData?` | `null` | Custom icon (overrides type icon) |
| `customColor` | `Color?` | `null` | Custom color (overrides type color) |
| `onTap` | `VoidCallback?` | `null` | Callback when snackbar is tapped |
| `actionLabel` | `String?` | `null` | Label for action button |
| `onActionPressed` | `VoidCallback?` | `null` | Callback for action button |
| `dismissible` | `bool` | `true` | Allow swipe to dismiss |
| `width` | `double?` | `null` | Custom width (uses screen width if null) |
| `margin` | `EdgeInsets?` | `null` | Custom margin |
| `replaceExisting` | `bool` | `true` | Replace existing snackbar (prevents multiple) |

## 🎛️ Advanced Features

### Single Snackbar at a Time

By default, only one snackbar is shown at a time. When you show a new snackbar, the previous one is automatically removed:

```dart
// Default behavior - replaces existing snackbar
CustomSnackBar.show(
  context: context,
  message: 'First message',
);

// This will replace the first one
CustomSnackBar.show(
  context: context,
  message: 'Second message',
);
```

To allow multiple snackbars at once:

```dart
CustomSnackBar.show(
  context: context,
  message: 'First message',
  replaceExisting: false, // Allow multiple
);

CustomSnackBar.show(
  context: context,
  message: 'Second message',
  replaceExisting: false, // Both will show
);
```

### Manually Dismiss Snackbar

```dart
// Show a snackbar
CustomSnackBar.show(
  context: context,
  message: 'Loading...',
);

// Dismiss it programmatically
CustomSnackBar.dismiss();
```
| `customIcon` | `IconData?` | `null` | Custom icon (overrides type icon) |
| `customColor` | `Color?` | `null` | Custom color (overrides type color) |
| `onTap` | `VoidCallback?` | `null` | Callback when snackbar is tapped |
| `actionLabel` | `String?` | `null` | Label for action button |
| `onActionPressed` | `VoidCallback?` | `null` | Callback for action button |
| `dismissible` | `bool` | `true` | Allow swipe to dismiss |
| `width` | `double?` | `null` | Custom width (uses screen width if null) |
| `margin` | `EdgeInsets?` | `null` | Custom margin |

## 📋 Examples

### Success Message
```dart
CustomSnackBar.show(
  context: context,
  message: 'Changes saved successfully!',
  type: SnackBarType.success,
  style: SnackBarStyle.gradient,
);
```

### Error with Action
```dart
CustomSnackBar.show(
  context: context,
  message: 'Failed to upload file',
  type: SnackBarType.error,
  style: SnackBarStyle.expanded,
  actionLabel: 'RETRY',
  onActionPressed: () {
    // Retry upload logic
  },
);
```

### Warning at Top
```dart
CustomSnackBar.show(
  context: context,
  message: 'Please check your internet connection',
  type: SnackBarType.warning,
  style: SnackBarStyle.ios,
  position: SnackBarPosition.top,
);
```

### Custom Style
```dart
CustomSnackBar.show(
  context: context,
  message: 'You have a new message!',
  style: SnackBarStyle.bubble,
  customColor: Colors.deepPurple,
  customIcon: Icons.mail_rounded,
  title: 'New Message',
);
```

### Compact Notification
```dart
CustomSnackBar.show(
  context: context,
  message: 'Copied to clipboard',
  style: SnackBarStyle.compact,
  type: SnackBarType.info,
  duration: const Duration(seconds: 2),
);
```

## 🎮 Running the Example

To see all 24 styles in action:

```bash
cd example
flutter run
```

The example app includes:
- Live preview of all 24 styles
- Interactive controls to switch between types
- Toggle between top/bottom positions
- Grid view with descriptions

## 🤝 Contributing

Contributions are welcome! If you have ideas for new styles or improvements:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 💡 Tips

- Use `SnackBarStyle.compact` for quick, non-intrusive messages
- Use `SnackBarStyle.expanded` when you need action buttons
- Use `SnackBarStyle.ios` for a native iOS feel
- Use `SnackBarStyle.material` for Material Design 3 apps
- Use `SnackBarStyle.neon` or `SnackBarStyle.glass` for modern, eye-catching effects
- Combine different types and styles for maximum customization

## 🐛 Issues

If you encounter any issues or have suggestions, please file them in the [issue tracker](https://github.com/yourusername/snackbar_flutter/issues).

## ⭐ Show Your Support

If you like this package, please give it a ⭐ on GitHub!

---

Made with ❤️ using Flutter

