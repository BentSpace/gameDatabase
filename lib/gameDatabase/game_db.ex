defmodule GameDatabase.GameDB do
  @moduledoc """
  The GameDB context.
  """

  import Ecto.Query, warn: false
  alias GameDatabase.Repo

  alias GameDatabase.GameDB.Brand

  @doc """
  Returns the list of brands.

  ## Examples

      iex> list_brands()
      [%Brand{}, ...]

  """
  def list_brands do
    Repo.all(Brand)
  end

  @doc """
  Gets a single brand.

  Raises `Ecto.NoResultsError` if the Brand does not exist.

  ## Examples

      iex> get_brand!(123)
      %Brand{}

      iex> get_brand!(456)
      ** (Ecto.NoResultsError)

  """
  def get_brand!(id), do: Repo.get!(Brand, id)

  @doc """
  Creates a brand.

  ## Examples

      iex> create_brand(%{field: value})
      {:ok, %Brand{}}

      iex> create_brand(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_brand(attrs \\ %{}) do
    %Brand{}
    |> Brand.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a brand.

  ## Examples

      iex> update_brand(brand, %{field: new_value})
      {:ok, %Brand{}}

      iex> update_brand(brand, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_brand(%Brand{} = brand, attrs) do
    brand
    |> Brand.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a brand.

  ## Examples

      iex> delete_brand(brand)
      {:ok, %Brand{}}

      iex> delete_brand(brand)
      {:error, %Ecto.Changeset{}}

  """
  def delete_brand(%Brand{} = brand) do
    Repo.delete(brand)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking brand changes.

  ## Examples

      iex> change_brand(brand)
      %Ecto.Changeset{data: %Brand{}}

  """
  def change_brand(%Brand{} = brand, attrs \\ %{}) do
    Brand.changeset(brand, attrs)
  end

  alias GameDatabase.GameDB.Primary_Operating_System

  @doc """
  Returns the list of primary_operating_systems.

  ## Examples

      iex> list_primary_operating_systems()
      [%Primary_Operating_System{}, ...]

  """
  def list_primary_operating_systems do
    Repo.all(Primary_Operating_System)
  end

  @doc """
  Gets a single primary__operating__system.

  Raises `Ecto.NoResultsError` if the Primary  operating  system does not exist.

  ## Examples

      iex> get_primary__operating__system!(123)
      %Primary_Operating_System{}

      iex> get_primary__operating__system!(456)
      ** (Ecto.NoResultsError)

  """
  def get_primary__operating__system!(id), do: Repo.get!(Primary_Operating_System, id)

  @doc """
  Creates a primary__operating__system.

  ## Examples

      iex> create_primary__operating__system(%{field: value})
      {:ok, %Primary_Operating_System{}}

      iex> create_primary__operating__system(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_primary__operating__system(attrs \\ %{}) do
    %Primary_Operating_System{}
    |> Primary_Operating_System.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a primary__operating__system.

  ## Examples

      iex> update_primary__operating__system(primary__operating__system, %{field: new_value})
      {:ok, %Primary_Operating_System{}}

      iex> update_primary__operating__system(primary__operating__system, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_primary__operating__system(%Primary_Operating_System{} = primary__operating__system, attrs) do
    primary__operating__system
    |> Primary_Operating_System.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a primary__operating__system.

  ## Examples

      iex> delete_primary__operating__system(primary__operating__system)
      {:ok, %Primary_Operating_System{}}

      iex> delete_primary__operating__system(primary__operating__system)
      {:error, %Ecto.Changeset{}}

  """
  def delete_primary__operating__system(%Primary_Operating_System{} = primary__operating__system) do
    Repo.delete(primary__operating__system)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking primary__operating__system changes.

  ## Examples

      iex> change_primary__operating__system(primary__operating__system)
      %Ecto.Changeset{data: %Primary_Operating_System{}}

  """
  def change_primary__operating__system(%Primary_Operating_System{} = primary__operating__system, attrs \\ %{}) do
    Primary_Operating_System.changeset(primary__operating__system, attrs)
  end

  alias GameDatabase.GameDB.Game

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Gets a single game.

  Raises `Ecto.NoResultsError` if the Game does not exist.

  ## Examples

      iex> get_game!(123)
      %Game{}

      iex> get_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game!(id), do: Repo.get!(Game, id)

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{data: %Game{}}

  """
  def change_game(%Game{} = game, attrs \\ %{}) do
    Game.changeset(game, attrs)
  end
end
