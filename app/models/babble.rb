class Babble < ApplicationRecord
    belongs_to :user
    has_many_attached :attachments
    validates :babble, presence: true, length: { minimum: 2 }
end
