defmodule Delivertrade.Products.Variant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Delivertrade.Products.Product

  schema "product_variants" do
    field :price, :integer
    field :sku, :string
    field :size, :string
    field :size_label, :string
    field :color, :string
    field :color_label, :string
    field :length, :float
    field :length_label, :string
    field :weight, :float
    field :weight_label, :string
    field :package_size, :integer
    field :package_size_label, :string

    belongs_to :product, Product

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(variant, attrs) do
    variant
    |> cast(attrs, [:sku, :price])
    |> validate_required([:sku, :price])
    |> unique_constraint(:sku)
  end
end
