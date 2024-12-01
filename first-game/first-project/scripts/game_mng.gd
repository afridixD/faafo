extends Node

var points=0

@onready var collectibles = %collectibles

func add_points():
	points+=1
	print(points)
	collectibles.text=str(points)
