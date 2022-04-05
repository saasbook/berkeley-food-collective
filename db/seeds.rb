# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

userObjects = [
  {
    name: 'Andrew Mo',
    email: 'andrewmo@berkeley.edu'
  },
  {
    name: 'Roberto Cardenas',
    email: 'robertocardenas@berkeley.edu'
  },
  {
    name: 'Simon Jovanovic',
    email: 'simonjov@berkeley.edu'
  }
]

taskObjects = [
  {
    name: 'clean up',
    description: 'please clean the room',
    category: 'Cleaning',
    priority: 0,
    added: DateTime.new(2001, 2, 3, 4, 5, 6),
    user_add: 'Roberto',
    complete_time: DateTime.new(2001, 2, 3, 4, 5, 6),
    user_complete: 'Melody',
    completed: true
  },
  {
    name: 'fill pantry',
    description: 'stock the pantry with tomatoes',
    category: 'Inventory',
    priority: 0,
    added: DateTime.new(2001, 2, 3, 4, 5, 6),
    user_add: 'Simon',
    complete_time: DateTime.new(2001, 2, 3, 4, 5, 6),
    user_complete: 'Aditya',
    completed: true
  },
  {
    name: 'make app',
    description: 'make the app for BSFC',
    category: 'Engineering',
    priority: 0,
    added: DateTime.new(2001, 2, 3, 4, 5, 6),
    user_add: 'Armando',
    complete_time: DateTime.new(2001, 2, 3, 4, 5, 6),
    user_complete: 'Us',
    completed: true
  }
]


User.create(userObjects)
Task.create(taskObjects)