# Snackbar Flutter - File Structure (বাংলা)

## 📂 প্রজেক্ট স্ট্রাকচার

এই package টা properly organized করা হয়েছে যাতে code maintainable এবং scalable হয়।

### 🗂️ মূল ফাইল স্ট্রাকচার

```
snackbar_flutter/
│
├── lib/
│   ├── snackbar_flutter.dart          # Main entry point (সব exports এখানে)
│   │
│   └── src/                           # Source files (internal implementation)
│       │
│       ├── custom_snackbar.dart       # প্রধান CustomSnackBar class
│       │                              # এখানে show() method আছে
│       │
│       ├── enums/                     # সব enums এক জায়গায়
│       │   ├── snackbar_type.dart     # 10 types (success, error, etc.)
│       │   ├── snackbar_position.dart # 2 positions (top, bottom)
│       │   └── snackbar_style.dart    # 24 styles
│       │
│       ├── widgets/                   # UI widgets
│       │   └── snackbar_widget.dart   # Main widget with animations
│       │                              # Slide, fade, scale animations
│       │
│       ├── styles/                    # সব style builders
│       │   ├── all_styles.dart        # 24টা style এর implementation
│       │   └── style_factory.dart     # Style select করার factory
│       │
│       ├── painters/                  # Custom painters for special effects
│       │   ├── bubble_tail_painter.dart   # Chat bubble tail আঁকে
│       │   ├── stripe_painter.dart        # Stripe pattern আঁকে
│       │   └── dot_pattern_painter.dart   # Dot pattern আঁকে
│       │
│       ├── clippers/                  # Custom clippers
│       │   └── diagonal_clipper.dart  # Diagonal shape এর জন্য
│       │
│       └── utils/                     # Helper utilities
│           └── snackbar_helpers.dart  # Color, icon, title helpers
│
├── example/                           # Demo application
│   ├── lib/
│   │   └── main.dart                  # 24টা style showcase
│   └── pubspec.yaml
│
├── test/                              # Unit tests
│   └── snackbar_flutter_test.dart
│
├── pubspec.yaml                       # Package configuration
├── README.md                          # Documentation
├── CHANGELOG.md                       # Version history
└── LICENSE                            # MIT License
```

## 🎯 কেন Multiple Files?

### ✅ সুবিধা:

1. **Easy Maintenance** 
   - একটা specific feature change করতে হলে শুধু সেই file edit করলেই হবে
   - পুরো codebase search করতে হবে না

2. **Better Organization**
   - Related code এক জায়গায়
   - Enums, Widgets, Styles আলাদা folders এ

3. **Reusability**
   - Individual components আলাদাভাবে reuse করা যায়
   - Future এ new styles add করা easy

4. **Team Collaboration**
   - Multiple developers একসাথে কাজ করতে পারবে
   - Git conflicts কম হবে

5. **Performance**
   - Dart শুধু needed files import করে
   - Unused code tree-shake হয়ে যায়

6. **Scalability**
   - নতুন features add করা easy
   - Package বড় হলেও manageable থাকবে

## 📝 প্রতিটি File এর কাজ

### 1. `snackbar_flutter.dart` (Main Entry)
```dart
// শুধুমাত্র exports - users এটাই import করবে
export 'src/enums/snackbar_type.dart';
export 'src/custom_snackbar.dart';
```

### 2. `custom_snackbar.dart`
- Main `CustomSnackBar.show()` method
- Overlay management
- Parameters handling

### 3. `enums/` Folder
**snackbar_type.dart**: 10টা types define করে
- success, error, warning, info, primary, etc.

**snackbar_position.dart**: Position define করে
- top, bottom

**snackbar_style.dart**: 24টা styles define করে
- classic, frosted, minimal, gradient, etc.

### 4. `widgets/snackbar_widget.dart`
- Main UI widget
- Animation controller
- Slide, fade, scale animations
- Dismissible functionality
- Auto-dismiss after duration

### 5. `styles/` Folder
**all_styles.dart**: সব style implementations
- 24টা static methods
- প্রতিটা style এর custom design
- Reusable এবং testable

**style_factory.dart**: Style selector
- Switch case দিয়ে appropriate style return করে
- Centralized style management

### 6. `painters/` Folder
Custom visual effects এর জন্য:
- **bubble_tail_painter.dart**: Chat bubble এর tail
- **stripe_painter.dart**: Diagonal stripes
- **dot_pattern_painter.dart**: Polka dots

### 7. `clippers/diagonal_clipper.dart`
- Custom shape cutting
- Diagonal edges create করে

### 8. `utils/snackbar_helpers.dart`
Helper methods:
- `getColors()`: Type থেকে color
- `getIcon()`: Type থেকে icon
- `getTitle()`: Type থেকে title

## 🔄 Data Flow

```
User calls CustomSnackBar.show()
         ↓
custom_snackbar.dart processes parameters
         ↓
Creates SnackBarWidget with animations
         ↓
StyleFactory selects appropriate style
         ↓
AllStyles builds the specific design
         ↓
Painters/Clippers add special effects
         ↓
Widget displayed with animations
```

## 🎨 Adding New Style (নতুন Style যোগ করা)

1. `snackbar_style.dart` এ enum add করুন
2. `all_styles.dart` এ new method লিখুন
3. `style_factory.dart` এ case add করুন
4. Example app এ showcase করুন

Easy! 🎉

## 💡 Best Practices

- ✅ Single Responsibility: প্রতিটা file একটা specific কাজ করে
- ✅ DRY Principle: Code repetition নেই
- ✅ Separation of Concerns: UI, Logic, Data আলাদা
- ✅ Easy Testing: Individual components test করা easy
- ✅ Documentation: প্রতিটা file এ clear comments

## 🚀 Usage

Users শুধু একটা file import করবে:

```dart
import 'package:snackbar_flutter/snackbar_flutter.dart';

CustomSnackBar.show(
  context: context,
  message: 'Hello!',
  style: SnackBarStyle.gradient,
);
```

Internal implementation তারা দেখবে না, কিন্তু আমরা সহজে maintain করতে পারব! 💪

---

**Summary**: একটা বড় file এর বদলে multiple organized files ব্যবহার করা best practice। এতে code maintainable, scalable এবং collaborative হয়! 🎯
