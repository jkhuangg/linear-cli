# frozen_string_literal: true

module Rubyists
  module Linear
    module Operations
      module Team
        # The List operation lists teams
        class List < Trailblazer::Operation
          step :fetch_teams

          def fetch_teams(ctx, params:, **)
            ctx[:teams] = if params[:mine]
                            Rubyists::Linear::Team.mine
                          else
                            Rubyists::Linear::Team.all
                          end
          end
        end
      end
    end
  end
end
