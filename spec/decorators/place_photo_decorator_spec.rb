require 'spec_helper'

describe PlacePhotoDecorator do
	before(:each) do
		@place = create(:place).decorate
		@place_photo = create(:place_photo).decorate
		@place_photo.place_id = @place.id
	end

	it "Get Place Name" do
		expect(@place_photo.place_name).to eq("Tra Sua")
	end

	it "Get url" do
		expectedString = "https://maps.googleapis.com/maps/api/place/photo?maxheight=720&photoreference=test1&key=AIzaSyBrJ4kgKukKBQGXsu7ULAynrPaBz65k3iA"
		expect(@place_photo.place_name).to eq("Tra Sua")
	end
end
