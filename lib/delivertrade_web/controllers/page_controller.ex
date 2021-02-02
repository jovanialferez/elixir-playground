defmodule DelivertradeWeb.PageController do
  use DelivertradeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
