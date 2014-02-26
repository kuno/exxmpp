# Exxmpp

Getting `exmpp` working in Elixir.

## Getting started

Get and compile the dependencies.

```bash
mix deps.get
```

Set environment variables for `CHAT_HOST`, `CHAT_USER`, and `CHAT_PASS`.
`CHAT_USER` should be the `node` part of the XMPP jid.

Start an `iex` session.

```bash
$ iex -S mix
iex(1)> Exxmpp.Client.start
```

This should just sit there in a loop and show any incoming stanzas recieved by
the user.

## TODO

Unfortunately `exmpp` doesn't seem like it's being actively developed. It doesn't
look like it's being used in ejabberd anymore either. So it may not be worth
it to continue exploring this library any further.
