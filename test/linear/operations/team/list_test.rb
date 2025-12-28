# frozen_string_literal: true

require_relative '../../../test_helper'
require 'linear/operations/team/list'

class TeamListOperationTest < Minitest::Spec
  describe 'Rubyists::Linear::Operations::Team::List' do
    let(:teams) { [Object.new, Object.new] }

    describe 'when mine is true' do
      let(:params) { { mine: true } }

      it 'fetches my teams' do
        Rubyists::Linear::Team.stub :mine, teams do
          result = Rubyists::Linear::Operations::Team::List.call(params: params)

          _(result.success?).must_equal true
          _(result[:teams]).must_equal teams
        end
      end
    end

    describe 'when mine is false' do
      let(:params) { { mine: false } }

      it 'fetches all teams' do
        Rubyists::Linear::Team.stub :all, teams do
          result = Rubyists::Linear::Operations::Team::List.call(params: params)

          _(result.success?).must_equal true
          _(result[:teams]).must_equal teams
        end
      end
    end
  end
end
