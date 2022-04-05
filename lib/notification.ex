defmodule WaterEx.Notification do
  def send_notification() do
    execute_command("notify-send -u normal -i #{get_image_path()} DRINK WATER!")
    play_water_sound()
  end

  def play_water_sound do
    execute_command("paplay #{get_sound_path()}")
  end

  defp get_sound_path do
    get_priv_file("water.ogg")
  end

  defp get_image_path do
    get_priv_file("water.jpg")
  end

  defp get_priv_file(file) do
    Path.join(:code.priv_dir(:water_ex), file)
  end

  defp execute_command(command) do
    command
    |> String.to_charlist()
    |> :os.cmd()
    |> List.to_string()
    |> String.trim()
    |> IO.puts()
  end
end
