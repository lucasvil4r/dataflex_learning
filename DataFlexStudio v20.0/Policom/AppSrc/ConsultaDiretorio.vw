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
            String sDiretorio
            
            Set Value of oOpenExplorer to sDiretorio
            Set psOpenExplorer to sDiretorio
        End_Procedure
    End_Object

    Object oReadDir is a Form
        Set Size to 14 326
        Set Location to 44 68
        Set Label to "Caminho arquivo:"
        Property String psReadDir
             
        Procedure Onchange
            String sDiretorio
            
            Set Value of oReadDir to sDiretorio
            Set psReadDir to sDiretorio 
        End_Procedure
    End_Object
  
    Object oButton1 is a Button
        Set Size to 15 56
        Set Location to 14 401
        Set Label to "Abrir explorer"
        
        Procedure DoesFileExist
            String sDiretorio
            Global_Variable Boolean bFileExists
            
            Get psOpenExplorer of oOpenExplorer to sDiretorio
            
            File_Exist sDiretorio bFileExists
        End_Procedure
        
        Send DoesFileExist
        
        Procedure OnClick
            String sDiretorio
            
            Get psOpenExplorer of oOpenExplorer to sDiretorio
            
            If bFileExists Begin
                Runprogram Background ('c:\windows\explorer.exe' *  '"' + ((sDiretorio)) + '"')
            End
            Else Begin
                Send Info_Box "Caminho não encontrado"
            End
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
