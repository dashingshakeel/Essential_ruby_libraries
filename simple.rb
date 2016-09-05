require "delegate"
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
  
end
class PersonDecorator < SimpleDelegator
  def slug
    name.gsub /\W/, "_"
  end
end
pero=Person.new("jJose mota")
decto=PersonDecorator.new(pero)
puts decto.slug