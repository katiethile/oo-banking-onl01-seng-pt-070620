class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount = 50 )
    @sender = sender 
    @receiver = receiver
    @status = 'pending'
    @amount = amount
    @transfer_count = 0
  end 
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if sender.valid? && receiver.valid? && transfer_count < 1
    self.status = 'complete'
  else
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end 
end
end