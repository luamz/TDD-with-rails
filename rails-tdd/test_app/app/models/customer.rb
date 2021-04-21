class Customer < ApplicationRecord
    def full_name
        "Mr./Ms. #{name}"
    end
end
