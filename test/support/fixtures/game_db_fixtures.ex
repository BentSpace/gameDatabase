defmodule GameDatabase.GameDBFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GameDatabase.GameDB` context.
  """

  @doc """
  Generate a brand.
  """
  def brand_fixture(attrs \\ %{}) do
    {:ok, brand} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> GameDatabase.GameDB.create_brand()

    brand
  end
end
