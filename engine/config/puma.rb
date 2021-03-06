#!/usr/bin/env puma

# app do |env|
#   puts env
#
#   body = 'Hello, World!'
#
#   [200, { 'Content-Type' => 'text/plain', 'Content-Length' => body.length.to_s }, [body]]
# end

environment 'production'
daemonize false

# stdout_redirect 'log/puma.log', 'log/puma_err.log'

workers 1

# quiet
threads 0, 16
bind 'unix:///var/run/puma.sock'  # nginx will proxy to this socket

# ssl_bind '127.0.0.1', '9292', { key: path_to_key, cert: path_to_cert }

# on_restart do
#   puts 'On restart...'
# end

# restart_command '/u/app/lolcat/bin/restart_puma'


# === Cluster mode ===

# workers 2

# on_worker_boot do
#   puts 'On worker boot...'
# end

# === Puma control rack application ===

activate_control_app 'unix:///var/run/pumactl.sock'
