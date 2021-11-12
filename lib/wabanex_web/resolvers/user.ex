defmodule WabanexWeb.Resolvers.User do
  def create(%{input: params}, _context), do: Wabanex.Users.Create.call(params)
  def get(%{id: user_id}, _context), do: Wabanex.Users.Get.call(user_id)
  def get(_, _context), do: Wabanex.Users.Get.call()
  def delete(%{id: user_id}, _context), do: Wabanex.Users.Delete.call(user_id)
end
