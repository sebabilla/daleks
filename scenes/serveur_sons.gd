extends Node

## Attention l'ordre des noeuds est important!
func jouer_bruitage(son: Globals.EnumBruitages) -> void:
	if not Globals.jouer_bruitages: 
		return
	%Bruitages.get_child(son).play()
	
func switch_musique() -> void:
	%Musique.stream_paused = not $Musique.stream_paused
