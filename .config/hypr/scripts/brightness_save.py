import sys

from brightness import get_brightness, set_brightness, save_brightness_to_file


def main():
    brightness = get_brightness()
    if brightness is None:
        print("Не удалось получить яркость экрана")
        sys.exit(1)

    save_brightness_to_file(brightness)

    set_brightness(0)


if __name__ == "__main__":
    main()
