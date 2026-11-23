class Product < ApplicationRecord
    belongs_to :category

    def self.low_quantities(threshold)
        where("quantity < ?", threshold)
    end

    def total_value
        price * quantity
    end

    scope :below_average_quantity, -> {
        avg = average(:quantity)
        where("quantity < ?", avg)
    }
end
