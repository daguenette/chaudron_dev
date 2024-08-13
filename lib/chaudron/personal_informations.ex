defmodule Chaudron.PersonalInformations do
  @moduledoc """
  The PersonalInformations context.
  """

  import Ecto.Query, warn: false
  alias Chaudron.Repo

  alias Chaudron.PersonalInformations.PersonalInformation

  @doc """
  Create or update a personal_information
  """
  def create_or_update_personal_information(user, attrs) do
    case get_personal_information(user.id) do
      nil -> create_personal_information(user, attrs)
      personal_info -> update_personal_information(personal_info, attrs)
    end
  end

  @doc """
  Returns the list of personal_informations.

  ## Examples

      iex> list_personal_informations()
      [%PersonalInformation{}, ...]

  """
  def list_personal_informations do
    Repo.all(PersonalInformation)
  end

  @doc """
  Gets a single personal_information.

  Raises `Ecto.NoResultsError` if the Personal information does not exist.

  ## Examples

      iex> get_personal_information!(123)
      %PersonalInformation{}

      iex> get_personal_information!(456)
      ** (Ecto.NoResultsError)

  """
  def get_personal_information(user_id) do
    Repo.one(from p in PersonalInformation, where: p.user_id == ^user_id)
  end

  @doc """
  Creates a personal_information.

  ## Examples

      iex> create_personal_information(%{field: value})
      {:ok, %PersonalInformation{}}

      iex> create_personal_information(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_personal_information(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:personal_informations)
    |> PersonalInformation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a personal_information.

  ## Examples

      iex> update_personal_information(personal_information, %{field: new_value})
      {:ok, %PersonalInformation{}}

      iex> update_personal_information(personal_information, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_personal_information(%PersonalInformation{} = personal_information, attrs) do
    personal_information
    |> PersonalInformation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a personal_information.

  ## Examples

      iex> delete_personal_information(personal_information)
      {:ok, %PersonalInformation{}}

      iex> delete_personal_information(personal_information)
      {:error, %Ecto.Changeset{}}

  """
  def delete_personal_information(%PersonalInformation{} = personal_information) do
    Repo.delete(personal_information)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking personal_information changes.

  ## Examples

      iex> change_personal_information(personal_information)
      %Ecto.Changeset{data: %PersonalInformation{}}

  """
  def change_personal_information(%PersonalInformation{} = personal_information, attrs \\ %{}) do
    PersonalInformation.changeset(personal_information, attrs)
  end
end
