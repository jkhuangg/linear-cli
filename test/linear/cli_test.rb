# frozen_string_literal: true

require_relative '../test_helper'
require 'linear/cli'

class CLITest < Minitest::Spec
  describe 'Rubyists::Linear::CLI' do
    it 'has a version number' do
      _(Rubyists::Linear::VERSION).wont_be_nil
    end
  end
end
