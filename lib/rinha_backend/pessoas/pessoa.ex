defmodule RinhaBackend.Pessoas.Pessoa do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: true}
  schema "pessoas" do
    field :apelido, :string
    field :nascimento, :date
    field :nome, :string
    field :stack, {:array, :string}, default: nil
    field :pesquisa, :string
  end

  # fixme -> verificar o params \\ %{}
  def changeset(pessoa \\ %__MODULE__{}, params) do
    pessoa
    |> cast(params, [:nome, :apelido, :nascimento, :stack, :pesquisa])
    |> validate_required([:nome, :apelido, :nascimento], message: "Campos Obrigatórios")
    |> validate_length(:nome, max: 100, message: "Nome deve ter no máximo 100 caracteres")
    |> validate_length(:apelido, max: 32, message: "Apelido deve ter no máximo 32 caracteres")
    |> unique_constraint(:apelido, message: "Apelido já cadastrado")

  end
end
