Use Windows.pkg
Use DFClient.pkg
Use cWsDbView.pkg
Use cWsContainer3D.pkg
Use cWsTextBox.pkg
Use cWsDbContainer3D.pkg
Use INFONFE.DD
Use cWsDbForm.pkg
Use cWsDbComboForm.pkg
Use dfLine.pkg
Use cWsButton.pkg
Use cWsOpenDialog.pkg
Use FuncoesGenericas.pkg
Use Flexml.pkg
Use envianfe.bp

Deferred_View Activate_oPFatCadastroInfonfe for ;
Object oPFatCadastroInfonfe is a cWsDbView
    Object oINFONFE_DD is a Infonfe_DataDictionary
    End_Object

    Set Main_DD to oINFONFE_DD
    Set Server to oINFONFE_DD

    Set Border_Style to Border_Thick
    Set Size to 246 421
    Set psNomeFonte to "PFatCadastroInfonfe.vw"
    Set Label to "Cadastro do InfoNFe"
    Set piMinSize to 246 421
    Set piMaxSize to 246 421

    Object oContainer3d1 is a cWsContainer3D
        Set Size to 34 425
        Set Location to 1 1
        Set Border_Style to Border_None
        Set Color to clWhite
        Set Bitmap to "LogoPolicom.bmp"
        Set peAnchors to anTopLeftRight

        Procedure Activating Returns Integer
            Integer iRetVal
            Forward Get msg_Activating to iRetVal
            Set Bitmap to SisTab.sAdmLogoEmpresa
        End_Procedure        

        Object oTxtTitulo is a cWsTextBox
            Set Size to 19 133
            Set Location to 8 154
            Set Label to "Cadastro do InfoNFe"
            Set FontPointHeight to 18
            Set TextColor to 8404992
        End_Object
    End_Object
	
    Object oContainerCorpo is a cWsDbContainer3D
        Set Size to 186 417
        Set Location to 35 2
        Set Border_Style to Border_ClientEdge
        Set peAnchors to anAll    

        Object oINFONFE_NUMNF is a cWsDbForm
            Entry_Item INFONFE.NUMNF
            Set Location to 4 31
            Set Size to 13 54
            Set Label to "Nro NF:"        
        End_Object

        Object oINFONFE_SERIE is a cWsDbForm
            Entry_Item INFONFE.SERIE
            Set Location to 4 107
            Set Size to 13 13
            Set Label to "Série:"
            Set Enabled_State to False            
        End_Object

        Object oINFONFE_DATAEMIS is a cWsDbForm
            Entry_Item INFONFE.DATAEMIS
            Set Location to 4 152
            Set Size to 13 41
            Set Label to "Emissão:"
            Set Enabled_State to False            
        End_Object

        Object oINFONFE_DATAAUTO is a cWsDbForm
            Entry_Item INFONFE.DATAAUTO
            Set Location to 62 52
            Set Size to 13 41
            Set Label to "Autorização:"        
        End_Object

        Object oINFONFE_HORAAUTO is a cWsDbForm
            Entry_Item INFONFE.HORAAUTO
            Set Location to 62 97
            Set Size to 13 35
        End_Object

        Object oINFONFE_PROTENVIO is a cWsDbForm
            Entry_Item INFONFE.PROTENVIO
            Set Location to 46 223
            Set Size to 13 64
            Set Label to "Protocolo de Envio:"        
        End_Object

        Object oINFONFE_ID is a cWsDbForm
            Entry_Item INFONFE.ID
            Set Location to 4 208
            Set Size to 13 202
            Set Label to "ID:"  
            Set Enabled_State to False      
        End_Object

        Object oINFONFE_SITUACAO is a cWsDbComboForm
            Entry_Item INFONFE.SITUACAO
            Set Location to 46 97
            Set Size to 13 55
            Set Entry_State to False     
        End_Object

        Object oINFONFE_DATASITU is a cWsDbForm
            Entry_Item INFONFE.DATASITU
            Set Location to 46 52
            Set Size to 13 41
            Set Label to "Data Situação:"
            Set Enabled_State to False    
        End_Object

        Object oINFONFE_PROTCANC is a cWsDbForm
            Entry_Item INFONFE.PROTCANC
            Set Location to 89 223
            Set Size to 13 96
            Set Label to "Protocolo de Cancelamento:"
            Set Enabled_State to False            
        End_Object

        Object oINFONFE_JUSTIFI is a cWsDbForm
            Entry_Item INFONFE.JUSTIFI
            Set Location to 107 84
            Set Size to 13 323
            Set Label to "Justificativa:"
            Set Enabled_State to False            
        End_Object

        Object oINFONFE_RECENVIO is a cWsDbForm
            Entry_Item INFONFE.RECENVIO
            Set Location to 46 344
            Set Size to 13 66
            Set Label to "Recibo de Envio:"        
        End_Object

        Object oINFONFE_DATACANCE is a cWsDbForm
            Entry_Item INFONFE.DATACANCE
            Set Location to 91 84
            Set Size to 13 41
            Set Label to "Data de Cancelamento:"
            Set Enabled_State to False            
        End_Object

        Object oINFONFE_DESCERRO is a cWsDbForm
            Entry_Item INFONFE.DESCERRO
            Set Location to 142 68
            Set Size to 13 228
            Set Label to "Descrição de erro:"
            Set Enabled_State to False    
        End_Object

        Object oINFONFE_ARQXML is a cWsDbForm
            Entry_Item INFONFE.ARQXML
            Set Location to 62 190
            Set Size to 13 220
            Set Label to "Arquivo XML:"
            Set Prompt_Button_Mode to PB_PromptOn
                    
            Procedure Prompt
                Forward Send Prompt
                
                Handle hoOpenDg 
                Date dDataEntrada
                Boolean bSave bExist
                String sFileName sTemp sFolder sFile sNroNF sSerie sDoc sAno sCnpj
                
                // tratamento do arquivo de origem
                Get Create (RefClass(cWsOpenDialog)) to hoOpenDg
                Set Filter_String  of hoOpenDg to 'Arquivo XML|*.XML'
                Set Dialog_Caption of hoOpenDg to 'Selecione o local de origem...'
                Set Initial_Folder of hoOpenDg to (fGetWindowsUserDesktop())
                Get Show_Dialog of hoOpenDg to bSave
                If (bSave) Get File_Name  of hoOpenDg to sFileName
                Send Destroy of hoOpenDg

                // Copia o arquivo para o diretório/arquivo padrão
                Move ((sFileName)) to sFileName
                File_Exist sFileName bExist 
                If bExist Set Value to sFileName
            End_Procedure

        End_Object
        
        Object oINFONFE_MSGSEFAZ is a cWsDbForm
            Entry_Item INFONFE.MSGSEFAZ
            Set Location to 158 68
            Set Size to 13 228
            Set Label to "Mensagem Sefaz:"    
            Set Enabled_State to False    
        End_Object

        Object oINFONFE_CARTACORR is a cWsDbForm
            Entry_Item INFONFE.CARTACORR
            Set Location to 89 388
            Set Size to 13 18
            Set Label to "Carta de Correção:"
            Set Enabled_State to False        
        End_Object

        Object oINFONFE_iTPNF is a cWsDbComboForm
            Entry_Item INFONFE.iTPNF
            Set Location to 20 31
            Set Size to 13 55
            Set Label to "Tipo:"
            Set Enabled_State to False    
        End_Object

        Object oINFONFE_iFinNf is a cWsDbComboForm
            Entry_Item INFONFE.iFinNf
            Set Location to 20 130
            Set Size to 12 280
            Set Label to "Finalidade:"
            Set Enabled_State to False    
        End_Object

        Object oLineControl1 is a LineControl
            Set Size to 1 398
            Set Location to 38 8
        End_Object

        Object oLineControl2 is a LineControl
            Set Size to 1 398
            Set Location to 83 8
        End_Object

        Object oLineControl3 is a LineControl
            Set Size to 1 398
            Set Location to 131 8
        End_Object
        
        Object oBtAtualizaXML is a cWsButton
            Set Size to 28 104
            Set Location to 142 301
            Set Label to 'Atualizar XML e Protocolo autorizado'
            Set psImage to "XML.ico"
            Set piImageSize to 32
            Set MultiLineState to True
                    
            Procedure OnClick
                Handle hoXML hoNode
                Boolean bExist bOK
                String sPathXMLfile sNameSpace sNfe sDhEmi sCnpj sDhRecbto sMotivo sProt sArqXML sPathNFe sAmbiente sAno sMes sSerieNFe
                Integer iCount
                Number nResposta
                Date dDataEmis
                
