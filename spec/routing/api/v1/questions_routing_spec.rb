require 'rails_helper'

RSpec.describe Api::V1::QuestionsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/api/v1/questions.json').to route_to(
                                                      controller: 'api/v1/questions',
                                                      action: 'index',
                                                      format: 'json')
    end

    it 'routes to #show' do
      expect(:get => '/api/v1/questions/1.json').to route_to(
                                                        controller: 'api/v1/questions',
                                                        action: 'show',
                                                        format: 'json',
                                                        :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/api/v1/questions.json').to route_to(
                                                       controller: 'api/v1/questions',
                                                       action: 'create',
                                                       format: 'json')
    end

    it 'routes to #update' do
      expect(:put => '/api/v1/questions/1.json').to route_to(
                                                        controller: 'api/v1/questions',
                                                        action: 'update',
                                                        format: 'json',
                                                        :id => "1")
    end

    it 'routes to #destroy' do
      expect(:delete => '/api/v1/questions/1.json').to route_to(
                                                           controller: 'api/v1/questions',
                                                           action: 'destroy',
                                                           format: 'json',
                                                           :id => '1')
    end
  end
end
