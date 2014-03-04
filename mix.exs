defmodule Exxmpp.Mixfile do
  use Mix.Project

  def project do
    [ app: :exxmpp,
      version: "0.0.1",
      elixir: "~> 0.12.3",
      deps: deps ]
  end

  def application do
    [
      mod: { Exxmpp, [] },
      applications: [
        :crypto,
        :ssl,
        :exmpp
      ]
    ]
  end

  defp deps do
    [
      { :exmpp, github: "jeanparpaillon/exmpp" }
    ]
  end
end
