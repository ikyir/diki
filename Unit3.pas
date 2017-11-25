unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxExportPDF, frxPreview, StdCtrls, ExtCtrls, ShellAPI;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    frxPreview1: TfrxPreview;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DelFilesFrom(Directory, Filemask : string; DelSubDirs : Boolean);
    function waktu: string;
  end;

var
  Form3: TForm3;

implementation

uses
  Unit2, Unit1;

{$R *.dfm}

{ TForm3 }

procedure TForm3.DelFilesFrom(Directory, Filemask: string;
  DelSubDirs: Boolean);
  var Sourcelst : string;
  FOS : TSHFileOpStruct;
begin
  FillChar(FOS, SizeOf(FOS), 0);
  FOS.Wnd := Application.MainForm.Handle;
  FOS.wFunc := FO_DELETE;
  Sourcelst := Directory+'\'+Filemask+#0;
  FOS.pFrom := PChar(Sourcelst);
  if not DelSubDirs then
  FOS.fFlags := FOS.fFlags or FOF_FILESONLY;
  FOS.fFlags := FOS.fFlags or FOF_NOCONFIRMATION;
  SHFileOperation(FOS);
end;

function TForm3.waktu: string;
var tgl : TDateTime;
begin
tgl :=now();
Result:= FormatDateTime('yyyy', tgl);
end;

procedure TForm3.frxReport1BeforePrint(Sender: TfrxReportComponent);
var img : TfrxComponent;
begin
  try
    img:=frxReport1.FindObject('Picture1');
    TfrxPictureView(img).Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+
    'Gambar_scan\'+Form2.VirtualTable1.FieldValues['Image']);
    except
      ShowMessage('Objek Tidak DItemukan');
    end;  
end;

procedure TForm3.FormShow(Sender: TObject);
begin
frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'PreviewScanPdf.fr3');
frxReport1.FileName:=ExtractFilePath(Application.ExeName)+'PreviewScanPdf.fr3';
frxReport1.ShowReport();
end;

procedure TForm3.Button1Click(Sender: TObject);
var PDFku: TfrxCustomExportFilter;
namapdf, lokasihapus : string;
begin
  if asalScan = 0 then
  begin
  namapdf := Form1.Edit1.Text+'-'+Form1.Edit2.Text+'-'+waktu+'Surat-masuk.pdf';
  PDFku := TfrxCustomExportFilter(frxPDFExport1);
  PDFku.ShowDialog := False;
  PDFku.FileName := ExtractFilePath(Application.ExeName)+'\FilePDF\'+namapdf;
  frxReport1.PrepareReport(false);
  frxReport1.Export(PDFku);
  Form1.Label8.Caption := namapdf;
  end;

  Form2.VirtualTable1.Clear;
  lokasihapus := (ExtractFilePath(Application.ExeName)+'\Gambar_scan\');
  DelFilesFrom(lokasihapus, '*.*', False);
  Close;
end;

end.
