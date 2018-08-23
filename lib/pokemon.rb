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
    pokemon_new = Pokemon.new(id:new_p[0][0], name:new_p[0][1], type:new_p[0][2], db:db)
  end



end
