class MRH_KeyCard_Base: CBA_MiscItem
{
	author = "Mr H.";
	displayName = "Pass RFID";
	model = "\MRHMiscItems\Models\RFIDPass\MRH_RFIDpass.p3d";
	scope = 0;      
	scopeArsenal = 0;
	scopeCurator = 0;
	editorCategory = "EdSubcat_MRH_Props";
	editorPreview = "\MRHMiscItems\Models\RFIDPass\Data\RFIDthumbnail.paa";
	editorSubcategory = "EdSubcat_MRH_InvIt";
	picture = "\MRHMiscItems\Models\RFIDPass\Data\RFIDthumbnail.paa";
	descriptionShort = $STR_MRH_MRHMiscItems_RFIDDescShort;
	//type = 0;
	ace_arsenal_hide = 1;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass=0.6;//en lb*10
			};

};

class MRH_KeyCard_BLUFOR : MRH_KeyCard_Base
{
    displayName = $STR_MRH_MRHMiscItems_RF_BLU;
    scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
    ace_arsenal_hide = 0;
};

class MRH_KeyCard_OPFOR : MRH_KeyCard_Base
{
    displayName = $STR_MRH_MRHMiscItems_RF_OP;
    scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
    ace_arsenal_hide = 0;
};

class MRH_KeyCard_IND : MRH_KeyCard_Base
{
    displayName = $STR_MRH_MRHMiscItems_RF_IND;
    scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
    ace_arsenal_hide = 0;
};
//unused for now, will be implemented later:

//1-0-0
#define MRH_KEYCARD_ITEM(KEY_BASE,KEY_ID) \
    class KEY_BASE##_##KEY_ID : KEY_BASE { \
        scope = 1; \
        scopeArsenal = 0; \
        scopeCurator = 0; \
        MRH_Key_Id_Number = KEY_ID; \
    }


MRH_KEYCARD_ITEM(MRH_KeyCard_BLUFOR,1);
MRH_KEYCARD_ITEM(MRH_KeyCard_BLUFOR,2);