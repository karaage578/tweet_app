web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -C config/sidekiq.yml
worker: sudo docker run --name redis -d -p 6379:6379 redis redis-server --appendonly yes
