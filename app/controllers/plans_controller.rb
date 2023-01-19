class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params.require(:plan).permit(:title, :start_date, :end_date, :checkbox, :memo))
    if @plan.save
      flash[:notice] = "プランを登録しました"
      redirect_to plans_path
    else
      render "new"
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(params.require(:plan).permit(:title, :start_date, :end_date, :checkbox, :memo))
      flash[:notice] = "ユーザー#{@plan.id}が内容を変更しました"
      redirect_to plan_path(@plan)
    else
      render "edit"
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to plans_path
  end
end
