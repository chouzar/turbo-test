defmodule LimiterRemovalWeb.ChatView do
  use LimiterRemovalWeb, :view

  # This is meant to be an example of how to render without
  # separating Views, Templates and Components into multiple
  # directories.
  def render("list.html", assigns) do
    ~H"""
      <% # Lazy load this frame %>
      <turbo-frame id="agents">
        <LimiterRemoval.ItemsComponent.list agents={@agents} />
      </turbo-frame>
    """
  end
end

defmodule LimiterRemoval.ItemsComponent do
  use Phoenix.Component

  # Upcoming phoenix version you can do:
  # attr :items, :list, required: true

  def list(assigns) do
    ~H"""
    <ol>
      <%= for item <- @agents do %>
      <li><%= item %></li>
      <% end %>
    </ol>
    """
  end
end
