class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    kitten = Kitten.new(kitten_params)

    if kitten.save
      redirect_to root_path, notice: 'Your kitten was successfuly registered'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to root_path, notice: 'Your kitten was successfuly edited'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    kitten = Kitten.find(params[:id])
    
    if kitten.destroy
      redirect_to root_path, notice: 'Your kitten was deleted'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def kitten_params
    params.require(:kittens).permit(:name, :age, :cuteness, :softness)
  end
end
