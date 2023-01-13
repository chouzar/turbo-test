defmodule LimiterRemovalWeb.ItemsController do
  use LimiterRemovalWeb, :controller

  def index(conn, _params) do
    conn
    #|> put_layout("turbo.html")
    #|> put_layout({TurboView, "turbo.html"})
    |> render("index.html")
  end

  def edit(conn, _params) do
    render(conn, "edit.html")
  end

  def list(conn, _params) do
    render(conn, "list.html")
  end
end
