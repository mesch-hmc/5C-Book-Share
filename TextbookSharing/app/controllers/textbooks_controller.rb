class TextbooksController < ApplicationController
  def index
    @textbooks = Textbook.all.order('created_at DESC')      
  end

  def new
  end

  def create
    @textbook = Textbook.new(textbook_params)

    if @textbook.save
      redirect_to textbooks_path
    else
      render 'new'
    end
  end

  private
    def textbook_params
      params.require(:textbook).permit(:title, :author, :isbn, :college, :email, :fblink, :price, :sold)
    end
end
