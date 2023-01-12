defmodule LimiterRemoval.Repo do
  use Ecto.Repo,
    otp_app: :limiter_removal,
    adapter: Ecto.Adapters.Postgres
end
