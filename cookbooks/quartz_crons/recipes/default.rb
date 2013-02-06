if ['app_master', 'app', 'solo'].include?(node[:instance_role])
  cron "quarz_api_check" do
    minute '0,30'
    user node[:owner_name]
    command "cd /data/quartz_health_check_blue/current && RAILS_ENV=#{node[:environment][:framework_env]} bundle exec rake check_quartz_api"
  end
end