---
layout: post
title: "Whither the Pageview Apocalypse?"
description: "If this is a post-pageview world, then we must be living in a zombie apocalypse as I'm relentlessly haunted by the metric's lifeless corpse."
author: Brian Abelson
email: brianabelson@gmail.com
category: open-news
---

_This is the first in the series of two posts about pageviews.  This post will deal with some of theoretical baggage tied up in the metric, while the second will detail some research I've conducted on the correlates of pageviews._

---------

>"Wild, dark times are rumbling toward us, and the prophet who wishes to write a new apocalypse will have to invent entirely new beasts, and beasts so terrible that the ancient animal symbols of St. John will seem like cooing doves and cupids in comparison." – Heinrich Heine, _Lutetia; or, 'Paris'_, Augsberg Gazette, 1842

---------

The pageview is dead. Jeff Jarvis <a href="http://www.theguardian.com/media/2007/jan/15/mondaymediasection5" target="_blank">presided over its wake in 2007</a>, soberly preparing us for a brave new world of Flash, AJAX, and embeddable widgets in which a page was no longer _just a page_. Chartbeat announced its death <a href="http://blog.chartbeat.com/2012/01/10/metrics-that-matter-and-death-of-the-page-view/" target="_blank">as early as 2012</a> and most recently in a <a href="http://ona13.journalists.org/2013/10/03/metrics-can-improve-newsrooms-but-only-if-the-culture-is-ready/" target="_blank">sponsored post for the Online News Association's upcoming conference</a>.  My current position as a <a href="http://www.mozillaopennews.org/fellowships/2013meet.html" target="_blank">2013 Knight-Mozilla OpenNews Fellow</a> was granted a messianic status when some equated the fellowship to <a href="https://twitter.com/rsingel/status/266602336963686400" target="_blank">a violent crusade against the metric</a>.

<br />

Yet, when I open Google Analytics, I am presented with a time series chart of pageviews.  Most newsrooms I visit include a 'big board' with a list of the top ten articles by pageviews.** And when I sit in analytics meetings, I regularly hear the metric tossed around as a means of benchmarking one article against another. If, as I've been led to believe, this is a post-pageview world, then we must be living in a zombie apocalypse as I'm relentlessly haunted by the metric's lifeless corpse.

<br />

What then of the pageview apocalypse and the prophets who giddily proclaim it? To what ends are these revelations leading us? What strategic aims and benefits are these claims predicated upon?

---------

In Jacques Derrida's 1982 essay, <a href="http://bit.ly/GN1uaY" target="_blank"><em>Of an Apocalyptic Tone Newly Adopted in Philosophy</em></a>, he writes of a tendency prevalent in academia in which scholars paradoxically announce the 'death' or 'end' of their fields. This same tendency can be located in art and culture when critics bemoan the death of <a href="http://www.xxlmag.com/news/bloggers/2006/05/the-death-of-hip-hop/" target="_blank">Hip-Hop</a> or <a href="http://www.academia.edu/156134/The_Death_and_Life_of_Punk_The_Last_Subculture" target="_blank">Punk</a>. The last decade of the News Industry has often resembled the final minutes of _Reservoir Dogs_, with publications announcing the demise of their counterparts only to be shot down themselves in the following frame. There is even <a href="http://newspaperdeathwatch.com/" target="_blank">an online newspaper dedicated to the death of newspapers</a>.

<br />

For Derrida, though, such apocalyptic declarations are intriguing not for the end they depict, but for the transformative visions embedded within their rhetoric. Grounding his discussion in etymology, 'apocalypse' is derived from the Greek <a href="http://www.biblestudytools.com/lexicons/greek/nas/apokalupsis.html" target="_blank"><em>apokalupsis</em></a> which translates to "reveal" or to "uncover." In the Hebrew Bible, the equivalent word <a href="http://www.biblestudytools.com/lexicons/hebrew/nas/gala.html" target="_blank"><em>gala</em></a> is used over a hundred times saying in effect "disclosure, uncovering, unveiling, the veil lifted from about the thing," most often in reference to the sex and/or genitalia of a man or woman, but also in reference to their sensory organs (eyes, ears, mouth). 'Apocalypse’, then, literally means the act of uncovering: the removing of clothes, the shifting of hair, or the unveiling of eyes  to reveal a secret or unknowable existence just beyond the surface. In this manner, an apocalypse is "essentially a contemplation," or a meditation upon a veiled state, which is structured by a desire of a particular disclosure or revelation to its thought process. 

---------

