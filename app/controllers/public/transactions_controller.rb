class Public::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit]

  def new
    @transaction = Transaction.new
  end

  def index
    @transactions = Transaction.all
  end

  def show
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      redirect_to transactions_path, notice: '正常に登録されました'
    else
      render :new
    end
  end

  def edit
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :description, :transaction_type, :category_id, :date)
  end

  def set_transaction
    @transaction = current_user.transactions.find(params[:id])
  end
end
