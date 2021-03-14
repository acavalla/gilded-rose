# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'
# This class initializes with a balance and a transactions array
class Bank
  attr_reader :balance, :transactions, :statement, :transaction

  def initialize(transaction = Transaction, statement = Statement)
    @balance = 0
    @transactions = []
    @statement = statement
    @transaction_class = transaction
    @transactions = []
  end

  def make_transaction(amount, date)
    adjust_balance(amount)
    new_transaction(amount, date)
  end

  def create_statement
    statement.new.print(transactions)
  end

  private

  attr_writer :balance

  def adjust_balance(amount)
    self.balance += amount
  end

  def new_transaction(amount, date)
    transactions << @transaction_class.new(amount, date, balance)
  end
end
