class TextbooksController < ApplicationController

  def index
    check_access
    @textbooks = Textbook.all.order('created_at DESC')
  end

  def new
    check_access
  end

  def create
    @textbook = Textbook.new(textbook_params)

    if @textbook.save
      redirect_to textbooks_path
    else
      render 'new'
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
