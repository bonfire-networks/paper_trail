defmodule Example.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :name,       :string
      add :is_active,  :boolean
      add :website,    :string
      add :city,       :string
      add :address,    :string
      add :facebook,   :string
      add :twitter,    :string
      add :founded_in, :string

      timestamps()
    end
  end
end
