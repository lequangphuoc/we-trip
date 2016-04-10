require 'rails_helper'

RSpec.describe PlacePhotosHelper, type: :helper do
  describe '#render_place_photos' do
    context 'empty collection' do
      it 'should render empty view' do
        expect(helper.render_place_photos([])).to eq('<p>There is no image for this location yet.</p>')
      end

      it 'should render empty view' do
        expect(helper.render_place_photos(nil)).to eq('<p>There is no image for this location yet.</p>')
      end
    end

    context 'not empty collection' do
      let(:place_photos) { [double(PlacePhoto)] }

      it 'should render collection' do
        expect(helper).to receive(:render).with(:place_photos)
        helper.render_place_photos(:place_photos)
      end
    end
  end
end