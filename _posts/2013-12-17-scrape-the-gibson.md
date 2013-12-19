---
layout: post
title: "Scrape the Gibson: Python skills for data scrapers"
description: "I used to scrape data stupidly. @pudo taught me better."
author: Brian Abelson
email: brianabelson@gmail.com
category: open-news
---
_Most of the code in this post is based on [a workshop](https://github.com/pudo/hhba-scraping) my fellow ex-OpenNews fellow [@pudo](http://www.twitter.com/pudo) gave at [Hacks Hackers Buenos Aires Media Party](http://www.mediaparty.info)._

<br/>

Two years ago, I learned I had superpowers. [Steve Romalewski](http://www.twitter.com/spatiality) was working on some [fascinating](http://spatialityblog.com/2011/09/29/spatial-analysis-of-nyc-bikeshare-maps/) [analyses](http://spatialityblog.com/2012/05/14/citibikenyc_firstlastmile_quantified/) of CitiBike locations and needed some help scraping information from the city's data portal.  Cobbling together the little I knew about `R`, I wrote [a simple scraper](https://gist.github.com/abelsonlive/2690803) to fetch the json files for each bike share location and output it as a csv. When I opened the clean data in Excel, the feeling was tantamount to this scene from _Hackers_:

<br/>

<iframe width="640" height="360" src="//www.youtube.com/embed/vYNnPx8fZBs">
</iframe>

<br/>
<br/>

Ever since then I've spent a good portion of my life scraping data from websites.  From [movies](http://www.imdb.com/), to [bird sounds](http://macaulaylibrary.org/), to [missed connections](http://newyork.craigslist.org/mis/index.html), and [john boards](http://eccie.net) (don't ask, I promise it's for good!), there's not much I haven't tried to scrape.  In many cases, I dont't even analyze the data I've obtained, and the whole process amounts to a nerdy version of sport hunting, with my comma-delimited trophies mounted proudly on Amazon S3.

<br/>

In this time, I've learned a lot about what not to do when scraping websites.  This trial-and-error process has involved, among other fiascos, having my office's IP address permanently banned from IMDB.  At one point, I got so frustrated with `R`'s error handling that I just wrote [my own library](https://github.com/abelsonlive/scraply) to do it.  In the past year, however, I've started using `python` for scraping, and have learned a tremendous amount from my fellow ex-OpenNews Fellow [Friedrich Lindenberg](http://twitter.com/pudo).  In this post I hope to share some of this knowledge.

<br/>

## Basics

There are many amazing libraries for parsing HTML in python  –  [pyquery](https://github.com/gawel/pyquery), [scrapy](http://scrapy.org/), and [cssselect](http://pythonhosted.org/cssselect/) to name a few  –  but I've always preferred [BeautifulSoup](http://www.crummy.com/software/BeautifulSoup/bs4/doc/) for it's deceptive simplicity. Below, we'll walk through a simple example of scraping missed connections from CraigsList.  As I further develop and refine this code, I'll introduce some best practices I've learned from [@pudo](http://twitter.com/pudo).

<br/>

Let's go through a simple example of retrieving missed connections from craigslist. To run the code on your computer you'll need to have four python modules installed: requests, BeautifulSoup, dataset, and thready.  To install these, you can run this command in your terminal:

{% highlight bash %}
sudo pip install beautifulsoup4 requests dataset thready
{% endhighlight %}

If this returns and error, try installing pip and running the command again:

{% highlight bash %}
sudo easy_install pip
sudo pip install beautifulsoup4 requests dataset thready
{% endhighlight %}

If everything works you should be able to open a python terminal and import the libraries with no errors:

<br/>

{% highlight pycon %}
python
>>> import requests
>>> from bs4 import BeautifulSoup
>>> import dataset
>>> from thready import thereaded
{% endhighlight %}

<br/>

Alright, now that we're ready to get started, let's walk through a basic scraper for CraigsList missed connections. In the code snippet below I add detailed comments that explain what I'm doing for each line. You can follow along with each of these scripts on [this github repository](https://github.com/abelsonlive/scrape-the-gibson).

<br/>
#### 00-basics.py
{% highlight python %}
import requests
from bs4 import BeautifulSoup
from pprint import pprint
from urlparse import urljoin

# The base url for craigslist in New York
BASE_URL = 'http://newyork.craigslist.org/'

def scrape_missed_connections():
    """ Scrape all the missed connections from a list """
    
    # Download the list of missed connections

    # here were using requests, 
    # a python library for accessing the web

    # we add "mis/" to the url to tell requests
    # to get the missed connections 
    # on newyork.craigslist.org

    response = requests.get(BASE_URL + "mis/")

    # parse HTML using Beautiful Soup
    # this returns a `soup` object which
    # gives us convenience methods for parsing html

    soup = BeautifulSoup(response.content)

    # find all the posts in the page.

    # here we're telling BeautifulSoup to get us every
    # span tag that has a class that equals pl

    # these tags might look something like this:
    # <span class='pl'> {content} </span>

    missed_connections = soup.find_all('span', {'class':'pl'})

    # Get all the links to missed connection pages:
    for missed_connection in missed_connections:
        
        # for each span list, find the "a" tag which 
        # represents the link to the missed connection page.

        link = missed_connection.find('a').attrs['href']
        
        # join this relative link with the 
        # BASE_URL to create an absolute link

        url = urljoin(BASE_URL, link)
        
        # pass this url to a function (defined below) to scrape 
        # info about that missed connection

        scrape_missed_connection(url)

def scrape_missed_connection(url):
    """ Extract information from a missed connections's page. """

    # retrieve the missed connection with requests

    response = requests.get(url)

    # Parse the html of the missed connection post

    soup = BeautifulSoup(response.content)

    # Extract the actual contents of some HTML elements:

    # here were using BeautifulSoup's `text` method for retrieving
    # the plain text within each HTML element.

    # see and example of what this page looks like here:

    data = {
        'source_url': url,
        'subject': soup.find('h2', {'class':'postingtitle'}).text.strip(),
        'body': soup.find('section', {'id':'postingbody'}).text.strip(),
        'datetime': soup.find('time').attrs['datetime']
    }

    # Print it prettily. 
    pprint(data)

if __name__ == '__main__':
    scrape_missed_connections()

{% endhighlight %}

<br/>

If all goes well you should see a series of python dictionaries printed to your console:

{% highlight pycon %}
{
    'body': 'I saw you on your way home from work last night. I hoped to see you on the way to work this morning, and I did. Actually, I usually see you on the way to work. I wanted to say hello this morning, and I stupidly smiled at you wanting you to smile back. You looked at me in acknowledgement but that seemed about it. I will have to talk to you the next time I see you and tell you how cute you look in that hat you were wearing.',
    'datetime': '2013-12-18T10:50:29-0500',
    'source_url': 'http://newyork.craigslist.org/brk/mis/4249329594.html',
    'subject': 'A train to work this morning - m4w'
}
{% endhighlight %}

<br/>

## Databases

We could stop here and probably be fine, but it's usually a better idea to save the data you scrape into a database. This way, if the script breaks midway through execution, we can retain the information we scraped up until that point.  In addition, by using a database, we can also quickly construct an API or app on top of the data we scrape. Luckily, [@pudo](http://www.twitter.com/) wrote an amazing python library called [dataset](http://dataset.readthedocs.org) that makes writing to a database as easy as writing json to a file.  To incorporate it into our script, we only need to change three lines:

<br/>

#### [01-dataset.py](https://github.com/abelsonlive/scrape-the-gibson/blob/master/01-dataset.py)
{% highlight python %}
import dataset

# connect to a database

# here we're just going to use sqlite3 which is a lightweight
# SQL store, ideal for most simple scraping jobs.  However, we could
# easily use MySQL or PostgreSQL by simply swapping out the path
# to the database:

db = dataset.connect('sqlite:///missed_connections.db')

...

# now instead of simply printing our data to the console,
# lets put it into our database

# here db['posts'] signifies that we are going to insert data
# into the 'posts' table of the database. We'll use "upsert"
# instead of "insert" because we'll probably want to run the
# scraper a few times to test it, and this way we won't continually
# add duplicate records to our database.

db['posts'].upsert(data, ['source_url'])

{% endhighlight %}

Putting it all together, our new script should look something like [this](https://github.com/abelsonlive/scrape-the-gibson/blob/master/01-dataset.py).

<br/>

## Caching 

One of the most common scraping problems is realizing your script is buggy midway through execution and having to start over from scratch. This isn't too big of a problem if you're scraping a few pages, but if you're trying to pull in everything from IMDB or CraigsList, you'll slowly drive yourself insane when, three hours into a big job, you realize you forgot to grab an important piece of data. One easy way to deal with this problem is to cache the html files that you're scraping (in other words, save them to a local file).

<br/>

To implement this, we need to write a function that checks whether we've already saved a local version of the page already and, if so, load the cached version rather than hitting the site's server again. If not, we'll proceed as normal and request the page from the site's server and then save a version of it locally:

<br/>

#### 02-caching.py
{% highlight python %}
import os
from hashlib import sha1


# a directory for caching file's we've already downloaded
CACHE_DIR = os.path.join(os.path.dirname(__file__), 'cache')

def url_to_filename(url):
    """ Make a URL into a file name, using SHA1 hashes. """

    # use a sha1 hash to convert the url into a unique filename
    hash_file = sha1(url).hexdigest() + '.html'
    return os.path.join(CACHE_DIR, hash_file)


def store_local(url, content):
    """ Save a local copy of the file. """

    # If the cache directory does not exist, make one.
    if not os.path.isdir(CACHE_DIR):
        os.makedirs(CACHE_DIR)

    # Save to disk.
    local_path = url_to_filename(url)
    with open(local_path, 'wb') as f:
        f.write(content)


def load_local(url):
    """ Read a local copy of a URL. """
    local_path = url_to_filename(url)
    if not os.path.exists(local_path):
        return None

    with open(local_path, 'rb') as f:
        return f.read()


def get_content(url):
    """ Wrap requests.get() """
    content = load_local(url)
    if content is None:
        response = requests.get(url)
        content = response.content
        store_local(url, content)
    return content

{% endhighlight %}

<br/>

Now, everytime we request a new missed connection, we should use our `get_content` function instead of `requests.get()`.  Merging this code in, our script should now look [this](https://github.com/abelsonlive/scrape-the-gibson/blob/master/02-caching.py).

<br/>

## Multithreading

Up to this point, our script has only been capable of downloading a single missed connection at a time.  It turns out that a single processor is capable of executing multiple tasks at a time via a process that's called "[multithreading](http://en.wikipedia.org/wiki/Multithreading_(computer_architecture))." This is different than [parallel processing](http://en.wikipedia.org/wiki/Parallel_processing) where a set of tasks are executed across across a series of networked computers.  In the case of our task  –  scraping multiple missed connections  –  this means that instead of simply looping through the list of each missed connection, that we'll first detect all the urls to the missed connection pages and then downloading and parse these pages across multiple threads.  It turns out that, once again, [@pudo](http://twitter.com/pudo) has solved this problem for us.  With a simple module he wrote named [thready](https://github.com/pudo/thready), we can pass this list of urls to our function that scrapes each missed connection and very quickly and easily increase the speed with which we parse all the pages.  This is implemented by modifying our `scrape_missed_connections` function as follows:

<br/>

#### 03-multithreading.py
{% highlight python %}
from thready import threaded

...

def scrape_missed_connections():
    """ Scrape all the missed connections from a list """

    response = requests.get(BASE_URL + "mis/")
    soup = BeautifulSoup(response.content)
    missed_connections = soup.find_all('span', {'class':'pl'})

    # create an empty list of urls to scrape 
    urls = []
    for missed_connection in missed_connections:

        link = missed_connection.find('a').attrs['href']
        url = urljoin(BASE_URL, link)
        
        # iteratively populate this list 
        urls.append(url)


    # download and parse these missed connections using
    # multiple threads
    threaded(urls, scrape_missed_connection, num_threads=10)

{% endhighlight %}

<br/>


Now when we execute [this script](https://github.com/abelsonlive/scrape-the-gibson/blob/master/03-multithreading.py), it should run much, much faster than our previous scripts.  Be warned, however, many sites do not appreciate you requesting multiple pages at once and may ban you from the site for throttling their servers.  Make sure to excercise caution and be respectful when utilizing multiple threads to scrape a site.

<br/>

With these three simple skills, you should be able to start scraping the web like a true hacker. Enjoy!


