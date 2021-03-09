# frozen_string_literal: true

# Takes care of the printing of statements when given recent transactions
class Statement
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def print
    puts "date || credit || debit || balance#{calculate.empty? ? '' : "\n#{calculate}"}"
  end

  def calculate
    str = []
    transactions.reverse_each do |transaction|
      str << if transaction.details['amount'].positive?
               deposit(transaction)
             else
               withdrawal(transaction)
             end
    end
    str.join("\n")
  end

  private

  def withdrawal(transaction)
    "#{transaction.details['date']} || || "\
    "#{-transaction.details['amount']} || "\
    "#{transaction.details['current_balance']}"
  end

  def deposit(transaction)
    "#{transaction.details['date']} || "\
    "#{transaction.details['amount']} || || "\
    "#{transaction.details['current_balance']}"
  end
end
