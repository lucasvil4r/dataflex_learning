Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg
Use DfAllEnt.pkg
Use cCJGrid.pkg
Use cCJGridColumn.pkg
Use cFilesystem.pkg

Activate_View Activate_oConteudoDiretorio for oConteudoDiretorio
Object oConteudoDiretorio is a dbView
    Set Location to 2 4
    Set Border_Style to Border_Thick
    Set Size to 241 567
    Set piMinSize to 228 525                                     
       
    Object oPathFile is a Form
        Set Location to 22 81
        Set Size to 13 469
        Set Label to "Caminho arquivo:"
        Set Enabled_State to False
    End_Object
    
    Object oCustomerGrid is a cCJGrid
        Set Size to 165 533
        Set Location to 54 17
        Set peAnchors to anAll
        Set pbReadOnly to True
        Set pbSelectionEnable to True      

        Object oFileSearch is a cCJGridColumn
            Set piWidth to 889
            Set psCaption to "Arquivos encontrados:"
        End_Object
        
        Procedure CheckPath
            If (sReadDir <> "") Begin
                Set Value of oPathFile to sReadDir
                Send FileExplorer
                Send LoadData
            End
            Else Begin
                Send Info_Box "Caminho não encontrado, grid não foi contruida"
                Break
            End 
        End_Procedure
        
//        Procedure FileExplorer           
//            Object oFilesystem is a cFilesystem
//                Get ListOfFiles sReadDir to aFiles
//            End_Object
//        End_Procedure

        Procedure FileExplorer   
            String sBuffer sDiretorio iIndex

            Move ("dir: " + sReadDir) to sDiretorio
            Direct_Input sDiretorio
            Move 0 to iIndex                          
            While (not (SeqEof))
                Readln sBuffer
                Move sBuffer to aFiles[iIndex]
                Increment iIndex
            Loop
            Close_Input            
//            String sBuffer sDiretorio
//            Integer iIndex
//            
//            Move ("dir: " + sReadDir) to sDiretorio
//            Direct_Input sDiretorio
//            Move 0 to iIndex
//            While (not (SeqEof))
//                Move sBuffer to aFiles[iIndex]
//                Increment iIndex
//            Loop
//            Close_Input
//            Move "Lucas" to aFiles[0]
//            Move "Richard" to aFiles[1]
//            Move "Ricardo" to aFiles[2]
//            Move "Cris" to aFiles[3]
        End_Procedure
        
        Procedure LoadData 
            Handle hoDataSource
            tDataSourceRow[] TheData
            Boolean bFound   
            Integer iRows iFile iIndex

            Get phoDataSource to hoDataSource
    
            //Load All data into the datasource array
            For iIndex from 0 to (SizeOfArray(aFiles) - 1)
                Move aFiles[iIndex] to TheData[iRows].sValue[iFile]
                Increment iRows
            Loop
            
            // Initialize Grid with new data
            Send InitializeData TheData
            Send MovetoFirstRow
      End_Procedure
        
      Procedure Activating    
          Send CheckPath
          Send FileExplorer
          Forward Send Activating
      End_Procedure  
        
  End_Object
End_Object
