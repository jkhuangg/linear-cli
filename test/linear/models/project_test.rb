# frozen_string_literal: true

require_relative '../../test_helper'
require 'linear/models/project'

class ProjectTest < Minitest::Spec
  describe 'Rubyists::Linear::Project' do
    let(:attributes) do
      {
        id: SecureRandom.alphanumeric(32),
        name: "Project #{Time.now.to_i}",
        content: "Content at #{Time.now}",
        slugId: SecureRandom.alphanumeric(8),
        description: "Gadzooks! It's #{Time.now}!",
        url: 'https://linear.app/myorg/project/my-project-a2d0ddbbfbeb',
        createdAt: Time.now - 86_400,
        updatedAt: Time.now - 3600
      }
    end
    let(:instance) { Rubyists::Linear::Project.new(attributes) }

    describe '#match_score?' do
      context 'when arg equals matching url' do
        it 'returns 100' do
          _(instance.match_score?(attributes.fetch(:url))).must_equal 100
        end
      end

      context 'when arg equals project ID' do
        it 'returns 100' do
          _(instance.match_score?(attributes.fetch(:id))).must_equal 100
        end
      end

      context 'when arg equals project name' do
        it 'returns 100' do
          _(instance.match_score?(attributes.fetch(:name))).must_equal 100
        end
      end

      context 'when arg is part of project name' do
        it 'returns 75' do
          # Argument is project name with last 5 characters removed
          _(instance.match_score?(attributes.fetch(:name)[0..-5])).must_equal 75
        end
      end

      context 'when description includes arg' do
        let(:project_name) { 'gadzooks' }

        it 'returns 50' do
          _(instance.match_score?(project_name)).must_equal 50
        end
      end
    end
  end
end
