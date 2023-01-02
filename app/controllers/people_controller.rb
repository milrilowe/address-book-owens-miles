class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    # Return sorted by last name
    @people = Person.all.order(:last_name)
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def show
    @person = Person.find(params[:id])
    @addresses = @person.addresses
    @emails = @person.emails
    @phone_numbers = @person.phone_numbers
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to @person
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

  private
    def person_params
      params.require(:person).permit(:salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment)
    end

    def set_person
      @person = Person.find(params[:id])
    end
end
