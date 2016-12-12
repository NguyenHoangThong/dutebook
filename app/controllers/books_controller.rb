class BooksController < ApplicationController
	before_action :authenticate_user! ,:except => [:show]
	#resources :book
	#before_action :find_user, only: [:show]

  def show
  	
  	#@book=Book.find(books_params[:id])
  	@book = Book.where(id: params[:id]).first
  end
  
  def index
    @books = current_user.books.all
  end

  def new
    @book = Book.new
    @Fcl=["Cong Nghe Thong Tin","Dien Tu Vien Thong","Tu Dong Hoa"]
  end

  def create
    @book =current_user.books.build(photo_params)
    #@book.user_id= current_user.id
    if @book.save
      flash[:success] = "your book were added!"
      redirect_to books_index_path
    else
      render 'new'
    end
  end

  def destroy
  	current_user.books.find_by(books_params[:id]).destroy
  	#@book = Book.where(id: books_params[:id]).first
  	#@book.destroy
  	flash[:success]="deleted"
  	redirect_to(:back)
  end

  private

  def photo_params
    params.require(:book).permit(:image, :title, :facility, :content, :document)
  end
  def bookparams
    params.permit!
    params.require(:book).permit(:id)
  end

  def books_params
    params.permit(:id, :image, :title, :facility, :content, :document)
  end

  def find_book
  	find_user.books.find(params[:id])
  end
  def find_user
  	User.find(params[:user_id])	
  end
end
