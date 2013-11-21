if (window.feedbin == null) {
  window.feedbin = {};
}

$.extend(feedbin, {
  query: function (query) {
    return {
      query: {
        query_string: {
          query: query
        }
      },
      highlight: {
        fields: {
          content: {fragment_size: 150, number_of_fragments: 1}
        }
      }
    }
  },
  updateSearch: function (query) {
    window.history.pushState({}, '', '/search/?' + $.param({query: query}))
    $('[type=search]').val(query);
  },
  search: function(query) {
    var query = feedbin.query(query);
    jQuery.ajax({
      url: 'http://localhost:9200/_search',
      type: 'POST',
      dataType: 'json',
      contentType: 'application/json; charset=utf-8',
      data: JSON.stringify(query),
    }).then(function(results) {
      var results = results.hits.hits.map(function(result) {
        var description = result._source.description;
        if ('highlight' in result) {
          description = result.highlight.content[0]
        }
        result._source.description = description;
        return result._source;
      });
      var context = {results: results}
      feedbin.html = feedbin.template(context);
      $("[data-behavior~=search_results_target]").html(feedbin.html);
    });
  },
  queryString: function(name) {
    var regex, regexS, results;
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    regexS = "[\\?&]" + name + "=([^&#]*)";
    regex = new RegExp(regexS);
    results = regex.exec(window.location.search);
    if (results != null) {
      return decodeURIComponent(results[1].replace(/\+/g, " "));
    } else {
      return null;
    }
  }
});

$.extend(feedbin, {
  init: {
    searchTemplate: function() {
      if ($("[data-template=search_results]").length > 0) {
        var templateSource = $("[data-template=search_results]").html();
        feedbin.template = Handlebars.compile(templateSource);
      }
    },
    search: function() {
      query = feedbin.queryString('query');
      if (query != null) {
        feedbin.search(query);
        feedbin.updateSearch(query);
      }
    }
  }
});

$(function() {
  return $.each(feedbin.init, function(i, item) {
    return item();
  });
});

