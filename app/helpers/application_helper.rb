module ApplicationHelper

	# Returns default page title if none is specified
	def full_title(page_title)
		base_title = "PriorityStream: What's Hot?"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

end
