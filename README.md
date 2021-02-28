[![Build Status](https://www.travis-ci.com/ericminio/yose-rails-react.svg?branch=master)](https://www.travis-ci.com/ericminio/yose-rails-react)

````
docker-compose up -d yosethegame
docker-compose run --rm --service-ports ruby
ruby yose/lib/start.rb
````

- open http://localhost:5000
- create player
- play with server http://host.docker.internal:5001
