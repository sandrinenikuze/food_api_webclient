
class Food
  attr_accessor :id, :ingredient, :spice, :measurement

  def initialize(hash)
    @id = hash['id']
    @ingredient = hash['ingredient']
    @spice = hash['spice']
    @measurement= hash['measurement']
  end

  def self.find(id)
    food_hash= Unirest.get("#{ENV['DOMAIN']}/foods/#{:id}.json",headers:{"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "Y-Use-Email"=> ENV['Y_USER_EMAIL']}).body
    @food = Food.new(food_hash)
  end
  def self.all
    food_hashes = Unirest.get("#{ENV['DOMAIN']}/foods.json",headers:{"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "Y-Use-Email"=> ENV['Y_USER_EMAIL']}).body
    @foods = []
    food_hashes.each do|food_hash|
     @foods << Food.new(food_hash)
   end 
   return @foods
  end 
  def self.create
    food_hash = Unirest.post("#{ENV['DOMAIN']}/foods.json", headers:{"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "Y-Use-Email"=> ENV['Y_USER_EMAIL']}, :parameters=>{:ingredient=> params[:ingredient], :spice=> params[:spice], :measurement=> params[:measurement]}).body
  end
    
  def self. edit
    food_hash = Unirest.get("#{ENV['DOMAIN']}/foods/#{params[:id]}.json").body
  end 
  def update
   @food = Unirest.patch("#{ENV['DOMAIN']}/foods.json", headers:{"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "Y-Use-Email"=> ENV['Y_USER_EMAIL']},:parameters=>{:ingredient=> params[:ingredient], :spice=> params[:spice], :measurement=> params[:measurement]}).body
  end 
  def delete
    @food = Unirest.delete("#{ENV['DOMAIN']}/foods/#{params[:id]}.json", headers:{"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "Y-Use-Email"=> ENV['Y_USER_EMAIL']}).body

  end 
end
    
    