import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :autocomplete_testbed, AutocompleteTestbedWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "M0aTg700+CNTDNaf8dfCu+jT35DO44NxOQ5HxO+IeBQNsVmDXgWzaUJfgNNPiIsP",
  server: true

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

config :wallaby,
  otp_app: :autocomplete_testbed,
  base_url: "http://localhost:4002"
  # chromedriver: [
  #   headless: false
  # ]
