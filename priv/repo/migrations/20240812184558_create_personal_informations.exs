defmodule Chaudron.Repo.Migrations.CreatePersonalInformations do
  use Ecto.Migration

  def change do
    create table(:personal_informations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :age, :integer
      add :marital_status, :string
      add :dependant_amount, :integer
      add :country, :string
      add :state, :string
      add :city, :string
      add :job_title, :string
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:personal_informations, [:user_id])
  end
end
