json.array!(@issue_types) do |issue_type|
  json.extract! issue_type, :id, :name
  json.crit_name issue_type.critical_type.name
  json.color issue_type.critical_type.color
  json.is_enabled issue_type.is_enabled?
  json.url issue_type_url(issue_type)
end
