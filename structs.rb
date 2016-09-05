require 'ostruct'
require 'benchmark'

COUNT= 1_000_000
NAME= "Shakeel rauf"
EMAIL= "dashingshakeel@gmail.com"

class Person
  attr_accessor :name, :email 
end

Benchmark.bm(30) do |x|
  x.report("hash:") do 
    COUNT.times do 
      p={name: NAME, email: EMAIL}
    end
  end

  x.report("openstruct:") do
    COUNT.times do 
      p=OpenStruct.new
      p.name=NAME 
      p.email= EMAIL 
    end
  end

  x.report("Struct:") do
    PersonStrcut=Struct.new(:name,:email) 
    COUNT.times do
      p=PersonStrcut.new
      p.name=NAME 
      p.email=EMAIL 
    end
  end

  x.report("class:") do
    COUNT.times do
      p=Person.new
      p.name=NAME 
      p.email=EMAIL
    end
  end
end
      
   