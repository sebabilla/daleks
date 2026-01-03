extends Button

var courant: String = "init"
var cible: int = -1


func maj_choix(nouveau: String, ref: int) -> void:
	courant = nouveau
	cible = ref
	text = tr(courant)
	disabled = cible == -1
	visible = cible != -1
	theme_type_variation = "BoutonChoixSuite" if courant == ">" else "BoutonChoix"


func desactiver_le_choix() -> void:
	release_focus()
	disabled = true
	visible = false

func _on_mouse_entered() -> void:
	grab_focus()
