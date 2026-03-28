# Booby Trap Door

## Overview
This mod enables [Taro Tripwire](https://steamcommunity.com/sharedfiles/filedetails/?id=3034379807), created by Taro, to function as a booby trap for doors.

It was developed with the goal of recreating "Ready or Not" style door traps within Arma 3.

*Note: Currently, placement is only supported via the 3DEN Editor.*
* GitHub Repository: [CatalpaBow/BoobyTrapDoor](https://github.com/CatalpaBow/BoobyTrapDoor/)
* Bug Reports & Feedback: [Issues](https://github.com/CatalpaBow/BoobyTrapDoor/issues)

## Features
* Traps trigger automatically when a door is opened past a certain point.
* Compatible with ACE **Incremental Door Opening**, allowing players to check for traps without triggering them.
* Traps can be disarmed via ACE Interaction (Functionality provided by Taro Tripwire).

## Prerequisites
* [CBA_A3](https://steamcommunity.com/workshop/filedetails/?id=450814997)
* [ace](https://steamcommunity.com/workshop/filedetails/?id=463939057) 
* [TaroTripwire](https://steamcommunity.com/sharedfiles/filedetails/?id=3034379807)

## Usage

### Setting up a Trap
1. Place a **TaroTripWire** in front of the door you wish to trap. To simulate the mechanism of the wire catching as the door swings open, ensure it is placed on the side towards which the door opens.
2. Paste the following code into the TripWire's initialization field:

```sqf
[this, "HandGrenade"] call taro_tripwire_fnc_addGrenade;
[this] call btd_trap_fnc_registerTrap;
```

> * **taro_tripwire_fnc_addGrenade**: Attaches a grenade to the trap. For further details, please refer to the Taro Tripwire Workshop page.
> * **btd_trap_fnc_registerTrap**: Registers the passed object (the Taro Tripwire object) into the BoobyTrapDoor system. Traps will not detonate upon door opening unless registered via this function.

### Checking for Traps
You can use the ACE **Incremental Door Opening** feature to check for traps without setting them off. Opening the door by just one increment will not trigger the detonation.

### Disarming Traps
Traps can be disarmed by interacting with them via the ACE Interaction menu (Feature of Taro Tripwire).

## Troubleshooting
### If the trap does not trigger when the door is opened:

Please enable Debug Mode to check the status of the trap.
Debug Mode can be toggled via **Addon Options > BoobyTrapEditor**.

Once enabled, debug text will appear over trap objects. To maintain visibility at a distance, detailed information will only be displayed when within 100 meters.

Below are solutions for specific debug statuses:

* **"Door not detected"**
    The system failed to detect the door. Go to **Addon Options > BoobyTrapDoor > DoorDetection > IncludeList** and add the animation name (or a keyword within it) of the door you want to target.
    To find the animation name, run the [animationNames](https://community.bistudio.com/wiki/animationNames) command using the building object as the argument. This will return a list of animation names; identify the one that corresponds to the door.
    
    * **Example:** If the undetected door's animation name is `tur_0`, add `"tur"` to the IncludeList: `["door","dvere","tur"]`.

* **Other cases**
    The system may be misidentifying a non-door animation as a door. Check the `DoorAnimationName` displayed in the debug text, and add that name (or a part of it, e.g., "locked" if it's `door_locked`) to **Addon Options > DoorDetection > ExcludeList**.
    * **Example:** If `DoorAnimationName: 'door_explosion'` is displayed, add `"explosion"` to the ExcludeList: `["locked","explosion"]`.

* **If the issue persists:**
    This may be a bug. Please report it via [**GitHub Issues**](https://github.com/CatalpaBow/BoobyTrapDoor/issues).

## Credits
* [Taro Tripwire](https://steamcommunity.com/sharedfiles/filedetails/?id=3034379807):A trap of a suitable size for door-rigging. My thanks to the creator, Taro.

This text was translated/refined using generative AI.