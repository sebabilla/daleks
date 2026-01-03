extends Control


func init_pause() -> void:
	get_tree().paused = true
	if Globals.etat_jeu == Globals.EnumEtats.DEBUT:
		%Continuer.disabled = true
		%NouvellePartie.grab_focus()
	else:
		%Continuer.disabled = false
		%Continuer.grab_focus()
	show()
	%Details.visible = false


func sortir_pause() -> void:
	hide()
	Globals.ecran_jeu.sortie_de_pause()
	get_tree().paused = false


func _on_continuer_pressed() -> void:
	Globals.serveur_sons.jouer_bruitage(Globals.EnumBruitages.VALIDER)
	sortir_pause()


func _on_nouvelle_partie_pressed() -> void:
	Globals.serveur_sons.jouer_bruitage(Globals.EnumBruitages.VALIDER)
	Globals.etat_jeu = Globals.EnumEtats.DEBUT
	sortir_pause()
	

func _on_musique_pressed() -> void:
	Globals.jouer_musique = not Globals.jouer_musique
	%Musique.text = "Couper la musique" if Globals.jouer_musique else "Remettre la musique"
	Globals.serveur_sons.switch_musique()


func _on_bruitage_pressed() -> void:
	Globals.jouer_bruitages = not Globals.jouer_bruitages
	%Bruitage.text = "Couper les bruitages" if Globals.jouer_bruitages else "Remettre les bruitages"
	Globals.serveur_sons.jouer_bruitage(Globals.EnumBruitages.VALIDER)


func _on_afficher_details_pressed() -> void:
	%Details.visible = not %Details.visible
