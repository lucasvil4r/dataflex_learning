Use Windows.pkg
Use DFClient.pkg
Use cRecipeDataDictionary.dd
Use cKitchenDataDictionary.dd
Use cIngredientsDataDictionary.dd
Use DFEntry.pkg
Use cDbTextEdit.pkg
Use dbTrckBr.pkg
Use cDbCJGrid.pkg
Use cdbCJGridColumn.pkg

Deferred_View Activate_oRecipe for ;
Object oRecipe is a dbView
    Object oIngredients_DD is a cIngredientsDataDictionary
    End_Object

    Object oKitchen_DD is a cKitchenDataDictionary
    End_Object

    Object oRecipe_DD is a cRecipeDataDictionary
    End_Object

    Set Main_DD to oRecipe_DD
    Set Server to oRecipe_DD

    Set Border_Style to Border_Thick
    Set Size to 199 534
    Set Location to 1 1
    Set Label to "Recipe"

    Object oRecipe_Name is a dbForm
        Entry_Item Recipe.Name
        Set Location to 14 69
        Set Size to 12 200
        Set Label to "Name:"
    End_Object

    Object oRecipe_HowToMake is a cDbTextEdit
        Entry_Item Recipe.HowToMake
        Set Location to 110 8
        Set Size to 75 263
        Set Label to "HowToMake:"
    End_Object

    Object oRecipe_PreparationTime is a dbForm
        Entry_Item Recipe.PreparationTime
        Set Location to 57 69
        Set Size to 12 24
        Set Label to "PreparationTime:"
    End_Object

    Object oRecipe_Created is a dbForm
        Entry_Item Recipe.Created
        Set Location to 57 203
        Set Size to 12 66
        Set Label to "Created:"
    End_Object

    Object oKitchen_Name is a dbForm
        Entry_Item Kitchen.Name
        Set Location to 36 69
        Set Size to 12 200
        Set Label to "Kitchen:"
    End_Object

    Object oDbTrackBar1 is a dbTrackBar
        Entry_Item Recipe.Rating
        Set Size to 13 100
        Set Location to 79 69
        Set Label to "Rating:"
        Set Maximum_Position to 10
    End_Object

    Object oButton1 is a Button
        Set Size to 15 90
        Set Location to 78 181
        Set Label to "Find the pickled cucumber"
    
        // fires when the button is clicked
        Procedure OnClick
            Move "Pickled cucumber" to Recipe.Name
            Send Find of oRecipe_DD GE 2
        End_Procedure
    
    End_Object

    Object oDbCJGrid1 is a cDbCJGrid
        Set Server to oIngredients_DD
        Set Size to 170 232
        Set Location to 14 290

        Object oIngredients_Name is a cDbCJGridColumn
            Entry_Item Ingredients.Name
            Set piWidth to 192
            Set psCaption to "Ingredients"
        End_Object

        Object oIngredients_Amount is a cDbCJGridColumn
            Entry_Item Ingredients.Amount
            Set piWidth to 195
            Set psCaption to "Amount"
        End_Object
    End_Object

Cd_End_Object
