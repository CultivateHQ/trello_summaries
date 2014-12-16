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

      ids |> Enum.map(fn(id) ->
        IO.puts fetch({:board_name, {id}}, {trello_key, trello_token}) |> decode |> inspect
      end
    )

    render conn, "index.html"
  end

  defp trello_key do
    System.get_env("TRELLO_KEY")
  end

  defp trello_token do
    System.get_env("TRELLO_TOKEN")
  end
end
