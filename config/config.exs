# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mega_merchant,
  ecto_repos: [MegaMerchant.Repo]

# Configures the endpoint
config :mega_merchant, MegaMerchant.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OkAbXGbXvN/EeTEEb9NjbGuh/GOJ1SyRnhosrz2UcHBoWesQUfEHyQ5sg+0QCZgJ",
  render_errors: [view: MegaMerchant.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MegaMerchant.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
