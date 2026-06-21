module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :phone, String, null: true
    field :participations, [Types::ParticipationType], null: true
  end
end
