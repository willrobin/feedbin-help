---
layout: post
title: How to Subscribe
category: feed-management
---

There are several ways to add feeds to Feedbin.

OPML Import
-----------

If you're coming to Feedbin from another RSS reader, chances are that reader allows you to export a list of your subscriptions in a format called OPML. Feedbin can read OPML files to enable you to quickly import all of your subscriptions.

You can access the import page under [Settings -> Import/Export](https://feedbin.me/settings/import_export)

Subscribe Form
--------------

The main Feedbin interface includes a button to subscribe. You can enter either the URL of the website i.e. http://blog.feedbin.me OR the URL of the feed i.e. http://blog.feedbin.me/atom.xml.

The full URL to the feed is required if the website does not link to its RSS feed in a way that Feedbin can find it.

URL
---

Feedbin supports a special URL you can use to subscribe to a feed. This is useful if you want to be able to programatically subscribe to a feed, for example through a bookmarklet.

The URL is:

`https://feedbin.me/?subscribe=%s`

The `%s` part is a placeholder where the url of the feed or website would go.