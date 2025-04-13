defmodule Anubis.Repo.Migrations.AddStatusToContacts do
  use Ecto.Migration

  def change do
    alter table(:contacts) do
      add :status, :string, default: "active", null: false
    end
  end
end
