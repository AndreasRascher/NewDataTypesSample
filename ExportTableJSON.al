codeunit 50102 ExportTableJSON implements IExportTable
{
    procedure AddRecord(RecVariant: Variant)
    var
        rRef: RecordRef;
        fRef: FieldRef;
        fieldNo: Integer;
        JRecord: JsonObject;
    begin
        // variant -> recordRef
        rRef.GetTable(RecVariant);
        CheckTableHasExportFields(rRef.Number);

        // collect & convert values
        foreach fieldNo in ExportFieldsGlobal.Get(rRef.Number) do begin
            fRef := rRef.Field(fieldNo);
            JRecord.Add(GetJsonFieldName(fRef), FieldToJSONValue(fRef));
        end;
        // add line to output
        JRecords.Add(JRecord);
    end;

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

    procedure CheckTableHasExportFields(tableID: Integer)
    begin
        if not ExportFieldsGlobal.ContainsKey(tableID) then
            Error('%1 has no fields defined', tableID);
    end;

    procedure GetContent(var Content: TextBuilder) hasContent: Boolean;
    var
        JSONAsText: Text;
    begin
        JRecords.WriteTo(JSONAsText);
        Content.Append(JSONAsText);
        hasContent := JSONAsText <> '';
    end;

    local procedure GetJsonFieldName(FRef: FieldRef): Text
    var
        Name: Text;
        i: Integer;
    begin
        Name := FRef.Name();
        for i := 1 to Strlen(Name) do begin
            if Name[i] < '0' then
                Name[i] := '_';
        end;
        exit(Name.Replace('__', '_').TrimEnd('_').TrimStart('_'));
    end;

    local procedure FieldToJSONValue(var fldRef: FieldRef) JValue: JsonValue
    var
        T: Text;
        B: Boolean;
        Dec: Decimal;
        D: Date;
        Tm: Time;
        DT: DateTime;
        I: Integer;
        G: Guid;
    begin
        if fldRef.Class = FieldClass::FlowField then
            fldRef.CalcField();

        case fldRef.Type of
            FieldType::Text,
            FieldType::Code:
                begin
                    T := fldRef.Value;
                    JValue.SetValue(T);
                end;
            FieldType::Decimal:
                begin
                    Dec := fldRef.Value;
                    JValue.SetValue(Dec);
                end;
            FieldType::Integer:
                begin
                    I := fldRef.Value;
                    JValue.SetValue(I);
                end;
            FieldType::DateTime:
                begin
                    DT := fldRef.Value;
                    JValue.SetValue(DT);
                end;
            FieldType::Boolean:
                begin
                    B := fldRef.Value;
                    JValue.SetValue(B);
                end;
            FieldType::Guid:
                begin
                    G := fldRef.Value;
                    JValue.SetValue(G);
                end;
        end;
    end;

    var
        ExportFieldsGlobal: Dictionary of [integer, List of [Integer]];  // TabellenID mit allen Feldern für den Export
        Properties: Dictionary of [Text, Text];
        FileContent: TextBuilder;
        JRecords: JsonArray;

    procedure SetProperty(name: Text; value: Text);
    begin

    end;
}