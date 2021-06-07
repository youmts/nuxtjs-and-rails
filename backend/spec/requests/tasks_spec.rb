require 'rails_helper'

RSpec.describe Api::V1::TasksController, :type => :request do
  it 'index' do
    get '/api/v1/tasks'

    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
    expect(json['status']).to eq('SUCCESS')
  end
end
