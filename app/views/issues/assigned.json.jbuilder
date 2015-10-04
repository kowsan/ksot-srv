json.array!(@issues) do |issue|
  #json.extract! issue, :id, :author, :created_at, :violator, :close_date
  json.id issue.id
  json.author issue.author.full_name
  json.created issue.created_at
  json.created_human issue.created_at.to_s
  json.violator issue.violator.full_name
  json.status issue.status.name
  json.issue_type issue.issue_type.name
  json.assigned issue.assigned.full_name

  json.due_date issue.due_date
  json.due_date_human issue.due_date.to_s || '-'

  json.workspace issue.work_space.name
  json.note_measures issue.note_measures
  json.edit_url edit_issue_path issue

  # json.edit_url issue_url(issue, format: :json)
end
