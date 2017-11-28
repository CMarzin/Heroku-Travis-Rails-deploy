# README

[![Build Status](https://travis-ci.org/CMarzin/Heroku-Travis-Rails-deploy.svg?branch=master)](https://travis-ci.org/CMarzin/Heroku-Travis-Rails-deploy)

Example of integration an ruby app with Travis
___


This repo assume you already have an heroku account and an app running on it.

#### If not you can do it [here](https://www.heroku.com)

Basically, when you push something on master, it trigger travis and travis make all the things you tell him, (in the .travis.yml) and after run the test etc.. it deploy automatically on your app located on heroku.

__Explanation of the travis file__

```yml
deploy:
  provider: heroku # you don't need to change anything here
  app: # here you specify the name of your app
  api_key:
    secure: # you need to execute the command below to generate a token
  run:
  - rake db:migrate # excute the migration
```

## Deployment instructions
___
Before anything make sure you have installed [Heroku cli]('https://devcenter.heroku.com/articles/heroku-cli') and [Travis cli](https://github.com/travis-ci/travis.rb#installation)
- Duplicate the .travis.example.yml and remove the example from one
- Now open `.travis.yml` 
- In the travis file you need to specify the name of your app
```yml
deploy:
  provider: heroku # you don't need to change anything here
  app: # here you specify the name of your app
  api_key:
    secure: # you need to execute the command below to generate a token
  run:
  - rake db:migrate # excute the migration
```

 - execute this command in the terminal to get a token from heroku (in the root of the repo)
 ```sh
travis encrypt $(heroku auth:token) --add deploy.api_key
 ```
- Thats it ! Now every time you push on master if the build is passing the code will be deployed