class Transaction < ActiveRecord::Base
  validates :num_credits, presence: true
  validates :to_user_id, presence: true
  before_create :balance_check
  after_create :update_balance
  belongs_to :user

  private
  def update_balance
    sending_user = User.find_by_id(self.from_user_id)
    receiving_user = User.find_by_id(self.to_user_id)
    receiving_user.update_attribute(:balance, receiving_user.balance + self.num_credits)
    if self.from_user_id
      sending_user.update_attribute(:balance, sending_user.balance - self.num_credits)
    end
  end

  def balance_check
    raise ActiveRecord::Rollback, "Number must be greater than 0" if self.num_credits < 0
    if self.from_user_id
      sending_user = User.find_by_id(self.from_user_id)
       if sending_user.balance < self.num_credits
         raise ActiveRecord::Rollback, "Insufficient Funds"
       end
     end
  end
end
