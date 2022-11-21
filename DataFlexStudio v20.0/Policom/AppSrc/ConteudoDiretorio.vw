Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg
Use DfAllEnt.pkg
Use cCJGrid.pkg
Use cCJGridColumn.pkg
Use cFilesystem.pkg
Use cCJGridColumnRowIndicator.pkg

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
       
    Object oCJGrid1 is a cCJGrid
        Set Size to 165 533
        Set Location to 54 17
        Set peAnchors to anAll
        Set pbReadOnly to True
        Set pbSelectionEnable to True 

        Object oCJGridColumnRowIndicator1 is a cCJGridColumnRowIndicator
            Set piWidth to 18
        End_Object

        Object oCustomer_Name is a cCJGridColumn
            Set piWidth to 889
            Set psCaption to "Arquivos encontrados:"
        End_Object
        
        Procedure CheckPath
            Boolean bExist
            
            File_Exist sReadDir bExist
            If (bExist) Begin
                Set Value of oPathFile to sReadDir
                Send FileExplorer
                Send LoadData
            End
            Else Begin
                Send Info_Box "Caminho não encontrado, grid não foi contruida"
                Break
            End 
        End_Procedure
        
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
        End_Procedure
        
        Procedure OnRowDoubleClick Integer iRow Integer iCol                      
            Forward Send OnRowDoubleClick iRow iCol 
            String sFile
            Boolean bExist
                        
            //  Setinha
            If (iCol = (piColumnId(oCJGridColumnRowIndicator1))) Begin
                If (YesNo_Box("Deseja mesmo excluir o arquivo?","Informação",MBR_Yes) = MBR_Yes) Begin                   
                      
                    Get RowValue of oCustomer_Name iRow to sFile
                    Move (sReadDir + "\" + sFile) to sFile
                   
                    EraseFile sFile        
                    File_Exist sFile bExist
                        
                    If (not(bExist)) Begin
                        Send Info_Box (sFile + "was deleted successfully")
                    End
                    Else Begin
                        Send Stop_Box (sFile + "was NOT deleted successfully")
                    End    
                End
            End
            //  Nome do arquivo
            If (iCol = (piColumnId(oCustomer_Name))) Begin     
                Get RowValue of oCustomer_Name iRow to sFile
                Move (sReadDir + "\" + sFile) to sFile
                
                Send Info_Box ("Function download " + sFile)
                // Dowload
            End

          Send CheckPath
          Send FileExplorer
        End_Procedure
        
        Procedure LoadData 
            tDataSourceRow[] TheData
            Boolean bFound
            Integer iRows iName iIndex iIndicador
        
            // Get the datasource indexes of the various columns
            Get piColumnId of oCJGridColumnRowIndicator1 to iIndicador
            Get piColumnId of oCustomer_Name to iName
    
            For iIndex from 0 to (SizeOfArray(aFiles) - 1)   
                If not (aFiles[iIndex] = "[.]" or aFiles[iIndex] = "[..]") Begin
                    Move aFiles[iIndex] to TheData[iRows].sValue[iName] 
                    Increment iRows
                End
            Loop
            
            // Initialize Grid with new data
            Send InitializeData TheData
            Send MovetoFirstRow
        End_Procedure
        
        Procedure Activating    
          Forward Send Activating
          Send CheckPath
          Send FileExplorer
        End_Procedure  

        Procedure Deactivating
            Forward Send Deactivating
        End_Procedure

    End_Object  
End_Object
