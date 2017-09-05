class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
    @users = User.all
  end

  def create
    @transaction = Transaction.new( to_user_id: params[:to_user_id], from_user_id: current_user.id, num_credits: params[:transaction][:num_credits] )
    if @transaction.save
      flash[:notice] = "Credits sent"
      redirect_to root_path
    else
      flash[:alert] = "Unable to send credits"
      redirect_to root_path
    end
  end
end
