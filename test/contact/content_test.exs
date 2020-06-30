defmodule Contact.ContentTest do
  use Contact.DataCase

  alias Contact.Content

  describe "files" do
    alias Contact.Content.File

    @valid_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], locale_id: "7488a646-e31f-11e4-aace-600308960662", media_type_id: "7488a646-e31f-11e4-aace-600308960662", saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], locale_id: "7488a646-e31f-11e4-aace-600308960668", media_type_id: "7488a646-e31f-11e4-aace-600308960668", saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{codec_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, locale_id: nil, media_type_id: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_file()

      file
    end

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert Content.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Content.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = Content.create_file(@valid_attrs)
      assert file.codec_id == "7488a646-e31f-11e4-aace-600308960662"
      assert file.created_at_clock_count == 42
      assert file.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert file.locale_id == "7488a646-e31f-11e4-aace-600308960662"
      assert file.media_type_id == "7488a646-e31f-11e4-aace-600308960662"
      assert file.saga == "some saga"
      assert file.state_uri == "some state_uri"
      assert file.subtitle == "some subtitle"
      assert file.summary == "some summary"
      assert file.tenant_uri == "some tenant_uri"
      assert file.title == "some title"
      assert file.type_uri == "some type_uri"
      assert file.updated_at_clock_count == 42
      assert file.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert file.updated_by_uri == "some updated_by_uri"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, %File{} = file} = Content.update_file(file, @update_attrs)
      assert file.codec_id == "7488a646-e31f-11e4-aace-600308960668"
      assert file.created_at_clock_count == 43
      assert file.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert file.locale_id == "7488a646-e31f-11e4-aace-600308960668"
      assert file.media_type_id == "7488a646-e31f-11e4-aace-600308960668"
      assert file.saga == "some updated saga"
      assert file.state_uri == "some updated state_uri"
      assert file.subtitle == "some updated subtitle"
      assert file.summary == "some updated summary"
      assert file.tenant_uri == "some updated tenant_uri"
      assert file.title == "some updated title"
      assert file.type_uri == "some updated type_uri"
      assert file.updated_at_clock_count == 43
      assert file.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert file.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_file(file, @invalid_attrs)
      assert file == Content.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Content.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Content.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Content.change_file(file)
    end
  end

  describe "folders" do
    alias Contact.Content.Folder

    @valid_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], locale_id: "7488a646-e31f-11e4-aace-600308960662", media_type_id: "7488a646-e31f-11e4-aace-600308960662", saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], locale_id: "7488a646-e31f-11e4-aace-600308960668", media_type_id: "7488a646-e31f-11e4-aace-600308960668", saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{codec_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, locale_id: nil, media_type_id: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def folder_fixture(attrs \\ %{}) do
      {:ok, folder} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_folder()

      folder
    end

    test "list_folders/0 returns all folders" do
      folder = folder_fixture()
      assert Content.list_folders() == [folder]
    end

    test "get_folder!/1 returns the folder with given id" do
      folder = folder_fixture()
      assert Content.get_folder!(folder.id) == folder
    end

    test "create_folder/1 with valid data creates a folder" do
      assert {:ok, %Folder{} = folder} = Content.create_folder(@valid_attrs)
      assert folder.codec_id == "7488a646-e31f-11e4-aace-600308960662"
      assert folder.created_at_clock_count == 42
      assert folder.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert folder.locale_id == "7488a646-e31f-11e4-aace-600308960662"
      assert folder.media_type_id == "7488a646-e31f-11e4-aace-600308960662"
      assert folder.saga == "some saga"
      assert folder.state_uri == "some state_uri"
      assert folder.subtitle == "some subtitle"
      assert folder.summary == "some summary"
      assert folder.tenant_uri == "some tenant_uri"
      assert folder.title == "some title"
      assert folder.type_uri == "some type_uri"
      assert folder.updated_at_clock_count == 42
      assert folder.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert folder.updated_by_uri == "some updated_by_uri"
    end

    test "create_folder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_folder(@invalid_attrs)
    end

    test "update_folder/2 with valid data updates the folder" do
      folder = folder_fixture()
      assert {:ok, %Folder{} = folder} = Content.update_folder(folder, @update_attrs)
      assert folder.codec_id == "7488a646-e31f-11e4-aace-600308960668"
      assert folder.created_at_clock_count == 43
      assert folder.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert folder.locale_id == "7488a646-e31f-11e4-aace-600308960668"
      assert folder.media_type_id == "7488a646-e31f-11e4-aace-600308960668"
      assert folder.saga == "some updated saga"
      assert folder.state_uri == "some updated state_uri"
      assert folder.subtitle == "some updated subtitle"
      assert folder.summary == "some updated summary"
      assert folder.tenant_uri == "some updated tenant_uri"
      assert folder.title == "some updated title"
      assert folder.type_uri == "some updated type_uri"
      assert folder.updated_at_clock_count == 43
      assert folder.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert folder.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_folder/2 with invalid data returns error changeset" do
      folder = folder_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_folder(folder, @invalid_attrs)
      assert folder == Content.get_folder!(folder.id)
    end

    test "delete_folder/1 deletes the folder" do
      folder = folder_fixture()
      assert {:ok, %Folder{}} = Content.delete_folder(folder)
      assert_raise Ecto.NoResultsError, fn -> Content.get_folder!(folder.id) end
    end

    test "change_folder/1 returns a folder changeset" do
      folder = folder_fixture()
      assert %Ecto.Changeset{} = Content.change_folder(folder)
    end
  end

  describe "tags" do
    alias Contact.Content.Tag

    @valid_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], locale_id: "7488a646-e31f-11e4-aace-600308960662", media_type_id: "7488a646-e31f-11e4-aace-600308960662", saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], locale_id: "7488a646-e31f-11e4-aace-600308960668", media_type_id: "7488a646-e31f-11e4-aace-600308960668", saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{codec_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, locale_id: nil, media_type_id: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Content.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Content.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Content.create_tag(@valid_attrs)
      assert tag.codec_id == "7488a646-e31f-11e4-aace-600308960662"
      assert tag.created_at_clock_count == 42
      assert tag.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert tag.locale_id == "7488a646-e31f-11e4-aace-600308960662"
      assert tag.media_type_id == "7488a646-e31f-11e4-aace-600308960662"
      assert tag.saga == "some saga"
      assert tag.state_uri == "some state_uri"
      assert tag.subtitle == "some subtitle"
      assert tag.summary == "some summary"
      assert tag.tenant_uri == "some tenant_uri"
      assert tag.title == "some title"
      assert tag.type_uri == "some type_uri"
      assert tag.updated_at_clock_count == 42
      assert tag.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert tag.updated_by_uri == "some updated_by_uri"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Content.update_tag(tag, @update_attrs)
      assert tag.codec_id == "7488a646-e31f-11e4-aace-600308960668"
      assert tag.created_at_clock_count == 43
      assert tag.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert tag.locale_id == "7488a646-e31f-11e4-aace-600308960668"
      assert tag.media_type_id == "7488a646-e31f-11e4-aace-600308960668"
      assert tag.saga == "some updated saga"
      assert tag.state_uri == "some updated state_uri"
      assert tag.subtitle == "some updated subtitle"
      assert tag.summary == "some updated summary"
      assert tag.tenant_uri == "some updated tenant_uri"
      assert tag.title == "some updated title"
      assert tag.type_uri == "some updated type_uri"
      assert tag.updated_at_clock_count == 43
      assert tag.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert tag.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_tag(tag, @invalid_attrs)
      assert tag == Content.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Content.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Content.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Content.change_tag(tag)
    end
  end

  describe "posts" do
    alias Contact.Content.Post

    @valid_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], locale_id: "7488a646-e31f-11e4-aace-600308960662", media_type_id: "7488a646-e31f-11e4-aace-600308960662", saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], locale_id: "7488a646-e31f-11e4-aace-600308960668", media_type_id: "7488a646-e31f-11e4-aace-600308960668", saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{codec_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, locale_id: nil, media_type_id: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Content.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Content.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Content.create_post(@valid_attrs)
      assert post.codec_id == "7488a646-e31f-11e4-aace-600308960662"
      assert post.created_at_clock_count == 42
      assert post.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert post.locale_id == "7488a646-e31f-11e4-aace-600308960662"
      assert post.media_type_id == "7488a646-e31f-11e4-aace-600308960662"
      assert post.saga == "some saga"
      assert post.state_uri == "some state_uri"
      assert post.subtitle == "some subtitle"
      assert post.summary == "some summary"
      assert post.tenant_uri == "some tenant_uri"
      assert post.title == "some title"
      assert post.type_uri == "some type_uri"
      assert post.updated_at_clock_count == 42
      assert post.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert post.updated_by_uri == "some updated_by_uri"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Content.update_post(post, @update_attrs)
      assert post.codec_id == "7488a646-e31f-11e4-aace-600308960668"
      assert post.created_at_clock_count == 43
      assert post.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert post.locale_id == "7488a646-e31f-11e4-aace-600308960668"
      assert post.media_type_id == "7488a646-e31f-11e4-aace-600308960668"
      assert post.saga == "some updated saga"
      assert post.state_uri == "some updated state_uri"
      assert post.subtitle == "some updated subtitle"
      assert post.summary == "some updated summary"
      assert post.tenant_uri == "some updated tenant_uri"
      assert post.title == "some updated title"
      assert post.type_uri == "some updated type_uri"
      assert post.updated_at_clock_count == 43
      assert post.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert post.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_post(post, @invalid_attrs)
      assert post == Content.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Content.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Content.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Content.change_post(post)
    end
  end

  describe "feeds" do
    alias Contact.Content.Feed

    @valid_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], locale_id: "7488a646-e31f-11e4-aace-600308960662", media_type_id: "7488a646-e31f-11e4-aace-600308960662", saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{codec_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], locale_id: "7488a646-e31f-11e4-aace-600308960668", media_type_id: "7488a646-e31f-11e4-aace-600308960668", saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{codec_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, locale_id: nil, media_type_id: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def feed_fixture(attrs \\ %{}) do
      {:ok, feed} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_feed()

      feed
    end

    test "list_feeds/0 returns all feeds" do
      feed = feed_fixture()
      assert Content.list_feeds() == [feed]
    end

    test "get_feed!/1 returns the feed with given id" do
      feed = feed_fixture()
      assert Content.get_feed!(feed.id) == feed
    end

    test "create_feed/1 with valid data creates a feed" do
      assert {:ok, %Feed{} = feed} = Content.create_feed(@valid_attrs)
      assert feed.codec_id == "7488a646-e31f-11e4-aace-600308960662"
      assert feed.created_at_clock_count == 42
      assert feed.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert feed.locale_id == "7488a646-e31f-11e4-aace-600308960662"
      assert feed.media_type_id == "7488a646-e31f-11e4-aace-600308960662"
      assert feed.saga == "some saga"
      assert feed.state_uri == "some state_uri"
      assert feed.subtitle == "some subtitle"
      assert feed.summary == "some summary"
      assert feed.tenant_uri == "some tenant_uri"
      assert feed.title == "some title"
      assert feed.type_uri == "some type_uri"
      assert feed.updated_at_clock_count == 42
      assert feed.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert feed.updated_by_uri == "some updated_by_uri"
    end

    test "create_feed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_feed(@invalid_attrs)
    end

    test "update_feed/2 with valid data updates the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{} = feed} = Content.update_feed(feed, @update_attrs)
      assert feed.codec_id == "7488a646-e31f-11e4-aace-600308960668"
      assert feed.created_at_clock_count == 43
      assert feed.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert feed.locale_id == "7488a646-e31f-11e4-aace-600308960668"
      assert feed.media_type_id == "7488a646-e31f-11e4-aace-600308960668"
      assert feed.saga == "some updated saga"
      assert feed.state_uri == "some updated state_uri"
      assert feed.subtitle == "some updated subtitle"
      assert feed.summary == "some updated summary"
      assert feed.tenant_uri == "some updated tenant_uri"
      assert feed.title == "some updated title"
      assert feed.type_uri == "some updated type_uri"
      assert feed.updated_at_clock_count == 43
      assert feed.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert feed.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_feed/2 with invalid data returns error changeset" do
      feed = feed_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_feed(feed, @invalid_attrs)
      assert feed == Content.get_feed!(feed.id)
    end

    test "delete_feed/1 deletes the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{}} = Content.delete_feed(feed)
      assert_raise Ecto.NoResultsError, fn -> Content.get_feed!(feed.id) end
    end

    test "change_feed/1 returns a feed changeset" do
      feed = feed_fixture()
      assert %Ecto.Changeset{} = Content.change_feed(feed)
    end
  end
end
