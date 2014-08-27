json.array!(@flashcards) do |flashcard|
  json.extract! flashcard, :id
  json.url flashcard_url(flashcard, format: :json)
end
