require 'spec_helper'

describe PlaceDecorator do
	let(:place) { create(:place).decorate}

	it "Get Map Url" do
		exptectedString = "https://www.google.com/maps/embed/v1/place?q=place_id:test1&key=AIzaSyBrJ4kgKukKBQGXsu7ULAynrPaBz65k3iA"
		expect(place.map_url).to eq(exptectedString)
	end
end
