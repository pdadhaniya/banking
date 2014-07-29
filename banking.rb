

class Person #made the Person class

	attr_reader :name
	attr_accessor :cash_on_hand

	def initialize(name, cash_on_hand=0)
		@name = name
		@cash_on_hand = cash_on_hand
	end

end


class Bank #made the Bank class

	attr_reader :bank_name
	attr_reader :total_cash
	attr_reader :accounts

	def initialize(bank_name, total_cash=0)
		@bank_name = bank_name
		@total_cash = total_cash
		@accounts = Hash.new
	end

	def open_account(account_name)
		if @accounts[account_name.name]
			puts "#{account_name.name} already has an account at #{bank_name}! Can't have two!!"
		else
		@accounts[account_name.name] = 0
		puts "#{account_name.name}, thanks for opening an account at #{@bank_name}!"
		puts "#{account_name.name}'s account at #{@bank_name} is open with $#{@accounts[account_name.name]} saved!"
		end
	end

	def deposit(account_name, deposit_amount)
		@accounts[account_name.name] += deposit_amount
		account_name.cash_on_hand -= deposit_amount
		puts "#{account_name.name} deposited $#{deposit_amount} to #{bank_name}. #{account_name.name} has $#{account_name.cash_on_hand}. #{account_name.name}'s account has $#{@accounts[account_name.name]}."
	end

	def withdraw(account_name, withdraw_amount)
		@accounts[account_name.name] -= withdraw_amount
		account_name.cash_on_hand += withdraw_amount
		puts "#{account_name.name} withdrew #{withdraw_amount} from #{bank_name}. #{account_name.name} has $#{account_name.cash_on_hand}. #{account_name.name}'s account has $#{@accounts[account_name.name]}."
	end

end


# bob = Person.new("Bob", 1000)
# chase = Bank.new("JPM Chase", 0)
# chase.open_account(bob)
# chase.deposit(bob, 300)
# chase.withdraw(bob, 300)