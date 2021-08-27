defmodule FlyBirdy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FlyBirdy.Repo,
      # Start the Telemetry supervisor
      FlyBirdyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FlyBirdy.PubSub},
      # Start the Endpoint (http/https)
      FlyBirdyWeb.Endpoint
      # Start a worker by calling: FlyBirdy.Worker.start_link(arg)
      # {FlyBirdy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FlyBirdy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FlyBirdyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
