require 'rails_helper'

RSpec.describe "CreateTextRelations", type: :request do
  describe "GET /texts" do
    it "works! (now write some real specs)" do
      @text = Text.create!(title: "Speak", body: "This is a cool book -Rogah")

      get api_texts_url
      expect(response).to have_http_status(200)

      expect(response.body).not_to be_empty
    end
  end
end
