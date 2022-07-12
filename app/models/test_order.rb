class TestOrder < ApplicationRecord
    belongs_to :user
    belongs_to :tester
    enum status: {
    received: 0,
    ordered: 1
    }
end
