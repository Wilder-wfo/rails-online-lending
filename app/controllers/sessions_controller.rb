class SessionsController < ApplicationController
	def new
	end

	def login
	end

	def create
		if user = Lender.find_by(email: params[:email])
   			if user && user.authenticate(params[:password])
     			session[:user_id] = user.id
     			redirect_to "/lenders"
   			else
	     		flash[:errors] = ["Invalid"]
	     		redirect_to "/sessions/login"
   			end
   		else 
   			if user = Borrower.find_by(email: params[:email])
				if user && user.authenticate(params[:password])
     				session[:user_id] = user.id
     				redirect_to "/borrowers"
   				else
	     			flash[:errors] = ["Invalid"]
	     			redirect_to "/sessions/login"
   				end
   			end
   		end
 	end

 	 def logout
 		session[:user_id] = nil
 		redirect_to '/sessions/new'
 	end

end
