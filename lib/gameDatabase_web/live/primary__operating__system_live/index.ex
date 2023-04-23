defmodule GameDatabaseWeb.Primary_Operating_SystemLive.Index do
  use GameDatabaseWeb, :live_view

  alias GameDatabase.GameDB
  alias GameDatabase.GameDB.Primary_Operating_System

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :primary_operating_systems, GameDB.list_primary_operating_systems())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Primary  operating  system")
    |> assign(:primary__operating__system, GameDB.get_primary__operating__system!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Primary  operating  system")
    |> assign(:primary__operating__system, %Primary_Operating_System{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Primary operating systems")
    |> assign(:primary__operating__system, nil)
  end

  @impl true
  def handle_info({GameDatabaseWeb.Primary_Operating_SystemLive.FormComponent, {:saved, primary__operating__system}}, socket) do
    {:noreply, stream_insert(socket, :primary_operating_systems, primary__operating__system)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    primary__operating__system = GameDB.get_primary__operating__system!(id)
    {:ok, _} = GameDB.delete_primary__operating__system(primary__operating__system)

    {:noreply, stream_delete(socket, :primary_operating_systems, primary__operating__system)}
  end
end
