defmodule Wabanex.Users.DeleteTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.Users

  describe "call/1" do
    test "when a valid id is given, delete the user" do
      params = %{name: "John Doe", email: "johndoe@deletetest.com", password: "123456"}

      {:ok, %{id: user_id}} = Users.Create.call(params)

      Users.Delete.call(user_id)

      response = Users.Get.call(user_id)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
