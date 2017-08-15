class User < ActiveRecord::Base


	def get_user_data
		params = { 
			group_id: 
      format: 'json',
      page: '50'}
    meetup_api = MeetupApi.new
    events = meetup_api.members(params)
	end
end