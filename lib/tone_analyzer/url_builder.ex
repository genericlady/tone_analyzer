defmodule ToneAnalyzer.UrlBuilder do

  def build(text) do
    url <> URI.encode(text)
  end

  def url do
    "https://#{host}#{path}?version=2016-05-19&text="
  end

  def credentials(:username) do
    System.get_env("TONE_ANALYZER_USERNAME")
  end

  def credentials(:password) do
    System.get_env("TONE_ANALYZER_PASS")
  end

  defp host do
    "gateway.watsonplatform.net"
  end

  defp path do
    "/tone-analyzer/api/v3/tone"
  end
end

