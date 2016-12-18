defmodule ToneAnalyzer do

  def main(args) do
    args |> parse_args |> process
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

end
