# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wabanex,
  ecto_repos: [Wabanex.Repo]

# setting id's as uuid's
config :wabanex, Wabanex.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :wabanex, WabanexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BbBv8c50i0sc4UI0dEyh+FG7bOS5djIUy5+kjvFX1JTFaGX7rBNKakOr6CoywKl0",
  render_errors: [view: WabanexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Wabanex.PubSub,
  live_view: [signing_salt: "+PbbTexm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :wabanex, :storage_api, Wabanex.Providers.Storage.AwsS3

config :ex_aws,
  debug_requests: true,
  json_codec: Jason,
  access_key_id: "",
  secret_access_key: ""

config :ex_aws, :s3,
  scheme: "https://",
  host: "",
  region: ""

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
