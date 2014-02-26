defmodule Exxmpp do
  use Application.Behaviour

  def start(_type, _args) do
    Exxmpp.Supervisor.start_link
  end
  
end
