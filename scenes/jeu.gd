extends Node


func _ready() -> void:
	Globals.ecran_jeu = %EcranJeu
	Globals.ecran_pause= %EcranPause
	Globals.serveur_sons = %ServeurSons
	%EcranPause.init_pause()


func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		%EcranPause.init_pause()
