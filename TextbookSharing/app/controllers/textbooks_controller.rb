class TextbooksController < ApplicationController
  before_action :authenticate_user!, except: [:welcome]

  def index
    if params[:q]
      @textbooks = Textbook.search((params[:q].present? ? params[:q] : '*')).records
    else
      @textbooks = Textbook.all.order('created_at DESC')
    end
  end

  def new
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
      params.require(:textbook).permit(:title, :author, :isbn, :price)
    end
end
