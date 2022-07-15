class Tester < ApplicationRecord
    has_one_attached :image
    has_one :test_order, dependent: :destroy
    belongs_to :company


    validates :price, numericality: { greater_than_or_equal_to: 50 }
end
