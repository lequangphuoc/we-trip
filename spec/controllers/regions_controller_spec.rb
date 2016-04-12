require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  describe 'GET #all' do
    before(:each) do
      create(:hcm)
      create(:hn)
      get :all, format: :json
    end

    it 'should be success' do
      expect(response).to be_success
    end

    it 'should have two region' do
      result = JSON.parse(response.body)
      expect(result.map { |region| region['name'] }).to eq(%w(HCM HN))
    end
  end
end
