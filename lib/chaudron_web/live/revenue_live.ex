defmodule ChaudronWeb.RevenueLive do
  use ChaudronWeb, :live_component
  alias Chaudron.{Revenues, Revenues.Revenue}

  def update(assigns, socket) do
    current_user = assigns.user

    revenue =
      Revenues.get_revenue(current_user.id) || %Revenue{}

    changeset = Revenues.change_revenue(revenue)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(
       form: to_form(changeset),
       revenue: revenue,
       edit_mode: assigns[:edit_mode] || false
     )}
  end

  def handle_event("cancel", _, socket) do
    send_update(ChaudronWeb.RevenueLive, id: "revenue", edit_mode: false)
    {:noreply, socket}
  end

  def handle_event("save-revenue", %{"revenue" => params}, socket) do
    current_user = socket.assigns.user

    parsed_params = parse_financial_params(params)

    case Revenues.create_or_update_revenue(current_user, parsed_params) do
      {:ok, updated_revenue} ->
        {:noreply,
         socket
         |> assign(
           revenue: updated_revenue,
           edit_mode: false,
           form: to_form(Revenues.change_revenue(updated_revenue))
         )
         |> put_flash(:info, "Revenue information updated successfully")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  # Helper function to parse financial values
  defp parse_financial_params(params) do
    Enum.map(params, fn {key, value} ->
      case Float.parse(String.replace(value, ~r/[^\d.]/, "")) do
        {float_value, _} -> {key, float_value}
        # Keep original value if parsing fails
        :error -> {key, value}
      end
    end)
    |> Enum.into(%{})
  end
end
