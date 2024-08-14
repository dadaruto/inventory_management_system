class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :amount)
  end
end

