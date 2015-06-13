json.array!(@managements) do |management|
  json.extract! management, :id
  json.url management_url(management, format: :json)
end
