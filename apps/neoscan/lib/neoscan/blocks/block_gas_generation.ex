defmodule Neoscan.BlockGasGeneration do

  #blockchain gas generation params
  def generation_amount, do: [8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  def generation_length, do: 22
  def decrement_interval, do: 2000000

  #calculate the amount of gas generated by a block
  def get_amount_generate_in_block(nil), do: nil
  def get_amount_generate_in_block(index) do
    interval = decrement_interval()
    lenght = generation_length()
    amount = generation_amount()
    if Integer.floor_div(index, interval) > lenght do
      0
    else
      position = Integer.floor_div(index, interval)
      Enum.at(amount, position)
    end
  end
end
