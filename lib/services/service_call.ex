defmodule ServiceCall do
  import UrlBuilder
  import String, only: [replace: 3]

  def start(:get, text) do
    analyze_text(:get, text)
      |> to_struct
      |> document_tone
      |> tone_categories
  end

  def start(:post, text) do
    analyze_text(:post, text)
      |> to_struct
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
    HTTPotion.get build_url(text), [basic_auth: login_credentials]
  end

  defp analyze_text(:post, text) do
    HTTPotion.post url, [
      body: "&text=#{text}",
      headers: [
        "User-Agent": "ToneAnalyzer",
        "Content-Type": "application/json"
      ],
      basic_auth: login_credentials
    ]
  end
 
  defp login_credentials do
    {
      credentials(:username),
      credentials(:password)
    }
  end

end

