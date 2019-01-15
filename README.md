# BlackJack Switch
[![Maintainability](https://api.codeclimate.com/v1/badges/ce26a90de66447d326d9/maintainability)](https://codeclimate.com/github/bghalami/blackjack_switch/maintainability)

#### Created By Ben Ghalami

This is the back end API that has all the logic needed for creating a front end for the game Black Jack Switch

You can use the app in production on [Heroku](https://bens-blackjack-switch.herokuapp.com/).

## Endpoints
#### API-KEY
  To obtain an API-KEY you simply need to create an account. Your key will be sent back in a JSON response.  
***

```
{
POST /api/v1/users - Create a user
  - need 'username' and 'password'.  

GET  /api/v1/users/:id 
  - Get user info

POST /api/v1/games/:game_id/deal  
  - deal a new game for the user by api-key
  - need to provide 'bet' and 'api_key'.  

* GET  /api/v1/games/:game_id/current_hand 
  - seeing current hand of game

* POST /api/v1/games/:game_id/current_hand/moves 
  - post a move to the current hand
  - need to provide the param 'move' with 'switch', 'hit', or 'stay'.  

* POST /api/v1/games 
  - create a new game
  - need to provide 'api_key'.  

* GET  /api/v1/games/:id 
  - see a game by id

* POST /api/v1/login 
  - login with username and password
  - need to provide 'username' and 'password'. 
}
```

## Contributing

If you would like to contribute, you can follow the steps in the next two sections to get running on your machine.

## Initial Setup
* Ruby version - 2.4.1
* Rails version - 5.1.6

* The following will be done in the terminal

1. Clone the repository and rename the repository to anything you'd like in one command:
  ```
  git clone git@github.com:bghalami/blackjack_switch.git
  ```
2. Change into the new directory

3. Install the dependencies:
  ```
  bundle
  ```
  
4. Create the database:
  ```
  rake db:{create,migrate}
  ```
  
5. Run server
  ```
  rails server
  ```
6. Visit "localhost:3000" in your browser to visit your app!
  

## Running the Tests

1. Run through steps 1 - 4 from "Initial Setup"

2. Run ```rspec``` in the terminal

3. Bask in the test results!


## Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [VCR](https://github.com/vcr/vcr)
* [Ruby on Rails](https://rubyonrails.org/)
* [RSpec](http://rspec.info/)
* [Faraday](https://github.com/lostisland/faraday)
* [PostgreSQL](https://www.postgresql.org/)


## External API's  
  [I consume the deck of cards API for this project](https://deckofcardsapi.com/)
