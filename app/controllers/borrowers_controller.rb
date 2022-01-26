class BorrowersController < ApplicationController
	def create
		borrower = Borrower.new(borrower_params)
		if borrower.save
			redirect_to "/sessions/login"
		else
			flash[:errors] = borrower.errors.full_messages
			redirect_to "/sessions/new"
		end
	end

	def show
		@borrower = Borrower.find(session[:user_id])
	end

	private
	def borrower_params
		params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money, :description, :purpose)
  	end	
end
