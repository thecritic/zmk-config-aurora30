# Aurora30 Nice!Nano v2 ZMK Firmware Flashing Instructions

## Putting Nice!Nano v2 into Bootloader Mode

1. Connect right/left half of Aurora30 to your computer via USB-C cable.
2. Press the reset button on the Nice!Nano v2 board twice quickly. The board should appear as a removable drive.
3. Flash the firmware using the commands below.

If the board does not want to pair via bluetooth, try to flash the reset firmware first onto both boards. Then reflash the left and right half firmwares.

## Reset Nice!Nano v2 Firmware
```
sudo mount /dev/sda /mnt/aurora30 && sudo cp ~/Downloads/firmware/settings_reset-nice_nano_v2-zmk.uf2 /mnt/aurora30 && sync && sudo umount /mnt/aurora30
```

## Flash Left Half Firmware
```
sudo mount /dev/sda /mnt/aurora30 && sudo cp ~/Downloads/firmware/aurora30_left-nice_nano_v2-zmk.uf2 /mnt/aurora30 && sync && sudo umount /mnt/aurora30
```

## Flash Right Half Firmware
```
sudo mount /dev/sda /mnt/aurora30 && sudo cp ~/Downloads/firmware/aurora30_right-nice_nano_v2-zmk.uf2 /mnt/aurora30 && sync && sudo umount /mnt/aurora30
```
