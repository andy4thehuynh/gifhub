defmodule Gifhub.Repo do
  use Ecto.Repo,
    otp_app: :gifhub,
    adapter: Ecto.Adapters.Postgres
end
