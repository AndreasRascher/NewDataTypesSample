/// <summary>Contains common functions for export, declares the interface implentation  </summary>
codeunit 50101 ExportTableMgt
{
    internal procedure GetDefaultCSVImplementation() ExportTable: interface IExportTable
    var
        ExportTableCSV: Codeunit ExportTableCSV;
    begin
        ExportTable := ExportTableCSV;
    end;

    internal procedure GetDefaultJSONImplementation() ExportTable: interface IExportTable
    begin
        Error('TBD');
    end;

    procedure DownloadContent(Content: TextBuilder; toFileName: Text)
    var
        tempBlob: Codeunit "Temp Blob";
        iStr: InStream;
        oStr: OutStream;
        AllFilesTypeTok: TextConst DEU = 'Alle Dateien (*.*)|*.*', ENU = 'All Files (*.*)|*.*';
    begin
        tempBlob.CreateOutStream(oStr, TextEncoding::UTF8);  // Import / Export as UTF-8
        oStr.WriteText(Content.ToText());
        tempBlob.CreateInStream(iStr);
        toFileName := DelChr(toFileName, '=', '#&-%/\(), ');
        DownloadFromStream(iStr, 'Download', 'ToFolder', AllFilesTypeTok, toFileName);
    end;
}