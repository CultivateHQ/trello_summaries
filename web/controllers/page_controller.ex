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
          board_id: id,
          cards: fetch({:board_lists, {id}}, {trello_key, trello_token}) |> decode,
          }
      end
    )

    conn
      |> assign(:trellos, trellos)
      |> assign(:boards, ["For Triage", "To Do", "Blocked", "Doing", "Pull Request Submitted", "Ready for Sign-off"])
      |> render("trellos.html")
  end

  defp trello_key do
    System.get_env("TRELLO_KEY")
  end

  defp trello_token do
    System.get_env("TRELLO_TOKEN")
  end
end
