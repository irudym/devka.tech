json.array! @questions do |question|
  json.id question.id
  json.title question.title
  json.description question.description
  json.created_at question.created_at
  json.user do
    json.id question.user.id
    json.nickname question.user.nickname
  end
  json.tags do
    json.array! question.tags do |tag|
      json.id tag.id
      json.text tag.text
    end
  end
end