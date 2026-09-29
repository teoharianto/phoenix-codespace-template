defmodule PhoenixCodespaceTemplateWeb.PageController do
  use PhoenixCodespaceTemplateWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
