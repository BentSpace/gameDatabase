defmodule GameDatabaseWeb.Primary_Operating_SystemLive.FormComponent do
  use GameDatabaseWeb, :live_component

  alias GameDatabase.GameDB

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage primary__operating__system records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="primary__operating__system-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:maker]} type="text" label="Maker" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Primary  operating  system</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{primary__operating__system: primary__operating__system} = assigns, socket) do
    changeset = GameDB.change_primary__operating__system(primary__operating__system)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"primary__operating__system" => primary__operating__system_params}, socket) do
    changeset =
      socket.assigns.primary__operating__system
      |> GameDB.change_primary__operating__system(primary__operating__system_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"primary__operating__system" => primary__operating__system_params}, socket) do
    save_primary__operating__system(socket, socket.assigns.action, primary__operating__system_params)
  end

  defp save_primary__operating__system(socket, :edit, primary__operating__system_params) do
    case GameDB.update_primary__operating__system(socket.assigns.primary__operating__system, primary__operating__system_params) do
      {:ok, primary__operating__system} ->
        notify_parent({:saved, primary__operating__system})

        {:noreply,
         socket
         |> put_flash(:info, "Primary  operating  system updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_primary__operating__system(socket, :new, primary__operating__system_params) do
    case GameDB.create_primary__operating__system(primary__operating__system_params) do
      {:ok, primary__operating__system} ->
        notify_parent({:saved, primary__operating__system})

        {:noreply,
         socket
         |> put_flash(:info, "Primary  operating  system created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
