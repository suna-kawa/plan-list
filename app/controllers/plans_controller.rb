class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(post_params)
    if @plan.save
      flash[:success] = "プランを登録しました"
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
    if @plan.update(post_params)
      flash[:info] = "ユーザー#{@plan.id}が内容を変更しました"
      redirect_to plan_path(@plan)
    else
      render "edit"
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:info] = "ユーザーを削除しました"
    redirect_to plans_path
  end

  private

  def post_params
    params.require(:plan).permit(:title, :start_date, :end_date, :checkbox, :memo)
  end
end
