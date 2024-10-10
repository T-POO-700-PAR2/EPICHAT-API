defmodule EpiChat.Repo do
  use Ecto.Repo,
    otp_app: :epi_chat,
    adapter: Ecto.Adapters.Postgres
end
