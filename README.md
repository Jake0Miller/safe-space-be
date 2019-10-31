# README
# Safe Space

Safe Space is a disaster relief app that is used to check in disaster survivors, and keep an up-to-date status of the disaster relief center (number of people at the center, inventory of supplies, and list of top necessities, for example water, blankets, food, etc.)

# Production & Codebase

You can view the Github repos as well as see the app in production here:

[Front end GitHub](https://github.com/ktsune/safe-space-fe)

[Front end (public-facing) GitHub](https://github.com/jogren/cross-poll-ui)

[Back end GitHub](https://github.com/Jake0Miller/safe-space-be)

[Back end Heroku](https://safe-space-be.herokuapp.com/)

#### You can also view the [project board here](https://github.com/ktsune/safe-space-fe/projects/1)

## Setup Instructions

#### How to setup:
    1. Clone the GitHub repository: git@github.com:Jake0Miller/safe-space-be.git
    2. Go to the directory with the new repo. Run bundle install.
    3. Run rake db:{create,migrate,seed}
    4. Run rails s, visit localhost:3000 to view the app and navigate on your local server.
#### Run tests:
    1. Run rspec.
    2. To run an individual test, type rspec and the full path to the test file into the command line.

## Endpoints
### Note: this app uses GraphQL as an api interface

### POST inventory item

```
Content-Type: application/json
Accept: application/json
mutation {
  createItem (
    name: "food"
    quantity: 11
    consumable: true
    centerId: 1
  ) {
    item {
      id
      name
    }
  }
}
```

### Delete User

```
Content-Type: application/json
Accept: application/json
mutation {
  deleteUser(id: 1) {
    user {
      name
    }
  }
}
```

### PATCH Inventory Item

```
Content-Type: application/json
Accept: application/json
(mutation {
  editItem(id: 1, centerId: 5, quantity: 10) {
    item {
      quantity
    }
  }
})
```

### POST User

```
Content-Type: application/json
Accept: application/json

mutation {
  createUser (
    name: "Jake",
    age: 23,
    phone: 5555555,
    centerId: 1
  ) {
    user {
      id
    }
  }
}

```

### POST other needs associated with a specific user

```
mutation {
  createNeed (
    name: "insulin"
    userId: #{@user_1.id}
  ) {
    need {
      id
      name
      userId
    }
  }
}

```

### POST Emergency Contacts

```
Content-Type: application/json
Accept: application/json

mutation {
  createContact (
    name: "Ian"
    phone: "555-555-5555"
    userId: #{@user_1.id}
  ) {
    contact {
      id
      name
      phone
      userId
    }
  }
}

```

### DELETE Inventory Items

```
Content-Type: application/json
Accept: application/json

mutation {
  deleteItem(id: 1) {
    item {
      name
    }
  }
}

```

### PATCH User Info

```
Content-Type: application/json
Accept: application/json

mutation {
  editUser (
    name: "Jake",
    age: 23,
    phone: 5555555,
    centerId: 1
  ) {
    user {
      id
    }
  }
}

```

## Schema Design

<a href="https://cl.ly/97c3829f0278" target="_blank"><img src="https://dzwonsemrish7.cloudfront.net/items/3k2G411P2n0P3m3W2S3j/Screen%20Shot%202019-10-30%20at%2011.59.44%20AM.png" style="display: block;height: auto;width: 100%;"/></a>

## Start the Server

```ruby
$ rails s
```

## Running Tests

```ruby
$ rspec
```

## How to Contribute

If you'd like to contribute to this project, feel free to make a pull request at:

https://github.com/Jake0Miller/safe-space-be/compare

and click on `New Pull Request`

## Contributors
- [Jake Miller](https://github.com/Jake0Miller)

## Tech Stack List

 - ruby 2.4.1
 - rails 5.2.3
 - postgresql 11.5
 - twilio-ruby
 - graphql
 - fastjson
 - rack-cors
 - faker
 - webmock
 - rspec-rails
