# Changelog: MRH Milsim Tools version : v.1.17.8
## Soldier tab
* Fixed : Missing $ on displayname cfg entry for HQ module west
* Added : Local events when viewing data and pictures:
For data:
 ``` 
 // "MRH_ST_dataViewedChanged" with passed parameters : ARRAY
 params ["_entryClass","_entryTitle","_entryBody",["_subEntries",[]]];
 //eg
 (_subEntries select 0) params ["_subEntryTitle","_subEntryBody"];
 
 //example :
 ["MRH_ST_dataViewedChanged", 
{
	params ["_entryClass","_entryTitle","_entryBody",["_subEntries",[]]];
	systemChat str _this;
	hintSilent format ["Now viewing data: %1", _entryTitle];
}] call CBA_fnc_addEventHandler;
 
 ```
 For pics:
 ```
 //"MRH_ST_picViewedChanged" with passed parameters ARRAY
 params ["_picEntry","_caption","_picpath"];
 // example :
 
 ["MRH_ST_picViewedChanged", 
{
	params ["_picEntry","_caption","_picpath"];
	systemChat str _this;
	hintSilent format ["Now viewing picture: %1", _caption];
}] call CBA_fnc_addEventHandler;
 ```
## Misc Items
* Fixed : several Rvmats that needed fixing


