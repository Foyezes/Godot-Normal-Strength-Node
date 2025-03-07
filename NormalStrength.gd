# This node was created by Foyezes
# x.com/Foyezes
# bsky.app/profile/foyezes.bsky.social

@tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeNormalStrength

func _get_name():
	return "NormalStrength"

func _get_category():
	return "Color"

func _get_description():
	return "Control normal map strength"

func _get_output_port_count():
	return 1
	
func _get_input_port_count():
	return 2

func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_VECTOR_3D

func _get_output_port_name(port):
		return ""
			
func _get_output_port_type(port):
	return VisualShaderNode.PORT_TYPE_VECTOR_3D

func _get_input_port_name(port):
	match port:
		0:
			return "Normal Map"
		1:
			return "Strength"
			
func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_VECTOR_3D
		1:
			return VisualShaderNode.PORT_TYPE_SCALAR
			
func _get_input_port_default_value(port):
	match port:
		1:
			return 1.0

func _get_property_count():
	return 1

func _get_property_name(index):
	match index:
		0:
			return "Normalize"

func _get_property_options(index):
	match index:
		0:
			return ["Yes(Default)", "No"]

func _get_code(input_vars, output_vars, mode, type):
	if type == VisualShader.TYPE_FRAGMENT:
		var normalize = get_option_index(0)
		match normalize:
			0:
				return """
				{
				vec3 normal = vec3(%s * 2.0 - 1.0);
				vec3 normal_strength = vec3(normal.xy * %s, normal.z) * 0.5 + 0.5;
				%s = normal_strength;
				}
				""" % [input_vars[0], input_vars[1], output_vars[0]]
			1:
				return """
				{
				vec3 normal = vec3(%s * 2.0 - 1.0);
				vec3 normal_strength = vec3(normal.xy * %s, normal.z) * 0.5 + 0.5;
				%s = normalize(normal_strength);
				}
				""" % [input_vars[0], input_vars[1], output_vars[0]]

func _is_available(mode, type):
	if type == VisualShader.TYPE_VERTEX:
		return false
	elif type == VisualShader.TYPE_FRAGMENT:
		return true
