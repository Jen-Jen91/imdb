require("pg")

class Role

  attr_reader(:id)
  attr_accessor(:movie_id, :actor_id, :fee)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @movie_id = options["movie_id"].to_i()
    @actor_id = options["actor_id"].to_i()
    @fee = options["fee"].to_i()
  end









end
