class FlashcardSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :content, :result
  has_many :answers, key: :answers, root: :answers, embed: :objects
end
