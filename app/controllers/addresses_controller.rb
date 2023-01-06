class AddressesController < ApplicationController
  before_action :authenticate

  before_action :set_person
  before_action :set_address, only: [:show, :update, :destroy, :edit]

  def index
    @addresses = Address.all
  end

  def show
    respond_to do |format|
      format.html
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
        format.js # render create.js.erb
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def update
    @addresses = @person.addresses

    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @person, notice: "Address was successfully updated." }
        format.js # render update.js.erb
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    id = @address.id
    @address.destroy

    prev_id = nil
    @person.addresses.each do |address|
      break if address.id > id
      prev_id = address.id
    end

    if prev_id != nil
      @address = @person.addresses.find(prev_id)
    else
      @address = @person.addresses.first
    end

    respond_to do |format|
      format.html { redirect_to @person, notice: "Address was successfully destroyed.", status: :see_other }
      format.js # render destroy.js.erb
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
