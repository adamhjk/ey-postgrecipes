action :create do
  execute "create-db-#{new_resource.name}" do
    command "`psql -c '\\l' | grep -q '#{new_resource.name}'`; if [ $? -eq 1 ]; then\n createdb #{new_resource.name}\nfi"
    action :run
    user 'postgres'
  end
end

action :delete do
end

