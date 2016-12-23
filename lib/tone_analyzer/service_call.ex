defmodule ToneAnalyzer.ServiceCall do
  alias ToneAnalyzer.UrlBuilder, as: UrlBuilder

  def start(:get, text) do
    analyze_text(:get, text) 
    |> to_struct
    |> document_tone
    |> tone_categories
  end

  def start(:post, text) do
    to_struct(analyze_text(:post, text))
  end

  defp document_tone(response_body) do
    response_body["document_tone"]
  end

  defp tone_categories(document_tone) do
    document_tone["tone_categories"]
  end

  defp to_struct(response) do
    Poison.decode!(response.body)
  end

  defp analyze_text(:get, text) do
    HTTPotion.get UrlBuilder.build(text), [basic_auth: login_credentials]
  end

  defp analyze_text(:post, text) do
    header = [
        "User-Agent": "ToneAnalyzer",
        "Content-Type": "application/json"
      ]

    body = "{\"text\": \"#{text}\"}"

    HTTPotion.post UrlBuilder.url, [
      body: body,
      headers: header,
      basic_auth: login_credentials
    ]
  end

  defp login_credentials do
    {
      UrlBuilder.credentials(:username),
      UrlBuilder.credentials(:password)
    }
  end

end

