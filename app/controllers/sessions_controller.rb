class SessionsController < ApplicationController

def create
	user = User.find_by(email:login_params[:email])
	if user && user.authenticate(login_params[:password])
		session[:user_id] = user.id
		redirect_to '/contact'
	else
		flash[:login_errors] = ['invalid username or password']
		redirect_to '/'
	end

end
def destroy
	session[:user_id] = nil
	redirect_to '/', notice: 'Successfully logged out!'
end


private
def login_params
	params.require(:login).permit(:email,:password)
	end

end
