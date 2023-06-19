defmodule Gifhub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GifhubWeb.Telemetry,
      # Start the Ecto repository
      Gifhub.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gifhub.PubSub},
      # Start Finch
      {Finch, name: Gifhub.Finch},
      # Start the Endpoint (http/https)
      GifhubWeb.Endpoint
      # Start a worker by calling: Gifhub.Worker.start_link(arg)
      # {Gifhub.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gifhub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GifhubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
