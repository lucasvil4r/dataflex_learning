Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg
Use DfAllEnt.pkg
Use File_dlg.pkg
Use cFilesystem.pkg

Deferred_View Activate_oTestFunction for ;
Object oTestFunction is a dbView

    Set Border_Style to Border_Thick
    Set Size to 126 470
    Set Location to -1 4

    Procedure FindDbFiles String sPathFind String sPathDestiny String sNameDb String[] ByRef sArquivosOrigem String[] ByRef sArquivosDestino  
        Boolean bExist
        String [] aFiles aExtension
        String sBuffer sFilePlusExtension sExtension sFile
        Integer iIndexFiles iIndexExtension
        
        Move "DAT" to aExtension[0]
        Move "K1" to aExtension[1]
        Move "K2" to aExtension[2]
        Move "K3" to aExtension[3]
        Move "K4" to aExtension[4]
        Move "K5" to aExtension[5]
        Move "K6" to aExtension[6]
        Move "K7" to aExtension[7]
        Move "K8" to aExtension[8]
        Move "K9" to aExtension[9]
        Move "K10" to aExtension[10]
        Move "K11" to aExtension[11]
        Move "K12" to aExtension[12]
        Move "K13" to aExtension[13]
        Move "K14" to aExtension[14]
        Move "K15" to aExtension[15]
        Move "VLD" to aExtension[16]
        Move "TAG" to aExtension[17]
        Move "HDR" to aExtension[18]
                   
        File_Exist sPathFind bExist
        If (bExist) Begin   
            
            Direct_Input ("dir: " + sPathFind)      
            While (not (SeqEof))  
                Readln sBuffer
                If not (sBuffer = "[.]" or sBuffer = "[..]" or sBuffer = "") Begin 
                    Move (Uppercase(sBuffer)) to sFile
                    Move (Uppercase(sNameDb)) to sNameDb  
                    
                    For iIndexExtension from 0 to (SizeOfArray(aExtension) - 1)
                        Move aExtension[iIndexExtension] to sExtension
                        Move (sNameDb + "." + sExtension) to sFilePlusExtension
                         
                        If (sFile = sFilePlusExtension) Begin       
                            Move (sPathFind + "\" + sBuffer) to sArquivosOrigem[iIndexFiles] 
                            Move (sPathDestiny + "\" + sBuffer) to sArquivosDestino[iIndexFiles]                          
                            Increment iIndexFiles
                            Move (SizeOfArray(aExtension) - 1) to iIndexExtension
                        End                    
                    Loop             
                End
            Loop
            Close_Input            
        End
        Else Begin
            Send Info_Box "Caminho n∆o encontrado"
        End 
    End_Procedure
    
    Function CopyDbFiles String sPathSender String sPathDestination String sFiles Returns Boolean
        Integer iIndex
        String[] sArquivosOrigem 
        String[] sArquivosDestino
        Boolean bReturn
              
        Handle hoFileSystem
        Get Create (RefClass(cFilesystem)) to hoFileSystem
   
        Send FindDbFiles sGPathFind sGPathDestination sGNameDb (&sArquivosOrigem) (&sArquivosDestino)
    
        For iIndex from 0 to (SizeOfArray(sArquivosOrigem) - 1) 
            Get FileCopy of hoFileSystem sArquivosOrigem[iIndex] sArquivosDestino[iIndex] 0 0 to bReturn
        Loop
        
        Send Destroy of hoFileSystem
        
        Function_Return bReturn
    End_Function
      
    Object oPathFind is a Form
        Set Size to 15 263
        Set Location to 4 64
        Set Label to "oPathFind:"

        Procedure OnChange
            Forward Send OnChange
            
            Get Value of oPathFind to sGPathFind
        End_Procedure
    End_Object

    Object oPathDestinatio is a Form
        Set Size to 17 381
        Set Location to 45 64
        Set Label to "oPathDestinatio:"
    
        Procedure OnChange           
            Forward Send OnChange
            
            Get Value of oPathDestinatio to sGPathDestination
        End_Procedure
    End_Object
    
    Object oNameDb is a Form
        Set Size to 17 70
        Set Location to 4 389
        Set Label to "oNameDb:"
    
        Procedure OnChange           
            Forward Send OnChange
            
            Get Value of oNameDb to sGNameDb
        End_Procedure
    End_Object  
                                   
    Object oFunctionCopyDbFiles is a Button
        Set Size to 38 212
        Set Location to 78 132
        Set Label to 'Testar funá∆o'
    
        // fires when the button is clicked
        Procedure OnClick
            Boolean bRetornoFunction
            
            Get CopyDbFiles sGPathFind sGPathDestination sGNameDb to bRetornoFunction
        End_Procedure
    End_Object
Cd_End_Object
