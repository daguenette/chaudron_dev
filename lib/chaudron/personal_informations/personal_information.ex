defmodule Chaudron.PersonalInformations.PersonalInformation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "personal_informations" do
    field :name, :string
    field :state, :string
    field :age, :integer
    field :marital_status, :string
    field :dependant_amount, :integer
    field :country, :string
    field :city, :string
    field :job_title, :string
    belongs_to :user, Chaudron.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(personal_information, attrs) do
    personal_information
    |> cast(attrs, [
      :name,
      :age,
      :marital_status,
      :dependant_amount,
      :country,
      :state,
      :city,
      :job_title,
      :user_id
    ])
    |> validate_required([
      :name,
      :age,
      :marital_status,
      :dependant_amount,
      :country,
      :state,
      :city,
      :job_title,
      :user_id
    ])
  end
end
