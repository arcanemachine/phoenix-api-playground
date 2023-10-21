defmodule ApiPlaygroundWeb.PageController do
  use ApiPlaygroundWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, page_title: "Home", layout: false)
  end
end
