web: bundle exec thin start -p $PORT -e $RACK_ENV
ws: bundle exec thin -R socky/config.ru -p $PORT start