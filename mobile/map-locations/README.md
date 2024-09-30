# Take-Home Coding Exercise

Welcome to the coding exercise! The goal of this project is to demonstrate your skills by building an app that displays a set of locations on a map in a performant manner. Please follow the instructions below to complete the exercise.

## Project Overview

This exercise involves fetching data from a JSON file stored in this repository and implementing a map view to display locations. You'll need to implement features like filtering locations by type and displaying additional information when a location is tapped.

## Instructions

1. **Fork the Repository:**
    - Please begin by forking this repository.
    - All of your changes should be committed to your fork.
    - Optional: Use pull requests with short descriptions to help explain as you go through

2. **Setup Project:**
    - Create an `android` or `ios` folder respectively in the root of this folder. This is where your project will live.

3. **Fetch Location Data:**
    - The repository contains a JSON file, `locations.json`, that lists various locations.
    - Use the raw file content feature of GitHub for fetching data (think of it as a mock API). Please point it to your forked repository, not the Voze repository.
        - `https://raw.githubusercontent.com/<GITHUB_ACCOUNT_NAME>/coding-exercises/master/mobile/map-locations/locations.json`
    - Your task is to parse this file and use the data within the app.

4. **Display Locations on a Map View:**
    - Create a map view in the app as the main view.
        - The data is centered around San Francisco. Please set the default location to there.
    - Plot the locations from the JSON file on the map using pins or markers.

5. **Filtering Locations:**
    - Implement a way to filter the displayed locations by `location_type`.
        - The assumption can be made the location_types are a static set and will not change.
        - You can provide a UI (e.g., dropdown menu, segmented control, etc) that allows users to select which types of locations to display on the map.
        - Please feel free to "steal" existing UI from other application such as Google Maps, Apple Maps, Zillow, etc for filtering or craft your own.
        - Optional: Distinguish between location types through the presentation of pin or markers.

6. **Additional Details on Tap:**
   - When a user taps on a location pin, show a view with more detailed information about that location.
        - Display all `attributes` inside this detail view.
        - Please feel free to "steal" existing UI from other application such as Google Maps, Apple Maps, Zillow, etc for details or craft your own.

## Requirements

- **Documentation:**
    - Please add any contextual implementation information into Implementation section at the bottom of this `README`.
    - Add code comments when relevant
    - Add information on how to get the application up and running into the Getting Started section at the bottom of this `README`.
- **Programming Language:**
    - iOS: Please focus on using Swift
    - Android: Please focus on using Kotlin (Java is still acceptable, however Kotlin is preferred)
- **Data Fetching:**
    - You may use the std library or a 3rd party library for making HTTP request.
        - If using a 3rd party library please explain why inside the Implementation section at the bottom of this `README`.
- **Map Integration:**
    - You may use any mapping library, such as MapKit
    - Please do not use a mapping library which requires an API key
- **UI/UX:**
    - Design a user-friendly interface to interact with the map and filter locations.
    - Keep it simple. This isn't a exercise to test your design skill.
- **Filtering:**
    - Implement efficient filtering of locations by their type.

## Submission

1. Once you have completed the exercise email a link to the forked repository.

## Evaluation Criteria

- **Correctness:** Does the app fetch and display data correctly?
- **UI/UX:** Is the map view intuitive and easy to use (within reason given lack of design criteria)?
- **Code Quality:** Is the code clean, readable, follow modern architecture per environment, and well-structured?
- **Filtering:** Is filtering by location type implemented efficiently?
- **Attention to Detail:** Does the app show detailed information when a pin is tapped?

Feel free to reach out if you have any questions. Good luck, and happy coding!

Do not edit any lines above this line break.

---

## Getting Started

No external libraries were used for this coding exercise. This app requires iOS 18. Please update your XCode accordingly.

This app works both on iPhone and iPad.

No Developer Account has been added to the project. Please run the app in the simulator.


## Implementation

For this exercise, I chose SwiftUI over UIKit. If there had been more navigation tasks, I may have considered UIKit.

I chose to use unit testing, rather than UI Testing. In my experience, unit testing is more useful for driving out software design. UI Testing is also too slow to be part of a Github Action CI suite. UI Testing is more suited for daily regression test runs which were beyond the scope of this coding challenge. I did consider the [ViewInspector](https://github.com/nalexn/ViewInspector) framework, as it is a popular testing framework for testing the view hierarchy in unit tests. I eventually discarded the notion, as it proved to not work easily with MapKit. The styling and interactions not verified by unit tests are easy to test by hand.

I chose to use the Decodable interface for decoding locations from json. This was perhaps slightly more difficult than decoding the json manually would have been, as translating a json array of attributes to properties on the location struct did come with some challenges. The final solution works well, and is easy to follow, so no refactor to manual decoding is justified.

I chose not to localize the app, as localization was not in the evaluation criteria.

I chose a black and white theme. This worked well with the icons I found for the different location types.

I did notice that some of locations were off. I plotted the location for the Chinatown Gate listed in the json file, and noticed it did not match the real world location. I looked up the location for the gate, and found that indeed the latitude and longitude listed in the json file do not match the real world location. I decided that the accuracy of the coordinates was perhaps not the point of this coding challenge, and left the coordinates as is.

I regret not using `squash on merge` for my pull requests. I believe that would have made my work easier to follow.
