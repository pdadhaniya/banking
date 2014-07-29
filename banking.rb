

class Person #made the Person class

	attr_reader :name
	attr_accessor :cash_on_hand

	def initialize(name, cash_on_hand=0)
		@name = name
		@cash_on_hand = cash_on_hand
		puts "Hi, #{@name}. You have $#{@cash_on_hand}!"
	end

end


class Bank #made the Bank class

	attr_reader :bank_name
	attr_accessor :accounts

	def initialize(bank_name)
		@bank_name = bank_name
		@accounts = Hash.new
		puts "#{@bank_name} bank was just created."
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
		if (account_name.cash_on_hand - deposit_amount) < 0
			puts "#{account_name.name} does not have enough cash to deposit $#{deposit_amount}."
		else
			@accounts[account_name.name] += deposit_amount
			account_name.cash_on_hand -= deposit_amount
			puts "#{account_name.name} deposited $#{deposit_amount} to #{bank_name}. #{account_name.name} has $#{account_name.cash_on_hand}. #{account_name.name}'s account has $#{@accounts[account_name.name]}."
		end
	end

	def withdraw(account_name, withdraw_amount)
		if (@accounts[account_name.name] - withdraw_amount) < 0
			puts "#{account_name.name} does not have enough money in the account to withdraw $#{withdraw_amount}."
		else
			@accounts[account_name.name] -= withdraw_amount
			account_name.cash_on_hand += withdraw_amount
			puts "#{account_name.name} withdrew $#{withdraw_amount} from #{bank_name}. #{account_name.name} has $#{account_name.cash_on_hand}. #{account_name.name}'s account has $#{@accounts[account_name.name]}."
		end
	end

	def transfer(account_name, recipient_bank, transfer_amount)
		@accounts[account_name.name] -= transfer_amount
		recipient_bank.accounts[account_name.name] += transfer_amount
		puts "#{account_name.name} transferred $#{transfer_amount} from the #{bank_name} account to the #{recipient_bank.bank_name} account. The #{bank_name} account has $#{@accounts[account_name.name]} and the #{recipient_bank.bank_name} account has $#{recipient_bank.accounts[account_name.name]}."
	end

	def total_cash_in_bank
		array_of_values = @accounts.values
		grand_total = array_of_values.inject(0) { |sum, a| sum + a }
		"#{bank_name} has $#{grand_total} in the bank."
	end
end

chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Shehzan", 500)
friend1 = Person.new("John", 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)
chase.transfer(me, wells_fargo, 100)

chase.deposit(me, 5000)
chase.withdraw(me, 5000)

puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank