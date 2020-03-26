# frozen_string_literal: true

set :branch, 'master'
set :server_ip, '13.233.118.114'

set :nginx_server_name, "api.covid-19.clicksandbox.com #{fetch(:application)}.local"

server fetch(:server_ip), user: 'ubuntu', roles: %w[web app db]