///////////////////////////
# Changelog: MRH Milsim Tools version : v.1.17.7
## Core
* Added: MRH_MISSION_ROOT public variable <STRING>
> Whenever a mission as a description.ext this variable will be created pointing to the mission root see here http://killzonekid.com/arma-scripting-tutorials-mission-root/ for possible uses
* Added : several utilty core functions
## Medevac
* Fixed: ETA counter will now show properly in MP
* Tweaked: max delay setting can go up to 3600 seconds
## Items
###### Fixes:
* Multiple RVMATS reworked, transparency issue with Bioscanner fixed. THX to Horrible Goat for is help on the Arma 3 Discord
* Multiple missing editor previews added
* Fixed: missing string message for one of the Bioscanner actions
* Tweaked : MOB and camp containers can now be flipped when tilted with ace action
###### Added items and props:
* Added: projection screens (large and small ones)THX to Horrible Goat and Dedmen for their help on the Arma 3 Discord
> They have two hidden selections  where you can apply custom textures 0 and 1 (1 overlays above 0)
* Added : Giant green box
> useful for taking screenshots with a green background or filming hollywood style! Color can be changed from the attributes, rvmat can be changed with setObjectMaterial command. Setting to a black lightless rvmat has a cool eerie effect, maybe you can use it in a trippy mission. Box is very big, meant to be used by placing things inside.
* Added : AN/PRC117F radio prop
* Added : AN/PRC152 prop radio
* Added : Trivec Avant SATCOM antenna
> This is not the same as MRH Satellite's own antenna, the base model was the same but I reworked it, optimized it, rescaled it and retextured it. In time this model will also replace the satellite's mod SATCOM Antenna. The antenna can be folded and carried in inventory and connected to with a tablet (see more in the tablet changes section of this changelog). It is NOT YET compatible with MRH Satellite mod features but will be in a very short time.
* Added : AN/PRC 117F radio station
> Now that's a big one! This prop is actually an enterable vehicle that you will find in the editor under Radio Stations > turrets for each side. It's a PRC117F connected to an antenna and with pluggued in 'phone'.It can be connected to a tablet just like the satcom antenna (ACE interactions). Using it with TFAR it has a rack vehicle radio. (I don't use TFAR so that's the only use I could think of with it any other ideas are welcome). Now ACRE2 users will have a way more in depth experience: the vehicle comes equipped with a rack 117F radio that you can use from both inside and outside (you can only set the channel from inside). In addition to that, players carrying both an ACRE2 117F radio and a folded satcom antenna will be able to deploy this station (ACE self interactions>> equipment) on the ground and their 117F will be mounted inside, retaining its settings. When repacking it the 117F is replaced in the player's inventory but the folded SATCOM antenna is left on the ground, don't forget to get it back. The station can and will be damaged when taking fire in the antenna, once damaged you can't repack it and so loose the radio. A variant of this functionnality for TFAR users might be added in the future if players have some interest for it.
###### /!\ Known issue: deploying the radio station from ACRE's PRC117F will only work EXACTLY one in two times: eg deploy the station use its rack, no problems, repack it, redeploy it, the setting is lost and you can't use the rack though the ace actions are here, do it again and it works fine etc. I've decided to release despite this because it's not game breaking and will seek help on that issue.
## Tablet
* Changed: tablet can be connected to a SATCOM antenna or a 117F radio to share data to distant users, the distant user has too be connected to an antenna to appear in the transfer file list and be able to receive data (stil only works for users of the same side). Unconnected the data transfer range is still 10m / or all users inside the same vehicle.
* Changed : when connected to an antenna/ a radio station the map tab will be available, even if it's disabled in the settings.
* Fixed : transmitting players won't showup in their own transfer list
* Tweaked : Transfering data and pictures used to transfer all of the owned datas and pictures, now it will only transfer the one that's currently active in the tablet (image or picture), meaning you have to click it in the tablet before sending. For data the whole entry will be stranfered even if a sub entry is active.
* Added : API function MRH_fnc_hasDataOrPicture to check wether a unit or object owns a given data / picture
> Parameters are 0 OBJECT unit or HQ to check 1 STRING Data or picture config entry to check for (case sensitive).
> Examples  
```[MRH_player,"DataEntry_7"]call MRH_fnc_hasDataOrPicture;// will return true if player owns given data ```

 ``` 
TAG_HQHasData_fnc = {
	params ["_player","_data"];
	private _hq = ([_player] call MRH_fnc_MilsimTools_SoldierTab_getSideHQ)#2;
	private _HQHASPIC = [_hq,_data]call MRH_fnc_hasDataOrPicture;
	_HQHASPIC
	};
	[MRH_player,"My_CaseSensitive_PicCfg_Entry"] call TAG_HQHasData_fnc; // will return true if the player's side HQ has received the picture (will only work if a HQ is set for player's side in the mission) see below for explanations on HQs
 ```
 * Added : Optionnal Mission HQ modules (in the editor Systems>>modules>> MRH Modules)
 > HQs pretty name can be defined in their attributes, default is PAPA BEAR, each HQ works as a receiver for datas and pictures. Players need to be connected to a satcom antenna / 117F radio station to be able to transmit to HQ, HQ will then be listed in the receivers under its pretty name.
 > Upon receiving a data / picture three things will happen:
 1. Any unit that's synchronized to the HQ in the editor will also receive the data.
 2. All players that have zeus powers will be prompted with a notification telling them which data/ picture has been received by the hq
 3. A global cba event is raised
 > "MRH_SideHQ_ReceivedData_global" parameters passed to the event are 0 OBJECT HQ module 1 STRING HQ call sign 2 ARRAY of STRINGS data entries transmitted to the HQ 3 OBJECT sender (player or objNull if data is added by attributeData function)
 > "MRH_SideHQ_ReceivedPictures_global" parameters passed to the event are 0 OBJECT HQ module 1 STRING HQ call sign 2 ARRAY of STRINGS picture entries transmitted to the HQ 3 OBJECT sender (player or objNull if data is added by attributePictures function)
