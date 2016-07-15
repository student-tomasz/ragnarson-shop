module Shop
  module Services
    module CartItems
      RSpec.describe IncrementOrCreate do
        describe '#call' do
          let(:book) do
            Models::Product.new(
              name: 'Agile Web Development with Rails 5',
              price: 2800,
              vat_id: 2
            )
          end

          before :each do
            stub_const('Shop::PRODUCTS', [book])
          end

          let(:book_cart_item) do
            Models::CartItem.new(product_id: book.id, quantity: 1)
          end

          before :each do
            stub_const('Shop::CART_ITEMS', [book_cart_item])
          end

          shared_examples 'raises ProductDoesNotExistError' do |product_id|
            it 'raises ProductDoesNotExistError' do
              expect { IncrementOrCreate.new.call(product_id: product_id) }
                .to raise_error(IncrementOrCreate::ProductDoesNotExistError)
            end
          end

          context 'with nil id' do
            include_examples 'raises ProductDoesNotExistError', nil
          end

          context 'with unknown id' do
            include_examples 'raises ProductDoesNotExistError', -1
          end

          context 'with valid id' do
            it 'increments the Models::CartItem#quantity' do
              expect { IncrementOrCreate.new.call(product_id: book.id) }
                .to change { Fetch.new.call(product_id: book.id).quantity }
                .from(1).to(2)
            end
          end
        end
      end
    end
  end
end
