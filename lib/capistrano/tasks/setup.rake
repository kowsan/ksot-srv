namespace :setup do

  desc "Upload database.yml file."
  task :upload_yml do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read("config/database.yml.example")), "#{shared_path}/config/database.yml"
    end
  end
  desc "upload unicorn cfg"
  task :upload_unicorn do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read("config/unicorn.rb.example")), "#{shared_path}/config/unicorn.rb"
    end
  end
  desc "Seed the database."
  task :seed_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end


  desc "Setup the database."
  task :setup_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:setup"
        end
      end
    end
  end


  desc "Setup init script "
  task :init_script do
    on roles(:app) do
      upload! StringIO.new(File.read("config/unicorn_ksot.sh")), "#{shared_path}/config/unicorn_ksot.sh"
      execute "chmod +x #{shared_path}/config/unicorn_ksot.sh"
      sudo "ln -s #{shared_path}/config/unicorn_ksot.sh /etc/init.d/unicorn_ksot"
    end
  end

  desc "Setup nginx"
  task :init_nginx do
    on roles(:app) do
      upload! StringIO.new(File.read("config/nginx.ksot")), "#{shared_path}/config/nginx.ksot"

      sudo "ln -snf #{shared_path}/config/nginx.ksot /etc/nginx/sites-enabled/ksot"
      sudo "service nginx restart"
    end
  end


# desc "Symlinks config files for Nginx and Unicorn."
# task :symlink_config do
#   on roles(:app) do
#     execute "rm -f /etc/nginx/sites-enabled/default"
#
#     execute "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
#     execute "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
#   end
end

