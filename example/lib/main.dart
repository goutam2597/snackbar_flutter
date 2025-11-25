import 'package:flutter/material.dart';
import 'package:snackbar_flutter/snackbar_flutter.dart';
import 'device_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackbar Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DeviceFrame(child: SnackBarDemoPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SnackBarDemoPage extends StatefulWidget {
  const SnackBarDemoPage({super.key});

  @override
  State<SnackBarDemoPage> createState() => _SnackBarDemoPageState();
}

class _SnackBarDemoPageState extends State<SnackBarDemoPage> {
  SnackBarPosition _position = SnackBarPosition.bottom;
  SnackBarType _type = SnackBarType.success;
  bool _replaceExisting = true;
  SnackBarDismissDirection _dismissDirection = SnackBarDismissDirection.any;
  Color _titleColor = Colors.white;
  Color _messageColor = Colors.white70;

  final List<Map<String, dynamic>> _styles = [
    {
      'style': SnackBarStyle.classic,
      'name': 'Classic',
      'description': 'Traditional filled design with icon and title',
    },
    {
      'style': SnackBarStyle.frosted,
      'name': 'Frosted Glass',
      'description': 'Modern glassmorphism effect',
    },
    {
      'style': SnackBarStyle.minimal,
      'name': 'Minimal',
      'description': 'Clean design with left border accent',
    },
    {
      'style': SnackBarStyle.gradient,
      'name': 'Gradient',
      'description': 'Beautiful gradient background',
    },
    {
      'style': SnackBarStyle.floating,
      'name': 'Floating',
      'description': 'Elevated with prominent shadow',
    },
    {
      'style': SnackBarStyle.material,
      'name': 'Material You',
      'description': 'Google Material Design 3',
    },
    {
      'style': SnackBarStyle.ios,
      'name': 'iOS Style',
      'description': 'Apple iOS notification style',
    },
    {
      'style': SnackBarStyle.outlined,
      'name': 'Outlined',
      'description': 'Transparent with colored border',
    },
    {
      'style': SnackBarStyle.compact,
      'name': 'Compact',
      'description': 'Single-line minimal space',
    },
    {
      'style': SnackBarStyle.expanded,
      'name': 'Expanded',
      'description': 'Large with action button',
    },
    {
      'style': SnackBarStyle.iconOnly,
      'name': 'Icon Only',
      'description': 'Just the icon, no container',
    },
    {
      'style': SnackBarStyle.neon,
      'name': 'Neon Glow',
      'description': 'Glowing neon effect',
    },
    {
      'style': SnackBarStyle.neumorphic,
      'name': 'Neumorphic',
      'description': 'Soft 3D neumorphic design',
    },
    {
      'style': SnackBarStyle.card,
      'name': 'Card',
      'description': 'Material card with elevation',
    },
    {
      'style': SnackBarStyle.pill,
      'name': 'Pill',
      'description': 'Rounded pill shape',
    },
    {
      'style': SnackBarStyle.banner,
      'name': 'Banner',
      'description': 'Full-width banner style',
    },
    {
      'style': SnackBarStyle.grunge,
      'name': 'Grunge',
      'description': 'Bold textured appearance',
    },
    {
      'style': SnackBarStyle.bubble,
      'name': 'Bubble',
      'description': 'Chat bubble with tail',
    },
    {
      'style': SnackBarStyle.stripe,
      'name': 'Striped',
      'description': 'Diagonal stripe pattern',
    },
    {
      'style': SnackBarStyle.pixel,
      'name': 'Pixel Art',
      'description': 'Retro pixel game style',
    },
    {
      'style': SnackBarStyle.glass,
      'name': 'Glass',
      'description': 'Advanced glassmorphism',
    },
    {
      'style': SnackBarStyle.threeDimensional,
      'name': '3D Effect',
      'description': 'Three-dimensional shadow',
    },
    {
      'style': SnackBarStyle.dotted,
      'name': 'Dotted',
      'description': 'Polka dot pattern',
    },
    {
      'style': SnackBarStyle.diagonal,
      'name': 'Diagonal Cut',
      'description': 'Angular diagonal edges',
    },
  ];

