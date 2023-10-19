codeunit 50100 ExportTableCSV implements IExportTable
{
    #region Settings
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
    ///<summary> reminder to actualy check the properties </summary>
    procedure ParseProperties()
    begin
    end;
    #endregion Settings
    ///<summary> return csv content </summary>
    procedure GetContent(var Content: TextBuilder) HasContent: Boolean;
    begin
    end;
    ///<summary> handle type to text conversion, collect result </summary>
    local procedure AddField(var Line: List of [Text]; field: fieldRef)
    begin
    end;
    ///<summary> throw error if field setup is missing </summary>
    local procedure CheckTableHasExportFields(tableID: Integer)
    begin
    end;

    var
        ExportFieldsGlobal: Dictionary of [integer, List of [Integer]];  // TabellenID mit allen Feldern für den Export
        Properties: Dictionary of [Text, Text];
        SeparatorGlobal: Text;
        FileContent: TextBuilder;
}