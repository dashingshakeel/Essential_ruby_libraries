require "net/http"
require "json"

class Todo
  attr_reader :title, :done

  def self.all 
    response=Net::HTTP.get(URI("http://localhost:8080/todos.json"))
    todos_list=JSON.parse(response)["todos"]
    todos_list.map{|todo| Todo.new todo["title"],todo["done"]}
  end

  def initialize(title,done)
    @title, @done = title,done
  end
end

puts Todo.all.inspect