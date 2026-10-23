# Palette Studio

Build color palettes, tune hue, check WCAG-ish contrast, and export HEX values.

Flutter desktop/mobile demo.

## Status

Contrast helpers, pubspec, and app shell (`main` / `app`) are in place. Studio screen UI will land in a follow-up commit.

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
