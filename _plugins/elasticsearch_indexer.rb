require 'tire'
require 'sanitize'
require 'redcarpet'

module Jekyll
  class ElasticsearchIndexer < Generator
    safe true

    def generate(site)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      Tire::Configuration.url(site.config['search_server'])
      Tire.index site.config['search_index'] do
        delete
        create mappings: {
          post: {
            properties: {
              title: { type: 'string', boost: 2.0, analyzer: 'snowball'  },
              description: { type: 'string', analyzer: 'snowball'},
              content: { type: 'string', analyzer: 'snowball'},
              category: { type: 'string', analyzer: 'keyword' },
              url: { type: 'string'}
            }
          }
        }

        site.posts.each do |post|
          store type: 'post',
          title: post.data['title'],
          description: post.data['description'],
          content: Sanitize.clean(markdown.render(post.content)),
          category: post.categories,
          url: post.url
        end

      end
    end
  end
end