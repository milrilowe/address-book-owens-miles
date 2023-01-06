class Api::V1::PeopleController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate
  before_action :set_person, only: [:show, :update, :destroy]
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  before_action :validate_date, only: [:create, :update]

  def index
    @people = Person.all

    render json: @people, include: [:addresses, :emails, :phone]
  end

  def show
    if @person
      render json: @person
    else
      render json: { error: "Person not found" }, status: 404
    end
  end

  def create
    @person = Current.user.people.new(person_params)
    render json: {message: "Hello World"}
    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)

      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  private
    def set_person
      begin
        @person = Person.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @person = nil
      end
    end

    def person_params
      valid_params = params.require(:person).permit(
        :salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment,
        addresses: [:id, :street, :town, :zip_code, :state, :country],
        emails: [:id, :email_address, :comment],
        phone: [:id, :phone_number, :comment]
      ).to_h

      if valid_params[:birth_date] != ""
        date = valid_params[:birth_date].split("/")
        valid_params[:birth_date] = Date.parse(date[2]+date[0]+date[1])
      end
      valid_params
    end

    def validate_date
      date = params[:person][:birth_date]

      if date && date != ""
        begin
          date = date.split("/")
          Date.parse(date[2] + date[0] + date[1])
        rescue ArgumentError
          render json: { error: "Mal-formed data" }, status: 400
        end
      end
    end

    def authorize
      people = Current.user.people.find_by(id: params[:id])

      if people.nil?
        if Person.find_by(id: params[:id]).nil?
          redirect_to root_path, notice: "Unable to find person with that id."
        else
          redirect_to root_path, notice: "You are not authorized to use this page."
        end
      end
    end
end