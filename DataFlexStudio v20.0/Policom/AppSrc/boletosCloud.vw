Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg

Activate_View Activate_oBoletosCloud for oBoletosCloud
Object oBoletosCloud is a dbView
    Set Label to "boletosCloud"
    Set Size to 111 250
    Set Location to 5 7

    Object oNewTabDialog is a dbTabDialogView
        Set Size to 100 240
        Set Location to 5 5
        Set Rotate_Mode to RM_Rotate

        Object oNewTabPage1 is a dbTabView
            Set Label to "Page 1"

            Object oTextBox2 is a Textbox
                Set Label to "Create a DDO structure for each tab page."
                Set Location to 8 6
                Set Size to 10 135
            End_Object

            Object oTextBox3 is a Textbox
                Set Label to "Then create entry forms for each page."
                Set Location to 22 6
                Set Size to 10 124
            End_Object

            Object oTextBox4 is a Textbox
                Set Label to "Each tab page will behave as if it was a separate data entry view."
                Set Location to 36 6
                Set Size to 10 207
            End_Object

        End_Object

        Object oNewTabPage2 is a dbTabView
            Set Label to "Page 2"
        End_Object

    End_Object

End_Object
