# frozen_string_literal: true

require_relative '../../../test_helper'
require 'linear/operations/project/list'

class ProjectListOperationTest < Minitest::Spec
  describe 'Rubyists::Linear::Operations::Project::List' do
    let(:projects) { [Object.new, Object.new] }

    describe 'when mine is true' do
      let(:params) { { mine: true } }

      it 'fetches my projects' do
        Rubyists::Linear::Project.stub :mine, projects do
          result = Rubyists::Linear::Operations::Project::List.call(params: params)

          _(result.success?).must_equal true
          _(result[:projects]).must_equal projects
        end
      end
    end

    describe 'when mine is false' do
      let(:params) { { mine: false } }

      it 'fetches all projects' do
        Rubyists::Linear::Project.stub :all, projects do
          result = Rubyists::Linear::Operations::Project::List.call(params: params)

          _(result.success?).must_equal true
          _(result[:projects]).must_equal projects
        end
      end
    end
  end
end
