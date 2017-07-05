class BankAccount
  @@interest_rate = 0.15
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    return @balance
  end

  def balance=(balance)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw (amount)
    @balance -= amount
  end

  def self.create
    individual_account = BankAccount.new
    @@accounts << individual_account
    return individual_account
  end

  def self.total_funds
    sum = 0
    @@accounts.each do |account|
      sum += account.balance
    end
    puts sum
  end

  def self.interest_time
    @@accounts.each do |account|
       account.balance= account.balance * (1 + @@interest_rate)
       puts account.balance
  end
end
end

account_1 = BankAccount.create
account_1.deposit(150)
account_2 = BankAccount.create
account_2.deposit(3000)
account_1.withdraw(100)

BankAccount.total_funds
BankAccount.interest_time 
