defmodule Apus.RedisAdapter do
  @moduledoc """
  """

  @behaviour Apus.Adapter

  require Logger

  def deliver(message, _config) do
    Redix.command(:redix_1, ["LPUSH", "sms_list", :erlang.term_to_binary(message)])
    Redix.command(:redix_1, ["LTRIM", "sms_list", "0", "99"])
  end

  def handle_config(config), do: config
end
