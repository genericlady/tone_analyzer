defmodule UrlBuilder do
  import System, only: [get_env: 1]
  import URI, only: [encode: 1]

  def build_url(text) do
    url <> encode(text)
  end

  def url do
    "https://#{host}#{path}?version=2016-05-19&text="
  end

  def credentials(:username) do
    get_env("TONE_ANALYZER_USERNAME")
  end

  def credentials(:password) do
    get_env("TONE_ANALYZER_PASS")
  end

  defp host do
    "gateway.watsonplatform.net"
  end

  defp path do
    "/tone-analyzer/api/v3/tone"
  end
end

