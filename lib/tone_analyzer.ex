defmodule ToneAnalyzer do
  def username do
    System.get_env("TONE_ANALYZER_USERNAME");
  end

  def password do
    System.get_env("TONE_ANALYZER_PASS");
  end
  
  def watsonEndPoint do
    "https://gateway.watsonplatform.net/tone-analyzer/api/v3";
  end
end
