// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

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
                var
                    IExportTable: Interface IExportTable;
                    ExportTableMgt: Codeunit ExportTableMgt;
                    ExportFileContent: TextBuilder;
                begin
                    IExportTable := ExportTableMgt.GetDefaultJSONImplementation();
                    IExportTable.AddExportField(Rec.RecordId.TableNo, Rec.fieldNo(Name));
                    IExportTable.AddExportField(Rec.RecordId.TableNo, Rec.fieldNo("Name 2"));
                    IExportTable.AddExportField(Rec.RecordId.TableNo, Rec.fieldNo(Address));
                    IExportTable.AddExportField(Rec.RecordId.TableNo, Rec.fieldNo("Address 2"));
                    IExportTable.AddExportField(Rec.RecordId.TableNo, Rec.fieldNo("Post Code"));
                    IExportTable.AddExportField(Rec.RecordId.TableNo, rec.fieldNo("Phone No."));
                    IExportTable.AddExportField(Rec.RecordId.TableNo, rec.fieldNo("Mobile Phone No."));
                    IExportTable.AddRecord(Rec);
                    if IExportTable.GetContent(ExportFileContent) then
                        ExportTableMgt.DownloadContent(ExportFileContent, 'Export.txt');
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