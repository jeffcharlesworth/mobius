class User < ActiveRecord::Base
  has_many :transactions
  after_create :initial_credits

  validates :email, length: { minimum: 3, maximum: 254 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  private
  def initial_credits
    Transaction.create!(:to_user_id => self.id, :num_credits => 100)
  end
end
