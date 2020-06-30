defmodule ContactWeb.FileControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Content

  @create_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], locale_id: "7488a646-e31f-11e4-aace-600308960662", media_type_id: "7488a646-e31f-11e4-aace-600308960662", saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], locale_id: "7488a646-e31f-11e4-aace-600308960668", media_type_id: "7488a646-e31f-11e4-aace-600308960668", saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{codec_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, locale_id: nil, media_type_id: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:file) do
    {:ok, file} = Content.create_file(@create_attrs)
    file
  end

  describe "index" do
    test "lists all files", %{conn: conn} do
      conn = get(conn, Routes.file_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Files"
    end
  end

  describe "new file" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.file_path(conn, :new))
      assert html_response(conn, 200) =~ "New File"
    end
  end

  describe "create file" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.file_path(conn, :create), file: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.file_path(conn, :show, id)

      conn = get(conn, Routes.file_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show File"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.file_path(conn, :create), file: @invalid_attrs)
      assert html_response(conn, 200) =~ "New File"
    end
  end

  describe "edit file" do
    setup [:create_file]

    test "renders form for editing chosen file", %{conn: conn, file: file} do
      conn = get(conn, Routes.file_path(conn, :edit, file))
      assert html_response(conn, 200) =~ "Edit File"
    end
  end

  describe "update file" do
    setup [:create_file]

    test "redirects when data is valid", %{conn: conn, file: file} do
      conn = put(conn, Routes.file_path(conn, :update, file), file: @update_attrs)
      assert redirected_to(conn) == Routes.file_path(conn, :show, file)

      conn = get(conn, Routes.file_path(conn, :show, file))
      assert html_response(conn, 200) =~ "some updated saga"
    end

    test "renders errors when data is invalid", %{conn: conn, file: file} do
      conn = put(conn, Routes.file_path(conn, :update, file), file: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit File"
    end
  end

  describe "delete file" do
    setup [:create_file]

    test "deletes chosen file", %{conn: conn, file: file} do
      conn = delete(conn, Routes.file_path(conn, :delete, file))
      assert redirected_to(conn) == Routes.file_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.file_path(conn, :show, file))
      end
    end
  end

  defp create_file(_) do
    file = fixture(:file)
    {:ok, file: file}
  end
end
