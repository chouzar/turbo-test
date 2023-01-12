defmodule LimiterRemovalWeb.PageController do
  use LimiterRemovalWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
