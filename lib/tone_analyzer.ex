defmodule ToneAnalyzer do
  def url do
    "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19"
  end

  def username do
    System.get_env("TONE_ANALYZER_USERNAME")
  end

  def password do
    System.get_env("TONE_ANALYZER_PASS")
  end

end

defmodule ServiceCall do
  def analyzeText(textInput) do
    "&text=" <> textInput
  end
  
  def get do
    HTTPotion.get url, [basic_auth: authOptions]
  end

  defp post do
    HTTPotion.post url, [
      body: "text=" <> URI.encode_www_form("w o r l d !!"),
      headers: [
        "User-Agent": "ToneAnalyzer",
        "Content-Type": "application/json"
      ]
    ]
  end

  defp authOptions do
    {ToneAnalyzer.username, ToneAnalyzer.password}
  end

end
