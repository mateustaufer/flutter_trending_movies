# Flutter Trending Movies

A simple Flutter Web App that shows a trending movies list from TMDB API.

## Framework versions

- Flutter SDK: 3.24.1
- Dart SDK: 3.5.1

## Features

- Trending movies list
- Movie details
- Flutter counter (just to demonstrate widget test)

## Getting Started

1. [Create a Bearer Token at the TMDB API site](https://www.themoviedb.org/settings/api)
2. Create a `.env` file with this structure:

    ```json
    {
        "ENV": "development",
        "API_BASE_URL": "api.themoviedb.org",
        "API_VERSION": "3",
        "API_KEY": "YOUR_API_KEY",
        "BEARER_TOKEN": "YOUR_BEARER_TOKEN"
    }
    ```

3. Run the project:
    - On VSCode, use the Debug Button and choose one profile
    - Or run this command in your terminal:
    
    ```sh
    flutter run --dart-define-from-file .env
    ```
