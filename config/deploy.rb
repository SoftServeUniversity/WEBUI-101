require "bundler/capistrano" 
require "delayed/recipes" 
set :rails_env, "production" #added for delayed job  
server "198.211.126.95", :web, :app, :db, primary: true

set :application, "plastmuse" 
set :user, "plastmuse" 
set :deploy_to, "/home/#{user}/apps/#{application}" 
set :deploy_via, :remote_cache 
set :use_sudo, false
set :shared_children, shared_children + %w{public/uploads}

set :scm, "git" 
set :repository, "git@github.com:SoftServeUniversity/WEBUI-101.git" 
set :branch, "production"

default_run_options[:pty] = true 
ssh_options[:forward_agent] = true


after "deploy", "deploy:cleanup" # keep only the last 5 releases

# Delayed Job 
after "deploy:stop",    "delayed_job:stop" 
after "deploy:start",   "delayed_job:start" 
after "deploy:restart", "delayed_job:restart"

namespace :deploy do 
  namespace :assets do
      task :precompile, :roles => :web do
        from = source.next_revision(current_revision)
        if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
          run_locally("rake assets:clean && rake assets:precompile")
          run_locally "cd public && tar -jcf assets.tar.bz2 assets"
          top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
          run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
          run_locally "rm public/assets.tar.bz2"
          run_locally("rake assets:clean")
        else
          logger.info "Skipping asset precompilation because there were no asset changes"
        end
      end

      task :symlink, roles: :web do
        run ("rm -rf #{latest_release}/public/assets &&
              mkdir -p #{latest_release}/public &&
              mkdir -p #{shared_path}/assets &&
              ln -s #{shared_path}/assets #{latest_release}/public/assets")
      end
  end

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server" 
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}" 
    end
  end

  task :setup_config, roles: :app do 
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}" 
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}" 
    run "mkdir -p #{shared_path}/config" 
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml" 
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do 
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"
  desc "Make sure local git is in sync with remote." 
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master` 
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes." 
      exit
    end 
  end 
  before "deploy", "deploy:check_revision" 
  #rake seed task
  desc "Seed the database on already deployed code"
  task :seed, :only => {:primary => true}, :except => { :no_release => true } do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:seed"
  end

  #start delayed_job service
  #cap deploy:delayed_job
  desc "Seed the database on already deployed code"
  task :delayed_job, :only => {:primary => true}, :except => { :no_release => true } do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake jobs:work"
  end

  desc "Create production db"
  task :create, :only => {:primary => true}, :except => { :no_release => true } do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:create"
  end

  desc "Create production db"
  task :reset, :only => {:primary => true}, :except => { :no_release => true } do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:reset"
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:seed"
  end

  desc "Seed the database on already deployed code"
  task :drop, :only => {:primary => true}, :except => { :no_release => true } do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:drop:all"
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:create:all"
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake db:migrate"
  end
   
  #rails 4 only
  desc 'Copy nondigest ckeditor files to shared folder'
  task :copy_ckeditor, :only => {:primary => true}, :except => { :no_release => true }  do
    run "rm -r #{shared_path}/assets/ckeditor"
    run "cp -r #{current_path}/public/ckeditor #{shared_path}/assets"
    run "rm -r #{current_path}/public/ckeditor "
  end

end