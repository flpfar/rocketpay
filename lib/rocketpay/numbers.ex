defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read
    |> handle_file
  end

  defp handle_file({:ok, result}), do: sum(result)
  defp handle_file({:error, _reason}), do: {:error, "Invalid file"}

  defp sum(numbers_string) do
    result =
      numbers_string
      |> String.split(",")
      # |> Enum.map(fn x -> String.to_integer(x) end)
      |> Stream.map(fn x -> String.to_integer(x) end) # Stream has same Enum functionality but is lazy
      |> Enum.reduce(0, fn x, acc -> x + acc end) # or Enum.sum

    {:ok, %{result: result}}
  end
end
