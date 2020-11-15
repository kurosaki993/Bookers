class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
      @book = Book.new(book_params)
      @book.save
    if @book.id == nil
      @books = Book.all
      flash[:danger] = 'error'
      render 'index'
    else
    redirect_to book_path(@book.id)
    flash[:success] = 'successfully'
    end
  end
  def create
     @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'successfully'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:danger] = 'error'
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    flash[:success] = 'successfully'
    redirect_to book_path(book.id)
    else
      @books = Book.all
      flash[:danger] = 'error'
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end