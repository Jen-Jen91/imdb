require("pry")
require_relative("./models/movie.rb")
require_relative("./models/role.rb")
require_relative("./models/actor.rb")


# Role.delete_all()
# Movie.delete_all()
# Actor.delete_all()


actor1 = Actor.new({
  "first_name" => "Harrison",
  "last_name" => "Ford"
  })

actor2 = Actor.new({
  "first_name" => "Carrie",
  "last_name" => "Fisher"
  })

actor3 = Actor.new({
  "first_name" => "Jack",
  "last_name" => "Nicholson"
  })


movie1 = Movie.new({
  "title" => "Star Wars: A New Hope",
  "genre" => "sci-fi"
  })

movie2 = Movie.new({
  "title" => "Raiders of the Lost Ark",
  "genre" => "adventure"
  })

movie3 = Movie.new({
  "title" => "The Shining",
  "genre" => "horror"
  })


role1 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor1.id,
  "fee" => 1000000
  })

role2 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor2.id,
  "fee" => 900000
  })

role3 = Role.new({
  "movie_id" => movie3.id,
  "actor_id" => actor3.id,
  "fee" => 1500000
  })
