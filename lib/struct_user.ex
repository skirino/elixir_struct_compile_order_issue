defmodule U do
  def f(%S{field1: f1}) do
    IO.inspect f1
  end
end
