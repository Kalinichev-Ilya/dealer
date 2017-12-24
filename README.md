###run:
```
redis-server &
bundle exec sidekiq
rails c
BillingWorker.perform_async('stock exchange url')
```
