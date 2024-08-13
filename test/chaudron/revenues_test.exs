defmodule Chaudron.RevenuesTest do
  use Chaudron.DataCase

  alias Chaudron.Revenues

  describe "revenues" do
    alias Chaudron.Revenues.Revenue

    import Chaudron.RevenuesFixtures

    @invalid_attrs %{annual_gross_salary: nil, addiotional_income_sources: nil, alimony_received: nil, social_benefits: nil, investment_income: nil, other_income: nil}

    test "list_revenues/0 returns all revenues" do
      revenue = revenue_fixture()
      assert Revenues.list_revenues() == [revenue]
    end

    test "get_revenue!/1 returns the revenue with given id" do
      revenue = revenue_fixture()
      assert Revenues.get_revenue!(revenue.id) == revenue
    end

    test "create_revenue/1 with valid data creates a revenue" do
      valid_attrs = %{annual_gross_salary: 120.5, addiotional_income_sources: 120.5, alimony_received: 120.5, social_benefits: 120.5, investment_income: 120.5, other_income: 120.5}

      assert {:ok, %Revenue{} = revenue} = Revenues.create_revenue(valid_attrs)
      assert revenue.annual_gross_salary == 120.5
      assert revenue.addiotional_income_sources == 120.5
      assert revenue.alimony_received == 120.5
      assert revenue.social_benefits == 120.5
      assert revenue.investment_income == 120.5
      assert revenue.other_income == 120.5
    end

    test "create_revenue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Revenues.create_revenue(@invalid_attrs)
    end

    test "update_revenue/2 with valid data updates the revenue" do
      revenue = revenue_fixture()
      update_attrs = %{annual_gross_salary: 456.7, addiotional_income_sources: 456.7, alimony_received: 456.7, social_benefits: 456.7, investment_income: 456.7, other_income: 456.7}

      assert {:ok, %Revenue{} = revenue} = Revenues.update_revenue(revenue, update_attrs)
      assert revenue.annual_gross_salary == 456.7
      assert revenue.addiotional_income_sources == 456.7
      assert revenue.alimony_received == 456.7
      assert revenue.social_benefits == 456.7
      assert revenue.investment_income == 456.7
      assert revenue.other_income == 456.7
    end

    test "update_revenue/2 with invalid data returns error changeset" do
      revenue = revenue_fixture()
      assert {:error, %Ecto.Changeset{}} = Revenues.update_revenue(revenue, @invalid_attrs)
      assert revenue == Revenues.get_revenue!(revenue.id)
    end

    test "delete_revenue/1 deletes the revenue" do
      revenue = revenue_fixture()
      assert {:ok, %Revenue{}} = Revenues.delete_revenue(revenue)
      assert_raise Ecto.NoResultsError, fn -> Revenues.get_revenue!(revenue.id) end
    end

    test "change_revenue/1 returns a revenue changeset" do
      revenue = revenue_fixture()
      assert %Ecto.Changeset{} = Revenues.change_revenue(revenue)
    end
  end
end
