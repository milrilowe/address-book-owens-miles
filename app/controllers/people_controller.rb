class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @person = Person.new

    respond_to do |format|
      format.js # render new.js.erb
    end
  end

  def edit
    @person = Person.find(params[:id])

    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def show
    @person = Person.find(params[:id])
    @addresses = @person.addresses
    @emails = @person.emails
    @phone_numbers = @person.phone_numbers
    @address = Address.new
    @email = Email.new
    @phone_number = PhoneNumber.new

    respond_to do |format|
      format.html
      format.json { render json: @person }
    end

  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_path, notice: "Person was successfully destroyed.", status: :see_other }
      format.json { render json: @person.errors }
    end
  end

  private
    def person_params
      params.require(:person).permit(:salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment)
    end

    def set_person
      @person = Person.find(params[:id])
    end
end
