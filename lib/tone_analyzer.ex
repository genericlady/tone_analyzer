defmodule ToneAnalyzer do
  include System, only [get_env: 1]

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

defmodule ServiceCall do
  import ToneAnalyzer
  import String, only: [replace: 3]

  def start(:get, text) do
    HTTPotion.get url <> "&text=" <> encode(text), [basic_auth: login_credentials]
  end

  def start(:post) do
    HTTPotion.post url, [
      body: "&text=" <> "I like chocolate",
      headers: [
        "User-Agent": "ToneAnalyzer",
        "Content-Type": "application/json"
      ],
      basic_auth: login_credentials
    ]
  end

  defp encode(text) do
    replace text, " ", "%20"
  end
 
  defp loginCredentials do
    {username, password}
  end

end
