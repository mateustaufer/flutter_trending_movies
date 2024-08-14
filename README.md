# flutter_trending_movies

A simple app that shows a trending movies list from TMDB API.

## Getting Started

[First of all, create a Bearer Token at themoviedb api site](https://www.themoviedb.org/settings/api)
You will need to signup or signin for this.

Create a .env file with this structure:

{
    "ENV": "development",
    "API_BASE_URL": "api.themoviedb.org",
    "API_VERSION": "3",
    "API_KEY": "YOUR_API_KEY",
    "BEARER_TOKEN": "YOUR_BEARER_TOKEN"
}

At the last, but not the least, just run the project:
    On VSCode, use the Debug Button and choose one profile;
    Or run this command in you terminal:
        flutter run --dart-define-from-file .env