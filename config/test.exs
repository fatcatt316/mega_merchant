use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mega_merchant, MegaMerchant.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mega_merchant, MegaMerchant.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "joep",
  password: "",
  database: "mega_merchant_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
