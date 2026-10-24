# Palette Studio

Build color palettes, tune hue, check WCAG-ish contrast, and export HEX values.

Flutter desktop/mobile demo.

## Status

Contrast helpers, app shell, and studio screen UI are in place. Tests and lint config will land in follow-up commits.

## Setup

```powershell
flutter pub get
flutter run
```

## Module

```dart
import 'package:palette_studio/contrast.dart';

final ratio = contrastRatio(Colors.black, Colors.white);
final hex = hexOf(Colors.teal);
```

## License

MIT
