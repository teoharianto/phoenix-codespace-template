defmodule PhoenixCodespaceTemplate.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixCodespaceTemplateWeb.Telemetry,
      PhoenixCodespaceTemplate.Repo,
      {DNSCluster, query: Application.get_env(:phoenix_codespace_template, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixCodespaceTemplate.PubSub},
      # Start a worker by calling: PhoenixCodespaceTemplate.Worker.start_link(arg)
      # {PhoenixCodespaceTemplate.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixCodespaceTemplateWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixCodespaceTemplate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixCodespaceTemplateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
