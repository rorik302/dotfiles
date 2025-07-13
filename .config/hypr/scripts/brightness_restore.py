from brightness import read_brightness_from_file, set_brightness


def main():
    brightness = read_brightness_from_file()
    set_brightness(brightness)


if __name__ == "__main__":
    main()
