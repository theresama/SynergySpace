class UserController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_user_type
end
