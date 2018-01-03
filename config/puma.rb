if ENV['RACK_ENV'] != 'production' || ENV['RAILS_ENV'] != 'production'
  workers Integer(ENV['PUMA_WORKERS'] || 4)
end

threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 16)

rackup      DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'
preload_app!

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    config['pool'] = ENV['MAX_THREADS'] || 16
    ActiveRecord::Base.establish_connection(config)
  end
endif ENV['RACK_ENV'] != 'production' || ENV['RAILS_ENV'] != 'production'
workers Integer(ENV['PUMA_WORKERS'] || 4)
end

threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 16)

rackup      DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'
preload_app!

on_worker_boot do
# worker specific setup
ActiveSupport.on_load(:active_record) do
  config = ActiveRecord::Base.configurations[Rails.env] ||
              Rails.application.config.database_configuration[Rails.env]
  config['pool'] = ENV['MAX_THREADS'] || 16
  ActiveRecord::Base.establish_connection(config)
end
end