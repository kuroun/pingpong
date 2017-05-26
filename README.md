## Getting Started

1. Run `bundle`
2. Run `rake db:migrate`
3. Run `rake db:seed`
4. Run `rails s`
5. Create a new account

## Description

The purpose of this app is to allow users to track their ping pong games and to show the current leaderboard of players in the office.

Once logged in, users can log games against other opponents, see the history of their games and see the current leaderboard.

A leaderboard keeps track of the rankings of a group of players or teams over time.  This is an [example of a leaderboard in the context of socccer](http://www.fifa.com/fifa-world-ranking/ranking-table/men/), this is an [example of a leaderboard](https://ratings.fide.com/top.phtml?list=men), in the context of chess, this is an [example of an Elo ranking](https://github.com/rgho/elo.rb) implemented in Ruby.

The framework of the app already allows users to register and sign in. Your task is to implement the abilty for players to log games, see their results and update the rank of the ping pong leaderboard. Mock ups for all UI to be developed are in the app already.  Please replace the mocks with your implementation.

## Requirements

Add all necessary migrations, models (with relationships, methods and validations), controllers, and tests.

1. Add necessary functionality to log a game between two users
  * Games follow standard ping pong rules. They are games to 21.  Each game needs to be won by a two point margin.
  * Games are inputted on the honor system (no handshaking of approval of a score)
2. Add history page which allow the logged in user to view history of games they participated in. This includes: timestamp, opponent user, game score
3. Populate the leaderboard page with current rankings:
  * Rankings are updated every time a game is logged
  * Not all wins should count the same. e.g: a player ranked 4 beating a player ranked 5 should not count the same as a player ranked 5 beating a player ranked 1
  * When the leaderboard is first created all the users will be equal in ranking
4. Populate all necessary models and controllers to support this functionality
5. Populate all necessary tests for the models and the controllers



