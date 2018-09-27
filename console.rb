require("pry")
require_relative("./models/movie.rb")
require_relative("./models/role.rb")
require_relative("./models/actor.rb")


Role.delete_all()
Movie.delete_all()
Actor.delete_all()


actor1 = Actor.new({
  "first_name" => "Harrison",
  "last_name" => "Ford"
  })

actor1.save()

actor2 = Actor.new({
  "first_name" => "Carrie",
  "last_name" => "Fisher"
  })

actor2.save()

actor3 = Actor.new({
  "first_name" => "Jack",
  "last_name" => "Nicholson"
  })

actor3.save()

movie1 = Movie.new({
  "title" => "Star Wars: A New Hope",
  "genre" => "sci-fi",
  "budget" => 5000
  })

movie1.save()

movie2 = Movie.new({
  "title" => "Raiders of the Lost Ark",
  "genre" => "adventure",
  "budget" => 3000
  })

movie2.save()

movie3 = Movie.new({
  "title" => "The Shining",
  "genre" => "horror",
  "budget" => 4000
  })

movie3.save()

role1 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor1.id,
  "fee" => 1000
  })

role1.save()

role2 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor2.id,
  "fee" => 900
  })

role2.save()

role3 = Role.new({
  "movie_id" => movie3.id,
  "actor_id" => actor3.id,
  "fee" => 1500
  })

role3.save()

role4 = Role.new({
  "movie_id" => movie2.id,
  "actor_id" => actor1.id,
  "fee" => 1000
  })

role4.save()


binding.pry
nil
