class HomeController < ApplicationController
  def index
  	@book=Book.all
  	@it=Book.where(facility: 'Cong Nghe Thong Tin').limit(3)
  	@dt=Book.where(facility: 'Dien Tu Vien Thong').limit(3)
  	@tdh=Book.where(facility: 'Tu Dong Hoa').limit(3)
  end
  def video
  	
  end

  def show
  	@book=Book.find(params[:id])
  	
  end

  def search
    @book=Book.search(params[:search])
  end

  def faci
    @book=Book.where(facility: params[:facility])
  end
end
