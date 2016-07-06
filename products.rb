class Products
  DB = [{
    id: 1,
    name: 'Agile Web Development with Rails 5',
    price: 2800,
    vat_category_id: 2
  }, {
    id: 2,
    name: 'Data Science Essentials in Python',
    price: 1900,
    vat_category_id: 2
  }, {
    id: 3,
    name: 'Web Development with Clojure, Second Edition',
    price: 2400,
    vat_category_id: 2
  }, {
    id: 4,
    name: 'Serverless Single Page Apps',
    price: 3000,
    vat_category_id: 2
  }, {
    id: 5,
    name: 'Deploying with JRuby 9k',
    price: 1600,
    vat_category_id: 2
  }, {
    id: 6,
    name: 'Pragmatic T-Shirt',
    price: 900,
    vat_category_id: 1
  }].map { |attrs| Product.new(attrs) }.freeze

  def self.find(id)
    product = DB.select { |product| id == product.id }.first
    throw ArgumentError if product.nil?
    product
  end
end
