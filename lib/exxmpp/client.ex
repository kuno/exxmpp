defrecord :xmlstreamstart, Record.extract(:xmlstreamstart, from_lib: "exmpp/include/exmpp.hrl")
defrecord :xmlstreamelement, Record.extract(:xmlstreamelement, from_lib: "exmpp/include/exmpp.hrl")
defrecord :xmlstreamend, Record.extract(:xmlstreamend, from_lib: "exmpp/include/exmpp.hrl")
defrecord :received_packet, Record.extract(:received_packet, from_lib: "exmpp/include/exmpp_client.hrl")

defmodule Exxmpp.Client do

  def start do
    user = System.get_env("CHAT_USER") |> to_char_list
    pass = System.get_env("CHAT_PASS") |> to_char_list
    start(user, pass)
  end

  def start(user, pass) do
    spawn __MODULE__, :init, [user, pass]
  end

  def stop(pid) do
    send pid, :stop
  end

  def init(user, pass) do
    host = System.get_env("CHAT_HOST") |> to_char_list
    session = :exmpp_session.start
    jid = :exmpp_jid.make user, host, :random
    :exmpp_session.auth session, jid, pass, :digest
    {:ok, _stream} = :exmpp_session.connect_TCP session, host, 5222
    login session
  end

  defp login(session) do
    case :exmpp_session.login session do
      {:ok, _jid} ->
        :exmpp_session.send_packet(session, :exmpp_presence.set_status(:exmpp_presence.available, "Ready!"))
        listen session
      _ ->
        IO.puts "Error!"
    end
  end

  defp listen(session) do
    IO.puts "Listening...."
    receive do
      :stop ->
        :exmpp_session.stop session
      record ->
        IO.inspect record
        listen session
    end
  end
end
