defmodule TrelloSummaries.DateFilter do

  @seconds_in_a_day 24 * 60 * 60

  def days_difference daytime1, daytime2 do
    case :calendar.time_difference(daytime1, daytime2) do
      {days, time} -> days + :calendar.time_to_seconds(time) / @seconds_in_a_day
    end
  end
  

  def filter_cards_by_age(cards, younger_than_days, now) do
    cards 
      |> Enum.filter(fn card -> days_difference(card.date_last_activity, now) < younger_than_days end)
  end

  def filter_cards_by_age(cards, younger_than_days) do
    filter_cards_by_age(cards, younger_than_days, :erlang.now |> :calendar.now_to_datetime)
  end
  

end
