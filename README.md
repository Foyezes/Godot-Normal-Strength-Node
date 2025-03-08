# Godot Normal Strength Node
This is an addon for Godot 4 that adds the `NormalStrength` node to the visual shader system. This node lets you control normal map strength.

![normalStrength](https://github.com/user-attachments/assets/df70aa1f-7691-4837-bc90-1892f3512eb2)
![normalS](https://github.com/user-attachments/assets/ec911a24-eb00-47a6-97da-68753c4ae079)

# Method
Unpack normal map.

    vec3 normal = vec3(%s * 2.0 - 1.0);

Multiply X & Y with input scalar value, then repack the normal map.

    vec3 normal_strength = vec3(normal.xy * %s, normal.z) * 0.5 + 0.5;
    %s = normal_strength;

For normalize set to yes,

    %s = normalize(normal_strength);
    
# Installation
You can get it from the Asset Store in editor.
Or extract the zip file and copy the folder to your project. You'll need to restart the editor for the node to appear in visual shader.
