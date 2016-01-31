class TextbooksController < ApplicationController

  def index
    check_access
    @textbooks = Textbook.all.order('created_at DESC')
  end

  def new
    check_access
    @textbook = Textbook.new
  end

  def create
    @textbook = Textbook.new(textbook_params)

    respond_to do |format|
      if @textbook.save
        format.html { redirect_to textbooks_path, notice: 'Texbook entry was successfully created.' }
        format.json { render :show, status: :created, location: @textbook }
      else
        format.html { render :new }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  def welcome
    session[:access] = false
  end

  def welcome_check
    @email = params[:textbook][:email]
    @check =  (@email.end_with? "@g.hmc.edu") ||  (@email.end_with? "@hmc.edu") ||
    (@email.end_with? "@pomona.edu") || (@email.end_with? "@scrippscollege.edu") ||
    (@email.end_with? "@claremontmckenna.edu") || (@email.end_with? "@pitzer.edu")

    if @check
      can_access
      redirect_to textbooks_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @textbook = Textbook.find(params[:id])

    if @textbook.email == params[:textbook][:email_confirmation]
      @textbook.destroy
      redirect_to textbooks_path
    else
      redirect_to root_path
    end
  end

  private
    def textbook_params
      params.require(:textbook).permit(:title, :author, :isbn, :college, :email, :fblink, :price, :sold)
    end

    def check_access
      if !session[:access]
        redirect_to root_path
      end
    end

    def can_access
      session[:access] = true
    end
end
