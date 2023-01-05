class PeopleController < ApplicationController
  before_action :authenticate

  before_action :set_person , only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:show, :edit, :update, :destroy]

  def index
    @people = Current.user.people
    @person = Person.new
  end

  def create
    @person = Current.user.people.new(valid_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "<%= Current.user %>" }
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
    @person.birth_date = @person.birth_date.strftime("%m/%d/%Y")

    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def show
    @person = Current.user.people.find(params[:id])
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
    respond_to do |format|
      if @person.update(valid_params)
        format.js # render update.js.erb
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
      format.html { redirect_to root_path, notice: "Person was successfully destroyed.", status: :see_other }
      format.json { render json: @person.errors }
    end
  end

  private
    def person_params
      params.require(:person).permit(:salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment)
    end

    def set_person
      @person = Current.user.people.find_by(id: params[:id])
    end

    def authorize
      people = Current.user.people.find_by(id: params[:id])

      if people.nil?
        if Person.find_by(id: params[:id]).nil?
          redirect_to root_path, notice: "Unable to find person with that id."
        else
          redirect_to root_path, notice: "You are not authorized to view this page."
        end
      end
    end

    def valid_params
      parameters = person_params.to_h
      date = parameters[:birth_date]
      mmddyyyy = date.split("/")
      begin
        parameters[:birth_date] = Date.parse(mmddyyyy[2] + mmddyyyy[0] + mmddyyyy[1])
        return parameters
      rescue ArgumentError
        redirect_to root_path, notice: "Invalid date format. Please use MM/DD/YYYY."
      end
    end
end
