defmodule EmryWeb.PageController do
  use EmryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
