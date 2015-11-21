web: bundle exec thin start -p $PORT -e $RACK_ENV
worker: bundle exec thin -R socky/config.ru -p3001 start