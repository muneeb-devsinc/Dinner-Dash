# README


* Ruby version : 2.5.8
* Rails version : 5.2.6

* Configuration

  run sudo apt install postgresql-contrib libpq-dev to install database dependencies

  Open Console at the root project directory and type 'bundle install' to install requried gems

  use rails db:setup to initialise, migrate and seed the database
  or
  rails db:create, rails db:migrate and rails db:seed individually to achieve the same goal

  This Application relies on cloudinary for active storage. Please insert your credentials in config/storage.yml and config/initialise/cloudinary.rb


* Deployment on heroku
  Install Heroku CLI from https://devcenter.heroku.com/articles/heroku-cli
  Sign up on heroku
  Open Console and type
  1.heroku login
  2.heroku create
  3.git config --list | grep heroku ( and check if the created directory name is the same as the directory listed here)
  4.git push heroku master (Pushes project code onto heroku)
  5.heroku run rake db:migrate  (Migrates database)
  6.heroku run rake db:seed     (Seeds data into database)
  7.heroku ps:scale web=1       (Ensures web dyno is running)
  8.heroku open                  (Opens deployed website link)

  Enjoy!
