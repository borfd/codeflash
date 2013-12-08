class FlashcardSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :description, :result
  has_many :answers, embed: :ids
end
