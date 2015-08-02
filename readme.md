[![Build Status](https://travis-ci.org/mmplisskin/my_secrets.svg?branch=travis)](https://travis-ci.org/mmplisskin/my_secrets)
#My Secrets
###my Secrets is a digital locker that emails recipients when the user goes inactive 
Deployed at [my-secrets.co](my-secrets.co)
 <br />

##Tech Used

- Rails 4
- Postgress
- Redis
- JS/Jquery

## Gems

- Oauth
- Sidekiq
- Clockwork
- Figaro
- 12 factor

## Highlights


#### Testing
- Rspec controller and model spec
- Capybara Test

#### Deployment
- ssl
- clockwork scheduling
- sidekiq


#### layout
- mobile compatible
- materialize framework


#### Email
- queue emailing
- secrets emails are sent out if a user goes inactive

#### Background Processes
- if a user does not check in for an extended period their secres are mailed to recipients and destroyed
- recipients that are not tied to secrets are removed from db

