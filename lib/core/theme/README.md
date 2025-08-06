# App Theme System

A centralized theme system that provides consistent styling across all features.

## Structure

```
lib/core/theme/
├── app_theme.dart
└── README.md
```

## Components

### AppTheme
Centralized theme class with:

#### Colors
- `primaryGold` - Main brand color (#E6A72C)
- `lightGold` - Secondary gold color (#F7D794)
- `backgroundColor` - App background (white)
- `textColor` - Primary text (black)
- `headerTextColor` - Header text (white)
- `cardBackgroundColor` - Card backgrounds (white)
- `cardTextColor` - Card text (grey)
- `inactiveFieldColor` - Inactive input fields (#F5F5F5)
- `borderColor` - Border color (#E0E0E0)

#### Text Styles
- `appTitleStyle` - Large bold titles (32px, 900 weight)
- `appSubtitleStyle` - Italic subtitles (18px, 300 weight)
- `userNameStyle` - User name in headers (24px, bold)
- `userEmailStyle` - User email in headers (16px, 400 weight)
- `buttonTextStyle` - Button text (16px, bold, white)
- `cardTitleStyle` - Card titles (14px, 500 weight, grey)
- `linkTextStyle` - Clickable links (14px, bold, gold)
- `hintTextStyle` - Input hints (14px, grey)

#### Dimensions
- `logoSize` - Standard logo size (120px)
- `smallLogoSize` - Small logo size (40px)
- `buttonHeight` - Standard button height (50px)
- `cardHeight` - Card height (120px)
- `headerHeight` - Header height (200px)
- `inputBorderRadius` - Input field radius (12px)
- `cardBorderRadius` - Card radius (12px)

#### Spacing
- `paddingSmall` - 8px
- `paddingMedium` - 16px
- `paddingLarge` - 20px
- `paddingExtraLarge` - 24px
- `paddingHuge` - 32px

#### Shadows
- `cardShadow` - Subtle shadow for cards
- `buttonShadow` - Shadow for floating buttons

#### Helper Methods
- `inputDecoration()` - Standard input field decoration
- `primaryButtonStyle` - Standard button style
- `inputContainerDecoration()` - Input container styling
- `cardDecoration` - Card container styling
- `headerDecoration` - Header container styling

## Usage

### In Constants Files
```dart
import '../../../../core/theme/app_theme.dart';

class MyConstants {
  static const Color primaryColor = AppTheme.primaryGold;
  static const double buttonHeight = AppTheme.buttonHeight;
}
```

### In Widgets
```dart
import '../../../../core/theme/app_theme.dart';

Text(
  'Title',
  style: AppTheme.appTitleStyle,
)

Container(
  decoration: AppTheme.cardDecoration,
  child: ...
)
```

### In Main App
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryGold),
  scaffoldBackgroundColor: AppTheme.backgroundColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: AppTheme.primaryButtonStyle,
  ),
),
```

## Benefits

- ✅ **Consistency** - All features use the same colors and styles
- ✅ **Maintainability** - Change once, updates everywhere
- ✅ **Professional** - Clean, organized styling approach
- ✅ **Scalability** - Easy to add new styles and themes
- ✅ **Type Safety** - Compile-time checking for style usage
- ✅ **Reusability** - Shared components across features 