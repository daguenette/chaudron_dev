defmodule ChaudronWeb.AboutController do
  use ChaudronWeb, :controller

  def about(conn, _params) do
    render(conn, :about)
  end
end
