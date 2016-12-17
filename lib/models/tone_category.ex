defmodule ToneCategory do
  @derive [Poison.Encoder]
  defstruct [:category_id, :category_name, :tones]
end
