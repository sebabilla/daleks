class_name Ligne extends Resource

@export var perso : Globals.EnumPersos = Globals.EnumPersos.VIDE
@export var pos_init : Globals.EnumPosInit = Globals.EnumPosInit.MILIEU_M
@export var regard: Globals.EnumRegard = Globals.EnumRegard.VIDE
@export var bouche: Globals.EnumBouche = Globals.EnumBouche.VIDE
@export var bruitage: Globals.EnumBruitages = Globals.EnumBruitages.VIDE
@export_multiline var texte_replique: String = ""
@export var texte_choix1: String = ">"
@export var ref_choix1: int = -1
@export var texte_choix2: String = ""
@export var ref_choix2: int = -1
