json.array!(@texts) do |text|
  json.extract! text, :id, :title, :body
  json.url api_text_url(text, format: :json)
end
