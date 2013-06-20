class Task < ActiveRecord::Base
  attr_accessible :created, :description, :estimate, :job, :name, :priority, :user_id, :worker_id
end
