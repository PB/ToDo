web: bundle exec thin start -p $PORT -e $RACK_ENV
worker: bundle exec thin -R socky/config.ru -p $PORT start