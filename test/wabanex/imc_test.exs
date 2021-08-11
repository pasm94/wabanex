defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Alberto" => 20.50561797752809,
           "Paulo" => 20.27777777777778,
           "Stein" => 16.467065868263475
         }}

      assert response == expected_response
    end

    test "when a wrong filename is given, returns an error" do
      params = %{"filename" => "wrognnamer23r6712n89.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
