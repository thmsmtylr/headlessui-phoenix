defmodule EmryWeb.PageController do
  use EmryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def documentation(conn, _params) do
    render(conn, "documentation.html")
  end
end
