class Article
  attr_reader :id, :name

  def initialize(id,name)
    @id = id
    @name = name
  end

  def to_msgpack(*args)
    {id: id, name: name}.to_msgpack(*args)
  end
end
