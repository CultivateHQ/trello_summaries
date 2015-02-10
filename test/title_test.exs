defmodule TitleTest do
  use ExUnit.Case

  import TrelloSummaries.Title

  test "title from date" do
    assert title({2014,11,3}) == "Cultivate status 03/11/2014"
  end

end
