include_recipe "postgresql::server"
include_recipe "database::postgresql"

postgresql_connection_info = {:host => "localhost",
                              :port => node['postgresql']['config']['port'],
                              :username => 'postgres',
                              :password => node['postgresql']['password']['postgres']}

# Create role test, with password test and create db test owned by role test
postgresql_database_user 'sonar' do
  connection postgresql_connection_info
  password 'sonar'
  action :create
end

postgresql_database 'sonar' do
  connection postgresql_connection_info
  owner 'sonar'
  action :create
end