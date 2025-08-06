# Dashboard Feature

A comprehensive dashboard with two different view layouts and a theme switcher.

## Structure

```
lib/features/dashboard/
├── presentation/
│   ├── constants/
│   │   └── dashboard_constants.dart
│   ├── pages/
│   │   ├── dashboard_page.dart
│   │   ├── dashboard_view1_page.dart
│   │   └── dashboard_view2_page.dart
│   └── widgets/
│       ├── dashboard_header.dart
│       ├── dashboard_footer.dart
│       ├── dashboard_button.dart
│       └── dashboard_card.dart
└── README.md
```

## Components

### DashboardPage
Main dashboard page with theme switcher:
- Toggle between View 1 (List) and View 2 (Grid)
- Floating theme switcher button
- Seamless view transitions

### DashboardView1Page (List View)
Vertical button layout with:
- Header with user profile
- 5 vertical action buttons
- Footer with app branding

**Action Buttons:**
- NEW DEVICE
- SETUP HUB
- SETUP WIFI
- CONFIGURATION
- STOCK DETAILS

### DashboardView2Page (Grid View)
Card-based layout with:
- Header with user profile
- Large SETUP button
- 2x2 grid of action cards
- Footer with app branding

**Action Cards:**
- NEW DEVICE
- NEW LABEL
- SETUP WIFI
- CONFIGURATION

### Shared Components

#### DashboardHeader
- Golden header with rounded bottom corners
- User profile icon and information
- Menu icon for navigation

#### DashboardFooter
- App logo and branding
- Consistent across both views

#### DashboardButton
- Full-width golden buttons
- Icon, title, and arrow
- Used in View 1

#### DashboardCard
- White cards with subtle shadows
- Icon and title
- Used in View 2

## Routes

- `/dashboard` - Main dashboard page

## Features

- ✅ Two distinct view layouts
- ✅ Easy theme switching
- ✅ Consistent branding
- ✅ Responsive design
- ✅ Reusable components
- ✅ Clean navigation
- ✅ Professional styling 