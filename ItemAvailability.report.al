report 50101 ItemAvailability
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    Caption = 'Item AvailabilityZZZZ';
    RDLCLayout = 'ItemAvailability.rdl';
    WordLayout = 'ItemAvailability.docx';
    ExcelLayout = 'ItemAvailability.xlsx';


    dataset
    {
        dataitem(Item; Item)
        {
            CalcFields = Inventory, "Qty. on Purch. Order", "Qty. on Sales Order";
            column(QtyonPurchOrder_Item; "Qty. on Purch. Order")
            {
                IncludeCaption = true;
            }
            column(QtyonSalesOrder_Item; "Qty. on Sales Order")
            {
                IncludeCaption = true;
            }


            column(No_Item; "No.")
            {
                IncludeCaption = true;
            }
            column(Description_Item; Description)
            {
                IncludeCaption = true;
            }
            column(Inventory_Item; Inventory)
            {
                IncludeCaption = true;
            }
            column("Availability"; "Inventory" + "Qty. on Purch. Order" - "Qty. on Sales Order")
            {
                caption = 'Availability';
            }
            dataitem("Item Category"; "Item Category")
            {
                DataItemLink = Code = field("Item Category Code");
                //the data item link reference is not necessarily needed unless there are joins
                // of multiple data items.  In this case there are only 2 being used.
                //the dataitemlinkreference is the table, the data item link is the field like in a join statement
                DataItemLinkReference = Item;

                column(ItemCategoryDescription; Description)
                {
                    IncludeCaption = true;
                }
            }

        }
    }

    labels
    {
        ItemInventoryAvailabilityLbl = 'Item AvailabilityZZ';
        AvailabilityLbl = 'Availability';
    }

    //     requestpage
    //     {
    //         AboutTitle = 'Teaching tip title';
    //         AboutText = 'Teaching tip content';
    //         layout
    //         {
    //             area(Content)
    //             {
    //                 group(GroupName)
    //                 {
    //                     field(Name; SourceExpression)
    //                     {

    //                     }
    //                 }
    //             }
    //         }

    //         actions
    //         {
    //             area(processing)
    //             {
    //                 action(LayoutName)
    //                 {

    //                 }
    //             }
    //         }
    //     }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }

    //     var
    //         myInt: Integer;
}