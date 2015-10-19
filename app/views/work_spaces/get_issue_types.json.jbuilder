json.array!(@issue_types) do |i|
  json.extract! i, :id,  :name
  json.critical_type i.critical_type

end
