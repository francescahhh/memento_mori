class Note < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { maximum: 35 }
    validates :body, presence: true, length: { maximum: 610 }
end
