require 'rvm/capistrano'
#require 'bundler/capistrano'
load 'deploy/assets'

set :application, 'lipetsk'
set :deploy_server, 'invest@195.34.235.94'
set :repository, 'git@bitbucket.org:mystand/lipetsk-admin.git'
set :branch, 'master'

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user
set :user, 'invest'
set :deploy_to, '/home/invest/repository/admin'
set :scm, :git
set :use_sudo, false

#default_run_options[:pty] = true

role :web, "#{deploy_server}" # Your HTTP server, Apache/etc
role :app, "#{deploy_server}" # This may be the same as your `Web` server
role :db, "#{deploy_server}", :primary => true # This is where Rails migrations will run

set :bundle_dir, ''
set :rails_env, 'production'
set :unicorn_binary, 'unicorn'
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

after 'deploy:create_symlink', :roles => :app do
  run "rm -f #{current_path}/public/uploads"
  run "ln -s #{deploy_to}/shared/uploads #{current_path}/public/uploads"

  run "rm -f #{current_path}/log"
  run "ln -s #{deploy_to}/shared/log #{current_path}/log"

  run "rm -f #{current_path}/config/database.yml"
  run "ln -s #{deploy_to}/shared/config/database.yml #{current_path}/config/database.yml"

  #run "rm -f #{current_path}/config/config.yml"
  #run "ln -s #{deploy_to}/shared/config/config.yml #{current_path}/config/config.yml"

  run "rm -f #{current_path}/config/unicorn.rb"
  run "ln -s #{deploy_to}/shared/config/unicorn.rb #{current_path}/config/unicorn.rb"
end

after "deploy:update_code", "deploy:migrate"
after "deploy:migrate", "deploy:seed"
#after "deploy:migrate", "deploy:pf"

before "deploy:assets:precompile", "deploy:create_symlink"


desc 'copy ckeditor nondigest assets'
task :copy_nondigest_assets, roles: :app do
  run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} ckeditor:copy_nondigest_assets"
end
after 'deploy:assets:precompile', 'copy_nondigest_assets'



namespace :deploy do
  task :start, :roles => :app, :except => {:no_release => true} do
    run "cd #{current_path} && bundle exec #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end
  task :stop, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end
  task :graceful_stop, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end
  task :reload, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end

  task :restart, :roles => :app, :except => {:no_release => true} do
    stop
    start
  end
  task :seed, :roles => :app do
    run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end

  task :fix_ckeditor, :roles => :app do
    run "cd #{current_path} && bundle exec rake assets:fix_ckeditor RAILS_ENV=#{rails_env}"
  end
  #task :pf, :roles => :app do
  #  run "cd #{current_path} && bundle exec rake pf:init RAILS_ENV=#{rails_env}"
  #end
end
