defmodule FinancasApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FinancasApiWeb.Telemetry,
      FinancasApi.Repo,
      {DNSCluster, query: Application.get_env(:financas_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FinancasApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FinancasApi.Finch},
      # Start a worker by calling: FinancasApi.Worker.start_link(arg)
      # {FinancasApi.Worker, arg},
      # Start to serve requests, typically the last entry
      FinancasApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FinancasApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FinancasApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
