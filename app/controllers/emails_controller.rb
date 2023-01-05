class EmailsController < ApplicationController
  before_action :authenticate

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
        format.js # render create.js.erb
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
    @emails = @person.emails

    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @person, notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
        format.js # render update.js.erb
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    id = @email.id
    @email.destroy

    prev_id = nil
    @person.emails.each do |email|
      break if email.id > id
      prev_id = email.id
    end

    if prev_id != nil
      @email = @person.emails.find(prev_id)
    else
      @email = @person.emails.first
    end

    respond_to do |format|
      format.html { redirect_to @person, notice: "Email was successfully destroyed.", status: :see_other }
      format.json { head json: @email.errors }
      format.js # render destroy.js.erb
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
