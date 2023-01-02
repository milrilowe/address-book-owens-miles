class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @emails = Email.all
  end

  def show

  end

  def new
    @email = @person.emails.new
  end

  def create
    @email = @person.emails.new(email_params)

    if @email.save
      redirect_to person_path(@person), notice: "Email was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @email.update(email_params)

    if @email.update(email_params)
      redirect_to @person, notice: "Email was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @email.destroy

    redirect_to @person, notice: "Email was successfully destroyed.", status: :see_other
  end

  private
    def email_params
      params.require(:email).permit(:email_address, :comment)
    end

    def set_email
      @email = Email.find(params[:id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end

end
