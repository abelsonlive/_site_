---
layout: post
title: "Creating a metric for news apps"
description: "Newsrooms large and small are adopting digital and data-driven techniques to engage readers with their work. News applications - large web-based interactive databases that tell stories with software - have emerged as the standard medium through which these projects are presented.  Given the common structure of news applications and the existence of well-developed tools for tracking user-level events on a website, I propose a simple framework for measuring engagement with news apps."
author: Brian Abelson
email: brianabelson@gmail.com
categories: open-news
---
More and more, newsrooms large and small are adopting digital and data-driven techniques to engage readers with their work. [News applications](http://www.propublica.org/nerds/item/knight-foundation-makes-grant-to-support-propublicas-news-applications-desk), or "large web-based interactive database[s] that tell a journalistic story using software instead of words and pictures", have emerged as the standard medium through which journalists present the outcomes of data-driven projects.  From [Dollars for Docs](http://projects.propublica.org/docdollars/) to [Dogs of NYC](http://project.wnyc.org/dogs-of-nyc/), news apps present readers with interactive experiences that offer them opportunities to engage more deeply with a story than traditional article-based formats.  Given the common structure of news apps (discussed below) and the existence of [well-developed tools](https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide) for tracking user-level events on a website, I propose a simple framework for measuring engagement with news applications.
<br>
### What makes a news app "successful"?
In a recent [InsideThunderdome](http://www.insidethunderdome.com/) live chat, [Scott Klein](https://twitter.com/kleinmatic), editor of News Applications at ProPublica, wrote, "what I like to see in a news application [is] a way to see the "far" view (in other words, the big national picture) and the "near" view (how the big national phenomenon relates to me personally)."  Put another way, the _far view_ "lets you know why you should care, what the story is, what the national phenomenon is and how places compare to each other." The _near view_, on the other hand, walks you "through levels of abstraction down to the very specific -- your town, your street, your school. So if we're successful now you know the national picture, why you should care, and what it's got to do with you."

Echoing this philosophy, [Michael Keller](http://www.twitter.com/mhkeller), Senior Data Reporter at Daily Beast says, "we think of interactives as tools to help people to see how a story might matter to them. Here, 'success' means drawing people into the story and, if we're lucky, also building in ways to hear how it affected them."

Other indications of what makes a "successful" news app come through job ads.  For instance, [PBS's News Hour](http://www.pbs.org/newshour/jobs/webdev.html) is looking for someone to "develop news applications that allow users to explore the stories behind data."

From these examples, a pattern emerges: a "successful" news application is one that presents a reader with a story and offers them an opportunity to dig deeper. Given this common structure of news applications, it should be possible to create a simple metric that captures the degree to which readers use an app to move from the far view to the near view.  Such a metric might help newsrooms begin to assess readers' level of engagement; defined here as the intersection of what readers want and what newsrooms want readers to do.
<br>
### How might we measure this?
Over the past couple of years, [journalists](http://www.niemanlab.org/2012/08/metrics-metrics-everywhere-how-do-we-measure-the-impact-of-journalism/), [editors](http://aronpilhofer.com/post/27993980039/the-right-metric-for-news), and [news room developers](http://www.greglinch.com/2012/01/quantifying-impact-a-better-metric-for-measuring-journalism.html) have begun to openly criticize the poverty of traditional metrics like page views and average time spent on page.  Most of their frustration lies in the inability of these metrics to capture deeper ideas like attitudinal, behavioral, or legislative change - in a word: impact.  But while automated metrics may never fully capture these important considerations, they could help us get at some idea of overall reader engagement with a news application.
<br>
##### Event tracking
One step past page-views and time spent on page are more granular web metrics that capture individual events.  From Google Analytics, Omniture, to WebTrends, many free and paid-for analytics services offer access to raw event-level data, or individual actions taken on a given page.  "Events" can be created with small tags in your site's JavaScript ([see how to do this with Google Analytics](https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide)). By tagging elements of a project associated with clicking through a site, entering a search term, watching a video, or sharing on social media, event tracking can be used to track a users path from the 'far' to the 'near' of news apps.
<br>
##### Identifying users
The difficult ([and perhaps troubling](http://en.wikipedia.org/wiki/Internet_privacy)) aspect of event tracking is the necessity of identifying individual users of a site. The New York Times is lucky enough to have substantial traffic from registered users. In these cases, collecting user-level event data over time and across multiple devices is simplified through logins. However, IP addresses or IDs extracted from [cookies](http://en.wikipedia.org/wiki/HTTP_cookie), small bits of information that sites use to track their users, can serve as proxies.  While these can be deactivated on [most modern browsers](http://www.aboutcookies.org/default.aspx?page=1), or through services like [Tor](https://www.torproject.org/), in most cases they can represent an "individual user." In turn, reconciling this information allows us to study the scope of each user's interaction with an app.
<br>
### A case study: _The Red Carpet Project_
In late January, the New York Times interactive team released [an app](http://www.nytimes.com/projects/oscars/red-carpet-history/) for exploring 15 years of outfits on the Red Carpet.  The app represents a new take on the slide show, enabling filtering, searching, and sharing of certain slices of slides.  Built into the app is an implicit logic of engagement: while the images are on showcase, readers are encouraged to explore the dresses and suits curated by editors and filter the images by time, style, and color. If all goes well, the readers share their own selection of outfits on social media.
<br>
<br>
##### Tagging news apps
<br>
<br>
<img src="/img/posts/metric-for-news-apps/red_carpet_site.png">
<br>
<br>

In _[The Red Carpet Project](http://www.nytimes.com/projects/oscars/red-carpet-history/)_, the far view are the images themselves - what the app would have been had it been merely a slide show.  Readers move closer to the near view as they filter the outfits, explore the editors' selections, and share the site on social media. By tagging each of these events with unique ids, we can isolate users whose behavior on the site was most indicative of "engagement."
<br>
<br>
##### Exploring the data
<br>
<br>
<center>
    <img src="/img/posts/metric-for-news-apps/number_of_events.png">
</center>
<br>
Given the data for these events, we can now measure the most-used elements of the app. In the figure above, we group events into simpler categories.  Note that "faves" connote instances where users selected their favorite outfits without necessarily sharing them on social media.  We find that over 95% of the events captured were associated with viewing an image - the "far view."  However, without knowing the degree to which each reader used all possible features, we cannot approximate levels of engagement.
<br>
<br>
<center>
    <img src="/img/posts/metric-for-news-apps/number_of_features_used.png">
</center>
<br>
By counting the number of unique features each reader used, we get a better idea of the degree to which users explored the app's near view.  We immediately see that readers rarely engaged with more than one or two of the apps features.  Taken together these two graphs beg the question: what was the difference between readers who only viewed slides and those who used additional features?
<br>
<br>
<center>
    <img src="/img/posts/metric-for-news-apps/time_v_events.png">
</center>
<br>
In this view, we see that more than half of the users viewed only slides and 5% clicked every slide without engaging other features. Readers that only clicked on slides also spent less time on the page than readers that explored more of the site. While such readers may have used the app extensively, they didn't reach its "near view." In creating a metric for news apps, we should account for these cases, assigning penalties for behaviors that suggest a lack of engagement.
<br>
<br>
##### Creating a metric of engagement
With these insights, we begin to get a sense of the things we can measure to approximate a user's overall engagement with the app.  While we'd like to give weight to the raw number of events -- after all, rapidly clicking through 500 images without filtering is its own form of engagement -- we also want to assign influence to features that capture whether a user reached the app's near view. A metric of engagement for this app might looking something like this:
<br>
<br>
<center>
    <img src="/img/posts/metric-for-news-apps/engagement.png">
</center>
<br>
<br>
While I've simplified the math here -- the variables are also transformed to decrease the influence of outliers and re-scaled to increase interpretability -- the abstracted equation represents a simplified measurement which captures the logic of engagement embedded in the site.  In this case, the corresponding density plot reveals a bifurcated distribution of user experiences, with one half barely engaging with the site (1-20), and the other half dispersed over a long-tail (20-100). However, we might imagine alternate situations where more/less users explored the deeper intricacies of the app. In these cases we would expect the distribution of engagement to look much different.
<br>
<br>
### What might we do with this?
Metrics, while abstractions, are useful in that they provide a single number one can use to track progress.  As [Bill Gates wrote](http://online.wsj.com/article/SB10001424127887323539804578261780648285770.html) in a recent _Wall Street Journal_ article (while referencing William Rosen's _[The Most Powerful Idea in the World](http://www.amazon.com/Most-Powerful-Idea-World-Invention/dp/0226726347)_), "Without feedback from precise measurement ... invention is 'doomed to be rare and erratic.' With it, invention becomes 'commonplace.'" Without a metric for news apps, our only tools for gauging success will be conjecture and anecdote - a great irony given the meticulousness with which data is cleaned and analyzed to construct these projects.  With a standard, interpretable metric, editors and journalists can begin to judge whether their intuitions match up with their readers behavior; analysts can compare apps over time and across news organizations; developers will come to value simplicity of presentation and ease of use over technical complexity; and, perhaps most importantly, news organizations will begin designing their digital offerings with [users in mind](http://jonathanstray.com/designing-journalism-to-be-used).  While the measurements proposed here are just a rough sketch, I hope they will lead to an open discussion on the development of meaningul metrics for journalism.
