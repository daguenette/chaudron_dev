defmodule Chaudron.PersonalInformationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chaudron.PersonalInformations` context.
  """

  @doc """
  Generate a personal_information.
  """
  def personal_information_fixture(attrs \\ %{}) do
    {:ok, personal_information} =
      attrs
      |> Enum.into(%{
        age: 42,
        city: "some city",
        country: "some country",
        dependant_amount: 42,
        job_title: "some job_title",
        marital_status: "some marital_status",
        name: "some name",
        state: "some state"
      })
      |> Chaudron.PersonalInformations.create_personal_information()

    personal_information
  end
end
