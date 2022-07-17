class Tester < ApplicationRecord
    #has_one_attached :image
    mount_uploader :image, ImageUploader
    has_one :test_order, dependent: :destroy
    belongs_to :company

    
    validates :price, numericality: { greater_than_or_equal_to: 50, less_than_or_equal_to: 9999999 }

    validates :item_name, presence: true, length: { maximum: 30 }
    validates :stock_quantity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 99999 }

    validates :description, presence: true, length: { maximum: 1000 }
end
