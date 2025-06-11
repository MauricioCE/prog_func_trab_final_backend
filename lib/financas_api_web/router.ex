defmodule FinancasApiWeb.Router do
  use FinancasApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FinancasApiWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/tags", TagController, except: [:new, :edit]
    resources "/transactions", TransactionController, except: [:new, :edit]
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:financas_api, :dev_routes) do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
