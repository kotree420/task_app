class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title,:start_date,:end_date,:all_day,:schedule_memo))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました" #ハッシュで格納し、ビューで呼び出す。
      redirect_to :schedules
    else
      render :new #指定したアクションが動く。
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title,:start_date,:end_date,:all_day,:schedule_memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end
end
