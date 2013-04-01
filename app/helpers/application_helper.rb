module ApplicationHelper
	def formatted_date(date)
		date.strftime("%b %d, %Y")
	end

	def formatted_date_short(date)
		date.to_date.to_s()
	end	

	def formatted_date_time(date)
		date.to_s(:db)
	end		

	def is_admin_user?
		true
	end
end
