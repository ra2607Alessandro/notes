class Notes < ApplicationRecord
  belongs_to :subjects
  belongs_to :workspaces
end
