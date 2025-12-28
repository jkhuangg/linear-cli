# frozen_string_literal: true

require_relative '../../../test_helper'
require 'linear/operations/issue/list'

class IssueListOperationTest < Minitest::Spec
  describe 'Rubyists::Linear::Operations::Issue::List' do
    let(:issues) { [Object.new, Object.new] }
    let(:project) { Struct.new(:id).new('project-id') }

    describe 'when ids are provided' do
      let(:params) { { ids: %w[ISS-1 ISS-2] } }

      it 'fetches specific issues' do
        Rubyists::Linear::Issue.stub :find, issues.first do
          result = Rubyists::Linear::Operations::Issue::List.call(params: params)

          _(result.success?).must_equal true
          _(result[:issues].size).must_equal 2
        end
      end
    end

    describe 'when no ids are provided' do
      let(:params) { { mine: true } }

      it 'fetches issues with filter' do
        Rubyists::Linear::Issue.stub :all, issues do
          result = Rubyists::Linear::Operations::Issue::List.call(params: params)

          _(result.success?).must_equal true
          _(result[:issues]).must_equal issues
          _(result[:filter]).must_equal({ assignee: { isMe: { eq: true } } })
        end
      end
    end

    describe 'when project is provided' do
      let(:params) { { project: 'some-project' } }

      it 'fetches issues with project filter' do
        Rubyists::Linear::Issue.stub :all, issues do
          result = Rubyists::Linear::Operations::Issue::List.call(params: params, project: project)

          _(result.success?).must_equal true
          _(result[:issues]).must_equal issues
          _(result[:filter]).must_equal({ project: { id: { eq: 'project-id' } } })
        end
      end
    end
  end
end
