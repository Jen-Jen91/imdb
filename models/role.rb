require_relative("../db/sql_runner.rb")

class Role

  attr_reader(:id)
  attr_accessor(:movie_id, :actor_id, :fee)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @movie_id = options["movie_id"].to_i()
    @actor_id = options["actor_id"].to_i()
    @fee = options["fee"].to_i()
  end


  def save()

    sql = "
      INSERT INTO roles(
        movie_id,
        actor_id,
        fee
      )
      VALUES ($1, $2, $3)
      RETURNING id;
    "

    values = [@movie_id, @actor_id, @fee]

    results = SqlRunner.run(sql, values)

    @id = results[0]["id"].to_i()

  end






end
