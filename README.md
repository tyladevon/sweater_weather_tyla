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

### Forecast

Retrieve detailed weather information for a given city, including:
- Current conditions
- Location details
- Tonight's weather (at 9pm, or currently if between 9 and midnight)
- Hourly forecasts for next 8 hours
- Daily forecasts for next 5 days

Endpoint:
```
/forecast
```

Query Parameter(s):
- `location`, which should be a string containing a city and state, comma-separated (e.g., "denver,co").

HTTP Request Example:
```
GET http://whether-sweater-df.herokuapp.com/api/v1/forecast?location=denver,co
```

Response example:
```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "location": {
                "city": "Indianapolis",
                "state": "IN",
                "country": "United States",
                "city_state": "Indianapolis, IN",
                "lat": 39.768403,
                "long": -86.158068
            },
            "currentForecast": {
                "feels_like": 29.88,
                "humidity": 0.78,
                "icon": "clear-night",
                "summary": "Clear",
                "temperature": 35.84,
                "time": 1583312586,
                "uv_index": 0,
                "visibility": 10,
                "day_temperature_high": 50.62,
                "day_temperature_low": 30.02,
                "today_summary": "Partly cloudy throughout the day.",
                "timezone_offset": -5,
                "timezone": "America/Indiana/Indianapolis",
                "uv_exposure_category": "low"
            },
            "tonightSummary": "Clear",
            "hourlyForecasts": [
                {
                    "time": 1583316000,
                    "icon": "rain",
                    "temperature": 35.42,
                    "summary": "Possible Drizzle"
                },
                {
                    "time": 1583319600,
                    "icon": "clear-night",
                    "temperature": 36.19,
                    "summary": "Clear"
                },
                {
                    "time": 1583323200,
                    "icon": "clear-night",
                    "temperature": 37.22,
                    "summary": "Clear"
                },
                {
                    "time": 1583326800,
                    "icon": "partly-cloudy-day",
                    "temperature": 39.01,
                    "summary": "Partly Cloudy"
                },
                {
                    "time": 1583330400,
                    "icon": "partly-cloudy-day",
                    "temperature": 42.91,
                    "summary": "Mostly Cloudy"
                },
                {
                    "time": 1583334000,
                    "icon": "partly-cloudy-day",
                    "temperature": 46.24,
                    "summary": "Mostly Cloudy"
                },
                {
                    "time": 1583337600,
                    "icon": "partly-cloudy-day",
                    "temperature": 48.21,
                    "summary": "Mostly Cloudy"
                },
                {
                    "time": 1583341200,
                    "icon": "partly-cloudy-day",
                    "temperature": 49.13,
                    "summary": "Partly Cloudy"
                }
            ],
            "dailyForecasts": [
                {
                    "time": 1583384400,
                    "icon": "partly-cloudy-day",
                    "temperature_high": 56.95,
                    "temperature_low": 32.37,
                    "humidity": 0.61,
                    "weekday": "Thursday"
                },
                {
                    "time": 1583470800,
                    "icon": "partly-cloudy-day",
                    "temperature_high": 42.02,
                    "temperature_low": 25.71,
                    "humidity": 0.68,
                    "weekday": "Friday"
                },
                {
                    "time": 1583557200,
                    "icon": "clear-day",
                    "temperature_high": 53.87,
                    "temperature_low": 35.58,
                    "humidity": 0.61,
                    "weekday": "Saturday"
                },
                {
                    "time": 1583643600,
                    "icon": "partly-cloudy-day",
                    "temperature_high": 62.26,
                    "temperature_low": 47.59,
                    "humidity": 0.55,
                    "weekday": "Sunday"
                },
                {
                    "time": 1583726400,
                    "icon": "rain",
                    "temperature_high": 60.46,
                    "temperature_low": 43.27,
                    "humidity": 0.76,
                    "weekday": "Monday"
                }
            ]
        }
    }
}
```

### Setup
1. clone repo
2. run 'git clone ' in terminal
3. cd sweater_weather_tyla
4. run 'bundle install'
5. run 'rails db:setup'
6. run 'rails db:migrate'
