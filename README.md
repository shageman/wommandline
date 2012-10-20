# Wommandline [![Build Status](https://secure.travis-ci.org/shageman/wommandline.png)](https://secure.travis-ci.org/shageman/wommandline)[![Dependency Status](https://gemnasium.com/shageman/wommandline.png)](https://gemnasium.com/shageman/wommandline)
Wommandline is your commandline for the Web. And it is simple. As simple as I could make it. Currently, it initiates searches on various websites I regularly use.

I have long used [YubNub](http://yubnub.org) for searching specific websites directly, but found that some commands that I like don't have the right shortcode and well, I had two free hours on my hand.

## Make your own
Running your own version of wommandline is really simple and involves only a few simple steps.

* Fork this project
* Clone the source code
* Edit `search_engine_query.rb` to contain your own commands
* Commit your changes
* Create an heroku application and push to heroku
* After your push heroku will tell you where your application was deployed

## Registering wommandline in your browser
After you have installed it, you can open its URL in the browser to get to your commandline. Additionally, you can register wommandline directly in your browser.

### Firefox
You can change how the URL bar works like so to make wommandline the default search engine:

* Point the browser URL to `about:config`
* Set `keyword.URL` value to `http://YOUR_SERVER.heroku.com/?q=`

### Chrome
You can easily manage Chrome's search engines:

* Open the preferences
* Click on "Manage Search Engines"
* Add a new search engine (at the bottom of "Other search engine") with the URL of `http://YOUR_SERVER.heroku.com/?q=%s`
* Give the wommandline search engine a keyword (like "w") or make it the default

## Test
Run `rake` to test any changes you make to the code.

## License

    Copyright (c) 2012 Stephan Hagemann
    twitter.com/shageman
    %w(stephan.hagemann gmail.com) * "@" || %w(threegreenwedges gmail.com) * "@"
    
    Released under the MIT license. See LICENSE file for details.
