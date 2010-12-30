class UsersController < ApplicationController

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome to the sample application!"
			sign_in @user
			redirect_to @user
		else
			@title = "Sign up"
			@user.password = ""
			@user.password_confirmation = ""
			render 'new'
		end
	end

  def new
  	@title = "Sign up"
  	@user = User.new
  end
	
	def show
		@user = User.find(params[:id])
		@title = @user.name
	end
end