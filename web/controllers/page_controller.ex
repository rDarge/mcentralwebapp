defmodule MCentral.PageController do
  use MCentral.Web, :controller

  plug :set_status, "Stopped"

  def index(conn, _params) do
    render conn, "index.html"
  end

  def status(conn, %{"status" => status}) do
  	render conn, "show.html", status: status
  end

  defp set_status(conn, status) do
  	assign(conn, :status, status)
  end
end
