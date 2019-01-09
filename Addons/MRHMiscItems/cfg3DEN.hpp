
// Configuration of all objects
class object
{
    // Categories collapsible in "Edit Attributes" window
    class AttributeCategories
    {
        // Category class, can be anything
        class MRH_BioScanner_settings
        {
            displayName = "Bio scanner configuration, ACE interactions"; // Category name visible in Edit Attributes window
            collapsed = 1; // When 1, the category is collapsed by default
            class Attributes
            {
                // Attribute class, can be anything
                class MainTouchScreen
                {
                    //--- Mandatory properties
                    displayName = "Code to run when the main touchscreen is used."; // Name assigned to UI control class Title
                    tooltip = "Configure all the things!"; // Tooltip assigned to UI control class Title
                    property = "codeTouchSCreen"; // Unique config property name saved in SQM
                    control = "Edit"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes

                    // Expression called when applying the attribute in Eden and at the scenario start
                    // The expression is called twice - first for data validation, and second for actual saving
                    // Entity is passed as _this, value is passed as _value
                    // %s is replaced by attribute config name. It can be used only once in the expression
                    // In MP scenario, the expression is called only on server.
                    expression = "[_this,%s,'main'] call MRH_fnc_MilsimTools_MiscItems_handleBioScannerActions;";

                    // Expression called when custom property is undefined yet (i.e., when setting the attribute for the first time)
                    // Entity is passed as _this
                    // Returned value is the default value
                    // Used when no value is returned, or when it's of other type than NUMBER, STRING or ARRAY
                    // Custom attributes of logic entities (e.g., modules) are saved always, even when they have default value
                    defaultValue = "";

                    //--- Optional properties
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "expression"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "STRING"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };
            };
        };
    };
};
