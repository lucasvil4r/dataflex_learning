// Kitchen.sl
// Kitchen Lookup List

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use cKitchenDataDictionary.dd

CD_Popup_Object Kitchen_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 170
    Set Label To "Kitchen Lookup List"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oKitchen_DD is a cKitchenDataDictionary
    End_Object 

    Set Main_DD To oKitchen_DD
    Set Server  To oKitchen_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 160
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "Kitchen_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oKitchen_Name is a cDbCJGridColumn
            Entry_Item Kitchen.Name
            Set piWidth to 250
            Set psCaption to "Name"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 7
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 61
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 115
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // Kitchen_sl
