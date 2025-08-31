class Workspace < ApplicationRecord
  # Add validation to ensure subjects field is not empty
  validates :subjects, presence: true, length: { minimum: 1 }
  
  # Add this for Action Text support (rich text notes)
  has_rich_text :notes
end

