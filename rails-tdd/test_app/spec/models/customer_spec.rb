require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#fullname' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    #puts customer.email
    expect(customer.full_name).to  starting_with("Mr./Ms. ")
  end
  
  it '#fullname with inheritance' do
    customer = create(:customer_default)
    expect(customer.vip).to  be_falsey
    customer2 = create(:customer_vip)
    expect(customer2.vip).to  be_truthy
  end

  it 'using attributes_for' do
    attrs = attributes_for(:customer)
    attrs1 = attributes_for(:customer_vip)
    attrs2 = attributes_for(:customer_default)
    # puts attrs
    # puts attrs1
    # puts attrs2
  end

  it 'transient Attributes' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it "customer's gender and type" do
    customer = create(:customer_male_vip)
    expect(customer.vip).to be_truthy
    expect(customer.gender).to eq("M")
  end

  it {expect{create(:user)}.to change {Customer.all.size}.by(1)}
end
