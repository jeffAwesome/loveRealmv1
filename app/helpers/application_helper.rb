module ApplicationHelper
	def followers_count ()
		if(params[:id])
			user_id = params[:id]
		else
			user_id = current_user.id
		end
		
		return Follow.count('id', :conditions => "followable_id = "+user_id.to_s)
	end
	def following_count ()
		if(params[:id])
			user_id = params[:id]
		else
			user_id = current_user.id
		end	
		return Follow.count('id', :conditions => "follower_id = "+user_id.to_s)
	end
	
end
