report 50105 UpdateItemDescriptions
{
    Caption = 'Update Item Descriptions';
    ProcessingOnly = true;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterHeading = 'Item Selection';
            RequestFilterFields = "No.", "Description", "Description 2";

            trigger OnPreDataItem()
            begin
                Clear(Counter);
            end;


            trigger OnAfterGetRecord()
            var
                ItemToUpdate: Record Item;
            begin
                Clear(ItemToUpdate);
                if ItemToUpdate.Get(Item."No.") then begin
                    ItemToUpdate."Description 2" := CopyStr("Description" + '(' + ItemToUpdate."No." + ')', 1, MaxStrLen(ItemToUpdate."Description 2"));
                    ItemToUpdate.Modify();
                    Counter += 1;

                end;
                // if Item."Description 2" <> Item.Description then begin
                //     Item."Description 2" := Item.Description;
                //     Item.Modify(true);
                // end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Updted %1 items', Counter);
            end;
        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(Group)
    //             {
    //                 field(Info; InfoTxt)
    //                 {
    //                     ApplicationArea = All;
    //                     Editable = false;
    //                 }
    //             }
    //         }
    //     }
    // }

    var
        Counter: Integer;
}