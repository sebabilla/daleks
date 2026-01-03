extends Node2D

signal fini(n_ligne: int)

# Tous les sprites font 200*450
# Sprite vide
const RECTANGLE_TRANSPARENT = preload("uid://yck3ppat3k8l")
# Sprites Siljouette
const ALEX = preload("uid://b7ubbx06dfero")
const DEDE = preload("uid://ophad141af3p")
const YOUTUBE = preload("uid://cqfwv8rgycaix")
const DALEK = preload("uid://clstwgf6vnfwu")
const DALI = preload("uid://ohl55ju5trqk")
# Sprites regard
const YEUX_BAS = preload("uid://bgmqr3qbob0b2")
const YEUX_DROITE = preload("uid://chqu3cc3pkayp")
const YEUX_GAUCHE = preload("uid://it7n54ouwhbc")
const YEUX_GROS = preload("uid://bfyny8ugkggit")
const YEUX_HAUT = preload("uid://bsejbjcspixu")
const YEUX_MILIEU = preload("uid://mr0ox73q3iip")
# Sprites bouche
const BOUCHE_NEUTRE = preload("uid://b2wr84pe45elt")
const BOUCHE_RIRE = preload("uid://doxpafdbq0tbs")
const BOUCHE_SOURIRE = preload("uid://2i7x7ofc3fvf")
const BOUCHE_TRISTE = preload("uid://q17oex5vq1xa")


func _ready() -> void:
	%Tete.texture = RECTANGLE_TRANSPARENT
	%Yeux.texture = RECTANGLE_TRANSPARENT
	%Bouche.texture = RECTANGLE_TRANSPARENT
	global_position = Vector2(0, 0)
	

func maj_personnage(numero: int) -> void:
	var ligne: Ligne = Globals.scenario.dialogue[numero]
	silhouette_caracteristiques(ligne.perso)
	positionner_silhouette(ligne.pos_init)
	positionner_replique(ligne.pos_init)
	regard_direction(ligne.regard)
	bouche_forme(ligne.bouche)
	lancer_bruitage(ligne.bruitage)
	maj_replique(ligne.texte_replique, numero)
	
func maj_replique(rep: String, numero: int):
	%Replique.text = rep
	%RepliqueContainer.visible = rep != ""
	var taille_texte: float= rep.length()
	var temps: float = taille_texte * 0.01
	var affichage: Tween = create_tween()
	affichage.tween_property(%Replique, "visible_ratio", 1, temps).from(0)
	await affichage.finished
	fini.emit(numero)
		

func silhouette_caracteristiques(tete: Globals.EnumPersos) -> void:
	match tete:
		Globals.EnumPersos.ALEX:
			%Tete.texture = ALEX
		Globals.EnumPersos.DEDE:
			%Tete.texture = DEDE
		Globals.EnumPersos.DALEK:
			%Tete.texture = DALEK
		Globals.EnumPersos.YOUTUBE:
			%Tete.texture = YOUTUBE
		Globals.EnumPersos.DALI:
			%Tete.texture = DALI
		_, Globals.EnumPersos.VIDE:
			%Tete.texture = RECTANGLE_TRANSPARENT

func positionner_silhouette(pos: Globals.EnumPosInit) -> void:
	%BasEcran.visible = true
	match pos:
		Globals.EnumPosInit.FOND_M:
			%Tete.scale = Vector2(0.5, 0.5)
			%Tete.position = Vector2(400, 200)
		Globals.EnumPosInit.FOND_G:
			%Tete.scale = Vector2(0.5, 0.5)
			%Tete.position = Vector2(100, 200)
		Globals.EnumPosInit.FOND_D:
			%Tete.scale = Vector2(0.5, 0.5)
			%Tete.position = Vector2(700, 200)
		Globals.EnumPosInit.MILIEU_M:
			%Tete.scale = Vector2(1, 1)
			%Tete.position = Vector2(400, 400)
		Globals.EnumPosInit.MILIEU_G: 
			%Tete.scale = Vector2(1, 1)
			%Tete.position = Vector2(150, 400)
		Globals.EnumPosInit.MILIEU_D: 
			%Tete.scale = Vector2(1, 1)
			%Tete.position = Vector2(650, 400)
		Globals.EnumPosInit.AVANT:
			%Tete.scale = Vector2(2, 2)
			%Tete.position = Vector2(400, 400)
			%BasEcran.visible = false
		_, Globals.EnumPosInit.VIDE:
			%Tete.scale = Vector2(1, 1)
			%Tete.position = Vector2(0,0)
			
func positionner_replique(pos: Globals.EnumPosInit) -> void:
	match pos:
		Globals.EnumPosInit.FOND_M, Globals.EnumPosInit.FOND_G:
			%RepliqueContainer.position = %Tete.position + Vector2(70, -100)
		Globals.EnumPosInit.FOND_D:
			%RepliqueContainer.position =  %Tete.position + Vector2(-220, -100)
		Globals.EnumPosInit.MILIEU_M, Globals.EnumPosInit.MILIEU_G:
			%RepliqueContainer.position = %Tete.position + Vector2(100, -200)
		Globals.EnumPosInit.MILIEU_D:
			%RepliqueContainer.position =  %Tete.position + Vector2(-250, -200)
		Globals.EnumPosInit.AVANT:
			%RepliqueContainer.position = %Tete.position + Vector2(220, -200)
		_:
			%RepliqueContainer.position = Vector2(1000, 0)

func regard_direction(dir: Globals.EnumRegard) -> void:
	match dir:
		Globals.EnumRegard.MILIEU:
			%Yeux.texture = YEUX_MILIEU
		Globals.EnumRegard.GAUCHE:
			%Yeux.texture = YEUX_GAUCHE
		Globals.EnumRegard.DROITE:
			%Yeux.texture = YEUX_DROITE
		Globals.EnumRegard.GROS:
			%Yeux.texture = YEUX_GROS
		Globals.EnumRegard.HAUT:
			%Yeux.texture = YEUX_HAUT
		Globals.EnumRegard.BAS:
			%Yeux.texture = YEUX_BAS
		_, Globals.EnumRegard.VIDE:
			%Yeux.texture = RECTANGLE_TRANSPARENT
	
func bouche_forme(forme: Globals.EnumBouche) -> void:
	match forme:
		Globals.EnumBouche.NEUTRE:
			%Bouche.texture = BOUCHE_NEUTRE
		Globals.EnumBouche.SOURIRE:
			%Bouche.texture = BOUCHE_SOURIRE
		Globals.EnumBouche.RIRE:
			%Bouche.texture = BOUCHE_RIRE
		Globals.EnumBouche.TRISTE:
			%Bouche.texture = BOUCHE_TRISTE
		_, Globals.EnumBouche.VIDE:
			%Bouche.texture = RECTANGLE_TRANSPARENT

func lancer_bruitage(bruit: Globals.EnumBruitages) -> void:
	Globals.serveur_sons.jouer_bruitage(bruit)
