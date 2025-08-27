reportextension 50102 SalesInvReportExt extends "Standard Sales - Invoice"
{
    RDLCLayout = 'SalesInvoiceReportExt.rdl';

    dataset
    {
        add(Line)
        {
            column(Order_No_Line_Lbl; Line.fieldCaption("Order No."))
            {

            }
            column(Order_No_Line; Line."Order No.")
            {

            }
            column(DisplayOrderInfo; DisplayOrderInfo)

            {

            }
        }
    }

    requestpage
    {
        layout
        {
            addlast(Options)
            {
                field(DisplayOrderInfo; DisplayOrderInfo)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show Order Information';

                }
            }
        }
    }
    var
        DisplayOrderInfo: Boolean;

}