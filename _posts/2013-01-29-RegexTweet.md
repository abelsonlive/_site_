---
layout: post
title: "Using spam bots for live reporting"
description: "RT's via RE's."
author: Brian Abelson
email: brianabelson@gmail.com
categories: open-news
---
For an upcoming project for [NewsBeastLabs](http://newsbeastlabs.tumblr.com/) on the gun debate, I’ve been monitoring statements representatives have made on the topic. As President Obama prepared to unveil his proposal for gun control last Wednesday, [Michael Keller](http://www.twitter.com/mhkeller) and I were curious to see the reactions of representatives to the highly publicized announcement. Given the degree to which breaking news is now reported (and responded to) on social media, we thought it would be useful to build a bot to log officials’ comments on certain issues and present them in real-time. Such a tool could be used by news rooms to engage their readers on a continuous basis by aggregating and serving content from members of particular communities or who serve on different committees.

###[@RepsGunTweets](http://www.twitter.com/repsguntweets) was born.###

We were inspired by the work of 2013 Mozilla-Knight OpenNews fellows who recently built a prototpe for an app called “if (this) then news," a news-oriented take on IFTTT – a site for linking triggers from gmail, twitter, dropbox, and other services to actions on the web. Applying this logic to news coverage, the fellows created the shell for a tool that would monitor live data streams, detect important events, and issue notifications. As Vice President Biden took the mic, we started furiously coding up a bot that would follow the twitter accounts of US Representatives and retweet any comment that included “gun", “assault weapon", “firearm", or other relvant keywords. After a couple hours of missteps and headaches, we eventually got @RepsGunTweets up and running. In the last ten days, the bot has logged 307 tweets; two-thirds of which came in the first three days. We’re still analyzing the conversation but one interesting observation is representatives who are not in favor of gun control tend to link to longer explanations of their position on their website instead of tweet a comment.

###Under the hood

At its core a retweet bot is a pretty simple tool: Follow a feed, find what matters, and serve it back up under a single account. The harder part is figuring out how to accurately communicate with Twitter’s API. Using tweepy for python we were able to easily access twitter’s numerous methods. All we needed to provide it with were the the consumer key, consumer secret, access token, and access token secret for an application generated on http://dev.twitter.com/apps). The bot follows CSPAN’s member of congress list and applies a regular expression for the desired keywords and retweets any matches.For even more technical info, including an easy way to create your own retweet bot, check out [this Github page](http://www.github.com/abelsonlive/regextweet).
