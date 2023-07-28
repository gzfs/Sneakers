defmodule Sneakers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SneakersWeb.Telemetry,
      # Start the Ecto repository
      Sneakers.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sneakers.PubSub},
      # Start Finch
      {Finch, name: Sneakers.Finch},
      # Start the Endpoint (http/https)
      SneakersWeb.Endpoint
      # Start a worker by calling: Sneakers.Worker.start_link(arg)
      # {Sneakers.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sneakers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SneakersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
