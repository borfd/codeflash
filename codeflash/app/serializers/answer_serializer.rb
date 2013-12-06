class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :code
  embed :ids, include: true
end
