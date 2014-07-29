

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

	def initialize(bank_name, total_cash=0)
		@bank_name = bank_name
		@total_cash = total_cash
	end

end
