class Tester < ApplicationRecord
    has_one_attached :image
    has_one :test_order, dependent: :destroy
end
