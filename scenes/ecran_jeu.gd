extends Control

@onready var personnage: Node2D = %Personnage
@onready var choix_1: Button = %Choix1
@onready var choix_2: Button = %Choix2

var choix_possible: bool = false

func _ready() -> void:
	choix_1.pressed.connect(_choix_presse.bind(choix_1))
	choix_2.pressed.connect(_choix_presse.bind(choix_2))
	
# Pour cliquer n'importe où si on joue à la souris, et qu'il faut juste faire avancer le dialogue.
func _input(event: InputEvent) -> void:
	if choix_possible and %Choix2.cible == -1:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				%Choix1.pressed.emit()

func sortie_de_pause() -> void:
	if Globals.etat_jeu == Globals.EnumEtats.DEBUT:
		Globals.etat_jeu = Globals.EnumEtats.EN_COURS
		Globals.historique_reset()

	maj_ligne(Globals.historique_dernier())
	

func maj_ligne(numero: int) -> void:
	personnage.maj_personnage(numero)
	
func _on_personnage_fini(n_ligne: int) -> void:
	var ligne: Ligne = Globals.scenario.dialogue[n_ligne]
	choix_1.maj_choix(ligne.texte_choix1, ligne.ref_choix1)
	choix_2.maj_choix(ligne.texte_choix2, ligne.ref_choix2)
	choix_1.grab_focus()
	choix_possible = true

func _choix_presse(choix: Button) -> void:
	desactiver_les_choix()
	var cible: int = choix.cible
	if cible > -1 and cible < Globals.scenario_longueur:
		Globals.historique_ajouter(cible)
		maj_ligne(cible)
		Globals.serveur_sons.jouer_bruitage(Globals.EnumBruitages.VALIDER)
	else:
		Globals.serveur_sons.jouer_bruitage(Globals.EnumBruitages.ECHEC)
		
func desactiver_les_choix() -> void:
	choix_possible = false
	choix_1.desactiver_le_choix()
	choix_2.desactiver_le_choix()
