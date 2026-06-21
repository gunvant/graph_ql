module Types
  class ParticipationType < Types::BaseObject
    field :id, ID, null: false
    field :enrollment_date, GraphQL::Types::ISO8601Date, null: true
    field :status, String, null: true
    field :start_date, GraphQL::Types::ISO8601Date, null: true
    field :end_date, GraphQL::Types::ISO8601Date, null: true
    field :user, Types::UserType, null: true
  end
end
