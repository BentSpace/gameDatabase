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

  @doc """
  Generate a primary__operating__system.
  """
  def primary__operating__system_fixture(attrs \\ %{}) do
    {:ok, primary__operating__system} =
      attrs
      |> Enum.into(%{
        maker: "some maker",
        name: "some name"
      })
      |> GameDatabase.GameDB.create_primary__operating__system()

    primary__operating__system
  end

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> GameDatabase.GameDB.create_game()

    game
  end
end
