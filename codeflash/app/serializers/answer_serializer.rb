class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :code, :correct, :raycode, :result
  embed :ids, include: true
end
