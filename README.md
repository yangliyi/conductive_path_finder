# README

* How to get the application up and running locally

`docker-compose build`

`docker-compose run web rails db:create db:migrate`

`docker-compose up -d`

* Instructions

1. After successfully starting the server, user shall see the page for evaluating grids.
2. User should type the input manually into the text box.

* What could be improved

1. Currently the algorithm for finding conductive paths has time conplexity O(n*n). It could be improved by other approach(e.g. dfs.)
2. More validation could be added(could be either frontend or backend or both) to stop the evaluation early when user type invalid input

