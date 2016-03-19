require 'test_helper'

class CreateTextRelationTest < ActionDispatch::IntegrationTest
  test "returns all texts" do
    get api_texts_url
    assert_equal response.status 200
    assert response.body not_empty
  end

  test "get text by id" do
    @text = Text.create!(title: "Speak", body: "This is a cool book -Rogah")

    get api_texts_url(@text)
    assert_equal response.status 200

    assert_equal response.location @text
    
  end
end
