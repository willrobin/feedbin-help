$stdout.sync = true
require 'logger'
require 'tire'
require 'sanitize'

module Jekyll
  class ElasticsearchIndexer < Generator
    safe true

    def log
      @log ||= Logger.new(File.expand_path(File.dirname(File.dirname(__FILE__))) + '/log/feedbin.log')
    end

    def generate(site)


      result = Tire::Configuration.url(site.config['search_server'])

      log.info(result.inspect)
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