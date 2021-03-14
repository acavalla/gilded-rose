# frozen_string_literal: true

# Takes care of the printing of statements when given recent transactions
class Statement
  attr_reader :transactions

  # def initialize(transactions)
  #   @transactions = transactions
  # end

  def print(transactions)
    puts "date || credit || debit || balance#{calculate(transactions).empty? ? '' : "\n#{calculate(transactions)}"}"
  end

  def calculate(transactions)
    str = []
    transactions.reverse_each do |transaction|
      str << if transaction.amount.positive?
               deposit(transaction)
             else
               withdrawal(transaction)
             end
    end
    str.join("\n")
  end

  private

  def withdrawal(transaction)
    "#{transaction.date} || || "\
    "#{-transaction.amount} || "\
    "#{transaction.current_balance}"
  end

  def deposit(transaction)
    "#{transaction.date} || "\
    "#{transaction.amount} || || "\
    "#{transaction.current_balance}"
  end
end
