require 'rails_helper'

RSpec.describe "CreateTextRelations", type: :request do
  describe "GET /texts" do
    before { @text = Text.create!(title: "Speak", body: "This is a cool book -Rogah") }

    it "gets all texts" do

      get api_texts_url
      expect(response).to have_http_status(200)

      expect(response.body).not_to be_empty
    end

    it "gets a single text by id" do
      get api_text_url(@text)
      expect(response).to have_http_status(200)

      text = JSON.parse(response.body, symbolize_names: true)
      expect(@text.title).to eq(text[:title])
    end
  end

  describe "POST /texts" do
    @text = {
        title: "Speak",
        body: "This is a cool book -Rogah"
      }

    it "creates a text" do
      post api_texts_url, @text.to_json, { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }
      expect(response).to have_http_status(201)

      text = JSON.parse(response.body, symbolize_names: true)
      expect(@text[:title]).to eq(text[:title])

      expect(response.location).to eq api_text_url(text[:id])
    end

    it "creates two way relation between texts" do
      post
    end
  end
end
