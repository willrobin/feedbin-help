set :application, 'feedbin-help'
set :repo_url, 'git@github.com:feedbin/feedbin-help.git'

set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/srv/apps/feedbin-help'
set :scm, :git

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      %x(rm -rf _site/* && bundle exec jekyll build)
    end
  end

  after :finishing, 'deploy:cleanup'

end
