# frozen_string_literal: true

module Rubyists
  module Linear
    module Operations
      module Project
        # The List operation lists projects
        class List < Trailblazer::Operation
          step :fetch_projects

          def fetch_projects(ctx, params:, **)
            ctx[:projects] = if params[:mine]
                               Rubyists::Linear::Project.mine
                             else
                               Rubyists::Linear::Project.all
                             end
          end
        end
      end
    end
  end
end
