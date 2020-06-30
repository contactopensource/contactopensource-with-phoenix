defmodule ContactWeb.OrganizationControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept

  @create_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:organization) do
    {:ok, organization} = Concept.create_organization(@create_attrs)
    organization
  end

  describe "index" do
    test "lists all organizations", %{conn: conn} do
      conn = get(conn, Routes.organization_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Organizations"
    end
  end

  describe "new organization" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.organization_path(conn, :new))
      assert html_response(conn, 200) =~ "New Organization"
    end
  end

  describe "create organization" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.organization_path(conn, :create), organization: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.organization_path(conn, :show, id)

      conn = get(conn, Routes.organization_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Organization"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.organization_path(conn, :create), organization: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Organization"
    end
  end

  describe "edit organization" do
    setup [:create_organization]

    test "renders form for editing chosen organization", %{conn: conn, organization: organization} do
      conn = get(conn, Routes.organization_path(conn, :edit, organization))
      assert html_response(conn, 200) =~ "Edit Organization"
    end
  end

  describe "update organization" do
    setup [:create_organization]

    test "redirects when data is valid", %{conn: conn, organization: organization} do
      conn = put(conn, Routes.organization_path(conn, :update, organization), organization: @update_attrs)
      assert redirected_to(conn) == Routes.organization_path(conn, :show, organization)

      conn = get(conn, Routes.organization_path(conn, :show, organization))
      assert html_response(conn, 200) =~ "some updated saga"
    end

    test "renders errors when data is invalid", %{conn: conn, organization: organization} do
      conn = put(conn, Routes.organization_path(conn, :update, organization), organization: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Organization"
    end
  end

  describe "delete organization" do
    setup [:create_organization]

    test "deletes chosen organization", %{conn: conn, organization: organization} do
      conn = delete(conn, Routes.organization_path(conn, :delete, organization))
      assert redirected_to(conn) == Routes.organization_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.organization_path(conn, :show, organization))
      end
    end
  end

  defp create_organization(_) do
    organization = fixture(:organization)
    {:ok, organization: organization}
  end
end