## Zeus features
- Added: CBA Events when a player goes into zeus interface:
> "MRH_curatorViewOpened_global" fires globally whenever a player enters the zeus interface, player entering zeus is passed as parameter (_this select 0)
> "MRH_curatorViewOpened" fires on the client who entered zeus interface only, passed parameters are 0 DISPLAY zeus interface display and 1 OBJECT player unit
> "MRH_curatorViewClosed_global" fires globally whenever a player leaves the zeus interface, player leaving zeus is passed as parameter (_this select 0)
> "MRH_curatorViewClosed" fires on the client who left zeus interface only, passed parameters are 0 DISPLAY zeus interface display and 1 OBJECT player unit
* Added: settings to hide and customize the zeus logo watermark in zeus interface.
> You can set the watermark to be: always hidden, a custom image, the player who is zeus's team logo if they are in an arma unit, or milsim tool's logo. These setteings can be changed midgame. This also works with achilles enabled but won't be applied when the interface takes too long a time to load with achilles enabled. Just exit and reenter and it should be okay. 
## Zeus modules
* Fixed : the Data Terminal sounds would play several times in MP when the terminal is hacked
* Fixed : data terminal and laptop created with the create hack functions are now added to allcurators
## Sniper aid
* Fixed: target spawner can now spawn non moving targets (0m patrol range) without divided by 0 errors
* Fixed: ZoneHeight parameter for the training area function now has intented effect
* Tweaked: in target spawner interface, positions are now listed ordered by distance
## Debug Tools
* Fixed: logged variables whould sometimes get messed up
* Added : setting to disable all logs from the mod (at list those created with the mod's own logging system, older Diag_logs in some functions will still show but will be replaced in time). This setting doesn't apply when in debug mod obviously.
## Radio chatter
* Tweaked: Now uses playSound 3D instead of say3D
>Upside: should fix the mess in mp that sometimes happened when players jiped,Downside: when turning off the radio the current sound will continue playing until finished (immediate shutdown didn't work correctly in MP anyway)
###### Wow that's all folks! A pretty big changelog for a pretty big update!
///////////////////////////////////
Changelog:
MRH Milsim Tools version : v.1.17.6
- Debug tools : Added tab in 3 den under tools: lists all mods and their addons, can be exported to clipboard, can be exported in github bug report format (compliant with the bug report templates for cba and ace 3)

- Heli taxi:
* Fixed, marker was not deleted after fast roping.
* Fixed heli speed when returning to base

- Medevac :
* Tweaked some bigger helis (rhs chinook )would never go to the end of the heal troops and come back function.

- Bio scanner:
* fixed missing text in a hintC message
///////////////////////////////////////
Changelog:
MRH Milsim Tools version : v.1.17.5
- Core :
* Added setting to disable loading of personal loadouts in Ace Arsenal
* Added attributes checkbox to allow a full zeus for unit (no need to add the module etc.)
* Added utility function to generate ace default loadouts:
>Function name:MRH_fnc_MilsimTools_Core_generateAceDefaultLoadOuts

Description: Generates a ready to paste file to run from mission or addon's init that will set Ace default loadouts for the ace arsenal tab.
HOW TO: create your loadouts on different units placed in the editor, give each unit a variable name that corresponds to the loadout (it will be the loadout name). When you're done, run the function. Paste the results to your mission's init.sqf (or any other sqf filled executed from init.sqf).

The result file also contains a list of the objetcs to allow for the arsenal box if you want a limited arsenal as well as a how to. (see comments at the bottom of the generated file)

Alternatively for sexier loadout names you can set them in the roledescription field of the unit and call the function with true as a parameter (but it will only grab playable units)
Return value: file to paste from clipboard
Public: Yes
Parameters:
0- <BOOL> (optional) to use roledescription instead of variable name
Example(s):
call MRH_fnc_MilsimTools_Core_generateAceDefaultLoadOuts; //will use allunits and variable names
or
true call MRH_fnc_MilsimTools_Core_generateAceDefaultLoadOuts; // will grab only playable units and use role descriptions

- Zeus modules 
* Added module to grant any player zeus powers

- Misc Items
* Added Magic Whellie bin:
>Anything placed in the bin wheel be deleted (when the bin's inventory tab is closed) useful if your players are the type to leave stuff everywher, the been can be carried and dragged with ace, have someone on cleanup duty!

/////////////////////////////////
Changelog:
MRH Milsim Tools version : v.1.17.4

- Heli Taxi revamped:
* The heli taxi system has been deeply reworked!
* You can now also use the system with an editor placed heli. To do that:
> place the heli in the editor and sync it to the heli taxi module. Sync the module to another group, the group will then have controls over this heli. If it's destroyed they will not be able to call a new one. Heli and commanding group MUST be different groups. Do not place anyone inside the heli except its flight crew in the editor. Where the heli is at mission start is its 'homebase', it will fly back and land there when cancelled or sent back. After a while it will shut its engines down and get repaired and refueled.Editor placed helis are not affected by the max number per side setting, but they DO affect it.
* You can now choose between different types of 'final waypoints':
>Land and drop troops: the helicopter will drop troops and fly back to base or go away and despawn (for helis that are spawned).
>land and wait at LZ the heli will land and wait at LZ until instructed otherwise. After a while it will shut its engines down. You can come back to it at any time.
>Loiter: the heli will fly over the waypoint and then loiter in circles around it until instructed otherwise.
>Hover: the heli will go to the waipoint and hover until instructed otherwise.
> fastrope troops: the heli will fast rope troops at given position and fly back to base or go away and despawn (for helis that are spawned)
* Fixed: AI units should be properly left at the LZ if the land and drop troups approach is selected.
* Fixed: units controlled by zeus wille be able to properly use and command the helo defined for their side/ group its linked too.

-Full 9 liner MEDEVAC functionality
>The 9 liner medevac function is quite complex, its settings can be found in addons settings. The different lines of the calling interface change the waiting time. You can require an escort (two helis will come along and loiter around the LZ when medevac is in effect), you can set the number of patients (the mod will select bigger helis for larger numbers). Decide to include a surgeon ( an AI medic will disembark the heli, talking to them with ace interaction will heal players, they will reembark when the heli leaves. You can ask for the heli to bring supplies (if ace medical crate it will be in the ACE3 virtual cargo interface, if you request medical tents 2 will be placed in the heli's inventory).Or ask for the crew to wear NBC gear (from contact dlc, useful if you use a radiation script for example).
>Upon calling the MEDEVAC you will receive a LZ near the position you gave (within 250m). You must then reach the LZ and mark it with the selected method (smoke etc.)to launch the medevac sequence. (failing to do that the medevac will be cancelled after a while).
>You can put uncounscious or severely wounded AIs or players in the Heli and send it away. It will fly back a while later and drop the fully healed units/ players at the LZ.
>Medevac helis can still be destroyed! Only one per side can be in action at the same time, you can set cooloff delays in the options.

- Supports: Artillery /CAS/Supply drops
* Fixed CAS no longer working
* Improved coordinates function should now work on all maps. (And hopefully not break everytime arma is updated).
* Setting the available number to -1 will make each of the supports infinite.
* You can instead or also set a cool off time for each support.
* ACE self interaction>>Contact HQ>>check availability will show available supports or cool off times (including medevacs).

- Insertion handler: 
*fixed gear should now be moved correctly to submarine cargo for submarine insertions.

- Core added several functions, added two free public domain fonts: Unifont and BethEllen2

- Functions added MRH_fnc_isDoctor
>[this] call MRH_fnc_isDoctor; will make a unit a doctor (talking to them with ace interaction heals player).

- Vehicle Spawner will now presort categories only on server should save loading time, haven't had time to test it properly and delve into it, expect patch/ full revamp soon.
/////////////////////////////////
Changelog:
MRH Milsim Tools version : v.1.17.3

- Insertion handler revamped:
* added different insertion types: the default static line jump, the HALO jump and submarine S.D.V. insertion.
* fixed : AI units couldn't be transfered onboard. Unchanged: this works only for AIs that are in groups with players.
*tweaked : added animation when preparing cargo.

- Added several internal functions
- Added submarine map marker
- Fixed sitOnChair function in MP

////////////////////
Changelog:
MRH Milsim Tools version : v.1.17.2

- added Laser designated tripod item (a modification of the remote laser designator introduced by the marksman DLC, can and must beused without uav controler, weighs the same as its real world counterpart) more realistic than using laser designator binoculars , or remote controlled designator).
-Added empty protective case.
-Added protective case containing all items from the mod.
-Fixed sitOnChairFunction.
-Fixed missing classnames in cfgPatches

/////////
Changelog:

MRH Milsim Tools version : v.1.17.1
- added RHS_CBPS_optional an optional module that can be found independantly on the workshop but requires milsim tools to function.
- fixed : attributes set in 3Den editor did not work in MP.
- Tweaked: Halo Mask hud can be completely disabled, or enabled elements can be selected.

///////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.17.0

- tweaked: For better practice. Heli Taxi, Cas Supports,Fire Supports and supply drops are now disabled by default. 
> Mission makers and server owners can enable them if they need /want them.
- added: ACE 3 medics, both players and AI will wear a medic patch insignia (if available on the uniform). Can be disabled from options.
- added: deployable fob functions & objects.
> In editor under MRHItems >> Utilities are a cargo container and a supply box both can be used to spawn a F.O.B. and a camp. The time it takes to deploy and repack them is configurable via CBA settings. By default they spawn compositions that are built in the mod but you can easily create and configure your own in an addon or in mission description.ext. See the function header for MRH_fnc_generateComposition on github or in the functions viewer for more information. Compositions are compatible with refill ammo and ammocrate functions as well as with my other mod MRH Satellite (if you use the generate function settings will be conveyed to the composition spawned).
- added: field medical tent item & object.
> tent item can be deployed and repacked and contains ACE 3 medical items. When deployed it serves as an ACE3 medical facility. How long it takes to deploy and repack tent can be modified in CBA settings.
- added some configurable eden attributes:
> - The hack and collect data function can be now configured from eligible objects attributes in 3DEN editor. Requires little to no scripting knowledge.
> - The object search function can be now configured from eligible objects attributes in 3DEN editor. Requires little to no scripting knowledge.
> - The simple conversation function can be now configured from units attributes in 3DEN editor. Requires little to no scripting knowledge.
> - The ammo box function can be now configured from eligible objects attributes in 3DEN editor. Requires little to no scripting knowledge.
> - The auto refill box function can be now configured from eligible objects attributes in 3DEN editor. Requires little to no scripting knowledge.
- added: an empty crate and an empty supply box. Because sometimes having them empty from the start is realy useful ;-)
- added: AceX food crate, if ACEX is enabled the box will contain ACEX field rations.
- added: Tents based on Land_MedicalTent_01_base_F receive an ACE3 open/close action (when closed action appears at the bottom of the entrance , when opened at the center of the tent, visible from the threshold)
- tweaked: Enhanced Map , map collect now uses core additem function. (if inventory is full object will spawn on the ground).
- tweaked: CBA versioning: wrong version will return player to the lobby with message from this version onward.


/////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.16.9

-Code optimization: started to move conde to unscheduled environment only for addons: Core, Zeus Modules, Halo Gear, Admin Menu
-Added unfoldable/draggable shooting mat that flattens grass.
-Elevator function can now be used by zeus remote controlled units.
-Fixed Folded map Ace Illumination
-Enhanced map can now be used by zeus controlled units.
-Fixed: Admin Menu heal all players no longer JIP. (Won't spam arriving players)
-Tweaked: Changing a remote player's gear will result in remote player receiving a notification.
-Tweaked: Unit insignia set with BIS_fnc_setUnitInsignia will be preserved.
-Added: cba local event when gear is changed: MRH_admin_menu_playerloadoutchanged_eh local to the admin's machine. Parameters passed to the event: [admin player, remote player,old loadout, newloadout]
-Fixed widthRailWay error on all map controls
-Fixed missing textures on HALO mask, AAD, Elevator button (thx Diveyez for the reports)
-Fixed VIP surrender
-Fixed Scanner Ace Actions not working since last ACE update
-Fixed CAS support (thx Larrow)
-Vehicle spawner should display  RHS Mk V patrol boat in maritime spawns
///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.16.8
*Zeus Modules:
-Fixed set unit surrender module not working as intended (testing to be done)
-Halo Jump module:
tweaked >groups of objects parachuted along the players will be  transfered to the server
added > The zeus menu now displays the altitude above sea level where the module is placed.

ADDED: Debug mod
>Disabled by default can be enabled in CBA options menu, don't forget to disable before exporting mission
when enabled:
-Shows all debugs messages in a box at the corner of the screen (latest is displayer)
-CTRL + SHIFT + X opens a log with all MRH Milsim Tools error logs
- You can add your own logs to the log by calling
[<STRING>] call MRH_fnc_MilsimTools_DebugTools_trace
useful macros:
#define IS_DEBUG ["MRH_MilsimTools_DebugTools_isDebugMode"] call cba_settings_fnc_get
#define TRACE(ARG) [(##ARG##)] call MRH_fnc_MilsimTools_DebugTools_trace

>When in debug from ace self actions you can:
draw/undraw all triggers in game (activated triggers will show in green)
draw / undraw cursortarget selections positions with names
draw/undra model to world positions
///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.16.7
*fixed units surrendering from the zeus module should now behave properly in MP
*Yet another attempt to solve the movein cargo function in MP, honestly I'm at my wits' end on that one and since it requires testing on a large scale with several guinea pigs / players on the server for each test its quite hard to solve...

///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.16.6

*Zeus modules
Added: module to make unit surrender
Fixed: Halo Jump did not teletransport all players in the group (some testing remains to be done)

*Functions
Added : ambient conversation function
Fixed: Animate data terminal video was not played on the screen in MP
Tweaked: VIP surrender function overhauled, makes use of new ambient conversation function, allows playing a customized sound when unit surrenders,allows setting a chance percentage that the unit will surrender. See function header for more information

*Core
-Function to test if percentage chances are met
///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.16.5

*Zeus modules
Added modules for the tablet
-Module to create data on the fly
-Module to attribute data to a player /an object as a collect point/ an unit as a conversation upon which the player will receive the data
-Module to add hack action to an object and let player hack and download data

*Functions
-Animate data terminal
-Hack download and give data function

*Core
-Some UI related functions
///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.16.4
HOTFIX: tablet pictures were not showing

///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.16.3

*Added new functionality :
*Zeus mmodules
-Module to change a variable name in game (for coders/mission makers /advanced users)
-Module to add a conversation to an unit (see functions)
-Module to set availability of items for halo parachuting (see halo gear)
-Module to generate a HALO jump (see halo gear)
-Module to set how many helicopter taxis are available for each side


*Functions:
-fixed: MRH_fnc_MoveInCargo func should now work properly in MP and not cause server desync (large scale testing remains to be done)
-tweaked: Massive overhaul of the "simple ace conversation" function, new interface with unit's name and video feed to replace the previous hintC box, unit lip movement when talking (only on local machine),you can now pass parameters to the executed script see function header for guidelines. The conversation can now be added/removed dynamicaly via a zeus module. Deleting the module will remove the conversation.

*Milsim Tools Core:
-tweaked: newly added internal functions

*Soldier Tab:
-Changed: >in preparation for the upcoming zeus module data can now be created by script midgame.
 >tablet will now also look for data in configfile in addition to mission configfile and you can create data and pictures cfgs in an addon. New nearly empty addon added to the mod that will contain more preconfigured data in the future. 
*Halo Gear

-Added AAD inventory object & model. This AAD can be used to prepare an ammobox or a vehicule (Land vehicles and boats) for a paradrop (ACE 3 object interaction), and then set to open parachute at desired altitude when object is dropped.
-Added two zeus modules: 
>HALO list object add module: place it on any object and it will be made available in the list for the HALO module
> Simple HALO drop module: Very powerful module, place on LZ on the map and it will allow you to program and execute a complete HALO drop for a player/ group of players and paradrop objects and vehicles along with them. You can disable every option enabled by default and let the players ready themselves and their gear for the drop but you can also automaticaly set the player's and objects' AADs to open at desired altitude, add rebreather mask (if possible currently equiped goggles will be stored in inventory), AAD capable parachute. Player's backpack will be attached to their chest and automatically restored upon touching ground and parachute left on the ground UNLESS the mod BackPack on chest is activated in which case it will be used to put backpack on chest and players will have to get rid of the parachute themselves and manually put their bags back on their backs.
///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.15.7

*Tweaked & improved
-nearest door finding function optional parameters
-You cannow define which building the biometric scanner controls in its attributes
///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.15.6

*Added
New item:
-Biometric scanner 
==> The scanner includes functions to enhance its use, see the object's attributes in eden editor to access settings.

Functions added to MilsimTools_Core:
detect nearest door in nearest building, detect if door is locked, autoclose/lock door.


///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.15.5
*Tweaked:
-Move in cargo function hopefully improved and won't cause desync making all other functions using this one safely usable.
*Added
New items:
-Elevator button, to be used with the elevator function
-Usb key (prop for now, will have its use with the tablet later on)
-Inventory item: RFID pass (by side), have no use for now (but you can scripr use for them in your mission, will be used in upcoming feature)
///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.1.15.0


*Added new functionality : Parachuting addon (Halo Gear)
-Features:
* 2 Masks and 2 Parachutes with auto opening possibilities (CYPRES II Auto Activation Device).
*Special HUD for Halo Mask
*Chances of mask breaking (Halo Mask With ESS only)
*Emulation of Hypoxia effects
*Configurable key to open parachute (default SPACE) instead of scrollwheel action menu.
*Objects that are attached to the player with ace interaction (IR Strobes chemLights etc) will also appeared attached when the chute is deployed.
*Fully configurable





//////////////////////////////////////////////////////////////////////////
MRH Milsim Tools version : v.1.14.6

*Demo mission updated
*Admin menu:
-fixed:
> changing player gear with ace arsenal should now work properly even if the admin isn’t formation leader
-changed:
> added setting to allow non admin players to open the admin menu if they are in zeus interface (disabled by default)
-tweaked:
> when opening the admin menu and viewing a specific player the view camera will not be displayed (it fucked with the zeus cam) but the zeus cam will be centered on selected player instead.

*Enhanced map:
-fixed:
>incorrect texture path for proving grounds would cause sharable map to be invisible
-changed:
>added icons for actions
-tweaked:
>foldable map actions can now be used in vehicles

*Fire support:
-fixed: 
>some players wouldn’t get the actions
> all functions now have complete headers
>paradrop script now functions as intended
-changed:
> passed ace self-interactions from script to config, should be much more stable
-tweaked:
> you can call supports when in a vehicle or on the map

*Functions:
-fixed:
> missing “talk” localization for simple ace message function
>paradrop script now functions as intended


*Heli Taxi
-changed & tweaked:
> massive overhaul of the heli taxi system
> helis and their owners are now created and handled on & by the server
> you can set waypoints to reach the destination
> all members of the group that called the heli are now able to cancel it and set its course while inside
> you can change the course of the heli midflight and give it new waypoints at any time (except if the heli is in its landing phase.
> you can choose LZs over water and MOST helis will safely hover over the water. (be careful some bigger helis will sink)
> If you are in the water and the helicopter is coming to pick you up, since you are too far for classic arma action, helis will receive an ACE3 “climb in” interaction allowing you to move inside from the water.
> compatibility with some helis that do not land completely (RHS super stallion)
>Sometimes helis do not land, in that case passengers will receive an ace3 action to force the landing after 3 seconds

*Insertion Handler:
-fixed:
>settings are now parsed only on the server, no risk of overwriting by new connected player
> all functions now have complete headers
>paradrop script now functions as intended
>scrollbars in listboxes
-changed: 
>Only groups with players will appear in the group choice combo
-tweaked: 
>Added exclusion list for cargo prepping, list is to be expanded with further use/users feedback.


*Markers:
-added: 
>Waypoint marker

*Milsim Tools Core:
-added:
> function to return wether a player is alive and conscious (ace + milsim tools status)
> func that returns alive and conscious group members




FOR LATER RELEASE
*Soldier Tab:
-fixed:
-changed:
-tweaked:

*Vehicle spawner:
-fixed:
-changed:
-tweaked:
// to do: fix sorting not working anymore
////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
Template :
///////////////////////////////////////////////////////////////////////////////////
Changelog:

MRH Milsim Tools version : v.0.0.0

*Added new functionality :
*Admin menu:
-fixed:
-changed:
-tweaked:

*Enhanced map:
-fixed:
-changed:
-tweaked:

*Fiberscope:
-fixed:
-changed:
-tweaked:

*Fire support:
-fixed:
-changed:
-tweaked:

*Functions:
-fixed:
-changed:
-tweaked:

*Heli Taxi:
-fixed:
-changed:
-tweaked:

*Insertion Handler:
-fixed:
-changed:
-tweaked:

*Jip Menu:
-fixed:
-changed:
-tweaked:

*Markers:
-fixed:
-changed:
-tweaked:

*Milsim Tools Core:
-fixed:
-changed:
-tweaked:

*Radio Chatter:
-fixed:
-changed:
-tweaked:

*Sniper Aid:
-fixed:
-changed:
-tweaked:

*Soldier Tab:
-fixed:
-changed:
-tweaked:

*Vehicle spawner:
-fixed:
-changed:
-tweaked:

*Halo Gear

-fixed:
-changed:
-tweaked: