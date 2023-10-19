// Filter bauen (Text, endswith, replace)
// FileFilter Upload (Enum)
// Pfade prüfen (Text,endswith)
// Erweiterbares StrMenu (Text.split,contains(CancelLbl), DefaultValue)
// Zeilenümbrüche in HTML Zeilenumbrüche umwandeln (Text,Textbuilder)
// Verarbeitete Datensätze sammeln (List, RecordID)
//---Einrichtung in JSON BLOB speichern (JSONToken, JSONObj, JSONArray, Foreach)---
// DataTable (Dictionary, List)
// CSV Export (Dictionary, List)

codeunit 50100 ExportTableCSV
{
    #region Settings
    procedure AddExportField(tableID: Integer; fieldNo: Integer)
    begin

    end;

    procedure AddRecordForExport(RecVariant: Variant)
    begin

    end;

    procedure SetFieldSeparator(separator: Text)
    begin

    end;
    #endregion Settings

    procedure Export()
    begin

    end;

    local procedure AddLine(RecVariant: Variant)
    begin

    end;

    procedure DownloadContent(fileName: Text)
    begin

    end;

    local procedure CheckTableHasExportFields(tableID: Integer)
    begin

    end;

    var
    // ExportFieldsGlobal  // Tabelle mit Feldern
    // SeparatorGlobal
    // FileContent: TextBuilder
}