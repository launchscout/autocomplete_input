defmodule AutocompleteTestbedWeb.AutocompleteTest do
  use ExUnit.Case
  use Wallaby.Feature

  import Wallaby.Query


  feature "autocomplete input", %{session: session} do
    session
    |> visit("/autocompleted-form")
    |> find(css("autocomplete-input"))
    |> shadow_root()
    |> click(css("span", text: "label"))
    |> fill_in(css("input"), with: "abc")
    |> assert_has(css("li", text: "Option 1"))
    |> assert_has(css("li", text: "Option 2"))
    |> click(css("li", text: "Option 1"))
    |> assert_has(css("span", text: "Option 1"))
    |> refute_has(css("li", text: "Option 2"))

    session |> click(css("button", text: "Submit")) |> assert_has(css("#selected-value", text: "option1"))
  end

end
