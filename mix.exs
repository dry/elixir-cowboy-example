defmodule Example.Mixfile do
  use Mix.Project

  def project do
    [ app: :example,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      { :erl_opts, [parse_transform: "lager_transform"] }
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      { :cowboy, github: "extend/cowboy", tag: "0.6.1" },
      { :lager, github: "basho/lager" }
    ]
  end
end
