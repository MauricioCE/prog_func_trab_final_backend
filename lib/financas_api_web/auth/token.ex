# lib/my_app/auth/token.ex
defmodule FinancasApiWeb.Auth.Token do
  @moduledoc false

  defp signer do
    Joken.Signer.create("HS256", "123456")
  end

  def gerar_token(claims \\ %{}) do
    signer = signer()
    Joken.encode_and_sign(claims, signer)
  end

  def validar_token(token) do
    signer = signer()
    token_config = Joken.Config.default_claims()

    Joken.verify_and_validate(token_config, token, signer)
  end
end
