defmodule ApiPlaygroundWeb.OpenWeatherJsonLive do
  use ApiPlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    api_key_exists = Application.get_env(:api_playground, :openweather_api_key) != nil

    {:ok, socket |> assign(api_key_exists: api_key_exists)}
  end
end
