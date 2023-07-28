defmodule Sneakers.Repo do
  use Ecto.Repo,
    otp_app: :sneakers,
    adapter: Ecto.Adapters.SQLite3
end
