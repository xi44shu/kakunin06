class SchedulesController < ApplicationController

  def index
    get_week    
    @teams = Team.where(work: '1')
    @schedules = Schedule.where(scheduled_date: @todays_date..@todays_date + 6)

  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
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
    if @schedule.update(schedule_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
      @schedule = Schedule.find(params[:id])
      @schedule.delete
      redirect_to root_path
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:scheduled_date, :time_zone_id, :team_id, :size_id, :mie_id, :accuracy_id, :first_contact_id).merge(user_id: current_user.id)
  end  

  def get_week
    # カレンダーに日付データ曜日を持たせる
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']
    @todays_date = Date.today

    @week_days = []

    7.times do |x|

      wday_num = Date.today.wday + x
      if  wday_num >= 7
        wday_num = wday_num -7
      end

      today_days = { scheduled_date:(@todays_date + x), month: (@todays_date + x).month, date: (@todays_date + x).day, wday:  wdays[wday_num]}

      @week_days.push(today_days)
    end
  end


end
