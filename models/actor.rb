require_relative("../db/sql_runner.rb")

class Actor

  attr_reader(:id)
  attr_accessor(:first_name, :last_name)


  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end


  def save()
    sql = "
      INSERT INTO actors(
        first_name,
        last_name
      )
      VALUES ($1, $2)
      RETURNING id;
    "

    values = [@first_name, @last_name]

    results = SqlRunner.run(sql, values)

    @id = results[0]["id"].to_i()
  end


  def self.all()
    sql = "SELECT * FROM actors;"

    results = SqlRunner.run(sql)

    actors = results.map do |actor|
      Actor.new(actor)
    end

    return actors
  end


  def self.delete_all()
    sql = "DELETE FROM actors;"
    SqlRunner.run(sql)
  end


  def update()
    sql = "
      UPDATE actors
      SET first_name = $1, last_name = $2
      WHERE id = $3;
    "

    values = [@first_name, @last_name, @id]

    SqlRunner.run(sql, values)
  end


  def movies()
    sql = "
      SELECT movies.* FROM movies
      INNER JOIN roles
      ON movies.id = roles.movie_id
      WHERE roles.actor_id = $1;
    "
    results = SqlRunner.run(sql, [@id])

    movies = results.map do |movie|
      Movie.new(movie)
    end

    return movies
  end

end
