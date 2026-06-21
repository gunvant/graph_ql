class Participation < ApplicationRecord
  belongs_to :user

  validates :status, presence: true
end
