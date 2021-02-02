defmodule Delivertrade.Repo do
  use Ecto.Repo,
    otp_app: :delivertrade,
    adapter: Ecto.Adapters.Postgres
end
