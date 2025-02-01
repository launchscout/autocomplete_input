defmodule AutocompleteTestbedWeb.AutocompleteTest do
  use ExUnit.Case
  use Wallaby.Feature

  import Wallaby.Query


  feature "autocomplete input", %{session: session} do
    session
    |> visit("/autocompleted-form")
    |> find(css("autocomplete-input[name='fruit']"))
    |> shadow_root()
    |> click(css("span", text: "Choose a fruit"))
    |> fill_in(css("input"), with: "nan")
    |> assert_has(css("li", text: "Nanna"))
    |> assert_has(css("li", text: "Banana"))
    |> click(css("li", text: "Nanna"))
    |> assert_has(css("span", text: "Nanna"))
    |> refute_has(css("li", text: "Banana"))

    session |> click(css("button", text: "Submit")) |> assert_has(css("#selected-fruit", text: "nanna"))
  end

  feature "doing the same search twice", %{session: session} do
    session
    |> visit("/autocompleted-form")
    |> find(css("autocomplete-input[name='animal']"))
    |> shadow_root()
    |> click(css("span", text: "Choose an animal"))
    |> fill_in(css("input"), with: "cat")
    |> assert_has(css("li", text: "Cat"))
    |> click(css(".cancel-icon"))
    |> click(css("span", text: "Choose an animal"))
    |> fill_in(css("input"), with: "cat")
    |> assert_has(css("li", text: "Cat"))
  end
end
