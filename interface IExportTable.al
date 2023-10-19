interface IExportTable
{

    procedure AddExportField(tableID: Integer; fieldNo: Integer);
    procedure AddRecord(RecVariant: Variant);
    procedure SetProperty(name: Text; value: Text);
    procedure ParseProperties();
    procedure GetContent(var Content: TextBuilder): Boolean;

}
