import subprocess
import getpass


USER = getpass.getuser()
BRIGHNESS_FILE = f"/home/{USER}/.config/brightness"


def get_brightness():
    result = subprocess.run(
        ["ddcutil", "getvcp", "10"],
        capture_output=True,
        text=True,
    )

    for line in result.stdout.split("\n"):
        if "current value" in line and "=" in line:
            value_part = line.split("=")[1].strip()
            brightness = value_part.split(",")[0]
            return int(brightness)


def set_brightness(brightness):
    subprocess.run(
        ["ddcutil", "setvcp", "10", str(brightness)],
        capture_output=True,
        text=True,
    )


def save_brightness_to_file(brightness):
    with open(BRIGHNESS_FILE, "w") as f:
        f.write(str(brightness))


def read_brightness_from_file():
    with open(BRIGHNESS_FILE, "r") as f:
        return int(f.read())
