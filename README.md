# Countries app
A simple app that displays a list of countries and information on them

## Features
- Fetches data from API and displays it in form of a list
- Search list
- Filter list accordidng to continent and timezone
- Theming: Light theme, dark theme and system default theme supported 

## Code base
The lib folder has two(2) subfolders:
- data
- presentation

The data folder contains the data layer of the app. The data layer is the outermost layer of the app. It consists of model classes, repositories and data source. The data source is the part of the app that communicates with the outside world by fetching data from the API. The repository coordinates data from the data source. The models allow us to interact with our data sources by converting them into data objects.
The presentation folder contains the presentation layer of the app. The presentation layer consists of the code to access the data of the app from the repository, codes for state management and codes for the layout and styling of the user interface.

## Libraries
- Bloc: for state management
- Intl: for number formatting and parsing
- Google fonts: to use google fonts in the app
- Http: to handle API calls and http requests
- Mocktail: to create mock classes used for testing

## Challenges
- Creating the model class: The data for some of the countries are incomplete and was returning null. It took a while to figure out why I was getting a type error. I had to study the json to see that some keys didn't have values and handle them accordingly.

## Future features
- Data persistence
- Language options
- Splash screen
- More filter parameters

## Links
- Apk: https://drive.google.com/file/d/1YqyiVB_LYshOQWGK9VCovqopQwmsYxpm/view?usp=share_link
- Appetize: https://appetize.io/app/u3ophy5emrolrtkyij3ekutdp4?device=pixel4&osVersion=12.0&scale=75

