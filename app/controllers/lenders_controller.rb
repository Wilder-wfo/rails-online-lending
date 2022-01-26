class LendersController < ApplicationController
	def create
		lender = Lender.new(lender_params)
		if lender.save
			redirect_to "/sessions/login"
		else
			flash[:errors] = lender.errors.full_messages
			redirect_to "/sessions/new"
		end
	end

	def show
		@lender = Lender.find(session[:user_id])
		@borrowers = Borrower.all
		@lends = @lender.lends
	end

	def update
		# fail
		lender = Lender.find(session[:user_id])
		borrower = Borrower.find(params[:id])
		if lender.money == 0
			flash[:errors] = ['You cannot lend money']
			redirect_to "/lenders"
		else
			l = 0
			l = lender.money.to_i - lender_params[:money].to_i
			lender.money = l
			lender.save
			b = 0
			b = borrower.raised.to_i + lender_params[:money].to_i
			borrower.raised = b
			borrower.save
			if lend = Lend.find_by(lender_id: session[:user_id], borrower_id: params[:id])
				amt = 0
				amt = lend.amount.to_i + lender_params[:money].to_i
				lend.amount = amt
				lend.save
				redirect_to "/lenders"
			else
				Lend.create(amount: lender_params[:money], lender_id: session[:user_id], borrower_id: params[:id])
				redirect_to "/lenders"
			end
		end
	end

	private
	def lender_params
		params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money)
  	end	
end
