# AutocompleteInput

This is an autocomplete component for Phoenix LiveView. It uses a form associated custom element, which means it appears in your form params just like any other input element in your form. It is designed to be simple to integrate with live view and fully stylable 
via css.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `autocomplete_input` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:autocomplete_input, "~> 0.1.0"}
  ]
end
```

To install the `autocomplete-input` element javascript: 
```
npm install --prefix assets phoenix-custom-event-hook @launchscout/autocomplete-input
```

Add following to app.js

```js
import '@launchscout/autocomplete-input'
import PhoenixCustomEventHook from 'phoenix-custom-event-hook'

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken},
  hooks: { PhoenixCustomEventHook }
})
```
Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/autocomplete_input>.

