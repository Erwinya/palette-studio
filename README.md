# Palette Studio

Build color palettes, tune hue, check WCAG-ish contrast, and export HEX values.

Flutter desktop/mobile demo.

## Status

Contrast helpers (`lib/contrast.dart`) are in place. Palette UI and pubspec will land in follow-up commits.

## Module

```dart
import 'contrast.dart';

final ratio = contrastRatio(Colors.black, Colors.white);
final hex = hexOf(Colors.teal);
```

## Planned setup

```powershell
flutter create . --project-name palette_studio
flutter pub get
flutter run
```

## License

MIT
