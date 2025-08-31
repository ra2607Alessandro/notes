json.extract! workspace, :id, :subjests, :notes, :created_at, :updated_at
json.url workspace_url(workspace, format: :json)
json.notes workspace.notes.to_s
