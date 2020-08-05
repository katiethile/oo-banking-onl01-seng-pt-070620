require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :transfer_count
  def initialize(sender, receiver, amount = 50 )
    @sender = sender 
    @receiver = receiver
    @status = 'pending'
    @amount = amount
    @transfer_count = 0
  end 
  
  def valid?
    (sender.valid? && sender.balance > @amount) && receiver.valid?
  end
  
  def execute_transaction
    if sender.valid? && receiver.valid? && @transfer_count < 1
      if sender.balance < @amount
        self.status = 'rejected'
         return "Transaction rejected. Please check your account balance."
      end
    self.status = 'complete'
    @transfer_count += 1 
    sender.balance -= @amount
    receiver.balance += @amount
    elsif !sender.valid? || !receiver.valid? 
      self.status = 'rejected'
        return "Transaction rejected. Please check your account balance."
    end 
end

  def reverse_transfer
   if self.status = 'complete' 
     binding.pry
     self.status = 'reversed'
      @sender.balance += @amount
      @receiver.balance -= @amount
   end 
  end
end 