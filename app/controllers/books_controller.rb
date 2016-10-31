class BooksController < ApplicationController
  BookStruct = Struct.new(:asin, :title, :image_url, :url, :author)
  before_action :set_book, only: %i(show destroy)

#  def index
#    @books = Book.all
#  end

  def show
  end

  def new
#    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_url(@book)
    else
      redirect_to books_url
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  def search
    if params[:keyword].present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      books = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle",
      )

      # 本のタイトル,画像URL, 詳細ページURLの取得
      @books = []
      books.items.each do |item|
        book = BookStruct.new(
          item.get('ASIN'),
          item.get('ItemAttributes/Title'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL'),
          item.get('ItemAttributes/Author'),
        )
        @books << book
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:title, :author, :cover_uri, :asin)
  end
end
