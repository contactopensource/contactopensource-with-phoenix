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

  describe "edges" do
    alias Contact.Graph.Edge

    @valid_attrs %{state_text: "some state_text", state_uri: "some state_uri", subject_database: "some subject_database", subject_id: "7488a646-e31f-11e4-aace-600308960662", subject_schema: "some subject_schema", subject_table: "some subject_table", subject_uri: "some subject_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
    @update_attrs %{state_text: "some updated state_text", state_uri: "some updated state_uri", subject_database: "some updated subject_database", subject_id: "7488a646-e31f-11e4-aace-600308960668", subject_schema: "some updated subject_schema", subject_table: "some updated subject_table", subject_uri: "some updated subject_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
    @invalid_attrs %{state_text: nil, state_uri: nil, subject_database: nil, subject_id: nil, subject_schema: nil, subject_table: nil, subject_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

    def edge_fixture(attrs \\ %{}) do
      {:ok, edge} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Graph.create_edge()

      edge
    end

    test "list_edges/0 returns all edges" do
      edge = edge_fixture()
      assert Graph.list_edges() == [edge]
    end

    test "get_edge!/1 returns the edge with given id" do
      edge = edge_fixture()
      assert Graph.get_edge!(edge.id) == edge
    end

    test "create_edge/1 with valid data creates a edge" do
      assert {:ok, %Edge{} = edge} = Graph.create_edge(@valid_attrs)
      assert edge.state_text == "some state_text"
      assert edge.state_uri == "some state_uri"
      assert edge.subject_database == "some subject_database"
      assert edge.subject_id == "7488a646-e31f-11e4-aace-600308960662"
      assert edge.subject_schema == "some subject_schema"
      assert edge.subject_table == "some subject_table"
      assert edge.subject_uri == "some subject_uri"
      assert edge.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert edge.type_text == "some type_text"
      assert edge.type_uri == "some type_uri"
      assert edge.updated_at_clock_count == 42
      assert edge.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert edge.updated_by_text == "some updated_by_text"
    end

    test "create_edge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Graph.create_edge(@invalid_attrs)
    end

    test "update_edge/2 with valid data updates the edge" do
      edge = edge_fixture()
      assert {:ok, %Edge{} = edge} = Graph.update_edge(edge, @update_attrs)
      assert edge.state_text == "some updated state_text"
      assert edge.state_uri == "some updated state_uri"
      assert edge.subject_database == "some updated subject_database"
      assert edge.subject_id == "7488a646-e31f-11e4-aace-600308960668"
      assert edge.subject_schema == "some updated subject_schema"
      assert edge.subject_table == "some updated subject_table"
      assert edge.subject_uri == "some updated subject_uri"
      assert edge.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert edge.type_text == "some updated type_text"
      assert edge.type_uri == "some updated type_uri"
      assert edge.updated_at_clock_count == 43
      assert edge.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert edge.updated_by_text == "some updated updated_by_text"
    end

    test "update_edge/2 with invalid data returns error changeset" do
      edge = edge_fixture()
      assert {:error, %Ecto.Changeset{}} = Graph.update_edge(edge, @invalid_attrs)
      assert edge == Graph.get_edge!(edge.id)
    end

    test "delete_edge/1 deletes the edge" do
      edge = edge_fixture()
      assert {:ok, %Edge{}} = Graph.delete_edge(edge)
      assert_raise Ecto.NoResultsError, fn -> Graph.get_edge!(edge.id) end
    end

    test "change_edge/1 returns a edge changeset" do
      edge = edge_fixture()
      assert %Ecto.Changeset{} = Graph.change_edge(edge)
    end
  end

  describe "edges" do
    alias Contact.Graph.Edge

    @valid_attrs %{count: 42, object_database: "some object_database", object_id: "7488a646-e31f-11e4-aace-600308960662", object_schema: "some object_schema", object_table: "some object_table", object_uri: "some object_uri", predicate_database: "some predicate_database", predicate_id: "7488a646-e31f-11e4-aace-600308960662", predicate_schema: "some predicate_schema", predicate_table: "some predicate_table", predicate_uri: "some predicate_uri", probability: "120.5", start_at_timestamp_utc: ~N[2010-04-17 14:00:00], state_text: "some state_text", state_uri: "some state_uri", stop_at_timestamp_utc: ~N[2010-04-17 14:00:00], subject_database: "some subject_database", subject_id: "7488a646-e31f-11e4-aace-600308960662", subject_schema: "some subject_schema", subject_table: "some subject_table", subject_uri: "some subject_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", weight: "120.5"}
    @update_attrs %{count: 43, object_database: "some updated object_database", object_id: "7488a646-e31f-11e4-aace-600308960668", object_schema: "some updated object_schema", object_table: "some updated object_table", object_uri: "some updated object_uri", predicate_database: "some updated predicate_database", predicate_id: "7488a646-e31f-11e4-aace-600308960668", predicate_schema: "some updated predicate_schema", predicate_table: "some updated predicate_table", predicate_uri: "some updated predicate_uri", probability: "456.7", start_at_timestamp_utc: ~N[2011-05-18 15:01:01], state_text: "some updated state_text", state_uri: "some updated state_uri", stop_at_timestamp_utc: ~N[2011-05-18 15:01:01], subject_database: "some updated subject_database", subject_id: "7488a646-e31f-11e4-aace-600308960668", subject_schema: "some updated subject_schema", subject_table: "some updated subject_table", subject_uri: "some updated subject_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", weight: "456.7"}
    @invalid_attrs %{count: nil, object_database: nil, object_id: nil, object_schema: nil, object_table: nil, object_uri: nil, predicate_database: nil, predicate_id: nil, predicate_schema: nil, predicate_table: nil, predicate_uri: nil, probability: nil, start_at_timestamp_utc: nil, state_text: nil, state_uri: nil, stop_at_timestamp_utc: nil, subject_database: nil, subject_id: nil, subject_schema: nil, subject_table: nil, subject_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, weight: nil}

    def edge_fixture(attrs \\ %{}) do
      {:ok, edge} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Graph.create_edge()

      edge
    end

    test "list_edges/0 returns all edges" do
      edge = edge_fixture()
      assert Graph.list_edges() == [edge]
    end

    test "get_edge!/1 returns the edge with given id" do
      edge = edge_fixture()
      assert Graph.get_edge!(edge.id) == edge
    end

    test "create_edge/1 with valid data creates a edge" do
      assert {:ok, %Edge{} = edge} = Graph.create_edge(@valid_attrs)
      assert edge.count == 42
      assert edge.object_database == "some object_database"
      assert edge.object_id == "7488a646-e31f-11e4-aace-600308960662"
      assert edge.object_schema == "some object_schema"
      assert edge.object_table == "some object_table"
      assert edge.object_uri == "some object_uri"
      assert edge.predicate_database == "some predicate_database"
      assert edge.predicate_id == "7488a646-e31f-11e4-aace-600308960662"
      assert edge.predicate_schema == "some predicate_schema"
      assert edge.predicate_table == "some predicate_table"
      assert edge.predicate_uri == "some predicate_uri"
      assert edge.probability == Decimal.new("120.5")
      assert edge.start_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert edge.state_text == "some state_text"
      assert edge.state_uri == "some state_uri"
      assert edge.stop_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert edge.subject_database == "some subject_database"
      assert edge.subject_id == "7488a646-e31f-11e4-aace-600308960662"
      assert edge.subject_schema == "some subject_schema"
      assert edge.subject_table == "some subject_table"
      assert edge.subject_uri == "some subject_uri"
      assert edge.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert edge.type_text == "some type_text"
      assert edge.type_uri == "some type_uri"
      assert edge.updated_at_clock_count == 42
      assert edge.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert edge.updated_by_text == "some updated_by_text"
      assert edge.weight == Decimal.new("120.5")
    end

    test "create_edge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Graph.create_edge(@invalid_attrs)
    end

    test "update_edge/2 with valid data updates the edge" do
      edge = edge_fixture()
      assert {:ok, %Edge{} = edge} = Graph.update_edge(edge, @update_attrs)
      assert edge.count == 43
      assert edge.object_database == "some updated object_database"
      assert edge.object_id == "7488a646-e31f-11e4-aace-600308960668"
      assert edge.object_schema == "some updated object_schema"
      assert edge.object_table == "some updated object_table"
      assert edge.object_uri == "some updated object_uri"
      assert edge.predicate_database == "some updated predicate_database"
      assert edge.predicate_id == "7488a646-e31f-11e4-aace-600308960668"
      assert edge.predicate_schema == "some updated predicate_schema"
      assert edge.predicate_table == "some updated predicate_table"
      assert edge.predicate_uri == "some updated predicate_uri"
      assert edge.probability == Decimal.new("456.7")
      assert edge.start_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert edge.state_text == "some updated state_text"
      assert edge.state_uri == "some updated state_uri"
      assert edge.stop_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert edge.subject_database == "some updated subject_database"
      assert edge.subject_id == "7488a646-e31f-11e4-aace-600308960668"
      assert edge.subject_schema == "some updated subject_schema"
      assert edge.subject_table == "some updated subject_table"
      assert edge.subject_uri == "some updated subject_uri"
      assert edge.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert edge.type_text == "some updated type_text"
      assert edge.type_uri == "some updated type_uri"
      assert edge.updated_at_clock_count == 43
      assert edge.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert edge.updated_by_text == "some updated updated_by_text"
      assert edge.weight == Decimal.new("456.7")
    end

    test "update_edge/2 with invalid data returns error changeset" do
      edge = edge_fixture()
      assert {:error, %Ecto.Changeset{}} = Graph.update_edge(edge, @invalid_attrs)
      assert edge == Graph.get_edge!(edge.id)
    end

    test "delete_edge/1 deletes the edge" do
      edge = edge_fixture()
      assert {:ok, %Edge{}} = Graph.delete_edge(edge)
      assert_raise Ecto.NoResultsError, fn -> Graph.get_edge!(edge.id) end
    end

    test "change_edge/1 returns a edge changeset" do
      edge = edge_fixture()
      assert %Ecto.Changeset{} = Graph.change_edge(edge)
    end
  end
end
