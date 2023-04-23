defmodule GameDatabaseWeb.Primary_Operating_SystemLiveTest do
  use GameDatabaseWeb.ConnCase

  import Phoenix.LiveViewTest
  import GameDatabase.GameDBFixtures

  @create_attrs %{maker: "some maker", name: "some name"}
  @update_attrs %{maker: "some updated maker", name: "some updated name"}
  @invalid_attrs %{maker: nil, name: nil}

  defp create_primary__operating__system(_) do
    primary__operating__system = primary__operating__system_fixture()
    %{primary__operating__system: primary__operating__system}
  end

  describe "Index" do
    setup [:create_primary__operating__system]

    test "lists all primary_operating_systems", %{conn: conn, primary__operating__system: primary__operating__system} do
      {:ok, _index_live, html} = live(conn, ~p"/primary_operating_systems")

      assert html =~ "Listing Primary operating systems"
      assert html =~ primary__operating__system.maker
    end

    test "saves new primary__operating__system", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/primary_operating_systems")

      assert index_live |> element("a", "New Primary  operating  system") |> render_click() =~
               "New Primary  operating  system"

      assert_patch(index_live, ~p"/primary_operating_systems/new")

      assert index_live
             |> form("#primary__operating__system-form", primary__operating__system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#primary__operating__system-form", primary__operating__system: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/primary_operating_systems")

      html = render(index_live)
      assert html =~ "Primary  operating  system created successfully"
      assert html =~ "some maker"
    end

    test "updates primary__operating__system in listing", %{conn: conn, primary__operating__system: primary__operating__system} do
      {:ok, index_live, _html} = live(conn, ~p"/primary_operating_systems")

      assert index_live |> element("#primary_operating_systems-#{primary__operating__system.id} a", "Edit") |> render_click() =~
               "Edit Primary  operating  system"

      assert_patch(index_live, ~p"/primary_operating_systems/#{primary__operating__system}/edit")

      assert index_live
             |> form("#primary__operating__system-form", primary__operating__system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#primary__operating__system-form", primary__operating__system: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/primary_operating_systems")

      html = render(index_live)
      assert html =~ "Primary  operating  system updated successfully"
      assert html =~ "some updated maker"
    end

    test "deletes primary__operating__system in listing", %{conn: conn, primary__operating__system: primary__operating__system} do
      {:ok, index_live, _html} = live(conn, ~p"/primary_operating_systems")

      assert index_live |> element("#primary_operating_systems-#{primary__operating__system.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#primary_operating_systems-#{primary__operating__system.id}")
    end
  end

  describe "Show" do
    setup [:create_primary__operating__system]

    test "displays primary__operating__system", %{conn: conn, primary__operating__system: primary__operating__system} do
      {:ok, _show_live, html} = live(conn, ~p"/primary_operating_systems/#{primary__operating__system}")

      assert html =~ "Show Primary  operating  system"
      assert html =~ primary__operating__system.maker
    end

    test "updates primary__operating__system within modal", %{conn: conn, primary__operating__system: primary__operating__system} do
      {:ok, show_live, _html} = live(conn, ~p"/primary_operating_systems/#{primary__operating__system}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Primary  operating  system"

      assert_patch(show_live, ~p"/primary_operating_systems/#{primary__operating__system}/show/edit")

      assert show_live
             |> form("#primary__operating__system-form", primary__operating__system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#primary__operating__system-form", primary__operating__system: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/primary_operating_systems/#{primary__operating__system}")

      html = render(show_live)
      assert html =~ "Primary  operating  system updated successfully"
      assert html =~ "some updated maker"
    end
  end
end
