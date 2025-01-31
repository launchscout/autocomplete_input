defmodule AutocompleteTestbedWeb.AutocompletedForm do
  use AutocompleteTestbedWeb, :live_view

  @fruit_options [{"Apple", "apple"}, {"Banana", "banana"}, {"Cherry", "cherry"}, {"Nanna", "nanna"}]
  @animal_options [{"Dog", "dog"}, {"Cat", "cat"}, {"Bird", "bird"}, {"Bearcat", "bearcat"}]

  import AutocompleteInput

  def mount(params, session, socket) do
    {:ok, socket |> assign(fruit_options: [], animal_options: [], results: %{})}
  end

  def handle_event("autocomplete-search", %{"name" => "fruit", "query" => value}, socket) do
    {:noreply, socket |> assign(fruit_options: @fruit_options |> Enum.filter(&label_matches?(value, &1)))}
  end

  def handle_event("autocomplete-search", %{"name" => "animal", "query" => value}, socket) do
    {:noreply, socket |> assign(animal_options: @animal_options |> Enum.filter(&label_matches?(value, &1)))}
  end

  def handle_event("autocomplete-commit", _params, socket) do
    {:noreply, socket |> assign(options: [])}
  end

  def handle_event("change", %{"autocomplete-input" => value}, socket) do
    IO.inspect(value, label: "change")
    {:noreply, socket |> assign(selected_value: value)}
  end

  def handle_event("submit", %{"fruit" => fruit, "animal" => animal}, socket) do
    {:noreply, socket |> assign(results: %{fruit: fruit, animal: animal})}
  end

  defp label_matches?(query, {label, _}) do
    String.contains?(String.downcase(label), String.downcase(query))
  end
end
