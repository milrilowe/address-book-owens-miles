class Api::V1::PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy]

  def index
    @people = Person.all

    render json: @people.to_json(
      include: [
        :addresses => { only: [:id, :street, :town, :zip_code, :state, :country] },

        :emails => { only: [:id, :email_address, :comment] },

        :phone_numbers => { only: [:id, :phone_number, :comment] }
      ]
    )
  end

  def show
    render json: @person.to_json(
      include: [
        :addresses => { only: [:id, :street, :town, :zip_code, :state, :country] },

        :emails => { only: [:id, :email_address, :comment] },

        :phone_numbers => { only: [:id, :phone_number, :comment] }
      ]
    )
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person.to_json(
        include: [
          :addresses => { only: [:id, :street, :town, :zip_code, :state, :country] },

          :emails => { only: [:id, :email_address, :comment] },

          :phone_numbers => { only: [:id, :phone_number, :comment] }
        ]
      ), status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)
      render json: @person.to_json(
        include: [
          :addresses => { only: [:id, :street, :town, :zip_code, :state, :country] },

          :emails => { only: [:id, :email_address, :comment] },

          :phone_numbers => { only: [:id, :phone_number, :comment] }
        ]
      )
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(
        :salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment,
        addresses: [:id, :street, :town, :zip_code, :state, :country],
        emails: [:id, :email_address, :comment],
        phone: [:id, :phone_number, :comment]
      )
    end
end