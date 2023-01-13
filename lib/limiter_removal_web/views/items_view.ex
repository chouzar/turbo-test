defmodule LimiterRemovalWeb.ItemsView do
  use LimiterRemovalWeb, :view

  # This is meant to be an example of how to render without
  # separating Views, Templates and Components into multiple
  # directories.
  def render("list.html", assigns) do
    ~H"""
      <% # Lazy load this frame %>
      <turbo-frame id="items">
        <LimiterRemoval.ItemsComponent.list [] />
      </turbo-frame>
    """
  end
end

defmodule LimiterRemoval.ItemsComponent do
  use Phoenix.Component

  def list(assigns) do
    ~H"""
    <% # Lazy load this frame %>
    <turbo-frame id="items">
      <ul>
        <li>Component 1</li>
        <li>Component 2</li>
        <li>Component 3</li>
        <li>Component 4</li>
        <li>Component 5</li>
      </ul>
    </turbo-frame>
    """
  end
end