//                Get Field_Current_Value of oINFONFE_DD Field INFONFE.ARQXML to sXMLfile
//                If (sXMLfile = "") Get psFileName of oINFONFE_ARQXML to sXMLfile

                Get Value of oINFONFE_ARQXML to sPathXMLfile
                File_Exist sPathXMLfile bExist
                
                If (bExist) Begin          
                    // Create document object
                    Get Create (RefClass(cXmlDomDocument)) to hoXML
            
                    Set psDocumentName of hoXML to sPathXMLfile
                    Set pbAsync of hoXML to False
                    Set pbValidateOnParse of hoXML to True
             
                    // Load the document
                    Get LoadXMLDocument of hoXML to bOK
             
                    // If the document fails to load, abort the program
                    If not bOK Begin
                        Send BasicParseErrorReport of hoXML
                        Send Destroy of hoXML
                        Procedure_Return
                    End
                    
                    Move "xmlns:q='http://www.portalfiscal.inf.br/nfe' " to sNameSpace
                    
                    Set psSelectionNamespaces of hoXML to sNameSpace
                    
                    Get FindNode of hoXML "q:nfeProc/q:NFe/q:infNFe/q:ide/q:nNF" to hoNode
                    If (not(hoNode = 0)) Get psText of hoNode to sNfe    
                    Else Send Info_Box "Não foi possível encontrar Tag <nNF>" "Info"                                      
                    
                    Get FindNode of hoXML "q:nfeProc/q:NFe/q:infNFe/q:ide/q:dhEmi" to hoNode
                    If (not(hoNode = 0)) Get psText of hoNode to sDhEmi 
                    Else Send Info_Box "Não foi possível encontrar Tag <dhEmi>" "Info"

                    Get FindNode of hoXML "q:nfeProc/q:NFe/q:infNFe/q:emit/q:CNPJ" to hoNode
                    If (not(hoNode = 0)) Get psText of hoNode to sCnpj 
                    Else Send Info_Box "Não foi possível encontrar Tag <CNPJ>" "Info" 
                    
                    Get FindNode of hoXML "q:nfeProc/q:protNFe/q:infProt/q:dhRecbto" to hoNode
                    If (not(hoNode = 0)) Get psText of hoNode to sDhRecbto   
                    Else Send Info_Box "Não foi possível encontrar Tag <dhRecbto>" "Info"
                    
                    Get FindNode of hoXML "q:nfeProc/q:protNFe/q:infProt/q:xMotivo" to hoNode
                    If (not(hoNode = 0)) Get psText of hoNode to sMotivo  
                    Else Send Info_Box "Não foi possível encontrar Tag <xMotivo>" "Info" 
                    
                    Get FindNode of hoXML "q:nfeProc/q:protNFe/q:infProt/q:nProt" to hoNode
                    If (not(hoNode = 0)) Get psText of hoNode to sProt
                    Else Send Info_Box "Não foi possível encontrar Tag <nProt>" "Info"
                    
                    Get FindNode of hoXML "q:nfeProc/q:NFe/q:infNFe/q:ide/q:serie" to hoNode
                    If (not(hoNode = 0)) Get psText of hoNode to sSerieNFe
                    Else Send Info_Box "Não foi possível encontrar Tag <serie>" "Info"
                    
                    Send Destroy of hoNode
                    Send Destroy of hoXML
                                   
                    Open TCamEmp
                    Open tfatnf
                    
                    Clear TCamEmp
                    Clear tfatnf
