module TasksHelper

	def task_belongs_to?(user, task)
		user == task.id
	end

end
