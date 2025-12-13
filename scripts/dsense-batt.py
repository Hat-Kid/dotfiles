import json
import subprocess

def get_battery_status():
    try:
        result = subprocess.run(["dualsensectl", "battery"], capture_output=True, text=True, check=True)
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        return f"N/A"
    except FileNotFoundError:
        return "error: dualsensectl not found"

data = {
    "icon": "joystick",
    "text": "DualSense {0}%".format(get_battery_status().split()[0])
}

print(json.dumps(data, indent=2))