//                    Clear INFONFE
                    
                    Move gsCodEmp to TCamEmp.EMP
//                    Move sNfe to TFATNF.sCdNota
//                    Move sNfe to INFONFE.NUMNF
//                    
                    Find eq TCamEmp by 1
//                    Find eq tfatnf by 1
//                    Find eq INFONFE by 1

                    Constraint_Set 1                             
                    Constrain tfatnf.sCdNota eq sNfe     
                    Constrained_Find First tfatnf by 1
                    
                    If ((not(sNfe = (Trim(tfatnf.sCdNota))))) Begin
                        Send Info_Box "Número da NFE divergente" "Erro"
                        Procedure_Return
                    End
                    
                    If ((not(sCnpj = (Trim(TCamEmp.CNPJ))))) Begin
                        Send Info_Box "CNPJ divergente" "Erro"
                        Procedure_Return
                    End
                    
                    If ((not((Trim(sMotivo)) = "Autorizado o uso da NF-e"))) Begin
                        Send Info_Box "Nota fiscal não autorizado" "Erro"
                        Procedure_Return
                    End
                    
                    Move (YesNo_Box("Informaçoes carregadas com sucesso do XML, deseja gravar ?", "Atenção", MB_DEFBUTTON2)) to nResposta
                    If (nResposta = MBR_Yes) Begin
                        
                        Get Pambiente of oEnvianfe to sAmbiente
                        Get RetornaPastaXml dDataEmis sAmbiente of oEnvianfe to sPathNFe 
                        Get VerificaPastaXML sPathNFe of oEnvianfe to bExist
                        
