# Welcome to Flutter with PHP Mobile App Repository!

This is a Flutter mobile application project that interacts with a PHP backend server for data exchange.

## Overview

This mobile application is built using Flutter, a popular open-source UI development toolkit for building natively compiled applications. <br>
It communicates with a PHP backend server to fetch and send data.

## Features

- User authentication and registration
- Fetching data from PHP backend APIs
- Sending data to PHP backend APIs
- CRUD operations (Create, Read, Update, Delete) with PHP backend

## Technologies Used

- Flutter: A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- PHP: A server-side scripting language designed for backend development or web development.
- MySQL: A relational database management system used for storing application data.

## Prerequisites

Before you begin, make sure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [PHP](https://www.php.net/downloads)

## Getting Started

1. Clone the repository:

```bash

git clone https://github.com/LearnCsWithDIR/Flutter_App_with_PHP.git

```
2. Navigate to the project directory:

```bash
cd Flutter_App_with_PHP
```

3. Run flutter pub get to install the dependencies.

```bash
flutter pub get
```
4. Find your IPv4 Address.

- On Linux or macOS, open a terminal and run:
```bash
ifconfig | grep 'inet '
```
- On Windows, open a Command Prompt and run:
```bash
ipconfig | findstr IPv4
```
5. Open the lib/Frontend/travel_app/lib/api_connection/api_connection.dart file

- This code line number 3 :  `ADD IPV4 Address` for replace your Ipv4 address:
```bash
static const host = "http://ADD IPV4 Address/travelApp";
```

Update the API endpoint URLs with your PHP backend server URLs.

## Run the App
#### Connect a device or start an emulator, then run the app:

```bash
flutter run
```
### Congratulations! Your Flutter with PHP mobile app is now up and running.

#### APK Export Command
```
  flutter build apk --split-per-abi
```

#### Exported APK Location Path
```
  build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk
```


## License
This project is licensed under the MIT License
- [MIT License]([https://firebase.google.com/docs/cli](https://github.com/LearnCsWithDIR/MADMob-HotReload?tab=MIT-1-ov-file#readme)https://github.com/LearnCsWithDIR/MADMob-HotReload?tab=MIT-1-ov-file#readme)