So what is being revealed when the death of the pageview is proclaimed?  Our first clue comes from the coroners.  More often than not, they are the stewards of Web Analytics, an industry that was largely built upon measuring pageviews. From <a href="http://ona13.journalists.org/2013/10/03/metrics-can-improve-newsrooms-but-only-if-the-culture-is-ready/" target="_blank">Chartbeat</a>, to <a href="http://blog.kissmetrics.com/throw-away-vanity-metrics/" target="_blank">KISSmetrics</a>, to <a href="http://blogs.webtrends.com/2010/07/web-analytics-is-dead-long-live-web-analytics/" target="_blank">WebTrends</a>, and <a href="http://www.computerworld.com/s/article/9026640/New_Nielsen_Web_metric_likely_to_hurt_Google_help_YouTube?intsrc=hm_list" target="_blank">Nielsen</a>, it seems like every analytics company has shared in the apocalyptic glee. Mixpanel, a particularly brazen analytics startup, even purchased billboard space along Highway 101 to announce the death of the pageview:
<br />
<br />
<center><img width="400px" src="https://dl.dropboxusercontent.com/u/6535582/mixpanel-pageviews-are-dead.png"></center>
<br />
<p> Remind you of anything? </p>
<br />
<center><img width="400px" src="http://www.writeonnewjersey.com/wp-content/uploads/2011/04/Judgment-Day-Billboard1.jpg"></center>
<br />
<br />
Why then are so many analytics companies taking up arms against themselves? What is the meaning of this <a href="http://stdout.be/2013/08/26/cargo-cult-analytics/" target="_blank">cargo cult</a> of counter-analytics? Here, we can use the common structure of the above billboards as our guide:


<br />

1. Loudly announce the end. 
2. Suggest a counter-action.

<br />
In almost every case, when we are told the pageview is dead, we are given a list of metrics that will take its place. This is the revelation. Instead of pageviews, we're advised, we should be quantifying engagement, trying out A/B tests, conducting funnel analyses, or deploying click/event tracking on our sites (conveniently enough, these tools have often just been added to the next iteration of their platforms). And it's not that these metrics are useless - they can be of great value when designed and deployed correctly - it's that, in lieu of a critical assessment of how and why pageview-centric platforms failed us, we are instead told that <a href="http://readwrite.com/2010/03/17/the-death-of-the-pageview" target="_blank">our egotism led us to pay attention to the wrong things in the first place</a>.

<br />

Yet, having experimented with many "actionable", rather than <a href="http://www.fourhourworkweek.com/blog/2009/05/19/vanity-metrics-vs-actionable-metrics/" target="_blank">"vanity metrics,"</a> I can tell you that their results are often just as murky and misleading. Engagement is a moving target; A/B tests, when poorly designed, often produce inconclusive results; event tracking, while incredibly powerful, does not readily enable comparisons across varied contexts. And, even when these tools are utilized to their full potential, it can be very difficult to translate their insights into action. The fact of the matter is that there are no silver bullets, no secrets to be revealed just beyond the pageview. All there is is hard work, open dialogue, and relentless experimentation to find what works in your particular context. After all, we're talking about measuring the complex behaviors of millions of people.

<br />

Still, many will try and seduce you into believing otherwise.  This act of seduction, Derrida explains, is the principal strategy of apocalypticism: 

>"the subject of [apocalyptic] discourse can have an interest in forgoing its own interest, can forgo everything in order to place yet its death on your shoulders and make you inherit in advance its corpse, that is, its soul, the subject hoping thus to arrive at its end through the end" (52).

In this powerful, if enigmatic passage, we begin to understand the true motivations of apocalyptic prophets.  Doomsayers do not merely seek acknowledgement of an end-to-come or one that has already passed, they are more concerned with seducing you into accepting the terms on which their continued existence, their vested interests, and their vision of 'the end' _are all equally possible_. It's not that analytics platforms are flawed, they say, it's simply that you're not paying attention to the right parts;  It's not that insights are difficult, they promise, it's that you've been going about finding them in the wrong way. 

<br />

So when we are told that the 'pageview is dead', what we are actually being told is that 'analytics platforms are dying'; that the current paradigm is fundamentally flawed and that the companies responsible are scrambling to convince us otherwise. And, rather than accepting their share of the blame, they cite our inherent egotism - our blindly narcissistic desire for validation - in a plot to absolve themselves of guilt and justify their importance. In this vision of the apocalypse, <a href="http://en.wikipedia.org/wiki/Babylon_(New_Testament)" target="_blank">Babylon</a> is inhabited by the users of metrics, not their marketers or makers.

---------


> "This is the way the world ends. Not with a bang but a whimper." - T.S. Elliot, <em> The Hollow Men </em>, 1925


While the <a href="http://mathbabe.org/2013/09/20/the-bursting-of-the-big-data-bubble/" target="_blank">big data bubble</a> has inflated quickly, it will not simply 'pop'.  So, instead of worrying about whether we're measuring the wrong things, or using the wrong tools or software, or falling behind the competition, let's take a deep breath, ignore the doomsayers, and do the best we can with what we have right now.  And, if after a while, that's still not working, then perhaps we should reassess precisely why, in what manner, and by whom we were convinced that analytics would solve our problems in the first place.

<br />
<br />
_Correction:
The original version of this essay contained the sentence, "When I glance at the Chartbeat dashboard looming above my desk, I see a list of the top five articles by pageviews on the New York Times’ site."  In fact, Chartbeat does not measure "pageviews", but "concurrent visitors."  Read more about it [here](http://support.chartbeat.com/customer/portal/articles/1249454-where-can-i-find-page-views-?b_id=226)._

