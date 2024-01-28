# README

## Test Assignment: Weather Statistics API

This project is a weather statistics API. It uses data from [AccuWeather APIs](https://developer.accuweather.com/apis).
The city of "Moscow" is used as an example.

### Endpoints

- `/weather/current`: Current temperature
- `/weather/historical`: Hourly temperature for the last 24 hours
- `/weather/historical/max`: Maximum temperature in the last 24 hours
- `/weather/historical/min`: Minimum temperature in the last 24 hours
- `/weather/historical/avg`: Average temperature in the last 24 hours
- `/weather/by_time`: Find the temperature closest to the given timestamp. If the exact time is not available, it will return a 404 error.
- `/health`: Backend status (always respond with OK)

## Setup

To get started with the project, clone the repository, install the dependencies, 
docker-compose up:

```bash
bundle install

docker-compose up
```

Finally, start the server:

```bash
rails s
```

You can now access at `http://localhost:3000`.

## Testing

To run the tests, use the following command:

```bash
rspec
```
