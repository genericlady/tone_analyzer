# ToneAnalyzer

You will need ibm bluemix credentials to use the tone analyzing service. [Register Here](https://console.ng.bluemix.net/dashboard/apps/) for a free account.

Register for the tone analyzing service and set your environment variables with the proper credentials.

```bash
TONE_ANALYZER_USERNAME=abc
TONE_ANALYZER_PASS=def
```

Clone the repo cd into the root of the project directory to compile into an executable.
```
$ mix escript.build
```

run it's exectuable with a `--text=` flag.

```
$ ./tone_analyzer --text="Some long string of text"

+----------------------+
|     Emotion Tone     |
+-----------+----------+
| Tone Name | Score    |
+-----------+----------+
| Anger     | 0.165141 |
| Disgust   | 0.076184 |
| Fear      | 0.0706   |
| Joy       | 0.034928 |
| Sadness   | 0.722131 |
+-----------+----------+

+--------------------+
|   Language Tone    |
+------------+-------+
| Tone Name  | Score |
+------------+-------+
| Analytical | 0.0   |
| Confident  | 0.0   |
| Tentative  | 0.0   |
+------------+-------+

+------------------------------+
|         Social Tone          |
+-------------------+----------+
| Tone Name         | Score    |
+-------------------+----------+
| Openness          | 0.833323 |
| Conscientiousness | 0.405904 |
| Extraversion      | 0.773447 |
| Agreeableness     | 0.578656 |
| Emotional Range   | 0.441664 |
+-------------------+----------+

```

## Technical Overview
- [Overview of Watson Tone Analyzer Service](https://www.ibm.com/watson/developercloud/doc/tone-analyzer/)
- [Analyzer Service API Explorer](https://www.ibm.com/watson/developercloud/tone-analyzer/api/v3/)
- [Understand your score](https://www.ibm.com/watson/developercloud/doc/tone-analyzer/understanding-tone.shtml)

