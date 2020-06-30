defmodule ContactWeb.ArtistControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept

  @create_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:artist) do
    {:ok, artist} = Concept.create_artist(@create_attrs)
    artist
  end

  describe "index" do
    test "lists all artists", %{conn: conn} do
      conn = get(conn, Routes.artist_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Artists"
    end
  end

  describe "new artist" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.artist_path(conn, :new))
      assert html_response(conn, 200) =~ "New Artist"
    end
  end

  describe "create artist" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.artist_path(conn, :create), artist: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.artist_path(conn, :show, id)

      conn = get(conn, Routes.artist_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Artist"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.artist_path(conn, :create), artist: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Artist"
    end
  end

  describe "edit artist" do
    setup [:create_artist]

    test "renders form for editing chosen artist", %{conn: conn, artist: artist} do
      conn = get(conn, Routes.artist_path(conn, :edit, artist))
      assert html_response(conn, 200) =~ "Edit Artist"
    end
  end

  describe "update artist" do
    setup [:create_artist]

    test "redirects when data is valid", %{conn: conn, artist: artist} do
      conn = put(conn, Routes.artist_path(conn, :update, artist), artist: @update_attrs)
      assert redirected_to(conn) == Routes.artist_path(conn, :show, artist)

      conn = get(conn, Routes.artist_path(conn, :show, artist))
      assert html_response(conn, 200) =~ "some updated saga"
    end

    test "renders errors when data is invalid", %{conn: conn, artist: artist} do
      conn = put(conn, Routes.artist_path(conn, :update, artist), artist: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Artist"
    end
  end

  describe "delete artist" do
    setup [:create_artist]

    test "deletes chosen artist", %{conn: conn, artist: artist} do
      conn = delete(conn, Routes.artist_path(conn, :delete, artist))
      assert redirected_to(conn) == Routes.artist_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.artist_path(conn, :show, artist))
      end
    end
  end

  defp create_artist(_) do
    artist = fixture(:artist)
    {:ok, artist: artist}
  end
end
