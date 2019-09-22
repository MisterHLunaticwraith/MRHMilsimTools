class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class mrhtools_attributes {
                displayName = $STR_MRH_MISC_3DENattributesCat;
                collapsed = 1;
                class Attributes 
                {
                    class MRH_isZeus
                    {
                       
                        displayName = $STR_MRH_MISC_isZeus3DENATT; 
                        tooltip = $STR_MRH_MISC_isZeus3DENATTToolTip; 
                        property = "mrh_isZeus"; 
                        control = "CheckboxState";    
                        expression = "[_this] call MRH_fnc_MilsimTools_Core_isCurator;";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectControllable";
                        typeName = "BOOL";
                    };
                };
            };
        };
    };
/*
    class Group {
        class AttributeCategories {
            class mrhtools_attributes {
                displayName = $STR_MRH_MISC_3DENattributesCat;
                collapsed = 1;
                class Attributes {};
            };
        };
    };
*/
};