defmodule RinhaBackend.Cache do
  use Nebulex.Cache,
    otp_app: :rinha_backend,
    adapter: Nebulex.Adapters.Local
end
