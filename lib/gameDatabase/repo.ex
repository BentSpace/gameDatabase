defmodule GameDatabase.Repo do
  use Ecto.Repo,
    otp_app: :gameDatabase,
    adapter: Ecto.Adapters.Postgres
end
