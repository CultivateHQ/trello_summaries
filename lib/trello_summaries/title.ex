defmodule TrelloSummaries.Title do
  use Timex

  def title(date) do
     "Cultivate status #{format_date(date)}"
  end

  def title do
    :calendar.local_time |> title
  end


  defp format_date(date) do
    date
      |> Date.from
      |> DateFormat.format!("%d/%m/%Y", :strftime) 
  end
end
