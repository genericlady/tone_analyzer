defmodule ToneAnalyzer.CommandLine do
  @moduledoc """
  This module defines the main run routine used to
  parse command line arguments and process them.
  """
  @vsn "1.0"

  def main(args) do
    args |> parse_args |> process
    print_table
  end

  def process([]) do
    IO.puts 'Try appending --text="Analyze Text"'
  end

  def process(options) do
    ServiceCall.start(:get, options[:text])
  end

  defp parse_args(args) do
    {options, _, _} = 
      OptionParser.
        parse(
          args,
          switches: [text: :string]
        )
    options
  end

	def print_table do
		title = "Emotion Tone"
		header = ["Tone Name", "Score"]
		rows = [
			["Disgust", "0.041346"],
			["Fear", "0.167990"],
			["Joy", "0.245876"]
		] 

		TableRex.quick_render!(rows, header, title)
		|> IO.puts
  end

end
