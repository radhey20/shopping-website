class Project < ActiveRecord::Base
  attr_accessible :title, :resource_type, :resource_id
  validates :title, :presence => true
  has_many :tasks
  has_many :task_projects
end
