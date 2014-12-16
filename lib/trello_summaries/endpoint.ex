defmodule TrelloSummaries.Endpoint do
  use Phoenix.Endpoint, otp_app: :trello_summaries

  plug Plug.Static,
    at: "/", from: :trello_summaries

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_trello_summaries_key",
    signing_salt: "gATo6WME",
    encryption_salt: "zWEoT2ms"

  plug :router, TrelloSummaries.Router
end
