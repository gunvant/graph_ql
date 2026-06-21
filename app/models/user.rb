class User < ApplicationRecord
  has_many :participations, dependent: :destroy
end
