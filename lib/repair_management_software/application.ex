defmodule RepairManagementSoftware.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RepairManagementSoftwareWeb.Telemetry,
      RepairManagementSoftware.Repo,
      {DNSCluster, query: Application.get_env(:repair_management_software, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RepairManagementSoftware.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RepairManagementSoftware.Finch},
      # Start a worker by calling: RepairManagementSoftware.Worker.start_link(arg)
      # {RepairManagementSoftware.Worker, arg},
      # Start to serve requests, typically the last entry
      RepairManagementSoftwareWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RepairManagementSoftware.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RepairManagementSoftwareWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
