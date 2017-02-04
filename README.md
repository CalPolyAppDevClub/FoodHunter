# FoodHunter
Finding Food For Friendly Famished Fellows

# Development Install
### Prerequisite
CocoaPods is required. This project uses Alamofire, a swift networking library, and this dependency is managed through CocoaPods.     
To install CocoaPods (from project root directory):
```
sudo gem install cocoapods
pod setup
pod install
```
Note: `pod setup` may take a long time to complete.   
Another option is to run: `git clone https://github.com/CocoaPods/Specs.git ~/.cocoapods/repos/master` from your home directory and then run `pod setup` from the project root directory.

# Updating Your Git Branch
Add a remote branch to your local Git repository
```
git remote add upstream git@github.com:CalPolyAppDevClub/FoodHunter.git
```
Then pull from upstream and update your fork so you have the latest version!
```
git pull upstream master
git push origin master # this will update your fork of the repo
```
