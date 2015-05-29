---
layout: post
title: Search Syntax
category: search
description: Search syntax guide.
---

Feedbin supports an advanced search syntax.

Exact Match
-----------

To search for an exact match surround the search in quotes like: `"john smith"`

Boolean Operations
------------------

**AND**

By default, all terms are required for matching results. A search for `lorem ipsum` will find any document that contains `lorem and ipsum`.

**OR**

Matches long as one term is present in the article. A search for `lorem ipsum` will find any document that contains one or more of `lorem or ipsum`.


**NOT**

If you want to exclude terms you can use `NOT` this will match any document as long is it does not contain the excluded term. For example `lorem NOT ipsum` would find articles that contain `lorem` so long as they did not also contain `ipsum`

Filters
-------

**Starred Status**

You can search only your [starred items](XX) using `is:starred`. You can search only items that have not been starred with `is:unstarred`.

**Read Status**

You can search only your [unread items](XX) using `is:unread`. You can also search only your read items using `is:read`.

Search Order
------------

By default Feedbin search results are returned in order of relevance. However it is possible to set a different search order. To sort by date you can use `sort:desc` to sort results newest first or `sort:asc` to sort results oldest first.

Fields
------

You can restrict searches to certain fields as well. For example if you want to only search article titles you can use `title:(search terms)`, `title:(search OR term)` or `title:"search terms"` for an exact match. The fields you can specify are:

- title
- body
- author

Feeds and Tags
--------------

You can limit the scope of a search to specific feeds or tags by using the `feed_id` and `tag_id` fields for example `lorem feed_id:123` or `ipsum tag_id:3`.