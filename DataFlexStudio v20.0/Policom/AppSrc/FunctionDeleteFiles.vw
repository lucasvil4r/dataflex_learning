Use Windows.pkg
Use DFClient.pkg

Deferred_View Activate_oFunctionDeleteFiles for ;
Object oFunctionDeleteFiles is a dbView

    Set Border_Style to Border_Thick
    Set Size to 186 397
    Set Location to 1 1
    Set Label to "FunctionDeleteFiles"
    
    Procedure FindDbFiles String sPathFind String sNameDb String[] ByRef sArquivos
        Boolean bExist
        String sBuffer sFile sExtention
        Integer iIndexFiles iPos
                   
        Move (sNameDb + ".") to sNameDb
        Move (Uppercase(sNameDb)) to sNameDb
        
        
        File_Exist sPathFind bExist
        If (bExist) Begin                
            Handle hoFileSystem
            
            Direct_Input ("dir: " + sPathFind)      
            While (not (SeqEof))  
                Readln sBuffer
                If not (sBuffer = "[.]" or sBuffer = "[..]" or sBuffer = "") Begin
                     
                    Get Create (RefClass(cFilesystem)) to hoFileSystem 
                    Get RemoveExtention of hoFileSystem sBuffer to sExtention
                    
                    Move (Replace(sExtention, sBuffer, "")) to sFile
                    Move (Uppercase(sFile)) to sFile
                                       
                    If (sFile = sNameDb) Begin
                        Move (sPathFind + "\" + sBuffer) to sArquivos[iIndexFiles]
                        Increment iIndexFiles
                    End                  
                End
            Loop
            Close_Input 
                       
            Send Destroy of hoFileSystem   
        End
        Else Begin
            Send Info_Box "Caminho não encontrado"
        End 
    End_Procedure
    
    Function DeleteDbFiles String sPathSender String sPathDestination String sFiles Returns Boolean
        Integer iIndex
        String[] sArquivos
        Boolean bReturn
              
        Handle hoFileSystem
        Get Create (RefClass(cFilesystem)) to hoFileSystem
   
        Send FindDbFiles sGPathFind sGNameDb (&sArquivos)
        
        For iIndex from 0 to (SizeOfArray(&sArquivos) - 1) 
            Get FileDelete of hoFileSystem (&sArquivos[iIndex]) to bReturn
        Loop
      
        Send Destroy of hoFileSystem
             
        Function_Return bReturn
    End_Function
    
    Object oPathFind is a Form
        Set Size to 15 330
        Set Location to 13 62
        Set Label to "oPathFind:"

        Procedure OnChange
            Forward Send OnChange
            
            Get Value of oPathFind to sGPathFind
        End_Procedure
    End_Object
    
    Object oNameDb is a Form
        Set Size to 17 157
        Set Location to 46 116
        Set Label to "oNameDb:"
    
        Procedure OnChange           
            Forward Send OnChange
            
            Get Value of oNameDb to sGNameDb
        End_Procedure
    End_Object  
                                   
    Object oFunctionDeleteFiles is a Button
        Set Size to 38 212
        Set Location to 102 92
        Set Label to 'Testar oFunctionDeleteFiles'
    
        // fires when the button is clicked
        Procedure OnClick
            Boolean bRetornoFunction
                       
            Get DeleteDbFiles sGPathFind sGNameDb to bRetornoFunction
        End_Procedure
    End_Object
Cd_End_Object
