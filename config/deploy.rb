set :rbenv_type, :system
set :rbenv_ruby, '2.0.0-p247'

set :application, 'feedbin-help'
set :repo_url, 'git@github.com:feedbin/feedbin-help.git'

set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/srv/apps/feedbin-help'
set :scm, :git

namespace :deploy do

  desc 'jekyll build'
  task :jekyll_build do
    on roles(:app) do
      execute "cd #{release_path} && /usr/local/rbenv/shims/bundle exec jekyll build --quiet"
    end
  end

  after :updated, 'deploy:jekyll_build'
end
