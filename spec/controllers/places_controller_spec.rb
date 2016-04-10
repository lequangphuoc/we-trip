require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe 'GET #index' do
    it 'should render index' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:place) { build(:place) }
    let(:place_photos) { build(:place_photo) }

    before(:each) do
      allow(Place).to receive(:find).and_return(place)
      allow(place).to receive(:place_photos).and_return(place_photos)
      get :show, id: 1
    end

    it 'should decorate place' do
      expect(assigns(:place)).to be_decorated
    end

    it 'should decorate place photos' do
      expect(assigns(:place_photos)).to be_decorated
    end

    it 'should render show' do
      expect(response).to render_template(:show)
    end

    it 'should query place' do
      expect(assigns(:place)).to eq(place)
    end

    it 'should query place photo' do
      expect(assigns(:place_photos)).to eq(place_photos)
    end
  end
end
