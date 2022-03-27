defmodule WaterEx.Application do
  use Application

  def start(_, _) do
    children = [
      {WaterEx.Server, []}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
