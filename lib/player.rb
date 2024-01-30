require 'bundler'
Bundler.require

class Player 
  attr_accessor :name, :life_points 

  def initialize(name)
    @name = name
    @life_points = 10
    @damage_received = []    # Je crée un array pour stocker les damages
  end


  def show_state
    total_damage = @damage_received.sum     # J'additionne tout les damages
    remaining_life_points = @life_points - total_damage
    remaining_life_points = 0 if remaining_life_points < 0   # condition points de vies négatifs
    
    puts "#{@name} a #{remaining_life_points} points de vie"
  end


  def gets_damage(damage)
    @damage_received << damage     # Je rentre le damage dans mon array 

    total_damage = @damage_received.sum     # J'additionne tout les damages
    if @life_points - total_damage <= 0     # Je crée une condition
      puts "Le joueur #{@name} a été tué !"
    end
  end


  def attacks(other_player)
    puts "Le joueur #{@name} attaque le joueur #{other_player.name} !" # Je definie l'autre joueur de ma classe Player
    
    damage = compute_damage  # Je stock le résultat aléatoire du compute_damage dans une variable 
    other_player.gets_damage(damage) # J'applique les damages à l'autre joueur

    puts "Il lui inflige #{damage} points de dommages !"
  end


  def compute_damage # méthode pour générer aléatoirement un chiffre 
    return rand(1..6)
  end

  # Je crée une méthode dead? pour la reporter dans app.rb 
  def dead? 
    total_damage = @damage_received.sum
    @life_points - total_damage <= 0
  end

end