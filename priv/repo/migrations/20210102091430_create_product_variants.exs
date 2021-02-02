defmodule Delivertrade.Repo.Migrations.CreateProductVariants do
  use Ecto.Migration

  def change do
    create table(:product_variants) do
      add :sku, :string, null: false
      add :price, :integer, null: false
      add :size, :string
      add :size_label, :string
      add :color, :string
      add :color_label, :string
      add :length, :float
      add :length_label, :string
      add :weight, :float
      add :weight_label, :string
      add :package_size, :integer
      add :package_size_label, :string
      add :product_id, references(:products, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:product_variants, [:sku])
    create index(:product_variants, [:product_id])
  end
end
