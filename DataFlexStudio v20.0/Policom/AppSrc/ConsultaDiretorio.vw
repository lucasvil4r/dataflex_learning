﻿Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg
Use DfAllEnt.pkg
Use File_dlg.pkg

Activate_View Activate_oConsultaDiretorio for oConsultaDiretorio
Object oConsultaDiretorio is a dbView
    
    Set Label to "Consulta"
    Set Size to 73 470
    Set Location to -1 4

    Object oReadDir is a Form
        Set Size to 14 326
        Set Location to 44 68
        Set Label to "Caminho arquivo:"
<<<<<<< HEAD
        Set Prompt_Button_Mode to PB_PromptOn
        Property String psReadDir
        
        Procedure Exiting
            Set psReadDir to oReadDir
        End_Procedure
    End_Object
    
    Object oOpenExplorer is a Form
        Set Size to 14 326
        Set Location to 15 70
        Set Label to "Caminho arquivo:"
        Property String psOpenExplorer

        Procedure Onchange
            Set psOpenExplorer to oOpenExplorer
        End_Procedure
    End_Object
=======
        Property String psDiretorio
   End_Object
>>>>>>> eafe4cda8073e8d4ccd2fe8079020d0688dd0eaa
    
    Object oButton1 is a Button
        Set Size to 14 56
        Set Location to 44 401
        Set Label to "Ver diretorio"

        Procedure OnClick
            Set psDiretorio to oReadDir
            Send Activate_oConteudoDiretorio 
        End_Procedure
    End_Object

<<<<<<< HEAD
=======
    Object oOpenExplorer is a Form
        Set Size to 14 326
        Set Location to 15 68
        Set Label to "Caminho arquivo:"

        Procedure Key
            Global_Variable String sDiretorio
            Move oOpenExplorer to sDiretorio
        End_Procedure
    End_Object
    
>>>>>>> eafe4cda8073e8d4ccd2fe8079020d0688dd0eaa
    Object oButton2 is a Button
        Set Size to 15 56
        Set Location to 14 400
        Set Label to "Abrir explorer"
        
        Procedure OnClick
<<<<<<< HEAD
            String sDiretorio
            
            Get psOpenExplorer of oOpenExplorer to sDiretorio
=======
>>>>>>> eafe4cda8073e8d4ccd2fe8079020d0688dd0eaa
            Runprogram Background ('c:\windows\explorer.exe' *  '"' + ((sDiretorio)) + '"')
        End_Procedure  
    End_Object
End_Object
