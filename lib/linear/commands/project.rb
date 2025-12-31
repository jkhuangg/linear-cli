# frozen_string_literal: true

require_relative '../cli/sub_commands'

module Rubyists
  module Linear
    module CLI
      # The Project module is the namespace for all project-related commands
      module Project
        include CLI::SubCommands

        # Aliases for Project commands.
        ALIASES = {
          list: %w[ls l], # aliases for the list command
          project: %w[p projects] # aliases for the main project command itself
        }.freeze

        DESCRIPTION = 'Manage projects'
      end
    end
  end
end
