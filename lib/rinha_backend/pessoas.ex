defmodule RinhaBackend.Pessoas do


  alias RinhaBackend.Pessoas.Create

  defdelegate create(params), to: Create, as: :call


end
