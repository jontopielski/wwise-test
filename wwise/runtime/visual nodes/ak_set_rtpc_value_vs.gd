tool
extends VisualScriptCustomNode

export(AK.GAME_PARAMETERS._enum) var game_parameter:int = 0

func _get_caption():
	return "Ak Set RTPC Value"
	
func _get_category():
	return "Wwise"
	
func _get_text():
	for idx in AK.GAME_PARAMETERS._enum.values().size():
		if game_parameter == AK.GAME_PARAMETERS._enum.values()[idx]:
			return AK.GAME_PARAMETERS._enum.keys()[idx]

func _has_input_sequence_port():
	return true
	
func _get_output_sequence_port_count():
	return 1
	
func _get_input_value_port_count():
	return 2
	
func _get_input_value_port_name(idx):
	match idx:
		0: return "Value"
		1: return "Game Object"

func _get_input_value_port_type(idx):
	match idx:
		0:	return TYPE_REAL
		1: 	return TYPE_OBJECT

func _step(inputs, _outputs, _start_mode, _working_mem):
	Wwise.set_rtpc_id(game_parameter, inputs[0], inputs[1])

	return 0
