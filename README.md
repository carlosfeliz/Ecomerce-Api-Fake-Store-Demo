# Ecommerce API Fake Store Demo

A modern Flutter application demonstrating an e-commerce interface powered by the **Fake Store API**. This project follows **Clean Architecture** principles and uses **BLoC** for state management, providing a robust and scalable foundation.

## 🚀 Features

- **Product Listing**: Displays a grid of products fetched from the [Fake Store API](https://fakestoreapi.com/).
- **Category Navigation**: Interactive category tabs for filtering (UI implemented).
- **Responsive Design**: Clean and modern UI with product cards featuring images, pricing, and ratings.
- **Offline Support**: Local caching of products using **Hive** for better performance and offline availability.
- **Clean Architecture**: Organized into Data, Domain, and Presentation layers for maintainability.
- **Dependency Injection**: Seamless service locator pattern using **GetIt**.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Local Persistence**: [Hive](https://pub.dev/packages/hive)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it)
- **Functional Programming**: [dartz](https://pub.dev/packages/dartz) (for error handling)
- **Model Comparison**: [equatable](https://pub.dev/packages/equatable)

## 🏗️ Architecture Overview

The project is structured following the **Clean Architecture** pattern:

- **Core**: Contains shared utilities, error constants, and the service locator.
- **Features**:
  - **Product**:
    - **Data**: Models, repositories implementation, and data sources (Remote & Local).
    - **Domain**: Entities, repository interfaces, and use cases.
    - **Presentation**: BLoCs and UI Pages/Widgets.

## 📦 Getting Started

### Prerequisites

- Flutter SDK (latest stable version recommended)
- Dart SDK

### Installation

1.  **Clone the repository**:
    ```bash
    git clone [repository-url]
    ```
2.  **Navigate to the project directory**:
    ```bash
    cd Ecomerce-Api-Fake-Store-Demo
    ```
3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
4.  **Run build_runner** (if needed for Hive adapters):
    ```bash
    flutter pub run build_runner build
    ```
5.  **Run the app**:
    ```bash
    flutter run
    ```

## 📸 UI Components

- **Product List Page**: A grid view layout optimized for mobile screens.
- **Product Card**: Includes image caching, price formatting, and rating display.
- **Bottom Navigation**: Fast access to Home, Shop, Favorites, and Profile.

---

*Developed by Carlos Feliz*
