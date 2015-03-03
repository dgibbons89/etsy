json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :title, :url
  json.url lesson_url(lesson, format: :json)
end
