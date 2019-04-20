#include "\MRH_RHS_CBPS\macros.inc"

class Attributes 
{
	
	class Default;
	class Title: Default{};
	class TitleWide: Default{};

	class MRH_CBPS_Cmb : Title
	{
		attributeLoad = "\
		_ctrl = (_this controlsGroupCtrl 100);\
		_att = getText( _config >> 'property' );\
		_valueSaved = (( get3DENSelected 'object' ) select 0) get3DENAttribute _att;\
		if(str _valueSaved isEqualTo '[any]') exitWith {_ctrl lbsetCurSel 0};\
		_index = 0;\
		for '_i' from 0 to ((lbSize _ctrl)-1) do {\
		if ((_ctrl lbdata _i) == (_valueSaved select 0) ) then {_index = _i};\
		};\
		_ctrl lbSetCurSel _index;\
		";
		attributeSave = "\
		_ctrl = (_this controlsGroupCtrl 100);\
		_value = _ctrl lbData lbCurSel _ctrl;\
		_att = getText( _config >> 'property' );\
		collect3DENHistory {\
			{\
				_x set3DENAttribute [_att,_value];\
			} forEach ( get3DENSelected 'object' );\
		};\
		";
		class controls 
		{
			
			class Title : title
			{};
			class value : ctrlCombo
			{
				onload = "[(_this select 0)] call MRH_fnc_MilsimTools_RHS_CBPS_fillAttributesCombo";	
					
			idc = 100;
			x = ATTRIBUTE_TITLE_W * GRID_W;
			w = ATTRIBUTE_CONTENT_W * GRID_W;
			h = SIZE_M * GRID_H;
				
			};
		};
		
	};
	
	
	
	
	
		
};
