defmodule DateFilterTest do
  use ExUnit.Case

  import TrelloSummaries.DateFilter
  alias DailyTrello.Card

  test "days difference" do
    assert days_difference({{2015, 1, 10}, {0, 0, 0}}, {{2015, 1, 10}, {0, 0, 0}}) == 0
    assert days_difference({{2015, 1, 10}, {0, 0, 0}}, {{2015, 1, 11}, {0, 0, 0}}) == 1
    assert days_difference({{2015, 1, 11}, {0, 0, 0}}, {{2015, 1, 10}, {0, 0, 0}}) == -1
    assert days_difference({{2015, 1, 10}, {0, 0, 0}}, {{2015, 1, 11}, {12, 0, 0}}) == 1.5
    assert days_difference({{2015, 1, 10}, {0, 0, 0}}, {{2015, 1, 11}, {4, 48, 0}}) == 1.2
  end

  test "filter_cards_by_age" do
    cards = (10..20) |> Enum.map(fn day -> %Card{date_last_activity: {{2015, 1, day}, {0,0,0}}, id: day} end)

    assert cards 
      |> filter_cards_by_age(5, {{2015, 1, 20}, {0, 0, 1}})
      |> Enum.map(fn card -> card.id end)
      == [16, 17, 18, 19, 20]
  end
  

end
