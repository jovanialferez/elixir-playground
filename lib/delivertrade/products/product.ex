defmodule Delivertrade.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Delivertrade.Products.Variant

  schema "products" do
    field :description, :string
    field :name, :string
    has_many :variants, Variant

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
  end
end
