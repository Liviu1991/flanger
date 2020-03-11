class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @instruments = Instrument.all.order("created_at desc")
  end

  def show

  end

  def new
    @instrument = current_user.instruments.build
  end

  def edit

  end

  def create
    @instrument = current_user.instruments.build(instrument_params)
    if @instrument.save
      redirect_to instruments_path
    else
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:brand, :model, :description, :condition, :finish, :title, :price, :image)
  end
end
