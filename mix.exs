defmodule ToneAnalyzer.Mixfile do
  use Mix.Project

  def project do
    [
     app: :tone_analyzer,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: [main_module: CommandLine],
     package: package(),
     deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [
        :logger,
        :httpotion,
        :table_rex
      ]
    ]
  end

  defp package do
    [
      name: :tone_analyzer,
      files: [],
      maintainers: [],
      licenses: [],
      links: links()
    ]
  end

  defp links do
    %{
      "Github" => "url",
      "Docs" => "url"
    }
  end

  defp deps do
    [
      {:httpotion, "~> 3.0"},
      {:poison, "~> 3.0"},
      {:table_rex, "~> 0.8"}
    ]
  end
end
