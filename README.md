# BInventory
___

## BInventory
Manage User and Admin Inventory

___

# Technologies

BInventory was developed with Ruby on Rails, and PostGreSQL

___

## API Information
API endpoints URL - http://localhost:3000/

|METHOD  |DESCRIPTION                             |ENDPOINT                                  |
|------- |----------------------------------------|------------------------------------------|
|POST    |Sign Up                                 |users                                     |
|POST    |Sign In                                 |users/sign_in                             |
|POST    |Create a Frame                          |api/v1/frames                             |
|GET     |Get all Frames                          |api/v1/frames                             |
|POST    |Create a lens                           |api/v1/lenses                             |
|GET     |Get all Lenses                          |api/v1/lenses                             |
|POST    |Create a Glass                          |api/v1/glasses                            |
|GET     |Get Current User Glassed                |api/v1/glasses                            |

___
### Sample Users
Admin-<br/>
Username: admin@admin.com<br/>
Password: 12345678

User-<br/>
Username: user@user.com<br/>
Password: 12345678

___

## Running Locally

# Setup With Docker
Make sure you have Docker and Docker Composer Installed.

```sh
git clone git@github.com:danielufeli/binventory.git
cd binventory
open cmd and run the below docker commands:
docker build -t binventoryapp .
docker-compose up
docker compose run app rails db:setup
docker compose run app rails secret, then copy and paste the secret generated in the .env file `DEVISE_JWT_SECRET_KEY=secret`


Binventory app should now be running on [localhost:3000](http://localhost:3000/).
```

___

## Author
### Daniel Ufeli
