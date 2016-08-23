class SessionsController < ApplicationController
	def create
		user = User.find_by(user_params)
		if user 
		 if  user.authenticate params[:user][:password]
			session[:user_id] = user.id
			redirect_to sessions_path
		else
			flash[:error] = "Bad Login"
			redirect_to root_path
		end
		else
			flash[:error] = "Bad Login"
			redirect_to root_path
		end
	end

	def index
		@user = User.find(session[:user_id])
	end

	private
	def user_params
		params.require(:user).permit(:email)
	end
end
