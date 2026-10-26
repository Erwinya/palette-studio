# Palette Studio

Build color palettes, tune hue, check WCAG-ish contrast, and export HEX values.

Flutter desktop/mobile demo.

## Status

Complete: contrast helpers, accessible studio UI, lint config, and unit tests.

Contrast checks use WCAG-ish thresholds: `4.5:1` for AA body text and `3.0:1` for AA large text.

## Setup

```powershell
flutter pub get
flutter run
```

## Test

```powershell
flutter test
```

## Module

```dart
import 'package:palette_studio/contrast.dart';

final ratio = contrastRatio(Colors.black, Colors.white);
final hex = hexOf(Colors.teal);
```

## License

MIT
