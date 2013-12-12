class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :code, :correct, :raycode
  embed :ids, include: true
end
