defmodule MCentral.Router do
  use MCentral.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MCentral do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/startserver", ServerController, :startServer
    get "/stopserver", ServerController, :stopServer
    get "/bananas", BananaController, :do
  end

  # Other scopes may use custom stacks.
  # scope "/api", MCentral do
  #   pipe_through :api
  # end
end
