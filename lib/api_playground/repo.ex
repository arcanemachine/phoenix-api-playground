defmodule ApiPlayground.Repo do
  use Ecto.Repo,
    otp_app: :api_playground,
    adapter: Ecto.Adapters.Postgres
end
