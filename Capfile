load 'deploy'
# Uncomment if you are using Rails' asset pipeline

# Should be commented out during deploy:cold !!!
load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy' # remove this line to skip loading any of the default tasks
