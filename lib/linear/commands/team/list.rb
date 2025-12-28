# frozen_string_literal: true

require 'semantic_logger'

module Rubyists
  # Namespace for Linear
  module Linear
    M :team, :issue
    O 'team/list'
    # Namespace for CLI
    module CLI
      module Team
        List = Class.new Dry::CLI::Command
        # The List class is a Dry::CLI::Command that lists issues
        class List
          include SemanticLogger::Loggable
          include Rubyists::Linear::CLI::CommonOptions

          option :mine, type: :boolean, default: true, desc: 'Only show my issues'

          def call(**options)
            logger.debug 'Listing teams'
            result = Rubyists::Linear::Operations::Team::List.call(params: options)
            if result.success?
              display result[:teams], options
            else
              logger.error 'Failed to list teams'
            end
          end

          prepend Rubyists::Linear::CLI::Caller
        end
      end
    end
  end
end
