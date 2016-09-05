require "minitest/autorun"
require "minitest/utils"
require "pry-byebug"
require "csv"

class Product
  attr_reader :id,:name,:price,:category
  attr_writer :id

  def initialize(name,price,category,id=nil)
    @name, @price, @category, @id = name,price,category,id
  end
  def to_a
    [@id,@name,@price,@category]
  end
end

class ProductRepository
  FILE ="/tmp/products.csv"
  class << self
    def file_location; FILE; end

    def all
      csv= CSV.read(file_location,col_sep: "|")
      csv.to_a.map {|row| Product.new(*row)}
    end
    def find id
      csv= CSV.read(file_location,col_sep: "|")
      record=csv.to_a.find{|row| row[0].to_i == id}
      record ? Product.new(*record) : nil
    end
    def create product 
      CSV.open file_location,"a+",col_sep: "|" do |csv|
        product.id=csv.count+1
        csv <<product.to_a
      end
    end
  end

end


class ProductRepositoryTest <MiniTest::Test
  def setup 
    FileUtils.rm ProductRepository::FILE rescue nil 
    ProductRepository.create Product.new("Microphone",200,"audio")
    ProductRepository.create Product.new("dashing",200,"audio")
    ProductRepository.create Product.new("Microp",200,"audio")
  end 

  def test_retrieves_a_list_of_product
    assert_kind_of Product, ProductRepository.all.first 
  end

  def test_creates_a_record_based_off_a_product
    assert_equal 3,ProductRepository.all.length
  end

  def test_finds_a_record_by_key
    assert_kind_of  Product, ProductRepository.find(1)
  end
end