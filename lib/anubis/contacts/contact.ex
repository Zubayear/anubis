defmodule Anubis.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :tags, {:array, :string}
    field :user_id, :id
    field :status, :string, default: "active"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> maybe_cast_email(attrs)
    |> cast(attrs, [:first_name, :last_name, :tags, :status])
    |> validate_required_email(contact)
    |> validate_inclusion(:status, ["active", "inactive", "archived"])
    |> unique_constraint(:email)
  end

  defp maybe_cast_email(%{id: nil} = contact, attrs), do: cast(contact, attrs, [:email])

  defp maybe_cast_email(contact, _attrs), do: contact

  defp validate_required_email(changeset, %{id: nil}), do: validate_required(changeset, [:email])

  defp validate_required_email(changeset, _contact), do: changeset
end
