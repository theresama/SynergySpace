#Blue Screen: SYNERGY SPACE

####Workflow
Pull from master to your own branches. Work on your individual branches. Add and commit frequently to your branch. When ready to push changes, merge master to your branch and fix any conflicts before checking out master and merging your branch. The master branch is always ready to deploy to Heroku.

####Setup
```
git clone https://github.com/theresama/SynergySpace.git
bundle install
rake db:migrate
rails s
```
---
#####heroku production: https://bluescreen.herokuapp.com/
---
SynergySpace is a coworking space rental and teaming to succeed service. 
aka the office version of airbnb.


