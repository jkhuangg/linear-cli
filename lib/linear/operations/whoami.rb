# frozen_string_literal: true

module Rubyists
  module Linear
    module Operations
      # The WhoAmI operation returns the current user
      class WhoAmI < Trailblazer::Operation
        step :fetch_user

        def fetch_user(ctx, params:, **)
          ctx[:user] = Rubyists::Linear::User.me(teams: params[:teams])
        end
      end
    end
  end
end
