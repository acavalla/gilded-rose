# frozen_string_literal: true

require_relative 'transaction'
# This class initializes with a balance and a transactions array
class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def transaction(amount, date)
    adjust_balance(amount)
    new_transaction(amount, date)
  end

  def statement
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

  # def print_statement
  #   puts 'date || credit || debit || balance' +
  #        (statement.empty? ? '' : "\n" + statement)
  # end

  private

  attr_writer :balance

  def adjust_balance(amount)
    self.balance += amount
  end

  def new_transaction(amount, date)
    transactions << Transaction.new(amount, date, balance)
  end

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
