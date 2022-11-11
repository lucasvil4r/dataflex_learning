Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg
Use DfAllEnt.pkg

Activate_View Activate_oConsultaDiretorio for oConsultaDiretorio
Object oConsultaDiretorio is a dbView
    
    Set Label to "Consulta"
    Set Size to 73 470
    Set Location to -1 4

    Object oReadDir is a Form
        Set Size to 14 326
        Set Location to 44 68
        Set Label to "Caminho arquivo:"
        Property String psDiretorio
   End_Object
    
    Object oButton1 is a Button
        Set Size to 14 56
        Set Location to 44 401
        Set Label to "Ver diretorio"
        
        Procedure OnClick
            Set psDiretorio to oReadDir
            Send Activate_oConteudoDiretorio 
        End_Procedure
    End_Object

    Object oOpenExplorer is a Form
        Set Size to 14 326
        Set Location to 15 68
        Set Label to "Caminho arquivo:"

        Procedure Key
            Global_Variable String sDiretorio
            Move oOpenExplorer to sDiretorio
        End_Procedure
    End_Object
    
    Object oButton2 is a Button
        Set Size to 15 56
        Set Location to 14 400
        Set Label to "Abrir explorer"
    
        Procedure OnClick
            Runprogram Background ('c:\windows\explorer.exe' *  '"' + ((sDiretorio)) + '"')
        End_Procedure  
    End_Object

End_Object
