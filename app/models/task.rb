# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  job         :string(255)
#  estimate    :integer
#  user_id     :integer
#  worker_id   :integer
#  created     :datetime
#  priority    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :created, :description, :estimate, :job, :name, :priority, :user_id, :worker_id

  belongs_to :user
  belongs_to :worker
end
