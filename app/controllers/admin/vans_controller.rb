class Admin::VansController < Admin::BaseController
  before_action :find_train, only: [:create, :new]
  before_action :find_van, only: [:show]

  def new
    @van = @train.vans.build
  end

  def show
  end

  def create
    @van = @train.vans.build(van_params)
    if @van.save
      redirect_to [:admin, @train], note: 'Van successfuly created!'
    else
      render :new
    end
  end

  private

  def van_params
    params.require(:van).permit(:top_seats, :type, :bottom_seats,
                                :side_top_seats, :side_bottom_seats, :econom_seats)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end

  def find_van
    @van = Van.find(params[:id])
  end
end
