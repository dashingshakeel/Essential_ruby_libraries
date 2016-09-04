require "minitest/autorun"

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end


end

class  DemonstrationTest < MiniTest::Test 
  def test_assert_the_truth
    assert true 
  end
  def test_person_has_a_name
    person=Person.new "jose"

  end
end