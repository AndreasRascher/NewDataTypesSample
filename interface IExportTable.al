interface IExportTable
{

    procedure AddExportField(tableID: Integer; fieldNo: Integer);
    procedure AddRecord(RecVariant: Variant);
    /// <summary>
    /// <list type="table">
    /// <listheader>
    ///    <term>CSV Properties</term>
    /// </listheader>
    /// <item>
    ///    <term>SEPARATOR</term>
    ///    <description>value separator text</description>
    ///</item>
    ///</list>
    /// </summary>
    procedure SetProperty(propertyName: Text; propertyValue: Text)
    procedure GetContent(var Content: TextBuilder): Boolean;

}
