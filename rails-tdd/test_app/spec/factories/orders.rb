FactoryBot.define do
  factory :order do
    sequence(:description){|n| "Order ##{n}" }
    #association :customer, factory: :customer
    customer
  end
end
