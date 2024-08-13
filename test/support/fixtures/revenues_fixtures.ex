defmodule Chaudron.RevenuesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chaudron.Revenues` context.
  """

  @doc """
  Generate a revenue.
  """
  def revenue_fixture(attrs \\ %{}) do
    {:ok, revenue} =
      attrs
      |> Enum.into(%{
        addiotional_income_sources: 120.5,
        alimony_received: 120.5,
        annual_gross_salary: 120.5,
        investment_income: 120.5,
        other_income: 120.5,
        social_benefits: 120.5
      })
      |> Chaudron.Revenues.create_revenue()

    revenue
  end
end
