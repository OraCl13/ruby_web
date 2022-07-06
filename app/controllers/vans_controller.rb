class VansController < ApplicationController
  before_action :find_train, only: [:create, :new]

  def new
    @van = @train.vans.build
  end

  def create
    @van = @train.vans.build(van_params)
    if @van.save
      redirect_to @train, note: 'Van successfuly created!'
    else
      render :new
    end
  end

  private

  def van_params
    params.require(:van).permit(:top_seats, :kind, :bottom_seats)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end
end
