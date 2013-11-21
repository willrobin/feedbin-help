require 'tire'
require 'sanitize'

module Jekyll
  class ElasticsearchIndexer < Generator
    safe true

    def generate(site)
      Tire::Configuration.url(site.config['search_server'])
      Tire.index site.config['search_index'] do
        delete
        create mappings: {
          post: {
            properties: {
              title: { type: 'string', boost: 2.0, analyzer: 'snowball'  },
              category: { type: 'string', analyzer: 'keyword' },
              content: { type: 'string', analyzer: 'snowball'}
            }
          }
        }

        site.posts.each do |post|
          store type: 'post',
          title: post.data['title'],
          content: Sanitize.clean(post.content),
          category: post.categories
        end

      end
    end
  end
end