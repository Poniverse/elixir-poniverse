defmodule Poniverse.Mixfile do
  use Mix.Project

  def project do
    [app: :poniverse,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps()]
  end

  defp description do
    """
    OAuth2 Strategy to authenticate with Poniverse.net
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Adam Lavin", "Ross Gibson"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/Poniverse/elixir-poniverse"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:oauth2, "~> 0.8"},
      {:ex_doc, "~> 0.11", only: :dev},
      {:earmark, "~> 0.1", only: :dev}
    ]
  end
end
