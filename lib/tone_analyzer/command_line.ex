defmodule ToneAnalyzer.CommandLine do
  alias ToneAnalyzer.ServiceCall, as: ServiceCall

  @moduledoc """
  This module defines the main run routine used to
  parse command line arguments and process them.
  """
  @vsn "1.0"

  def main(args) do
    args |> parse_args |> process |> print_each_table
  end

  def process([]) do
    IO.puts 'Try appending --text="Analyze Text"'
  end

  def process(options) do
    ServiceCall.start(:get, options[:text]) |> to_tables
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

  def to_tables(categories) do
    Enum.map(categories,
      fn(category) ->
        title = category["category_name"]
        header = ["Tone Name", "Score"]
        rows = to_rows(category["tones"])
        TableRex.quick_render!(rows, header, title)
      end
    )
  end

  def print_each_table(tables) do
    Enum.each(tables, &IO.puts(&1))
  end

  def to_rows(tones) do
    Enum.map(tones,
      fn(tone) ->
        [
          tone["tone_name"],
          tone["score"]
        ]
      end
    )
  end
end
