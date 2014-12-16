defmodule TrelloSummaries.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", TrelloSummaries do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/trellos", PageController, :trellos
  end



  # Other scopes may use custom stacks.
  # scope "/api", TrelloSummaries do
  #   pipe_through :api
  # end
end
