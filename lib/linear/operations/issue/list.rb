# frozen_string_literal: true

module Rubyists
  module Linear
    module Operations
      module Issue
        # The List operation lists issues
        class List < Trailblazer::Operation
          step :build_filter
          step :fetch_issues

          def build_filter(ctx, params:, project: nil, **)
            filter = {}
            filter[:assignee] = { isMe: { eq: true } } if params[:mine]
            filter[:assignee] = { null: true } if params[:unassigned]
            filter[:team] = { key: { eq: params[:team] } } if params[:team]
            filter[:project] = { id: { eq: project.id } } if project
            ctx[:filter] = filter
          end

          def fetch_issues(ctx, params:, filter:, **)
            ctx[:issues] = if params[:ids] && !params[:ids].empty?
                             params[:ids].map { |id| Rubyists::Linear::Issue.find(id.upcase) }
                           else
                             Rubyists::Linear::Issue.all(filter:)
                           end
          end
        end
      end
    end
  end
end
