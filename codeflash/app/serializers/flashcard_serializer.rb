class FlashcardSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :content, :result
  has_many :answers, embed: :ids
end
