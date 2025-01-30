defmodule AutocompleteTestbedWeb.AutocompletedForm do
  use AutocompleteTestbedWeb, :live_view

  import AutocompleteInput

  def mount(params, session, socket) do
    {:ok, socket |> assign(options: [])}
  end

  def handle_event("autocomplete-search", %{"query" => value}, socket) do
    {:noreply, socket |> assign(options: [{"Option 1", "option1"}, {"Option 2", "option2"}])}
  end
end
