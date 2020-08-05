class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(deposit_money)
    @balance += deposit_money
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end 
  
  def close_account
    @status = 'closed'
  end 
  
  def valid?
    status == 'open' && balance > 0
  end
end 