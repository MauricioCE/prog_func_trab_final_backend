defmodule FinancasApiWeb.Router do
  use FinancasApiWeb, :router

  alias FinancasApiWeb.Auth.AuthController
  alias FinancasApiWeb.TagController
  alias FinancasApiWeb.TransactionController
  alias FinancasApiWeb.UserController

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug FinancasApiWeb.Auth.AuthPlug
  end

  scope "/api" do
    pipe_through :api

    post "/users/login", AuthController, :login
    post "/users/register", AuthController, :register
  end

  scope "/api" do
    pipe_through [:api, :auth]

    resources "/users", UserController, except: [:new, :edit]
    resources "/tags", TagController, except: [:new, :edit]
    resources "/transactions", TransactionController, except: [:new, :edit]
    post "/transactions/list", TransactionController, :list_by_user
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:financas_api, :dev_routes) do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
