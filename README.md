# phoenix-api-playground

A personal sandbox for interacting with XML and JSON APIs.

Available APIs:

    - OpenWeatherMap (JSON + XML)

## Up and Running

Ensure that you have [configured your environment](#configuring-your-environment) correctly before you begin.

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Configuring Your Environment

This project uses the following environment variables:

    - `OPENWEATHER_API_KEY` - Your API key used to access the OpenWeather API

You can use the file `.env.example` as a template for a dotenv file.
