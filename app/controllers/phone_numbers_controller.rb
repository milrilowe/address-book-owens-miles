class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  def index
    @phone_numbers = PhoneNumber.all
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @phone_number }
    end
  end

  def new
    @phone_number = @person.phone_numbers.new

    respond_to do |format|
      format.js # render new.js.erb
    end
  end

  def create
    @phone_number = @person.phone_numbers.new(phone_number_params)

    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to person_path(@person), notice: "Phone Number was successfully created." }
        format.json { render :show, status: :created, location: @phone_number }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def update
    @phone_number.update(phone_number_params)

    respond_to do |format|
      if @phone_number.update(phone_number_params)
          format.html { redirect_to @person, notice: "Phone Number was successfully updated." }
          format.json { render :show, status: :ok, location: @phone_number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @phone_number.destroy

    respond_to do |format|
      format.html { redirect_to @person, notice: "Phone Number was successfully destroyed.", status: :see_other }
      format.json { head json: @phone_number.errors }
    end
  end

  private
    def phone_number_params
      params.require(:phone_number).permit(:phone_number, :comment)
    end

    def set_phone_number
      @phone_number = PhoneNumber.find(params[:id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end
end
