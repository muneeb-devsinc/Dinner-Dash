# README


* Ruby version : 2.5.8
* Rails version : 5.2.6
* PostgreSQL : 13.4

* Dependencies

  configure the following environment variables before using the application in either application.yml generated using bundle exec figaro install or setting them manually in heroku

  Mailer Settings

  SENDMAIL_USERNAME: ' e.g test@devsinc.com'
  SENDMAIL_PASSWORD: 'password'
  MAIL_HOST:         'devsinc.com'
  DEFAULT_URL: 'yourapp.herokuapp.com'

  cloudinary settings

  cloud_name: 'e.g devsinc'
  api_key: 'Your API key'
  api_secret: 'Your API secret key'
  ADDRESS: 'e.g smtp.gmail.com'


* Configuration

  Open Console at the root project directory and type 'bundle install' to install requried gems

  use rails db:setup to initialise, migrate and seed the database
  or
  rails db:create, rails db:migrate and rails db:seed individually to achieve the same goal


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
