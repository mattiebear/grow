defmodule GrowWeb.PlotLive do
  use GrowWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>Plot live view</div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end
end
