Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg
Use DfAllEnt.pkg

Activate_View Activate_oTabbedDemo for oTabbedDemo
Object oTabbedDemo is a dbView
    
    Set Label to "TabbedDemo"
    Set Size to 273 470
    Set Location to 0 4

    Object oReadDir is a Form
        Set Size to 14 326
        Set Location to 14 68
        Set Label to "Caminho arquivo:"
        
//        Procedure Construct_Object  
//            Forward Send Construct_Object  // very important! 
//            Property String psDiretorio 
//        End_Procedure
    End_Object
    
    Object oButton1 is a Button
        Set Size to 14 56
        Set Location to 14 399
        Set Label to "Ver diretorio"
        
        Procedure OnClick
            Send Activate_oConsultaFile    
        End_Procedure
    End_Object

    Object oOpenExplorer is a Form
        Set Size to 14 330
        Set Location to 250 67
        Set Label to "Caminho arquivo:"
        Property String psDiretorio
    End_Object
        
    Procedure OnChange
        Forward Send OnChange
        Set psDiretorio to oOpenExplorer
    End_Procedure

    Object oButton2 is a Button
        Set Size to 14 53
        Set Location to 250 404
        Set Label to "Abrir explorer"
    
        Procedure OnClick
            Forward Send OnClick
            String sDiretorio
            
            Get psDiretorio to sDiretorio
            
            Runprogram Background ('c:\windows\explorer.exe' *  '"' + ((sDiretorio)) + '"')
        End_Procedure  
    End_Object

End_Object
