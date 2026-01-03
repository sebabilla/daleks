extends Node

# Etats du jeu
enum EnumEtats {DEBUT, EN_COURS}
var etat_jeu: EnumEtats = EnumEtats.DEBUT

# Scénario
var scenario: Dialogue = preload("uid://cvw3vk7lr55db")
var scenario_longueur: int = scenario.dialogue.size()

func ligne_scenario(cible: int) -> Ligne:
	return scenario.dialogue[cible]

# Historique (le jeu affiche la ligne du scenar corresponadant au dernier numéro)
var historique: Array[int] = [0]

func historique_reset() -> void:
	historique.clear()
	historique = [0]

func historique_dernier() -> int:
	return historique.back()

func historique_ajouter(numero: int) -> void:
	historique.append(numero)
	
func historique_extraire(numero:int) -> int:
	return historique[numero]

# Liens directs
var ecran_jeu: Control
var ecran_pause : Control
var serveur_sons: Node

# Réglages du jeu
var jouer_bruitages: bool = true
var jouer_musique: bool = true

# Reference des personnages et de leurs textures, et de leur position
enum EnumPersos {VIDE, DEDE, ALEX, YOUTUBE, DALEK, DALI}

enum EnumPosInit {
				VIDE,
				FOND_M, FOND_G, FOND_D,
				MILIEU_M, MILIEU_G, MILIEU_D,
				AVANT}
enum EnumRegard {VIDE, MILIEU, GAUCHE, DROITE, HAUT, BAS, GROS}
enum EnumBouche {VIDE, NEUTRE, SOURIRE, RIRE, TRISTE}

# Reference des bruitages
enum EnumBruitages {VIDE, VALIDER, ECHEC, PAGE, GROGNEMENT}
