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


  def self.all()
    sql = "SELECT * FROM roles;"

    results = SqlRunner.run(sql)

    roles = results.map do |role|
      Role.new(role)
    end

    return roles
  end


  def self.delete_all()
    sql = "DELETE FROM roles;"
    SqlRunner.run(sql)
  end


  def update()
    sql = "
      UPDATE roles
      SET
        movie_id = $1,
        actor_id = $2,
        fee = $3
      WHERE id = $4;
    "

    values = [@movie_id, @actor_id, @fee, @id]

    SqlRunner.run(sql, values)
  end




end
