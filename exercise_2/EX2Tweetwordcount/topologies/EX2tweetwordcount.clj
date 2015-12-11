(ns EX2tweetwordcount
  (:use     [streamparse.specs])
  (:gen-class))

(defn tweetwordcount [options]
   [
    ;; spout configuration
    {"tweet-spout1" (python-spout-spec
          options
          "spouts.tweets.Tweets"
          ["tweet"]
          :p 1
          )
    }
    ;; bolt configuration
    {"parse-tweet-bolt1" (python-bolt-spec
          options
          {"tweet-spout1" :shuffle
           }
          "bolts.parse.ParseTweet"
          ["word"]
          :p 2
          )


     "count-bolt1" (python-bolt-spec
          options
          {"parse-tweet-bolt1" ["word"]
           }
          "bolts.wordcount.WordCounter"
          ["word" "count"]
          :p 2
          )

    }
  ]
)


