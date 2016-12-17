defmodule UrlBuilder do
  import System, only: [get_env: 1]

  def url do
    "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19"
  end

  def username do
    get_env("TONE_ANALYZER_USERNAME")
  end

  def password do
    get_env("TONE_ANALYZER_PASS")
  end

end

