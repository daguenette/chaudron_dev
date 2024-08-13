defmodule ChaudronWeb.PersonalInformationLive do
  use ChaudronWeb, :live_component
  alias Chaudron.{PersonalInformations, PersonalInformations.PersonalInformation}

  def update(assigns, socket) do
    current_user = assigns.user

    personal_info =
      PersonalInformations.get_personal_information(current_user.id) || %PersonalInformation{}

    changeset = PersonalInformations.change_personal_information(personal_info)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(
       form: to_form(changeset),
       personal_info: personal_info,
       edit_mode: assigns[:edit_mode] || false
     )}
  end

  def handle_event("save-personal-information", %{"personal_information" => params}, socket) do
    current_user = socket.assigns.user

    case PersonalInformations.create_or_update_personal_information(current_user, params) do
      {:ok, updated_info} ->
        {:noreply,
         socket
         |> assign(
           personal_info: updated_info,
           edit_mode: false,
           form: to_form(PersonalInformations.change_personal_information(updated_info))
         )
         |> put_flash(:info, "Personal information updated successfully")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
