defmodule LimiterRemovalWeb.Router do
  use LimiterRemovalWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LimiterRemovalWeb.LayoutView, :root}
    # Or set the layout at the controller level with `put_layout {Mod, fun}`
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :turbo do
    # This pipeline is optimized for SSE (server side events)
    # and sending HTML over the wire.
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # For Turbo Streams we could set request headers at this level or the controller
  end

  scope "/", LimiterRemovalWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/chat", LimiterRemovalWeb do
    pipe_through :browser

    get "/", ChatController, :index

    # Although the path below retrieves a full page (with layout)
    # only the matching tubo-frame id will be put in place
    get "/list", ChatController, :list
  end

  scope "/turbo/chat", LimiterRemovalWeb do
    # This path is meant to deliver turbo components
    pipe_through :turbo

    get "/edit", ChatController, :edit
    post "/submit", ChatController, :submit
  end

  # Other scopes may use custom stacks.
  # scope "/api", LimiterRemovalWeb do
  #   pipe_through :api
  # end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
