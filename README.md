# Currency Converter App

Currency Converter App is a Flutter application that allows users to convert currencies between countries based on the current currency rates.

## Project Structure

The project is structured into the following directories:

1. **Components**: Contains the converter widget itself. This is where the user interface components for currency conversion are implemented.

2. **Functions**: Contains three functions responsible for fetching up-to-date data from the API. These functions are essential for retrieving currency rates, presenting various currencies, and performing conversion calculations.

3. **Models**: Contains models that represent objects holding current currency rates. These models facilitate the parsing of data retrieved from the API.

4. **Screens**: Contains the main screen of the application. This is where the user interacts with the currency conversion functionality.

5. **Utils**: Contains a file designed to hold the API key. This file is essential for accessing the API and fetching currency data.

## Getting Started

To run the Currency Converter App:

1. Clone this repository to your local machine.
2. Ensure you have Flutter installed. If not, follow the installation instructions on the [Flutter website](https://flutter.dev/docs/get-started/install).
3. Run `flutter pub get` in the project directory to install dependencies.
4. Replace the placeholder API key in the UTILS directory with your own API key.
5. Run the app using `flutter run`.

## Dependencies

The Currency Converter App relies on the following dependencies:

- http: ^1.2.0

Ensure that you have these dependencies installed by running `flutter pub get` before running the app.


