defmodule ContactWeb.Api.LocaleControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Data
  alias Contact.Data.Locale

  @create_attrs %{
    country_code: "some country_code",
    currency_code: "some currency_code",
    currency_symbol: "some currency_symbol",
    decimal_separator: "some decimal_separator",
    grouping_separator: "some grouping_separator",
    language_code: "some language_code",
    quotation_start_delimiter: "some quotation_start_delimiter",
    quotation_stop_delimiter: "some quotation_stop_delimiter",
    region_code: "some region_code",
    script_code: "some script_code",
    state_text: "some state_text",
    state_uri: "some state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960662",
    text: "some text",
    type_text: "some type_text",
    type_uri: "some type_uri",
    updated_at_clock_count: 42,
    updated_at_timestamp_utc: ~N[2010-04-17 14:00:00],
    updated_by_text: "some updated_by_text",
    variant_code: "some variant_code"
  }
  @update_attrs %{
    country_code: "some updated country_code",
    currency_code: "some updated currency_code",
    currency_symbol: "some updated currency_symbol",
    decimal_separator: "some updated decimal_separator",
    grouping_separator: "some updated grouping_separator",
    language_code: "some updated language_code",
    quotation_start_delimiter: "some updated quotation_start_delimiter",
    quotation_stop_delimiter: "some updated quotation_stop_delimiter",
    region_code: "some updated region_code",
    script_code: "some updated script_code",
    state_text: "some updated state_text",
    state_uri: "some updated state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960668",
    text: "some updated text",
    type_text: "some updated type_text",
    type_uri: "some updated type_uri",
    updated_at_clock_count: 43,
    updated_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    updated_by_text: "some updated updated_by_text",
    variant_code: "some updated variant_code"
  }
  @invalid_attrs %{country_code: nil, currency_code: nil, currency_symbol: nil, decimal_separator: nil, grouping_separator: nil, language_code: nil, quotation_start_delimiter: nil, quotation_stop_delimiter: nil, region_code: nil, script_code: nil, state_text: nil, state_uri: nil, tenant_id: nil, text: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, variant_code: nil}

  def fixture(:locale) do
    {:ok, locale} = Data.create_locale(@create_attrs)
    locale
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all locales", %{conn: conn} do
      conn = get(conn, Routes.api_locale_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create locale" do
    test "renders locale when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_locale_path(conn, :create), locale: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_locale_path(conn, :show, id))

      assert %{
               "id" => id,
               "country_code" => "some country_code",
               "currency_code" => "some currency_code",
               "currency_symbol" => "some currency_symbol",
               "decimal_separator" => "some decimal_separator",
               "grouping_separator" => "some grouping_separator",
               "language_code" => "some language_code",
               "quotation_start_delimiter" => "some quotation_start_delimiter",
               "quotation_stop_delimiter" => "some quotation_stop_delimiter",
               "region_code" => "some region_code",
               "script_code" => "some script_code",
               "state_text" => "some state_text",
               "state_uri" => "some state_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960662",
               "text" => "some text",
               "type_text" => "some type_text",
               "type_uri" => "some type_uri",
               "updated_at_clock_count" => 42,
               "updated_at_timestamp_utc" => "2010-04-17T14:00:00",
               "updated_by_text" => "some updated_by_text",
               "variant_code" => "some variant_code"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_locale_path(conn, :create), locale: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update locale" do
    setup [:create_locale]

    test "renders locale when data is valid", %{conn: conn, locale: %Locale{id: id} = locale} do
      conn = put(conn, Routes.api_locale_path(conn, :update, locale), locale: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_locale_path(conn, :show, id))

      assert %{
               "id" => id,
               "country_code" => "some updated country_code",
               "currency_code" => "some updated currency_code",
               "currency_symbol" => "some updated currency_symbol",
               "decimal_separator" => "some updated decimal_separator",
               "grouping_separator" => "some updated grouping_separator",
               "language_code" => "some updated language_code",
               "quotation_start_delimiter" => "some updated quotation_start_delimiter",
               "quotation_stop_delimiter" => "some updated quotation_stop_delimiter",
               "region_code" => "some updated region_code",
               "script_code" => "some updated script_code",
               "state_text" => "some updated state_text",
               "state_uri" => "some updated state_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960668",
               "text" => "some updated text",
               "type_text" => "some updated type_text",
               "type_uri" => "some updated type_uri",
               "updated_at_clock_count" => 43,
               "updated_at_timestamp_utc" => "2011-05-18T15:01:01",
               "updated_by_text" => "some updated updated_by_text",
               "variant_code" => "some updated variant_code"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, locale: locale} do
      conn = put(conn, Routes.api_locale_path(conn, :update, locale), locale: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete locale" do
    setup [:create_locale]

    test "deletes chosen locale", %{conn: conn, locale: locale} do
      conn = delete(conn, Routes.api_locale_path(conn, :delete, locale))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_locale_path(conn, :show, locale))
      end
    end
  end

  defp create_locale(_) do
    locale = fixture(:locale)
    {:ok, locale: locale}
  end
end
