# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :users_by_name_and_start_date, [Types::ParticipationType], null: false do
      argument :name, String, required: false
      argument :start_date, GraphQL::Types::ISO8601Date, required: false
    end

    def users_by_name_and_start_date(name: nil, start_date: nil)
      scope = Participation.joins(:user)

      if name.present?
        scope = scope.where("LOWER(users.name) LIKE ?", "%#{name.downcase}%")
      end

      if start_date.present?
        scope = scope.where("participations.start_date >= ?", start_date)
      end

      scope.includes(:user).order(:start_date)
    end
  end
end
