class DebtsController < ApplicationController
  def index
    @debts = Debt.all
  end

  def new
    @debt = Debt.new
  end

  def create
    @debt = Debt.new(debt_params)
    if @debt.save
      redirect_to debts_path, notice: 'Debt was successfully created.'
    else
      render :new
    end
  end

  private

  def debt_params
    params.require(:debt).permit(:description, :amount)
  end
end

