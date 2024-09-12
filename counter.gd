extends Control

@export var color := Color(1, 1, 1)

var count := 0

func _ready():
	$Minus.pressed.connect(minus)
	$Plus.pressed.connect(plus)
	$TextEdit.text_changed.connect(set_player)
	update_value(0)
	set_player()

func set_player():
	if $TextEdit.text == "":
		$PlayerName.text = "Player Name"
		$PlayerName.modulate = Color(1.0, 1.0, 1.0, 0.5)
	else:
		$PlayerName.text = $TextEdit.text
		$PlayerName.modulate = color

const OFFSET = 0.2
const MAX_POINTS := 20
var t : Tween
func update_value(increment: int):
	if increment < 0 and count <= 0:
		return
	
	count = maxi(0, (count + increment) % MAX_POINTS)
	$Count.text = str(count)
	$Count.position = -$Count.size * OFFSET * 0.5
	$Count.scale = Vector2(1.0, 1.0) * (1.0 + OFFSET)
	
	if t: t.kill()
	t = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE).set_parallel(true)
	t.tween_property($Count, "scale", Vector2(1, 1), 0.125)
	t.tween_property($Count, "position", Vector2(0, 0), 0.125)

func plus(): update_value(+1)
func minus(): update_value(-1)
