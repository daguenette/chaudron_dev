defmodule Chaudron.Revenues.Revenue do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "revenues" do
    field :annual_gross_salary, :float
    field :additional_income_sources, :float
    field :alimony_received, :float
    field :social_benefits, :float
    field :investment_income, :float
    field :other_income, :float
    belongs_to :user, Chaudron.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(revenue, attrs) do
    revenue
    |> cast(attrs, [
      :annual_gross_salary,
      :additional_income_sources,
      :alimony_received,
      :social_benefits,
      :investment_income,
      :other_income,
      :user_id
    ])
    |> validate_required([
      :annual_gross_salary,
      :additional_income_sources,
      :alimony_received,
      :social_benefits,
      :investment_income,
      :other_income,
      :user_id
    ])
  end
end
