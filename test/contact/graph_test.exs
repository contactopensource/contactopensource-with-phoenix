defmodule Contact.GraphTest do
  use Contact.DataCase

  alias Contact.Graph

  describe "nodes" do
    alias Contact.Graph.Node

    @valid_attrs %{id: "7488a646-e31f-11e4-aace-600308960662", json: %{}, number: "120.5", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", text: "some text", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: "2010-04-17T14:00:00.000000Z", updated_by_text: "some updated_by_text", xml: "some xml"}
    @update_attrs %{id: "7488a646-e31f-11e4-aace-600308960668", json: %{}, number: "456.7", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", text: "some updated text", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: "2011-05-18T15:01:01.000000Z", updated_by_text: "some updated updated_by_text", xml: "some updated xml"}
    @invalid_attrs %{id: nil, json: nil, number: nil, state_text: nil, state_uri: nil, tenant_id: nil, text: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, xml: nil}

    def node_fixture(attrs \\ %{}) do
      {:ok, node} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Graph.create_node()

      node
    end

    test "list_nodes/0 returns all nodes" do
      node = node_fixture()
      assert Graph.list_nodes() == [node]
    end

    test "get_node!/1 returns the node with given id" do
      node = node_fixture()
      assert Graph.get_node!(node.id) == node
    end

    test "create_node/1 with valid data creates a node" do
      assert {:ok, %Node{} = node} = Graph.create_node(@valid_attrs)
      assert node.id == "7488a646-e31f-11e4-aace-600308960662"
      assert node.json == %{}
      assert node.number == Decimal.new("120.5")
      assert node.state_text == "some state_text"
      assert node.state_uri == "some state_uri"
      assert node.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert node.text == "some text"
      assert node.type_text == "some type_text"
      assert node.type_uri == "some type_uri"
      assert node.updated_at_clock_count == 42
      assert node.updated_at_timestamp_utc == DateTime.from_naive!(~N[2010-04-17T14:00:00.000000Z], "Etc/UTC")
      assert node.updated_by_text == "some updated_by_text"
      assert node.xml == "some xml"
    end

    test "create_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Graph.create_node(@invalid_attrs)
    end

    test "update_node/2 with valid data updates the node" do
      node = node_fixture()
      assert {:ok, %Node{} = node} = Graph.update_node(node, @update_attrs)
      assert node.id == "7488a646-e31f-11e4-aace-600308960668"
      assert node.json == %{}
      assert node.number == Decimal.new("456.7")
      assert node.state_text == "some updated state_text"
      assert node.state_uri == "some updated state_uri"
      assert node.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert node.text == "some updated text"
      assert node.type_text == "some updated type_text"
      assert node.type_uri == "some updated type_uri"
      assert node.updated_at_clock_count == 43
      assert node.updated_at_timestamp_utc == DateTime.from_naive!(~N[2011-05-18T15:01:01.000000Z], "Etc/UTC")
      assert node.updated_by_text == "some updated updated_by_text"
      assert node.xml == "some updated xml"
    end

    test "update_node/2 with invalid data returns error changeset" do
      node = node_fixture()
      assert {:error, %Ecto.Changeset{}} = Graph.update_node(node, @invalid_attrs)
      assert node == Graph.get_node!(node.id)
    end

    test "delete_node/1 deletes the node" do
      node = node_fixture()
      assert {:ok, %Node{}} = Graph.delete_node(node)
      assert_raise Ecto.NoResultsError, fn -> Graph.get_node!(node.id) end
    end

    test "change_node/1 returns a node changeset" do
      node = node_fixture()
      assert %Ecto.Changeset{} = Graph.change_node(node)
    end
  end

  describe "nodes" do
    alias Contact.Graph.Node

    @valid_attrs %{id: "7488a646-e31f-11e4-aace-600308960662", json: %{}, number: "120.5", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", text: "some text", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", xml: "some xml"}
    @update_attrs %{id: "7488a646-e31f-11e4-aace-600308960668", json: %{}, number: "456.7", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", text: "some updated text", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", xml: "some updated xml"}
    @invalid_attrs %{id: nil, json: nil, number: nil, state_text: nil, state_uri: nil, tenant_id: nil, text: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, xml: nil}

    def node_fixture(attrs \\ %{}) do
      {:ok, node} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Graph.create_node()

      node
    end

    test "list_nodes/0 returns all nodes" do
      node = node_fixture()
      assert Graph.list_nodes() == [node]
    end

    test "get_node!/1 returns the node with given id" do
      node = node_fixture()
      assert Graph.get_node!(node.id) == node
    end

    test "create_node/1 with valid data creates a node" do
      assert {:ok, %Node{} = node} = Graph.create_node(@valid_attrs)
      assert node.id == "7488a646-e31f-11e4-aace-600308960662"
      assert node.json == %{}
      assert node.number == Decimal.new("120.5")
      assert node.state_text == "some state_text"
      assert node.state_uri == "some state_uri"
      assert node.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert node.text == "some text"
      assert node.type_text == "some type_text"
      assert node.type_uri == "some type_uri"
      assert node.updated_at_clock_count == 42
      assert node.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert node.updated_by_text == "some updated_by_text"
      assert node.xml == "some xml"
    end

    test "create_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Graph.create_node(@invalid_attrs)
    end

    test "update_node/2 with valid data updates the node" do
      node = node_fixture()
      assert {:ok, %Node{} = node} = Graph.update_node(node, @update_attrs)
      assert node.id == "7488a646-e31f-11e4-aace-600308960668"
      assert node.json == %{}
      assert node.number == Decimal.new("456.7")
      assert node.state_text == "some updated state_text"
      assert node.state_uri == "some updated state_uri"
      assert node.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert node.text == "some updated text"
      assert node.type_text == "some updated type_text"
      assert node.type_uri == "some updated type_uri"
      assert node.updated_at_clock_count == 43
      assert node.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert node.updated_by_text == "some updated updated_by_text"
      assert node.xml == "some updated xml"
    end

    test "update_node/2 with invalid data returns error changeset" do
      node = node_fixture()
      assert {:error, %Ecto.Changeset{}} = Graph.update_node(node, @invalid_attrs)
      assert node == Graph.get_node!(node.id)
    end

    test "delete_node/1 deletes the node" do
      node = node_fixture()
      assert {:ok, %Node{}} = Graph.delete_node(node)
      assert_raise Ecto.NoResultsError, fn -> Graph.get_node!(node.id) end
    end

    test "change_node/1 returns a node changeset" do
      node = node_fixture()
      assert %Ecto.Changeset{} = Graph.change_node(node)
    end
  end

  describe "nodes" do
    alias Contact.Graph.Node

    @valid_attrs %{json: %{}, number: "120.5", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", text: "some text", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", xml: "some xml"}
    @update_attrs %{json: %{}, number: "456.7", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", text: "some updated text", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", xml: "some updated xml"}
    @invalid_attrs %{json: nil, number: nil, state_text: nil, state_uri: nil, tenant_id: nil, text: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, xml: nil}

    def node_fixture(attrs \\ %{}) do
      {:ok, node} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Graph.create_node()

      node
    end

    test "list_nodes/0 returns all nodes" do
      node = node_fixture()
      assert Graph.list_nodes() == [node]
    end

    test "get_node!/1 returns the node with given id" do
      node = node_fixture()
      assert Graph.get_node!(node.id) == node
    end

    test "create_node/1 with valid data creates a node" do
      assert {:ok, %Node{} = node} = Graph.create_node(@valid_attrs)
      assert node.json == %{}
      assert node.number == Decimal.new("120.5")
      assert node.state_text == "some state_text"
      assert node.state_uri == "some state_uri"
      assert node.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert node.text == "some text"
      assert node.type_text == "some type_text"
      assert node.type_uri == "some type_uri"
      assert node.updated_at_clock_count == 42
      assert node.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert node.updated_by_text == "some updated_by_text"
      assert node.xml == "some xml"
    end

    test "create_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Graph.create_node(@invalid_attrs)
    end

    test "update_node/2 with valid data updates the node" do
      node = node_fixture()
      assert {:ok, %Node{} = node} = Graph.update_node(node, @update_attrs)
      assert node.json == %{}
      assert node.number == Decimal.new("456.7")
      assert node.state_text == "some updated state_text"
      assert node.state_uri == "some updated state_uri"
      assert node.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert node.text == "some updated text"
      assert node.type_text == "some updated type_text"
      assert node.type_uri == "some updated type_uri"
      assert node.updated_at_clock_count == 43
      assert node.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert node.updated_by_text == "some updated updated_by_text"
      assert node.xml == "some updated xml"
    end

    test "update_node/2 with invalid data returns error changeset" do
      node = node_fixture()
      assert {:error, %Ecto.Changeset{}} = Graph.update_node(node, @invalid_attrs)
      assert node == Graph.get_node!(node.id)
    end

    test "delete_node/1 deletes the node" do
      node = node_fixture()
      assert {:ok, %Node{}} = Graph.delete_node(node)
      assert_raise Ecto.NoResultsError, fn -> Graph.get_node!(node.id) end
    end

    test "change_node/1 returns a node changeset" do
      node = node_fixture()
      assert %Ecto.Changeset{} = Graph.change_node(node)
    end
  end
end
