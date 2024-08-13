defmodule Chaudron.Repo.Migrations.CreateRevenues do
  use Ecto.Migration

  def change do
    create table(:revenues, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :annual_gross_salary, :float
      add :additional_income_sources, :float
      add :alimony_received, :float
      add :social_benefits, :float
      add :investment_income, :float
      add :other_income, :float
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:revenues, [:user_id])
  end
end
