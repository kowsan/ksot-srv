json.array!(@issues) do |issue|
  json.extract! issue, :id, :belongs_to, :belongs_to, :belongs_to, :close_date
  json.url issue_url(issue, format: :json)
end
