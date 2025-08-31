class Workspace < ApplicationRecord
  has_many :subjects 
  has_many :notes 
end