//                        If ((not(sAmbiente = "1"))) Move "1" to sAmbiente
//                        
//                        Move TFATNF.dDtEmissao to dDataEmis
//                        Move (DateGetMonth(dDataEmis)) to sMes
//                        Move (DateGetYear(dDataEmis)) to sAno
//                        Move ("00" + (trim(sMes))) to sMes
//                        Move (Right(sMes,2)) to sMes
//                        
//                        If (gsCodEmp = "PP") Begin
//                            If (sAmbiente = "1") Move (Lowercase("\\poliserv\dataflex\DFPP\NFEenviadas\"+sAno+sMes)) to sPathNFe
//                            Else                Move (Lowercase(gsPastaNFe))              to sPathNFe
//                        End
//                        Else If (gsCodEmp = "PE") Begin
//                            If (sAmbiente = "1") Move (Lowercase("\\poliserv\dataflex\SisVisualPE\NFE\"+sAno+sMes)) to sPathNFe
//                            Else                Move (Lowercase(gsPastaNFe))             to sPathNFe
//                        End
//                        Else Begin
//                            If (sAmbiente = "1") Move (Lowercase("G:\DF\NFEenviadas\"+sAno+sMes)) to sPathNFe
//                            Else                Move (Lowercase(gsPastaNFe))            to sPathNFe
//                        End
//                        
//                        File_Exist sPathNFe bExist
//                        Move (sPathNFe + "\") to sPathNFe 
//                        
//                        If (not(bExist)) Begin
//                            Make_Directory sPathNFe
//                            Sleep 2
//                            File_Exist sPathNFe bExist
//                        End
                        
                        If (bExist) Begin
                            Move (String((Lowercase(gsCodEmp + "nfe" + sNfe + ".xml")))) to sArqXML
                            RenameFile sPathXMLfile to sArqXML
                            
                            //atualizando caminho com arquivo xml
                            Move (sPathNFe + sArqXML) to sPathXMLfile

                            CopyFile sArqXML to sPathNFe
                            Send pCopyFile sArqXML sPathXMLfile
                        End      

                        Send Refind_Records of oINFONFE_DD
                        
                        If (INFONFE.NUMNF = sNfe) Begin
                            Send Info_Box "Caiu no IF para salvar" "Info"
//                            Reread INFONFE
//                                Move sDhEmi to INFONFE.DATAEMIS  // data de emissão
//                                Move "" to INFONFE.ID  // id da NFe
//                                Move "A" to INFONFE.SITUACAO  // e= enviado  c= cancelado a=autorizado r= rejeitado
//                                Move DATAHJ to INFONFE.DATASITU // data da situação
//                                Move (Trim(nrorec)) to INFONFE.RECENVIO // recibo de envio
//                                Move sDhEmi to INFONFE.DATAEMIS
//                                Move sPathXMLfile to INFONFE.ARQXML
//                                SaveRecord INFONFE
//                            Unlock
                        End
                        Else Begin
                            Send Stop_Box "Não foi possível gravar os dados, número da nota fiscal divergente dos registros gravados na base de dados" "Info"
                        End
                    End
                    Else Begin
                        Send Stop_Box "Nada foi alterado!" "Info"
                        Procedure_Return
                    End
                    
                    Constraint_Set 1 Clear 
                    Constraint_Set 1 Delete

                    Close TCamEmp
                    Close TFATNF
                End
                Else Send Info_Box "Não foi possível carregar o XML indicado" "Info"
            End_Procedure
            
        End_Object
    End_Object
    
    Object oContainerToolbar is a cWsContainer3D
        Set Size to 20 360
        Set Location to 223 8
        Set Border_Style to Border_StaticEdge
        Set peAnchors to anBottomLeft
        #Include ToolBar.pkg
    End_Object
Cd_End_Object
