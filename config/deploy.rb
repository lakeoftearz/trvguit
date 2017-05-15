# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "trvguit"
set :repo_url, "https://github.com/lakeoftearz/trvguit"
set :deploy_to, "/home/andrea/webapps/trvguit"

# database settings
set :pg_user, 'trvguit_db_admin'
set :pg_user_ask_for_password, true
set :pg_system_user, 'pgsql'
set :pg_host, ''
set :pg_no_sudo, true

set :bundle_env_variables, {
  nokogiri_use_system_libraries: 1
}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files,
"config/database.yml"

# Default value for linked_dirs is []
append :linked_dirs,
  "log",
  "tmp/pids",
  "tmp/cache",
  "tmp/sockets",
  "public/system",
  "public/uploads"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5