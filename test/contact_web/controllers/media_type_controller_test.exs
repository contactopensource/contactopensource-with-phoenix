defmodule ContactWeb.MediaTypeControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Data

  @create_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], parameter_text: "some parameter_text", state_uri: "some state_uri", subtype: "some subtype", suffix: "some suffix", supertype: "some supertype", tenant_uri: "some tenant_uri", text: "some text", tree: "some tree", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], parameter_text: "some updated parameter_text", state_uri: "some updated state_uri", subtype: "some updated subtype", suffix: "some updated suffix", supertype: "some updated supertype", tenant_uri: "some updated tenant_uri", text: "some updated text", tree: "some updated tree", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, parameter_text: nil, state_uri: nil, subtype: nil, suffix: nil, supertype: nil, tenant_uri: nil, text: nil, tree: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:media_type) do
    {:ok, media_type} = Data.create_media_type(@create_attrs)
    media_type
  end

  describe "index" do
    test "lists all media_types", %{conn: conn} do
      conn = get(conn, Routes.media_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Media types"
    end
  end

  describe "new media_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.media_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Media type"
    end
  end

  describe "create media_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.media_type_path(conn, :create), media_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.media_type_path(conn, :show, id)

      conn = get(conn, Routes.media_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Media type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.media_type_path(conn, :create), media_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Media type"
    end
  end

  describe "edit media_type" do
    setup [:create_media_type]

    test "renders form for editing chosen media_type", %{conn: conn, media_type: media_type} do
      conn = get(conn, Routes.media_type_path(conn, :edit, media_type))
      assert html_response(conn, 200) =~ "Edit Media type"
    end
  end

  describe "update media_type" do
    setup [:create_media_type]

    test "redirects when data is valid", %{conn: conn, media_type: media_type} do
      conn = put(conn, Routes.media_type_path(conn, :update, media_type), media_type: @update_attrs)
      assert redirected_to(conn) == Routes.media_type_path(conn, :show, media_type)

      conn = get(conn, Routes.media_type_path(conn, :show, media_type))
      assert html_response(conn, 200) =~ "some updated parameter_text"
    end

    test "renders errors when data is invalid", %{conn: conn, media_type: media_type} do
      conn = put(conn, Routes.media_type_path(conn, :update, media_type), media_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Media type"
    end
  end

  describe "delete media_type" do
    setup [:create_media_type]

    test "deletes chosen media_type", %{conn: conn, media_type: media_type} do
      conn = delete(conn, Routes.media_type_path(conn, :delete, media_type))
      assert redirected_to(conn) == Routes.media_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.media_type_path(conn, :show, media_type))
      end
    end
  end

  defp create_media_type(_) do
    media_type = fixture(:media_type)
    {:ok, media_type: media_type}
  end
end
