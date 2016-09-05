require 'json'

my_hash= JSON.parse('{"hello": "goodbye"}')
puts my_hash


puts JSON.generate(my_hash)

puts my_hash = {:hello => "goodbye"}.to_json
puts my_hash = {:hello => "goodbye"}.as_json
