class Customer < ApplicationRecord
    has_many :orders

    validates :address, presence: true

    def full_name
        "Mr./Ms. #{name}"
    end
end