  void _showSnackBar(SnackBarStyle style, String name) {
    String message = 'This is a $name snackbar notification!';
    if (style == SnackBarStyle.compact) {
      message = '$name style!';
    }

    CustomSnackBar.show(
      context: context,
      message: message,
      type: _type,
      style: style,
      position: _position,
      duration: const Duration(seconds: 3),
      replaceExisting: _replaceExisting,
      dismissDirection: _dismissDirection,
      titleColor: _titleColor,
      messageColor: _messageColor,
      actionLabel: style == SnackBarStyle.expanded ? 'ACTION' : null,
      onActionPressed: style == SnackBarStyle.expanded
          ? () {
              debugPrint('Action pressed!');
            }
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Snackbar Flutter Demo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Controls
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Controls',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Position',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SegmentedButton<SnackBarPosition>(
                              segments: const [
                                ButtonSegment(
                                  value: SnackBarPosition.top,
                                  label: Text('Top'),
                                  icon: Icon(Icons.arrow_upward, size: 16),
                                ),
                                ButtonSegment(
                                  value: SnackBarPosition.bottom,
                                  label: Text('Bottom'),
                                  icon: Icon(Icons.arrow_downward, size: 16),
                                ),
                              ],
                              selected: {_position},
                              onSelectionChanged:
                                  (Set<SnackBarPosition> value) {
                                    setState(() {
                                      _position = value.first;
                                    });
                                  },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Replace Existing Toggle
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Replace Existing',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              _replaceExisting
                                  ? 'One at a time (replaces previous)'
                                  : 'Multiple snackbars allowed',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _replaceExisting,
                        onChanged: (value) {
                          setState(() {
                            _replaceExisting = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Dismiss Direction
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dismiss Direction',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: [
                          _buildDismissChip(
                            SnackBarDismissDirection.any,
                            'Any',
                          ),
                          _buildDismissChip(
                            SnackBarDismissDirection.left,
                            'Left',
                          ),
                          _buildDismissChip(
                            SnackBarDismissDirection.right,
                            'Right',
                          ),
                          _buildDismissChip(
                            SnackBarDismissDirection.top,
                            'Top',
                          ),
                          _buildDismissChip(
                            SnackBarDismissDirection.bottom,
                            'Bottom',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Text Colors
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Title Color',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              children: [
                                _buildColorChip(Colors.white, 'White', true),
                                _buildColorChip(Colors.black, 'Black', true),
                                _buildColorChip(Colors.red, 'Red', true),
                                _buildColorChip(Colors.blue, 'Blue', true),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Message Color',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              children: [
                                _buildColorChip(Colors.white70, 'White', false),
                                _buildColorChip(Colors.black87, 'Black', false),
                                _buildColorChip(Colors.red[300]!, 'Red', false),
                                _buildColorChip(
                                  Colors.blue[300]!,
                                  'Blue',
                                  false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Type',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTypeChip(
                        SnackBarType.success,
                        'Success',
                        Colors.green,
                      ),
                      _buildTypeChip(SnackBarType.error, 'Error', Colors.red),
                      _buildTypeChip(
                        SnackBarType.warning,
                        'Warning',
                        Colors.orange,
                      ),
                      _buildTypeChip(SnackBarType.info, 'Info', Colors.blue),
                      _buildTypeChip(
                        SnackBarType.primary,
                        'Primary',
                        Colors.purple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Styles Grid
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '24 Different Styles',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tap any card to preview the snackbar',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.1,
                        ),
                    itemCount: _styles.length,
                    itemBuilder: (context, index) {
                      final style = _styles[index];
                      return _buildStyleCard(
                        style['style'] as SnackBarStyle,
                        style['name'] as String,
                        style['description'] as String,
                        index,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeChip(SnackBarType type, String label, Color color) {
    final isSelected = _type == type;
    return FilterChip(
      selected: isSelected,
      label: Text(label),
      avatar: isSelected ? null : Icon(Icons.circle, size: 12, color: color),
      selectedColor: color.withValues(alpha: 0.2),
      checkmarkColor: color,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _type = type;
          });
        }
      },
    );
  }

  Widget _buildDismissChip(SnackBarDismissDirection direction, String label) {
    final isSelected = _dismissDirection == direction;
    return FilterChip(
      selected: isSelected,
      label: Text(label),
      selectedColor: Colors.purple.withValues(alpha: 0.2),
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _dismissDirection = direction;
          });
        }
      },
    );
  }

  Widget _buildColorChip(Color color, String label, bool isTitle) {
    final isSelected = isTitle ? _titleColor == color : _messageColor == color;
    return FilterChip(
      selected: isSelected,
      label: Text(label),
      avatar: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
      ),
      selectedColor: color.withValues(alpha: 0.2),
      onSelected: (selected) {
        if (selected) {
          setState(() {
            if (isTitle) {
              _titleColor = color;
            } else {
              _messageColor = color;
            }
          });
        }
      },
    );
  }

  Widget _buildStyleCard(
    SnackBarStyle style,
    String name,
    String description,
    int index,
  ) {
    final colors = [
      Colors.blue,
      Colors.purple,
      Colors.pink,
      Colors.red,
      Colors.orange,
      Colors.amber,
      Colors.green,
      Colors.teal,
      Colors.cyan,
      Colors.indigo,
    ];
    final color = colors[index % colors.length];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _showSnackBar(style, name),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.notifications_rounded,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
