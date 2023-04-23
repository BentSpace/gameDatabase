defmodule GameDatabase.GameDBTest do
  use GameDatabase.DataCase

  alias GameDatabase.GameDB

  describe "brands" do
    alias GameDatabase.GameDB.Brand

    import GameDatabase.GameDBFixtures

    @invalid_attrs %{name: nil}

    test "list_brands/0 returns all brands" do
      brand = brand_fixture()
      assert GameDB.list_brands() == [brand]
    end

    test "get_brand!/1 returns the brand with given id" do
      brand = brand_fixture()
      assert GameDB.get_brand!(brand.id) == brand
    end

    test "create_brand/1 with valid data creates a brand" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Brand{} = brand} = GameDB.create_brand(valid_attrs)
      assert brand.name == "some name"
    end

    test "create_brand/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameDB.create_brand(@invalid_attrs)
    end

    test "update_brand/2 with valid data updates the brand" do
      brand = brand_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Brand{} = brand} = GameDB.update_brand(brand, update_attrs)
      assert brand.name == "some updated name"
    end

    test "update_brand/2 with invalid data returns error changeset" do
      brand = brand_fixture()
      assert {:error, %Ecto.Changeset{}} = GameDB.update_brand(brand, @invalid_attrs)
      assert brand == GameDB.get_brand!(brand.id)
    end

    test "delete_brand/1 deletes the brand" do
      brand = brand_fixture()
      assert {:ok, %Brand{}} = GameDB.delete_brand(brand)
      assert_raise Ecto.NoResultsError, fn -> GameDB.get_brand!(brand.id) end
    end

    test "change_brand/1 returns a brand changeset" do
      brand = brand_fixture()
      assert %Ecto.Changeset{} = GameDB.change_brand(brand)
    end
  end

  describe "primary_operating_systems" do
    alias GameDatabase.GameDB.Primary_Operating_System

    import GameDatabase.GameDBFixtures

    @invalid_attrs %{maker: nil, name: nil}

    test "list_primary_operating_systems/0 returns all primary_operating_systems" do
      primary__operating__system = primary__operating__system_fixture()
      assert GameDB.list_primary_operating_systems() == [primary__operating__system]
    end

    test "get_primary__operating__system!/1 returns the primary__operating__system with given id" do
      primary__operating__system = primary__operating__system_fixture()
      assert GameDB.get_primary__operating__system!(primary__operating__system.id) == primary__operating__system
    end

    test "create_primary__operating__system/1 with valid data creates a primary__operating__system" do
      valid_attrs = %{maker: "some maker", name: "some name"}

      assert {:ok, %Primary_Operating_System{} = primary__operating__system} = GameDB.create_primary__operating__system(valid_attrs)
      assert primary__operating__system.maker == "some maker"
      assert primary__operating__system.name == "some name"
    end

    test "create_primary__operating__system/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameDB.create_primary__operating__system(@invalid_attrs)
    end

    test "update_primary__operating__system/2 with valid data updates the primary__operating__system" do
      primary__operating__system = primary__operating__system_fixture()
      update_attrs = %{maker: "some updated maker", name: "some updated name"}

      assert {:ok, %Primary_Operating_System{} = primary__operating__system} = GameDB.update_primary__operating__system(primary__operating__system, update_attrs)
      assert primary__operating__system.maker == "some updated maker"
      assert primary__operating__system.name == "some updated name"
    end

    test "update_primary__operating__system/2 with invalid data returns error changeset" do
      primary__operating__system = primary__operating__system_fixture()
      assert {:error, %Ecto.Changeset{}} = GameDB.update_primary__operating__system(primary__operating__system, @invalid_attrs)
      assert primary__operating__system == GameDB.get_primary__operating__system!(primary__operating__system.id)
    end

    test "delete_primary__operating__system/1 deletes the primary__operating__system" do
      primary__operating__system = primary__operating__system_fixture()
      assert {:ok, %Primary_Operating_System{}} = GameDB.delete_primary__operating__system(primary__operating__system)
      assert_raise Ecto.NoResultsError, fn -> GameDB.get_primary__operating__system!(primary__operating__system.id) end
    end

    test "change_primary__operating__system/1 returns a primary__operating__system changeset" do
      primary__operating__system = primary__operating__system_fixture()
      assert %Ecto.Changeset{} = GameDB.change_primary__operating__system(primary__operating__system)
    end
  end

  describe "games" do
    alias GameDatabase.GameDB.Game

    import GameDatabase.GameDBFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert GameDB.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert GameDB.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Game{} = game} = GameDB.create_game(valid_attrs)
      assert game.description == "some description"
      assert game.name == "some name"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameDB.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Game{} = game} = GameDB.update_game(game, update_attrs)
      assert game.description == "some updated description"
      assert game.name == "some updated name"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = GameDB.update_game(game, @invalid_attrs)
      assert game == GameDB.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = GameDB.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> GameDB.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = GameDB.change_game(game)
    end
  end
end
