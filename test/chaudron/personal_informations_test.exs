defmodule Chaudron.PersonalInformationsTest do
  use Chaudron.DataCase

  alias Chaudron.PersonalInformations

  describe "personal_informations" do
    alias Chaudron.PersonalInformations.PersonalInformation

    import Chaudron.PersonalInformationsFixtures

    @invalid_attrs %{name: nil, state: nil, age: nil, marital_status: nil, dependant_amount: nil, country: nil, city: nil, job_title: nil}

    test "list_personal_informations/0 returns all personal_informations" do
      personal_information = personal_information_fixture()
      assert PersonalInformations.list_personal_informations() == [personal_information]
    end

    test "get_personal_information!/1 returns the personal_information with given id" do
      personal_information = personal_information_fixture()
      assert PersonalInformations.get_personal_information!(personal_information.id) == personal_information
    end

    test "create_personal_information/1 with valid data creates a personal_information" do
      valid_attrs = %{name: "some name", state: "some state", age: 42, marital_status: "some marital_status", dependant_amount: 42, country: "some country", city: "some city", job_title: "some job_title"}

      assert {:ok, %PersonalInformation{} = personal_information} = PersonalInformations.create_personal_information(valid_attrs)
      assert personal_information.name == "some name"
      assert personal_information.state == "some state"
      assert personal_information.age == 42
      assert personal_information.marital_status == "some marital_status"
      assert personal_information.dependant_amount == 42
      assert personal_information.country == "some country"
      assert personal_information.city == "some city"
      assert personal_information.job_title == "some job_title"
    end

    test "create_personal_information/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PersonalInformations.create_personal_information(@invalid_attrs)
    end

    test "update_personal_information/2 with valid data updates the personal_information" do
      personal_information = personal_information_fixture()
      update_attrs = %{name: "some updated name", state: "some updated state", age: 43, marital_status: "some updated marital_status", dependant_amount: 43, country: "some updated country", city: "some updated city", job_title: "some updated job_title"}

      assert {:ok, %PersonalInformation{} = personal_information} = PersonalInformations.update_personal_information(personal_information, update_attrs)
      assert personal_information.name == "some updated name"
      assert personal_information.state == "some updated state"
      assert personal_information.age == 43
      assert personal_information.marital_status == "some updated marital_status"
      assert personal_information.dependant_amount == 43
      assert personal_information.country == "some updated country"
      assert personal_information.city == "some updated city"
      assert personal_information.job_title == "some updated job_title"
    end

    test "update_personal_information/2 with invalid data returns error changeset" do
      personal_information = personal_information_fixture()
      assert {:error, %Ecto.Changeset{}} = PersonalInformations.update_personal_information(personal_information, @invalid_attrs)
      assert personal_information == PersonalInformations.get_personal_information!(personal_information.id)
    end

    test "delete_personal_information/1 deletes the personal_information" do
      personal_information = personal_information_fixture()
      assert {:ok, %PersonalInformation{}} = PersonalInformations.delete_personal_information(personal_information)
      assert_raise Ecto.NoResultsError, fn -> PersonalInformations.get_personal_information!(personal_information.id) end
    end

    test "change_personal_information/1 returns a personal_information changeset" do
      personal_information = personal_information_fixture()
      assert %Ecto.Changeset{} = PersonalInformations.change_personal_information(personal_information)
    end
  end
end
