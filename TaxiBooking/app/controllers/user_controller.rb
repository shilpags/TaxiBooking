class UserController < ApplicationController
  before_action ::authenticate_user!

	def new
    		@user = User.new 
  	end

	def login
		render :layout => false
	end

	def login_attempt
		user_name = params[:user_name]
                password = params[:password]

                existingUser = User.find_by_name(params[:user_name])
                flash[:message] = 'There are no user present with the entered name. please Register with new user' if existingUser.nil? and redirect_to :action => 'login'
                if user_name == existingUser.name and password == existingUser.password
                        render :partial => 'form',. :controller => 'bookings'
                end

	end

	def create      #Sign up by registering with newly user created
    		@user = User.new(params[:user])
    		if @user.save
      			flash[:notice] = "You have registerd successfully"
      			flash[:message]= "Kindly login to book a taxi"
			redirect_to :action => 'login_attempt'
    		else
      			flash[:notice] = "Form is invalid"
      			flash[:color]= "invalid"
    		end
    			render "new"
  	end

  	def save_card_info
    		@payment = Payment.new
		@payment.holder_name = params[:holder_name]
		@payment.card_number = params[:card_number]
		@payment.card_cvv = params[:card_cvv]
		@payment.card_expiry =  params[:card_expiry]
		@payment.user = @user

    		if @payment.save
      			@user.is_card_info_set = true
      		   	redirect_to :action => 'logout' if @user.save
    		else
      			flash[:error] = @payment.errors.full_messages.first
      			redirect_to :action => 'login'
    		end
	end

	def logout(message="You have Logged out Successfully.")

	 	 if session[:user_id] != nil
			 cookies.clear
			 reset_session
			 flash[:messgae] =  "You have made the payment successfully"
    	    		 redirect_to  :action => 'login' and return
  	 	 else
    	    		redirect_to :action => 'login' "You have not logged in"
  		 end
 	end

end
