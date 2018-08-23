class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)
    new_p =  db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id)
    pokemon_new = Pokemon.new(id, name:new_p[1], type:new_p[2], db:db)
    pokemon_new
    binding.pry
  end



end
