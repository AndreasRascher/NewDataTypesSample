codeunit 50100 ExportTableCSV implements IExportTable
{
    #region Settings
    ///<summary> collect field IDs by table</summary>
    procedure AddExportField(tableID: Integer; fieldNo: Integer)
    var
        fieldNumbers: List of [Integer];
    begin
        if not ExportFieldsGlobal.ContainsKey(tableID) then begin
            fieldNumbers.Add(fieldNo);
            ExportFieldsGlobal.Add(tableID, fieldNumbers);
        end else begin
            ExportFieldsGlobal.Get(tableID, fieldNumbers);
            fieldNumbers.Add(fieldNo);
        end;
    end;
    ///<summary> writes the defined fields to the export content </summary>
    procedure AddRecord(RecVariant: Variant)
    var
        tabStop: Char;
        recRef: RecordRef;
        fieldNo: Integer;
        line: List of [Text];
        content, lineText : Text;
    begin
        // variant -> recordRef
        recRef.GetTable(RecVariant);
        CheckTableHasExportFields(recRef.Number);
        // init default separator
        tabStop := 9;
        if SeparatorGlobal = '' then
            SeparatorGlobal := tabStop;
        // collect & convert values
        foreach fieldNo in ExportFieldsGlobal.Get(recRef.Number) do
            AddField(line, recRef.Field(fieldNo));
        // write line
        foreach content in line do begin
            lineText += content + SeparatorGlobal;
        end;
        // remove trailing separator
        if lineText.EndsWith(SeparatorGlobal) then
            lineText := lineText.Remove(StrLen(lineText));
        // add line to output
        FileContent.AppendLine(lineText);
    end;
    ///<summary> Add defined fields from record into csv line </summary>
    procedure SetProperty(name: Text; value: Text)
    begin
        Properties.Set(name.ToUpper(), value); // Set to avoid errors
    end;

    procedure InitProperties()
    begin
        if Properties.ContainsKey('SEPARATOR') then
            SeparatorGlobal := Properties.Get('SEPARATOR');
    end;
    #endregion Settings

    procedure GetContent(var Content: TextBuilder) HasContent: Boolean;
    begin
        Content := FileContent;
        HasContent := Content.Length > 0;
    end;

    local procedure AddField(var Line: List of [Text]; field: fieldRef)
    valueInXmlFormat: Text;
    begin
        valueInXmlFormat := Format(field.Value, 0, 9);
        Line.Add(valueInXmlFormat);
    end;

    local procedure CheckTableHasExportFields(tableID: Integer)
    begin
        if not ExportFieldsGlobal.ContainsKey(tableID) then
            Error('%1 has no fields defined', tableID);
    end;

    var
        ExportFieldsGlobal: Dictionary of [integer, List of [Integer]];  // TabellenID mit allen Feldern für den Export
        Properties: Dictionary of [Text, Text];
        SeparatorGlobal: Text;
        FileContent: TextBuilder;
}