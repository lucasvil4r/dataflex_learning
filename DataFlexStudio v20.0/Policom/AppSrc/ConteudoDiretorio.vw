Use Windows.pkg
Use DFClient.pkg
Use DFTabDlg.pkg
Use DfAllEnt.pkg
Use cCJGrid.pkg
Use cCJGridColumn.pkg
Use ConsultaDiretorio.vw

Activate_View Activate_oConteudoDiretorio for oConteudoDiretorio
Object oConteudoDiretorio is a dbView
    Set Location to 2 4
    Set Border_Style to Border_Thick
    Set Size to 241 567
    Set piMinSize to 228 525
       
    Object oPathFile is a Form
        Get psDiretorio of oReadDir to sDiretorio
        
        Entry_Item sDiretorio
        Set Location to 22 81
        Set Size to 13 469
        Set Label to "Caminho arquivo:"
        Set Enabled_State to False
    
         //OnChange is called on every changed character
        Procedure OnChange
            Global_Variable String[] aFiles
            
            Move "Lucas" to aFiles[0]
            Move "Richard" to aFiles[1]
            Move "Ricardo" to aFiles[2]
            Move "Cris" to aFiles[3]
            
        End_Procedure
        
        Send OnChange
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
                 
        Procedure LoadData 
            Handle hoDataSource
            tDataSourceRow[] TheData
            Boolean bFound
            Integer iIndex    
            Integer iRows iFile
            
            Get phoDataSource to hoDataSource

//            Get the datasource indexes of the various columns
//            Get piColumnId of oCustomer_Customer_Number to iNum

//            Load All data into the datasource array
//            Clear Customer
//            Find ge Customer by 1

//            Move (Found) to bFound
//            While (bFound)
//                Move Customer.Customer_Number to TheData[iRows].sValue[iFile] 
//                Move (Found) to bFound
//                Increment iRows
//            Loop

            For iIndex from 0 to (SizeOfArray(aFiles) - 1)
                Move aFiles[iIndex] to TheData[iRows].sValue[iFile]
                Increment iRows
            Loop

            // Initialize Grid with new data
            Send InitializeData TheData
            Send MovetoFirstRow
        End_Procedure
    
        Procedure Activating
            Forward Send Activating
            Send LoadData
        End_Procedure
    
    End_Object

End_Object
