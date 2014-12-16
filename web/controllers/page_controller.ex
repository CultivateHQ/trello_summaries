defmodule TrelloSummaries.PageController do
  use Phoenix.Controller
  import DailyTrello.Fetch
  import DailyTrello.Decode

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def trellos(conn, params) do
    ids = params["ids"] |> String.split(",")

     trellos =  ids |> Parallel.pmap(fn(id) ->
        %{board_name: fetch({:board_name, {id}}, {trello_key, trello_token}) |> decode,
          cards: fetch({:board_lists, {id}}, {trello_key, trello_token}) |> decode,
          }
      end
    )

    conn
      |> assign(:trellos, trellos)
      |> render("trellos.html")
  end

  defp trello_key do
    System.get_env("TRELLO_KEY")
  end

  defp trello_token do
    System.get_env("TRELLO_TOKEN")
  end
end
