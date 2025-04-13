defmodule Anubis.ContactsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Anubis.Contacts` context.
  """

  @doc """
  Generate a unique contact email.
  """
  def unique_contact_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        email: unique_contact_email(),
        first_name: "some first_name",
        last_name: "some last_name",
        tags: ["option1", "option2"]
      })
      |> Anubis.Contacts.create_contact()

    contact
  end
end
