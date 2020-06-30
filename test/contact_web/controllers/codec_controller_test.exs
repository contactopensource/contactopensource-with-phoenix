defmodule ContactWeb.CodecControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Data

  @create_attrs %{bit_rate: "120.5", bit_rate_maximum: "120.5", bit_rate_minimum: "120.5", channel_count: 42, channel_count_maximum: 42, channel_count_minimum: 42, code: "some code", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], creator_name: "some creator_name", floss_flag: true, icon: "some icon", link: "some link", lossy_flag: true, name: "some name", note: "some note", parent_id: "7488a646-e31f-11e4-aace-600308960662", prefer_file_extension: "some prefer_file_extension", prefer_media_type_id: "7488a646-e31f-11e4-aace-600308960662", set_id: "7488a646-e31f-11e4-aace-600308960662", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri", variable_bit_rate_flag: true, variable_channel_count_flag: true}
  @update_attrs %{bit_rate: "456.7", bit_rate_maximum: "456.7", bit_rate_minimum: "456.7", channel_count: 43, channel_count_maximum: 43, channel_count_minimum: 43, code: "some updated code", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], creator_name: "some updated creator_name", floss_flag: false, icon: "some updated icon", link: "some updated link", lossy_flag: false, name: "some updated name", note: "some updated note", parent_id: "7488a646-e31f-11e4-aace-600308960668", prefer_file_extension: "some updated prefer_file_extension", prefer_media_type_id: "7488a646-e31f-11e4-aace-600308960668", set_id: "7488a646-e31f-11e4-aace-600308960668", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri", variable_bit_rate_flag: false, variable_channel_count_flag: false}
  @invalid_attrs %{bit_rate: nil, bit_rate_maximum: nil, bit_rate_minimum: nil, channel_count: nil, channel_count_maximum: nil, channel_count_minimum: nil, code: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, creator_name: nil, floss_flag: nil, icon: nil, link: nil, lossy_flag: nil, name: nil, note: nil, parent_id: nil, prefer_file_extension: nil, prefer_media_type_id: nil, set_id: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil, variable_bit_rate_flag: nil, variable_channel_count_flag: nil}

  def fixture(:codec) do
    {:ok, codec} = Data.create_codec(@create_attrs)
    codec
  end

  describe "index" do
    test "lists all codecs", %{conn: conn} do
      conn = get(conn, Routes.codec_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Codecs"
    end
  end

  describe "new codec" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.codec_path(conn, :new))
      assert html_response(conn, 200) =~ "New Codec"
    end
  end

  describe "create codec" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.codec_path(conn, :create), codec: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.codec_path(conn, :show, id)

      conn = get(conn, Routes.codec_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Codec"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.codec_path(conn, :create), codec: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Codec"
    end
  end

  describe "edit codec" do
    setup [:create_codec]

    test "renders form for editing chosen codec", %{conn: conn, codec: codec} do
      conn = get(conn, Routes.codec_path(conn, :edit, codec))
      assert html_response(conn, 200) =~ "Edit Codec"
    end
  end

  describe "update codec" do
    setup [:create_codec]

    test "redirects when data is valid", %{conn: conn, codec: codec} do
      conn = put(conn, Routes.codec_path(conn, :update, codec), codec: @update_attrs)
      assert redirected_to(conn) == Routes.codec_path(conn, :show, codec)

      conn = get(conn, Routes.codec_path(conn, :show, codec))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, codec: codec} do
      conn = put(conn, Routes.codec_path(conn, :update, codec), codec: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Codec"
    end
  end

  describe "delete codec" do
    setup [:create_codec]

    test "deletes chosen codec", %{conn: conn, codec: codec} do
      conn = delete(conn, Routes.codec_path(conn, :delete, codec))
      assert redirected_to(conn) == Routes.codec_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.codec_path(conn, :show, codec))
      end
    end
  end

  defp create_codec(_) do
    codec = fixture(:codec)
    {:ok, codec: codec}
  end
end
