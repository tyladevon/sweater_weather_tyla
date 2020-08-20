# Sweater Weather API README

### Introduction:
This is the Sweater Weather API, an API-only, Rails back-end application designed to serve data to a fictional "Sweater Weather" front-end application. This is a 'solo' project by me, Tyla Devon Gillings for Turing School of Software & Design in order to practice 3rd party API consumption, data aggregations, and exposing data and authentication functionality via an API.


## Technologies & Architecture

- Framework: Ruby on Rails, Ruby version
  2.4.1, Rails version 5.2.4
- Testing: RSpec
- Deployment: Heroku
- JSON Serializer: FastJsonAPI
- 3rd Party APIs:
  - Google Direction Matrix API
  - Google Geocoding API
  - Pexels Api
  - DarkSky API
- Response Caching: VCR & Webmock
- Test Coverage: SimpleCov

### Test Coverage:
At time of project submission, Whether Sweater has 100% test coverage and all tests passing.

The [project requirements](https://backend.turing.io/module3/projects/sweater_weather/requirements), [description](https://backend.turing.io/module3/projects/sweater_weather/), and [rubric](https://backend.turing.io/module3/projects/sweater_weather/rubric) are available on Turing's [back-end curriculum website](https://backend.turing.io/).

### Setup
1. clone repo
2. run 'git clone ' in terminal
3. cd sweater_weather_tyla
4. run 'bundle install'
5. run 'rails db:setup'
6. run 'rails db:migrate'

### Endpoints

All endpoints are build on this API URL:
```
https://sweater-weather-tyla.herokuapp.com/api/v1
```

Note the appropriate HTTP verb for each endpoint:

- GET '/forecast'
- GET '/backgrounds'
- POST '/sessions'
- POST '/users'
- POST '/road_trip'

#### You will need Query Parameters for each endpoint.

For
```
/forecast
```
and
```
/backgrounds
```

You will need Query Parameters:
- `location`, which should be a string containing a city and state, comma-separated (e.g., "denver,co").


For
```
/sessions
```
You will need Query Parameters:
- email and password
```
params = {
          "email": "whatever@example.com",
          "password": "password"
          }
```
For
```
/users
```
You will need Query Parameters:
- email, password, password_confirmation

```
params = {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
         }
```
For
```
/road_trip
```
You will need Query Parameters:
- an origin, a destination, and the user's api key
```
params = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": "#{user.api_key}"
          }
```


### Example for data returned using 'Forecast' endpoint:

This will retrieve detailed weather information for a given city, including:
- Current conditions
- Location details
- Tonight's weather (at 9pm, or currently if between 9 and midnight)
- Hourly forecasts for next 8 hours
- Daily forecasts for next 5 days

#### HTTP Request Example:
```
GET https://sweater-weather-tyla.herokuapp.com/api/v1/forecast?location=denver,co
```

Response example:
```json
{
    "data": {
      "id": null,
      "type": "forecast",
      "attributes": {
        "id": null,
        "current": {
          "summary": "Rain next Thursday.",
          "icon": "rain",
          "temperature": 87.1,
          "high": 90.37,
          "low": 66.12,
          "location": "denver,co",
          "time": "3:45PM, 08/20"
        },
        "details": {
          "summary": "Rain next Thursday.",
          "icon": "rain",
          "feels_like": 87.1,
          "humidity": 0.23,
          "visibility": 4.59,
          "uv_index": 5,
          "today": "Rain next Thursday.",
          "tonight": "Rain in the evening."
        },
        "forecast": [
          [
            {
              "time": 1597960800,
              "temperature": 86.66
            },
            {
              "time": 1597964400,
              "temperature": 84.62
            },
            {
              "time": 1597968000,
              "temperature": 85.26
            },
            {
              "time": 1597971600,
              "temperature": 85.74
            },
            {
              "time": 1597975200,
              "temperature": 82.47
            },
            {
              "time": 1597978800,
              "temperature": 80.47
            },
            {
              "time": 1597982400,
              "temperature": 79.76
            },
            {
              "time": 1597986000,
              "temperature": 78.08
            }
          ],
          [
            {
              "day": 1597989600,
              "forecast_icon": "clear-day",
              "forecast": "Clear throughout the day.",
              "precip": 0.09,
              "precip_icon": "rain",
              "high": 97.38,
              "low": 66.82
            },
            {
              "day": 1598076000,
              "forecast_icon": "clear-day",
              "forecast": "Clear throughout the day.",
              "precip": 0.02,
              "precip_icon": "rain",
              "high": 98.6,
              "low": 68.31
            },
            {
              "day": 1598162400,
              "forecast_icon": "clear-day",
              "forecast": "Clear throughout the day.",
              "precip": 0.05,
              "precip_icon": "rain",
              "high": 99.16,
              "low": 66.35
            },
            {
              "day": 1598248800,
              "forecast_icon": "clear-day",
              "forecast": "Clear throughout the day.",
              "precip": 0.09,
              "precip_icon": "rain",
              "high": 101.48,
              "low": 68.04
            },
            {
              "day": 1598335200,
              "forecast_icon": "clear-day",
              "forecast": "Clear throughout the day.",
              "precip": 0.04,
              "precip_icon": "rain",
              "high": 100.94,
              "low": 67.44
            }
          ]
        ]
      }
    }
  }
```
