defmodule LimiterRemovalWeb.ChatController do
  use LimiterRemovalWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end

  def edit(conn, _params) do
    conn
    |> render("edit.html")
  end

  def submit(conn, %{"message" => %{"content" => content}}) do
    conn
    |> Plug.Conn.put_resp_header("content-type", "text/vnd.turbo-stream.html")
    |> render("message.html", content: content)

    #conn
    #|> render("submit.html", content: content)
  end

  def list(conn, _params) do
    Process.sleep(:timer.seconds(2))

    conn
    |> render("list.html", agents: Enum.shuffle(["Raúl", "Pedro", "Okari"]))
  end
end
