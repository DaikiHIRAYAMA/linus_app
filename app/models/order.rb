class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product
    enum status: {
    received: 0,
    ordered: 1
    }
end
