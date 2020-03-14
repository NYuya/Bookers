class BooksController < ApplicationController

  def index
  	@books = Book.all # 記事を全件取得
  	@book = Book.new

  end

  def show
  	@book = Book.find(params[:id])
  end

  #def new
  	#@book = Book.new
  #end

  def create
  	book = Book.new(book_params)
  	if book.save
        redirect_to book_path(book.id), notice : "successfully"
    else
    	render :new
    end

  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end


  private
    def book_params
      params.require(:book).permit(:title, :body)
    end


end


