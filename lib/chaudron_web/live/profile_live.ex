defmodule ChaudronWeb.ProfileLive do
  use ChaudronWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, edit_mode: false)}
  end

  def render(assigns) do
    ~H"""
    <section class="pt-8 pr-8 pb-8">
      <button class="custom-hover" phx-click="toggle_edit_mode">
        <%= if @edit_mode, do: "Cancel", else: "Edit" %>
      </button>
    </section>
    <section>
      <.live_component
        module={ChaudronWeb.PersonalInformationLive}
        id="personal_info"
        user={@current_user}
        edit_mode={@edit_mode}
      />
    </section>
    <section>
      <.live_component
        module={ChaudronWeb.RevenueLive}
        id="revenue"
        user={@current_user}
        edit_mode={@edit_mode}
      />
    </section>
    """
  end

  def handle_event("toggle_edit_mode", _, socket) do
    {:noreply, update(socket, :edit_mode, &(!&1))}
  end
end
