defmodule PhoenixPubSubKafka.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :phoenix_pubsub_kafka,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      dialyzer: [
        plt_add_deps: :transitive,
        flags: [
          :error_handling,
          :race_connditions
        ]
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test],
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :kafka_ex, :phoenix_pubsub]
    ]
  end

  defp deps do
    [
      {:phoenix_pubsub, "~> 1.0"},
      {:kafka_ex, github: "akuriya/kafka_ex", ref: "0585ac0f38e1a65b3f9fa1c10dbbdd6e67ade9d1"},
      {:credo, "~> 0.8.10", only: :dev},
      {:dialyxir, "~> 0.5.1", only: :dev},
      {:excoveralls, "~> 0.8", only: :test},
      {:ex_doc, "~> 0.17.1", only: :docs}
    ]
  end

  defp description do
    "Kafka adapter for Phoenix's PubSub layer."
  end

  defp package do
    [
      maintainers: ["ohr486"],
      files: ["lib", "config/config.exs", "mix.exs", "README.md"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/ohr486/phoenix_pubsub_kafka"}
    ]
  end
end
