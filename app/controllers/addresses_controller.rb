class AddressesController < ApplicationController
  before_action :set_person
  before_action :set_address, only: [:show, :update, :destroy, :edit]

  def index
    @addresses = Address.all
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @address }
    end
  end

  def new
    @address = @person.addresses.new

    respond_to do |format|
      format.js # render new.js.erb
    end
  end

  def create
    @address = @person.addresses.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to person_path(@person), notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @person, notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to @person, notice: "Address was successfully destroyed.", status: :see_other }
      format.json { head json: @address.errors }
    end
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
