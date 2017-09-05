class Api::V1::UsersController < ApiController
before_action :logged_in

  def index
    email_balance = {}
    email_balance[:email] = current_user.email
    email_balance[:balance] = current_user.balance
    render json: email_balance
  end

  private
  def logged_in
     render json: "Please log in", status: 401 unless current_user
  end
end
