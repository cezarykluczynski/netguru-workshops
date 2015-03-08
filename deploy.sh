#! /bin/bash

heroku create --ssh-git && \
git push heroku master -f && \
heroku run rake db:migrate && \
heroku restart && \
heroku run rake db:seed && \
heroku open