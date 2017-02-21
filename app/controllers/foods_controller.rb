class FoodsController < ApplicationController

  def index
   @foods = Food.all
  end 

  def show
    @food = Food.find(params[:id])
  end 

  def new


  end
    
  def create
    @food = Food.create({ingredient: params[:ingredients], spice: params[:spice], measurement: params[:measurement]}) 
  
   redirect_to "/foods/#{@food["id"]}"
  end 
     
    
  def edit
     @food = Food.find(params[:id])
    # @food = Unirest.get("#{ENV['DOMAIN']}/foods/#{params[:id]}.json").body
  end 
  def update
   @food = Food.find(params[:id])
   @food= Food.update({iingredient: params[:ingredients], spice: params[:spice], measurement: params[:measurement]})
    redirect_to "/foods/#{@food['id']}"
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to "/foods"
  end 
end
  
  




