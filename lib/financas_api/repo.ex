defmodule FinancasApi.Repo do
  use Ecto.Repo,
    otp_app: :financas_api,
    adapter: Ecto.Adapters.Postgres
end
