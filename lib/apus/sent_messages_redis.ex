defmodule Apus.SentMessagesRedis do
  @moduledoc false

  def all() do
    case Redix.command(:redix, ["LRANGE", "sms_list", "0", "-1"]) do
      {:ok, msg} ->
        msg
        |> Enum.map(fn m ->
          :erlang.binary_to_term(m)
        end)

      e ->
        e
    end
  end
end
