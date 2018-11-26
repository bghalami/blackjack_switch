# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.4.1
* Rails version - 5.1.6

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ENDPOINTS!!!
POST /api/v1/users - Create a user
GET  /api/v1/users/:id - Get user info
POST /api/v1/games/:game_id/deal - deal a new game for the user by api-key
GET  /api/v1/games/:game_id/current_hand - seeing current hand of game
POST /api/v1/games/:game_id/current_hand/moves - post a move to the current hand
POST /api/v1/games - create a new game
GET  /api/v1/games/:id - see a game by id
POST /api/v1/login - login with username and password
