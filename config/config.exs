# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :trello_summaries, TrelloSummaries.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iaMslwJk1JJ1i12+DmP+h8NXqL9h2cXux+DVXecBok5GDf9NF8KEP0Q49CJLAly/",
  debug_errors: false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
