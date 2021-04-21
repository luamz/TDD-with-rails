require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has_an_order (Testing belongs_to)' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it ' creating_3_orders (Testing create_list)' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'has_3_orders (Testing has_many)' do
    customer = create(:customer_with_orders)
    #puts customer.inspect
    #puts customer.orders.inspect
    expect(customer.orders.count).to eq(3)
  end

end
