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

    it "creates a text" do

      @text_info = {
        title: "Speak",
        body: "This is a cool book -Rogah"
      }

      post api_texts_url, @text_info.to_json, { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }
      expect(response).to have_http_status(201)

      text = JSON.parse(response.body, symbolize_names: true)
      expect(@text_info[:title]).to eq(text[:title])

      expect(response.location).to eq api_text_url(text[:id])
    end

    it "creates two way relation between texts" do
      @text = Text.create!(title: "Bam!", body: "A cool book by a cool person") 
      @related_text = Text.create!(title: "Boom!", body: "Another fantastic book by a pretty cool person")

      post api_url(@text), { related_text_id: @related_text.id }.to_json, { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }
      expect(response).to have_http_status(201)
      
      texts = JSON.parse(response.body, symbolize_names: true)
      expect(texts).not_to be_empty
    end
  end
end
