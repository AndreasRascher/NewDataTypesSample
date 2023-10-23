codeunit 50100 ExportTableCSV
{
    ///<summary> collect field IDs by table</summary>
    procedure AddExportField(tableID: Integer; fieldNo: Integer)
    begin
    end;

    ///<summary> writes the defined fields to the export content </summary>
    procedure AddRecord(RecVariant: Variant)
    begin
    end;
    ///<summary> generic property setter </summary>
    procedure SetProperty(name: Text; value: Text)
    begin
    end;

    ///<summary> return csv content </summary>
    procedure GetContent(var Content: TextBuilder) HasContent: Boolean;
    begin
    end;
}