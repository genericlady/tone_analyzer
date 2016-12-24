defmodule UrlBuilderTest do
  alias ToneAnalyzer.UrlBuilder, as: UrlBuilder
  use ExUnit.Case
  doctest UrlBuilder

  def url do
    host = "gateway.watsonplatform.net"
    path = "tone-analyzer/api/v3/tone"
    "https://#{host}/#{path}?version=2016-05-19&text="
  end

  test "A path to the tone analyzer api v3" do
    assert UrlBuilder.url == url
  end

  test "Build an url with a string of text appended to it" do
    assert UrlBuilder.build("Foo Bar") == url <> "Foo%20Bar"
  end

end
