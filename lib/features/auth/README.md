# Auth Feature

Authentication screens for the Stock Tools application including login and signup functionality.

## Structure

```
lib/features/auth/
├── presentation/
│   ├── constants/
│   │   └── auth_constants.dart
│   ├── pages/
│   │   ├── login_page.dart
│   │   └── signup_page.dart
│   └── widgets/
│       └── social_login_button.dart
└── README.md
```

## Components

### LoginPage
Complete login screen with:
- Hexagonal logo with abacus icon
- "STOCK TOOLS" branding
- Email and password input fields
- Login button
- Social login options (Facebook, Google, Microsoft)
- Registration link

### SignupPage
Complete signup screen with:
- Hexagonal logo with abacus icon
- "STOCK TOOLS" branding
- Form fields (First Name, Last Name, Email, Password)
- Sign up button
- Login link

### Logo
Uses the same `app_logo.png` asset as the splash screen for consistency.

### SocialLoginButton
Circular social login button with:
- SVG icon support
- Border styling
- Tap handling

### AuthConstants
Centralized constants for:
- Colors (gold, white, black)
- Text content
- Dimensions and spacing
- Styling values

## Routes

- `/login` - Login page
- `/signup` - Signup page

## Navigation

- **Login → Signup**: Tap "Register Now" link
- **Signup → Login**: Tap "Login Now" link or back button
- **Splash → Login**: Automatic navigation after 2 seconds

## Features

- ✅ Clean, minimalist design
- ✅ Responsive layout
- ✅ Form validation ready
- ✅ Social login integration ready
- ✅ Navigation between auth screens
- ✅ Reusable components
- ✅ Consistent styling 