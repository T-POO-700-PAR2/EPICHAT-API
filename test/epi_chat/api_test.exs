defmodule EpiChat.ApiTest do
  use EpiChat.DataCase

  alias EpiChat.Api

  describe "protecteds" do
    alias EpiChat.Api.Protected

    import EpiChat.ApiFixtures

    @invalid_attrs %{field1: nil, field2: nil}

    test "list_protecteds/0 returns all protecteds" do
      protected = protected_fixture()
      assert Api.list_protecteds() == [protected]
    end

    test "get_protected!/1 returns the protected with given id" do
      protected = protected_fixture()
      assert Api.get_protected!(protected.id) == protected
    end

    test "create_protected/1 with valid data creates a protected" do
      valid_attrs = %{field1: "some field1", field2: 42}

      assert {:ok, %Protected{} = protected} = Api.create_protected(valid_attrs)
      assert protected.field1 == "some field1"
      assert protected.field2 == 42
    end

    test "create_protected/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_protected(@invalid_attrs)
    end

    test "update_protected/2 with valid data updates the protected" do
      protected = protected_fixture()
      update_attrs = %{field1: "some updated field1", field2: 43}

      assert {:ok, %Protected{} = protected} = Api.update_protected(protected, update_attrs)
      assert protected.field1 == "some updated field1"
      assert protected.field2 == 43
    end

    test "update_protected/2 with invalid data returns error changeset" do
      protected = protected_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_protected(protected, @invalid_attrs)
      assert protected == Api.get_protected!(protected.id)
    end

    test "delete_protected/1 deletes the protected" do
      protected = protected_fixture()
      assert {:ok, %Protected{}} = Api.delete_protected(protected)
      assert_raise Ecto.NoResultsError, fn -> Api.get_protected!(protected.id) end
    end

    test "change_protected/1 returns a protected changeset" do
      protected = protected_fixture()
      assert %Ecto.Changeset{} = Api.change_protected(protected)
    end
  end
end
