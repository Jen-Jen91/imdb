require_relative("../db/sql_runner.rb")

class Movie

  attr_reader(:id)
  attr_accessor(:title, :genre, :budget)


  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @budget = options["budget"].to_i()
  end


  def save()
    sql = "
      INSERT INTO movies(
        title,
        genre,
        budget
      )
      VALUES ($1, $2, $3)
      RETURNING id;
    "
    values = [@title, @genre, @budget]

    results = SqlRunner.run(sql, values)

    @id = results[0]["id"].to_i()
  end


  def self.all()
    sql = "SELECT * FROM movies;"

    results = SqlRunner.run(sql)

    movies = results.map do |movie|
      Movie.new(movie)
    end

    return movies
  end


  def self.delete_all()
    sql = "DELETE FROM movies;"
    SqlRunner.run(sql)
  end


  def update()
    sql = "
      UPDATE movies
      SET title = $1, genre = $2, budget = $3
      WHERE id = $4;
    "

    values = [@title, @genre, @budget, @id]

    SqlRunner.run(sql, values)
  end


  def actors()
    sql = "
      SELECT actors.* FROM actors
      INNER JOIN roles
      ON actors.id = roles.actor_id
      WHERE roles.movie_id = $1;
    "
    results = SqlRunner.run(sql, [@id])

    actors = results.map do |actor|
      Actor.new(actor)
    end

    return actors
  end


  def remaining_budget()
    sql = "
      SELECT SUM(roles.fee) AS total_fee
      FROM roles
      WHERE movie_id = $1;
      "

    results = SqlRunner.run(sql, [@id])

    fee = results[0]["total_fee"].to_i()

    remaining_budget = @budget - fee

    return remaining_budget
  end

# Or have set up two methods - one for roles, one for budget:

  # def roles()
  #   sql = "SELECT * FROM roles where movie_id = $1"
  #   values = [@id]
  #   roles_data = SqlRunner.run(sql, values)
  #   return roles_data.map{|role| Role.new(role)}
  # end
  #
  # def remaining_budget()
  #   roles = self.roles()
  #   role_fees = roles.map{|role| role.fee}
  #   combined_fees = role_fees.sum
  #   return @budget - combined_fees
  # end



  # def self.map_items(data)
  #   result = data.map{|movie| Movie.new(movie)}
  #   return result
  # end


end
