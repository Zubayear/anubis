defmodule Anubis.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :tags, {:array, :string}
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:contacts, [:email])
    create index(:contacts, [:user_id])
  end
end
