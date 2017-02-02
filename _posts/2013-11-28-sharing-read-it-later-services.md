---
layout: post
title: Sharing/Read-it-later Services
category: using-feedbin
description: Overview of how to configure sharing and read it later services.
---

There are a lot of sharing (i.e. Twitter and Facebook) and read-it-later services (Instapaper, Readability and Pocket). Chances are your favorites support sharing through a special URL.

For example to share something on <a href="https://app.net">App.net</a>, you can craft a URL like this and your post will be populated with the info you pass in:

<pre><code>https://alpha.app.net/intent/post?text=<span class="label label-info">${title}</span>+<span class="label label-info">${url}</span></code></pre>

You can add the sharing services you want to use on the [Sharing page](https://feedbin.com/settings/sharing) under Settings.

<p>Available tokens:</p>

<table class="table table-bordered">
  <tr>
    <th>Token</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>${title}</code></td>
    <td>The entry title</td>
  </tr>
  <tr>
    <td><code>${url}</code></td>
    <td>The entry URL</td>
  </tr>
  <tr>
    <td><code>${source}</code></td>
    <td>The feed name</td>
  </tr>
</table>

List of URLs
------------

| Label                 | URL                                                                                |
|-----------------------|------------------------------------------------------------------------------------|
| App.net               | `https://alpha.app.net/intent/post?text=${title}+${url}`                           |
| Bookie                | `https://bmark.us/{USERNAME}/new?description=${title}&url=${url}`                  |
| Buffer                | `http://bufferapp.com/add?url=${url}&text=${title}`                                |
| Delicious             | `https://delicious.com/save?&url=${url}&title=${title}`                            |
| Douban                | `http://www.douban.com/recommend/?url=${url}&title=${title}`                       |
| Drafts                | `drafts://x-callback-url/create?text=${title}+${url}`                              |
| Email                 | `mailto:?subject=${title}&body=${url}`                                             |
| Evernote              | `https://www.evernote.com/clip.action?url=${url}&title=${title}`                   |
| Facebook              | `http://www.facebook.com/sharer.php?u=${url}&t=${title}`                           |
| Flipboard             | `https://share.flipboard.com/bookmarklet/popout?v=2&title=${title}&url=${url}`     |
| Gmail for iOS         | `googlegmail:///co?subject=${title}&body=${url}`                                   |
| Gmail Webmail         | `https://mail.google.com/mail/?view=cm&su=${title}&body=${url}`                    |
| Google+               | `https://plus.google.com/share?url=${url}`                                         |
| Huffduffer            | `http://huffduffer.com/add?popup=true&page=${url}`                                 |
| Instapaper            | `http://www.instapaper.com/hello2?url=${url}&title=${title}`                       |
| Instapaper Text       | `http://www.instapaper.com/text?u=${url}`                                          |
| Kippt                 | `https://kippt.com/extensions/new/?url=${url}&title=${title}`                      |
| LinkedIn              | `http://www.linkedin.com/shareArticle?title=${title}&url=${url}`                   |
| LinkyWink             | `http://linkywink.com/winkit/?url=${url}&title=${title}`                           |
| Omnifocus             | `omnifocus:///add?name=${title}&note=${url}`                                       |
| Pinboard              | `https://pinboard.in/add?next=same&url=${url}&description=${title}&title=${title}` |
| Pinboard (read later) | `https://pinboard.in/add?later=yes&url=${url}&title=${title}&description=${title}` |
| Pinner                | `pinner://bookmark?href=${url}&title=${title}&shared=0&toread=1`                   |
| Pinterest             | `http://pinterest.com/pin/find/?url=${url}`                                        |
| Plurk                 | `http://www.plurk.com/m?content=${url}+(${title})&qualifier=shares`                |
| Pocket                | `https://getpocket.com/save?url=${url}&title=${title}`                             |
| Pocket for iOS        | `pocket://add?url=${url}`                                                          |
| Quitter               | `http://quitter.se/?action=newnotice&status_textarea=${title}${url}`               |
| Readability           | `https://www.readability.com/save?url=${url}`                                      |
| Reddit                | `https://www.reddit.com/submit?title=${title}&url=${url}`                          |
| Spillo                | `spillo:///bookmark?url=${url}&title=${title}`                                     |
| The List              | `http://thelist.io/posts/new?u=${url}&t=${title}`                                  |
| Things                | `things:add?title=${title}&notes=${url}`                                           |
| Todoist               | `https://todoist.com/API/addItem?content=${url}+(${title})+(via:+${source})&project_id={PROJECTID}&priority=1&token={APIKEY}` |
| Tumblr                | `http://www.tumblr.com/share?v=3&u=${url}&t=${title}`                              |
| Tweetbot              | `tweetbot:///post?text=${title}%20${url}`                                          |
| Twitter               | `https://twitter.com/intent/tweet?url=${url}&text=${title}`                        |
| Twitter for Mac/iOS   | `twitter://post?message=${title}%20${url}`                                         |
| Twitterrific          | `twitterrific:///post?message=${title}%20${url}`                                   |
| Weibo                 | `http://service.weibo.com/share/share.php?url=${url}&title=${title}`               |
| WordPress             | `https://your-wordpress-site.tld/wp-admin/press-this.php?u=${url}`                 |
| Fastmail              | `https://www.fastmail.fm/action/compose/?to=&subject=${title}&body=${url}`         |
