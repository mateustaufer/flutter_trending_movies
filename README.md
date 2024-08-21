# flutter_trending_movies

A simple app that shows a trending movies list from TMDB API.

## Features

- Trending movies list
- Movie details
- Search functionality

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