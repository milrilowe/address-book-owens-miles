class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: [:index, :show, :new, :create, :edit]

  def index
    @addresses = Address.all
  end

  def show

  end

  def new
    @address = Address.new
  end

  def create
    @address = @person.addresses.new(address_params)

    if @address.save
      redirect_to person_path(@person)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @address.update(address_params)

    if @address.update
      redirect_to @address
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy

    redirect_to addresses_path
  end

  private
    def address_params
      params.require(:address).permit(:street, :town, :zip_code, :state,  :country, :person_id)
    end

    def set_address
      @address = Address.find(params[:id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end

end
