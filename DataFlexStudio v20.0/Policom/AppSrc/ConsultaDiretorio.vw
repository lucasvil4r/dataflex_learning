Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg
Use DfAllEnt.pkg
Use File_dlg.pkg

Activate_View Activate_oConsultaDiretorio for oConsultaDiretorio
Object oConsultaDiretorio is a dbView
    Set Label to "Consulta"
    Set Size to 73 470
    Set Location to -1 4
    
    Object oOpenExplorer is a Form
        Set Size to 14 326
        Set Location to 14 68
        Set Label to "Caminho arquivo:"
        Property String psOpenExplorer

        Procedure Onchange
            Send AtribueValue
        End_Procedure
    
        Procedure AtribueValue
            Set psOpenExplorer of oOpenExplorer to oOpenExplorer
        End_Procedure
    End_Object

    Object oReadDir is a Form
        Set Size to 14 326
        Set Location to 44 68
        Set Label to "Caminho arquivo:"
        Property String psReadDir
        
//        Procedure Onchange
//            Set psReadDir to oReadDir
//        End_Procedure
    End_Object
  
    Object oButton1 is a Button
        Set Size to 15 56
        Set Location to 14 401
        Set Label to "Abrir explorer"
        
        Procedure OnClick
            String sDiretorio
            
//            Set psOpenExplorer of oOpenExplorer to oOpenExplorer
            Get psOpenExplorer of oOpenExplorer to sDiretorio
            
            Runprogram Background ('c:\windows\explorer.exe' *  '"' + ((sDiretorio)) + '"')
        End_Procedure  
    End_Object
    
    Object oButton2 is a Button
        Set Size to 14 56
        Set Location to 44 401
        Set Label to "Ver diretorio"
        
        Procedure OnClick
            Send Activate_oConteudoDiretorio 
        End_Procedure
    End_Object
End_Object
