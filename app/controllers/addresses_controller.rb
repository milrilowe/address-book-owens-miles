class AddressesController < ApplicationController
  before_action :set_person
  before_action :set_address, only: [:show, :edit, :update, :destroy]

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
      redirect_to person_path(@person), notice: "Address was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @address.update(address_params)
      redirect_to @person, notice: "Address was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy

    redirect_to @person, notice: "Address was successfully destroyed.", status: :see_other
  end

  private
    def address_params
      params.require(:address).permit(:street, :town, :zip_code, :state,  :country, :person_id)
    end

    def set_address
      @address = @person.addresses.find(params[:id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end

end
