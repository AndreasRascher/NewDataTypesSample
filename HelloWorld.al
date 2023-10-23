// Anforderung:
// - Tabellendaten exportieren
// - Erweiterbar
// - Umsetzung in CSV
// - Umsetzung in JSON
// - Weitere Export Formate sollen leicht zu integrieren sein
//   -> Interface (Trennung von Umsetzung und Absicht)

pageextension 50100 CustomerListExt extends "Customer List"
{

    actions
    {
        addlast("&Customer")
        {
            action(ExportCustomer)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //* Fields to Export
                    // Rec.Name
                    // Rec."Name 2"
                    // Rec.Address
                    // Rec."Address 2"
                    // Rec."Post Code"
                    // rec."Phone No."
                    // rec."Mobile Phone No."
                end;
            }
        }
    }

    trigger OnOpenPage();
    var
        Choice: Integer;
        ChoicesText: Text;
        Result: Text;
    begin
        // /// Sample 1 Strmenu with lists 
        // ChoicesText += 'SalesLine,PurchaseLine,ServiceList';
        // if GenericStrMenu(Choice, ChoicesText) then begin
        //     Result := ChoicesText.Split(',').Get(Choice);
        //     Message('Your Choice %1', Result);
        // end;
    end;



    // procedure GenericStrMenu(var Choice: Integer; Choices: Text) OK: Boolean
    // var
    //     CancelLbl: Label 'Cancel', Comment = 'de-DE=Abbrechen';
    //     ChoicesList: List of [Text];
    //     Default: Integer;
    // begin
    //     if not Choices.Contains(CancelLbl) then begin
    //         if not Choices.EndsWith(',') then
    //             Choices += ',';
    //         Choices += CancelLbl;
    //     end;
    //     Default := Choices.Split(',').Count;
    //     Choice := StrMenu(Choices, Default);
    //     ChoicesList := Choices.Split(',');
    //     OK := (Default <> Choice) or (Choice <> 0);
    // end;
}