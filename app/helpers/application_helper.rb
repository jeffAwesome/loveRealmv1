module ApplicationHelper
	def followers_count (user_id)
		if(params[:id])
			user_id = params[:id]
		end
		
		return Follow.count('id', :conditions => "followable_id = "+user_id.to_s)
	end
	def following_count (user_id)
		if(params[:id])
			user_id = params[:id]
		end	
		return Follow.count('id', :conditions => "follower_id = "+user_id.to_s)
	end
	
end
