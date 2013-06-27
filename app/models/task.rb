# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  job         :string(255)
#  hours       :integer
#  due         :datetime
#  complete    :boolean
#  user_id     :integer
#  worker_id   :integer
#  priority    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :complete, :description, :due, :hours, :job, :name, :priority, :user_id, :worker_id

  belongs_to :user
  belongs_to :worker

  validates :user_id, presence: true
  validates :description, length: { maximum: 240 }
  validates :hours, presence: true
  validates :name, presence: true

  default_scope order: 'tasks.priority ASC'
end
