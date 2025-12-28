# frozen_string_literal: true

require_relative '../../test_helper'
require 'linear/operations/whoami'

class WhoAmIOperationTest < Minitest::Spec
  describe 'Rubyists::Linear::Operations::WhoAmI' do
    let(:user) { Object.new }
    let(:params) { { teams: false } }

    it 'fetches the user' do
      Rubyists::Linear::User.stub :me, user do
        result = Rubyists::Linear::Operations::WhoAmI.call(params: params)

        _(result.success?).must_equal true
        _(result[:user]).must_equal user
      end
    end
  end
end
