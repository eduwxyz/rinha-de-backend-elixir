defmodule RinhaBackend.Repo.Migrations.AddPessoasTable do
  use Ecto.Migration

  def change do
    create table("pessoas") do
      add :uuid, :binary_id, primary_key: true, autogenerate: true
      add :nome, :string, null: false, size: 100
      add :apelido, :string, null: false, size: 32, unique: true
      add :nascimento, :date, null: false
      add :stack, {:array, :string}, default: nil
      add :pesquisa, :text, default: nil
    end

    create index(:pessoas, ["pesquisa gin_trgm_ops"], using: :gin)
    create unique_index(:pessoas, [:apelido])
  end
end
