defmodule ContactWeb.PostControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Content

  @create_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], locale_id: "7488a646-e31f-11e4-aace-600308960662", media_type_id: "7488a646-e31f-11e4-aace-600308960662", saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], locale_id: "7488a646-e31f-11e4-aace-600308960668", media_type_id: "7488a646-e31f-11e4-aace-600308960668", saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{codec_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, locale_id: nil, media_type_id: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:post) do
    {:ok, post} = Content.create_post(@create_attrs)
    post
  end

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get(conn, Routes.post_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Posts"
    end
  end

  describe "new post" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.post_path(conn, :new))
      assert html_response(conn, 200) =~ "New Post"
    end
  end

  describe "create post" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.post_path(conn, :create), post: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.post_path(conn, :show, id)

      conn = get(conn, Routes.post_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Post"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.post_path(conn, :create), post: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Post"
    end
  end

  describe "edit post" do
    setup [:create_post]

    test "renders form for editing chosen post", %{conn: conn, post: post} do
      conn = get(conn, Routes.post_path(conn, :edit, post))
      assert html_response(conn, 200) =~ "Edit Post"
    end
  end

  describe "update post" do
    setup [:create_post]

    test "redirects when data is valid", %{conn: conn, post: post} do
      conn = put(conn, Routes.post_path(conn, :update, post), post: @update_attrs)
      assert redirected_to(conn) == Routes.post_path(conn, :show, post)

      conn = get(conn, Routes.post_path(conn, :show, post))
      assert html_response(conn, 200) =~ "some updated saga"
    end

    test "renders errors when data is invalid", %{conn: conn, post: post} do
      conn = put(conn, Routes.post_path(conn, :update, post), post: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Post"
    end
  end

  describe "delete post" do
    setup [:create_post]

    test "deletes chosen post", %{conn: conn, post: post} do
      conn = delete(conn, Routes.post_path(conn, :delete, post))
      assert redirected_to(conn) == Routes.post_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.post_path(conn, :show, post))
      end
    end
  end

  defp create_post(_) do
    post = fixture(:post)
    {:ok, post: post}
  end
end
