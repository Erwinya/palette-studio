import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_studio/contrast.dart';

class StudioScreen extends StatefulWidget {
  const StudioScreen({super.key});

  @override
  State<StudioScreen> createState() => _StudioScreenState();
}

class _StudioScreenState extends State<StudioScreen> {
  final _random = math.Random();
  final List<Color> _palette = [
    const Color(0xFF1F4E79),
    const Color(0xFF245B4A),
    const Color(0xFFB08968),
    const Color(0xFFF4F1EA),
    const Color(0xFF1B1B1B),
  ];
  int _selected = 0;

  Color get _fg => _palette[_selected];
  Color get _bg => _palette[(_selected + 1) % _palette.length];

  Future<void> _export() async {
    final text = _palette.map(hexOf).join('\n');
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Palette copied as HEX list.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ratio = contrastRatio(_fg, _bg);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palette Studio'),
        actions: [
          TextButton(onPressed: _export, child: const Text('Export')),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var i = 0; i < _palette.length; i++)
                GestureDetector(
                  onTap: () => setState(() => _selected = i),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: _palette[i],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: i == _selected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black12,
                        width: i == _selected ? 3 : 1,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Selected: ${hexOf(_fg)}'),
          Slider(
            value: HSVColor.fromColor(_fg).hue,
            max: 359,
            label: 'Hue',
            onChanged: (v) {
              setState(() {
                _palette[_selected] = HSVColor.fromColor(_fg).withHue(v).toColor();
              });
            },
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    color: _bg,
                    child: Text(
                      'Contrast sample',
                      style: TextStyle(
                        color: _fg,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Contrast ratio: ${ratio.toStringAsFixed(2)} : 1'),
                  Text(ratio >= 4.5 ? 'AA body text: PASS' : 'AA body text: FAIL'),
                  Text(ratio >= 3.0 ? 'AA large text: PASS' : 'AA large text: FAIL'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _palette.add(Color(0xFF000000 | _random.nextInt(0xFFFFFF)));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
