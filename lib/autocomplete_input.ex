defmodule AutocompleteInput do
  use Phoenix.Component

  attr(:options, :list, required: true)
  attr(:id, :string, required: true)
  attr(:name, :string, required: true)
  attr(:display_value, :string, required: true)
  attr(:value, :string, required: true)
  attr(:min_length, :integer, required: false)

  def autocomplete_input(assigns) do
    ~H"""
    <autocomplete-input
      items={to_items(@options)}
      name={@name}
      value={@value}
      display-value={@display_value}
      min-length={@min_length}
      phx-hook="PhoenixCustomEventHook"
      phx-send-events="autocomplete-search,autocomplete-commit,autocomplete-close,autocomplete-open"
      id={@id}
    >
    </autocomplete-input>
    """
  end

  defp to_items(options) do
    options
    |> Enum.map(&to_item/1)
    |> Jason.encode!()
  end

  defp to_item({label, value}) do
    %{
      label: label,
      value: value
    }
  end
end
