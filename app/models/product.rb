class Product < ApplicationRecord
    has_one_attached :image
    has_one :order, dependent: :destroy
    belongs_to :company

end
