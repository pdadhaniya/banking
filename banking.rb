

class Person #made the Person class

	attr_reader :name
	attr_reader :cash_on_hand

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
		if @accounts[account_name]
			puts "#{account_name.name} already has an account at #{bank_name}! Can't have two!!"
		else
		@accounts[account_name.name] = 0
		puts "#{account_name.name}, thanks for opening an account at #{@bank_name}!"
		puts "#{account_name.name}'s account at #{@bank_name} is open with $#{@accounts[account_name.name]} saved!"
		end
	end

end
