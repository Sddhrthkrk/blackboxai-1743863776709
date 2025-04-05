# Sunrise Health Center Management System (Demo)

A Flutter-based demo application for healthcare center management with three user roles: Doctor, Patient, and Administrator.

## Features
- **Authentication System** with role-based access
- **Doctor Appointment Booking** with calendar view
- **Lab Test Requests** with test selection and pricing
- **Patient Portal** for viewing medical records
- **Doctor Portal** for managing patients and lab requests
- **Admin Portal** for user and appointment management

## Setup Instructions

### Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Android Studio with Android SDK
- VS Code (recommended) with Flutter extension

### Installation
1. Clone this repository
2. Navigate to the project directory:
   ```bash
   cd sunrise_health
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App
1. Connect an Android device or start an emulator
2. Run the app:
   ```bash
   flutter run
   ```

### Demo Credentials
- **Doctor**: 
  - Username: `dr_smith`
  - Password: `doctor123`
  - OTP: `123456`
- **Patient**: 
  - Username: `john_doe`
  - Password: `patient123`
  - OTP: `123456`
- **Admin**: 
  - Username: `admin`
  - Password: `admin123`
  - OTP: `123456`

## Important Notes
- This is a **demo application only** and not suitable for production use
- All data is stored locally and will be cleared when the app is closed
- The authentication system uses SHA-256 hashing for demo purposes only (not secure for production)

## Screenshots
![Login Screen](assets/screenshots/login.png)
![Doctor Booking](assets/screenshots/doctor_booking.png)
![Lab Request](assets/screenshots/lab_request.png)

## Dependencies
- `provider`: State management
- `table_calendar`: Appointment scheduling
- `crypto`: Password hashing (demo only)
- `http`: Mock API calls
- `pdf`: Lab report generation

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.