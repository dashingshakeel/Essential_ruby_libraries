require "forwardable"

class Person
  extend Forwardable

  def_delegator :@address, :to_s,:full_address
  def_delegators :@address,:city,:country
  
  attr_reader :name, :address
  def initialize(name:,address: Address.new)
    @name, @address = name,address
  end
  def country
    address.country
  end
end
class Address
  attr_reader :street,:zipcode,:city , :country
  def initialize(street:,zipcode:,city:,country:)
    @street, @zipcode, @city, @country = street,zipcode,city,country
  end
  def to_s
    <<EOF
#{street}
#{zipcode} #{city}
#{country}
EOF
  end

end
puts Person.new(name: "jpose mota", address: Address.new(street: "no street",zipcode: "57000", city: "sahiwal",country: "pakistan")).full_address
