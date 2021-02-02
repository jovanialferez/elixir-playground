defmodule Delivertrade.ProductsTest do
  use Delivertrade.DataCase

  alias Delivertrade.Products

  describe "products" do
    alias Delivertrade.Products.Product

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Products.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Products.create_product(@valid_attrs)
      assert product.description == "some description"
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Products.update_product(product, @update_attrs)
      assert product.description == "some updated description"
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "product_variants" do
    alias Delivertrade.Products.Variant

    @valid_attrs %{price: 42, sku: "some sku"}
    @update_attrs %{price: 43, sku: "some updated sku"}
    @invalid_attrs %{price: nil, sku: nil}

    def variant_fixture(attrs \\ %{}) do
      {:ok, variant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Products.create_variant()

      variant
    end

    test "list_product_variants/0 returns all product_variants" do
      variant = variant_fixture()
      assert Products.list_product_variants() == [variant]
    end

    test "get_variant!/1 returns the variant with given id" do
      variant = variant_fixture()
      assert Products.get_variant!(variant.id) == variant
    end

    test "create_variant/1 with valid data creates a variant" do
      assert {:ok, %Variant{} = variant} = Products.create_variant(@valid_attrs)
      assert variant.price == 42
      assert variant.sku == "some sku"
    end

    test "create_variant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_variant(@invalid_attrs)
    end

    test "update_variant/2 with valid data updates the variant" do
      variant = variant_fixture()
      assert {:ok, %Variant{} = variant} = Products.update_variant(variant, @update_attrs)
      assert variant.price == 43
      assert variant.sku == "some updated sku"
    end

    test "update_variant/2 with invalid data returns error changeset" do
      variant = variant_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_variant(variant, @invalid_attrs)
      assert variant == Products.get_variant!(variant.id)
    end

    test "delete_variant/1 deletes the variant" do
      variant = variant_fixture()
      assert {:ok, %Variant{}} = Products.delete_variant(variant)
      assert_raise Ecto.NoResultsError, fn -> Products.get_variant!(variant.id) end
    end

    test "change_variant/1 returns a variant changeset" do
      variant = variant_fixture()
      assert %Ecto.Changeset{} = Products.change_variant(variant)
    end
  end
end
