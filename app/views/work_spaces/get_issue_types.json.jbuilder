json.array!(@issue_types) do |i|
  json.extract! i, :id,  :name

end
