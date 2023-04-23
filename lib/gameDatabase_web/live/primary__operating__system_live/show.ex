defmodule GameDatabaseWeb.Primary_Operating_SystemLive.Show do
  use GameDatabaseWeb, :live_view

  alias GameDatabase.GameDB

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:primary__operating__system, GameDB.get_primary__operating__system!(id))}
  end

  defp page_title(:show), do: "Show Primary  operating  system"
  defp page_title(:edit), do: "Edit Primary  operating  system"
end
