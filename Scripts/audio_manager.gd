extends Node

@onready var gross_1 = $gross_1
@onready var gross_2 = $gross_2
@onready var gross_3 = $gross_3
@onready var mmm_1 = $mmm_1
@onready var mmm_2 = $mmm_2
@onready var squelch = $squelch
@onready var crunch_1 = $crunch_1
@onready var jump = $jump
@onready var lick_1 = $lick_1
@onready var lick_2 = $lick_2
@onready var lick_3 = $lick_3
@onready var block_1 = $block_1
@onready var block_2 = $block_2
@onready var music = $music
@onready var sugar = $sugar
@onready var gameover = $gameover
@onready var game_start = $game_start

func collect(item):
	if(item == "enemy"):
		block_sound()

func squelch_sound():
	squelch.play()
func gross_sound():
	var sound_type = randf_range(1,3)
	if(sound_type <= 1):
		gross_1.play()
	elif(sound_type <= 2):
		gross_2.play()
	elif(sound_type <= 3):
		gross_3.play()

func jump_sound():
	jump.play()

func yum_sound():
	var sound_chance = randf_range(1,5)
	if(sound_chance <= 2):
		mmm_1.play()
	elif(sound_chance <= 3):
		mmm_2.play()
func lick_sound():
	var sound_chance = randf_range(1,6)
	if sound_chance <= 1:
		lick_1.play()
	if sound_chance <= 2:
		lick_2.play()
	if sound_chance <= 3:
		lick_3.play()

func crunch_sound():
	crunch_1.play()

func block_sound():
	var sound_chance = randf_range(1,4)
	if sound_chance <= 1:
		block_1.play()
	if sound_chance <= 2:
		block_2.play()

func heal_sound():
	sugar.play()

func start_music():
	music.play()

func game_start_sound():
	game_start.play()

func gameover_sound():
	music.stop()
	gameover.play()
