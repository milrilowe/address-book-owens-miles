class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: [:show, :new, :create, :edit, :update]

  def index
    @phone_numbers = PhoneNumber.all
  end

  def show

  end

  def new
    @phone_number = @person.phone_numbers.new
  end

  def create
    @phone_number = @person.phone_numbers.new(phone_number_params)

    if @phone_number.save
      redirect_to person_path(@person)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @phone_number.update(phone_number_params)

    if @phone_number.update(phone_number_params)
      redirect_to @person
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @phone_number.destroy

    redirect_to addresses_path
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
