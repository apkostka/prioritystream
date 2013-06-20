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

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
