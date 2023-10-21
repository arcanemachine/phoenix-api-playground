defmodule ApiPlaygroundWeb.OpenWeatherJsonLive do
  use ApiPlaygroundWeb, :live_view

  import Ecto.Changeset

  defmodule FormData do
    @types %{city: :string}
    defstruct city: ""

    def changeset(%__MODULE__{} = form_data, attrs) do
      {form_data, @types} |> Ecto.Changeset.cast(attrs, Map.keys(@types))
    end
  end

  def mount(_params, _session, socket) do
    form = build_empty_form()

    {:ok,
     socket
     |> ensure_api_key_present()
     |> assign(page_title: "OpenWeather JSON", form: form)}
  end

  def build_empty_form(), do: to_form(FormData.changeset(%FormData{}, %{}))

  @doc "If OpenWeather API key not present, then redirect and show a flash error message."
  def ensure_api_key_present(socket) do
    if Application.get_env(:api_playground, :openweather_api_key) != nil do
      socket
    else
      socket
      |> put_flash(
        :error,
        "OPENWEATHER_API_KEY environment variable not set. Please set it and restart the server."
      )
      |> redirect(to: ~p"/")
    end
  end

  def handle_event("submit", %{"form_data" => form_data}, socket) do
    form = _validate_form(form_data)

    {:noreply,
     socket
     |> put_flash(:info, "Received 'submit' event (City: '#{form_data["city"]}')")
     |> assign(form: form)}
  end

  def handle_event("validate", %{"form_data" => form_data}, socket) do
    {:noreply, assign(socket, form: _validate_form(form_data))}
  end

  defp _validate_form(params) do
    %FormData{}
    |> FormData.changeset(params)
    |> validate_required([:city])
    |> Map.put(:action, :validate)
    |> to_form()
  end
end
