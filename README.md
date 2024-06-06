To run disko, use this command:

```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ../system/disko.nix
```
After succesfully configuring your disk run these commands:

```
nixos-generate-config --no-filesystems --root /mnt
nixos-install --root /mnt --flake ../system#default
```

Feature updates will fix the config bit by bit, and optimize the installation process
