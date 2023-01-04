class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  def index
    @emails = Email.all
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @email }
    end
  end

  def new
    @email = @person.emails.new

    respond_to do |format|
      format.js # render new.js.erb
    end
  end

  def create
    @email = @person.emails.new(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to person_path(@person), notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def update
    @email.update(email_params)

    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @person, notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to @person, notice: "Email was successfully destroyed.", status: :see_other }
      format.json { head json: @email.errors }
    end
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
