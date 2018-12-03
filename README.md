# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.4.1
* Rails version - 5.1.6

* Database - PostgreSQL

### Let's run some tests
 If you want to run my tests, it's as simple as downloading the correct Ruby and Rails versions.  
 Also you need bundler.  
 Then all you need to do is clone down the repo, open your terminal and run 'bundle', rake db:migrate, then run 'rspec'.  

## Deployment instructions
 It's essentially the same as testing, but instead of running rspec you'll run 'rails server' in your terminal.
 Open up the local server and database to your hearts content.  

## ENDPOINTS!!!
#### API-KEY
  To obtain an API-KEY you simply need to create an account. Your key will be sent back in a JSON response.  
  
* POST /api/v1/users - Create a user
  need 'username' and 'password'.  

* GET  /api/v1/users/:id - Get user info

* POST /api/v1/games/:game_id/deal - deal a new game for the user by api-key
 need to provide 'bet' and 'api_key'.  

* GET  /api/v1/games/:game_id/current_hand - seeing current hand of game

* POST /api/v1/games/:game_id/current_hand/moves - post a move to the current hand
 need to provide the param 'move' with 'switch', 'hit', or 'stay'.  

* POST /api/v1/games - create a new game
 need to provide 'api_key'.  

* GET  /api/v1/games/:id - see a game by id

* POST /api/v1/login - login with username and password
 need to provide 'username' and 'password'.  
