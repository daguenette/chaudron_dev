defmodule ChaudronWeb.CreatePersonalInformationLive do
  use ChaudronWeb, :live_view
  alias Chaudron.{PersonalInformations, PersonalInformations.PersonalInformation}

  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user

    personal_info =
      PersonalInformations.get_personal_information(current_user.id) || %PersonalInformation{}

    changeset = PersonalInformations.change_personal_information(personal_info)

    {:ok,
     assign(socket,
       form: to_form(changeset),
       personal_info: personal_info,
       edit_mode: false
     )}
  end

  def handle_event("edit", _, socket) do
    {:noreply, assign(socket, edit_mode: true)}
  end

  def handle_event("cancel", _, socket) do
    {:noreply, assign(socket, edit_mode: false)}
  end

  def handle_event("save", %{"personal_information" => params}, socket) do
    IO.inspect(params, label: "Params received in save event")
    current_user = socket.assigns.current_user

    case PersonalInformations.create_or_update_personal_information(current_user, params) do
      {:ok, updated_info} ->
        {:noreply,
         socket
         |> put_flash(:info, "Personal information updated successfully")
         |> assign(personal_info: updated_info, edit_mode: false)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
