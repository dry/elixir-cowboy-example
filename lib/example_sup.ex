defmodule ExampleSup do
  @behaviour :supervisor

  def start_link do
    :supervisor.start_link {:local, __MODULE__}, __MODULE__, []
  end

  def init([]) do
    {:ok, {{:one_for_one, 10, 10}, []}}
  end
end

