require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'



#### J'appel la classe Player (player.rb) ####
require_relative 'lib/player'

# Je crée Josiane et José
player1 = Player.new("Josiane")
player2 = Player.new("José")




#### LE JEU COMMENCE ###

# J'affiche l'état des joueurs
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state 

# J'indique que le combat commence 
puts "\nPassons à la phase d'attaque :"



### COMBAT MORTEL ###


while player1.life_points > 0 && player2.life_points > 0
  
  # Josiane attaque José
  player1.attacks(player2)
  break puts "Le joueur #{player2.name} a été tué !" if player2.dead? # Je casse la boucle si il y J2 est mort


  # José attaque à son tour Josiane
  player2.attacks(player1)
  
  # J'affiche la santé des joueurs avant la reprise
  puts "\nVoici l'état de nos joueurs :"
  player1.show_state
  player2.show_state

  break puts "Le joueur #{player1.name} a été tué !" if player1.dead?  # Je casse la boucle si il y J1 est mort
  puts "\nPassons à la phase d'attaque :"
end





