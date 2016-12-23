defmodule Foo do
  defmacro is_file(args) do
    quote do: Regex.match?(~r/--file/, args[0])
  end

  defmacro is_text(args) do
    quote do
      Regex.match?(~r/--text/, args[0])
    end
  end
end
