
class Food
  attr_accessor :id, :ingredient, :spice, :measurement

  def initialize(hash)
    @id = hash['id']
    @ingredient = hash['ingredient']
    @spice = hash['spice']
    @measurement= hash['measurement']
  end

  def self.find(id)
    food_hash= Unirest.get("#{ENV['DOMAIN']}/foods/#{:id}.json").body
    @food = Food.new(food_hash)
  end
  def self.all
    food_hashes = Unirest.get("#{ENV['DOMAIN']}/foods.json").body
    @foods = []
    food_hashes.each do|food_hash|
     @foods << Food.new(food_hash)
   end 
   @foods
  end 
  def self.create
    food_hash = Unirest.post("#{ENV['DOMAIN']}/foods.json", :headers =>{"Accept"=> "application/json"}, :parameters=>{:ingredient=> params[:ingredient], :spice=> params[:spice], :measurement=> params[:measurement]}).body
  end
    
  def self. edit
    food_hash = Unirest.get("#{ENV['DOMAIN']}/foods/#{params[:id]}.json").body
  end 
  def self. update
   @food = Unirest.patch("#{ENV['DOMAIN']}/foods.json", :headers => {"Accept"=> "application/json"},:parameters=>{:ingredient=> params[:ingredient], :spice=> params[:spice], :measurement=> params[:measurement]}).body
  end 
  def delete
    Unirest.delete("#{ENV['DOMAIN']}/foods/#{params[:id]}.json").body
  end 
end
    
    