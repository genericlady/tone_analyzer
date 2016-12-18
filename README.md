# ToneAnalyzer
Clone the repo cd into the root of the project directory and run
it's exectuable with a `--text=` flag.
```
$ ./tone_analyzer --text="Some long string of text"
```

To compile into an executable after editing the source code:
```
$ mix escript.build
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `tone_analyzer` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:tone_analyzer, "~> 0.1.0"}]
    end
    ```

  2. Ensure `tone_analyzer` is started before your application:

    ```elixir
    def application do
      [applications: [:tone_analyzer]]
    end
    ```

