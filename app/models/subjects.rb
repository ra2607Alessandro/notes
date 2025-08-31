class Subjects < ApplicationRecord
  belongs_to :workspaces
  broadcasts_to :notes

end