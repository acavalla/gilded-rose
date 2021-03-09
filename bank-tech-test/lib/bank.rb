# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'
# This class initializes with a balance and a transactions array
class Bank
  attr_reader :balance, :transactions, :statement

  def initialize
    @balance = 0
    @transactions = []
    # @statements = []
  end

  def transaction(amount, date)
    adjust_balance(amount)
    new_transaction(amount, date)
  end

  def create_statement
    @statement = Statement.new(@transactions)
    statement.print
  end

  private

  attr_writer :balance

  def adjust_balance(amount)
    self.balance += amount
  end

  def new_transaction(amount, date)
    transactions << Transaction.new(amount, date, balance)
  end
end
