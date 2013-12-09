class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :code, :correct
  embed :ids, include: true
end
