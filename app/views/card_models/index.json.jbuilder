json.array!(@card_models) do |card_model|
  json.extract! card_model, 
  json.url card_model_url(card_model, format: :json)
end
