# frozen_string_literal: true

require 'semantic_logger'

module Rubyists
  # Main module for Linear CLI commands
  module Linear
    M :project
    O 'project/list'
    module CLI
      module Project
        List = Class.new Dry::CLI::Command
        # The List class is a Dry::CLI::Command that lists projects
        class List
          include SemanticLogger::Loggable
          include Rubyists::Linear::CLI::CommonOptions

          desc 'List projects'
          example [
            '                      # List all projects',
            '--mine                # List only my projects'
          ]
          option :mine, type: :boolean, default: false, desc: 'Only show my projects'

          def call(**options)
            logger.debug 'Listing projects'
            result = Rubyists::Linear::Operations::Project::List.call(params: options)
            if result.success?
              display result[:projects], options
            else
              logger.error 'Failed to list projects'
            end
          end
        end
      end
    end
  end
end
