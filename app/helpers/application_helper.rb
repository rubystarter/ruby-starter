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
		if user_signed_in? && current_user.user_type==10
			true
		else
			false
		end
	end
end
