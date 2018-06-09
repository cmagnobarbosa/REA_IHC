extends Area2D

# class member variables go here, for example:
var interacao = 0
# var b = "textvar"
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#
	connect("body_entered",self,"colisao")
	connect("body_exited",self,"saiu")
	set_process(true)


func colisao(body):
	print("Entrou na zona de interacao")
	interacao=1


func saiu(body):
	print("Saiu da zona")
	interacao=0

func _process(delta):
	if(interacao and Input.is_action_pressed("ui_accept")):
		print("Clique")
		mensagem()
	# print(is_colliding())
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func mensagem():
	get_node("RichTextLabel").percent_visible=1
	get_node("ButtonOkIteracao").flat=0
	get_node("ButtonOkIteracao").text="OK"
	#print("Deu certo")

func _on_ButtonOkIteracao_pressed():
	get_node("RichTextLabel").hide()
	get_node("ButtonOkIteracao").hide()
	get_node("ButtonOkIteracao").text=""
	get_node("AnimatedSprite").hide();
	var posicao = get_node("/root/Deserto/NPC2")
	posicao.show()
	pass # replace with function body