defmodule DelivertradeWeb.VariantController do
  use DelivertradeWeb, :controller

  alias Delivertrade.Products
  alias Delivertrade.Products.Variant

  def index(conn, %{"id" => product_id}) do
    product = Products.get_product_with_variants!(product_id)
    variants = product.variants
    render(conn, "index.html", product: product, variants: variants)
  end

  def new(conn, %{"id" => product_id}) do
    product = Products.get_product!(product_id)
    changeset = Products.change_variant(%Variant{}, %{"product" => product})
    render(conn, "new.html", changeset: changeset, product: product)
  end

  def create(conn, %{"variant" => params, "id" => product_id}) do
    product = Products.get_product!(product_id)
    case Products.create_variant(product, params) do
      {:ok, _variant } ->
        conn
        |> put_flash(:info, "Variant added!")
        |> redirect(to: Routes.variant_path(conn, :index, product_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, product: product)
    end
  end
end
