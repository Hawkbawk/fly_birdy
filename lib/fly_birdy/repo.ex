defmodule FlyBirdy.Repo do
  use Ecto.Repo,
    otp_app: :fly_birdy,
    adapter: Ecto.Adapters.Postgres
end
