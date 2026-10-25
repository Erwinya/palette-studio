# Palette Studio

Build color palettes, tune hue, check WCAG-ish contrast, and export HEX values.

Flutter desktop/mobile demo.

## Status

Studio UI, contrast helpers, lint config, and unit tests are in place. Final polish lands next.

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
