defmodule Wabanex.IMC do
  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    data =
      content
      |> String.split("\n")
      |> Enum.map(fn line -> parse_line(line) end)
      |> Enum.into(%{})

    {:ok, data}
  end

  # _ pq n usaremos esse arg
  defp handle_file({:error, _reason}) do
    {:error, "Error while opening the file"}
  end

  defp parse_line(line) do
    line
    |> String.split(",")
    # primeiro arg
    |> List.update_at(1, &String.to_float/1)
    # segundo arg
    |> List.update_at(2, &String.to_float/1)
    # |> IO.inspect()
    |> calculate_imc()

    # |> IO.inspect()
  end

  defp calculate_imc([name, height, weight]), do: {name, weight / (height * 2)}
end
