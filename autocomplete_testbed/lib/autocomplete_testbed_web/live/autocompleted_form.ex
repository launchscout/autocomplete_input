defmodule AutocompleteTestbedWeb.AutocompletedForm do
  use AutocompleteTestbedWeb, :live_view

  import AutocompleteInput

  def mount(params, session, socket) do
    {:ok, socket |> assign(options: [], selected_value: nil)}
  end

  def handle_event("autocomplete-search", %{"query" => value}, socket) do
    {:noreply, socket |> assign(options: [{"Option 1", "option1"}, {"Option 2", "option2"}])}
  end

  def handle_event("autocomplete-commit", _params, socket) do
    {:noreply, socket |> assign(options: [])}
  end

  def handle_event("change", %{"autocomplete-input" => value}, socket) do
    IO.inspect(value, label: "change")
    {:noreply, socket |> assign(selected_value: value)}
  end

  def handle_event("submit", %{"autocomplete-input" => value}, socket) do
    {:noreply, socket |> assign(selected_value: value)}
  end

end
