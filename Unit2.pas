unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DelphiTwain, DB, MemDS, VirtualTable, StdCtrls, Grids, DBGrids,
  ExtCtrls, jpeg, ShellAPI;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    VirtualTable1: TVirtualTable;
    DelphiTwain1: TDelphiTwain;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DelphiTwain1TwainAcquire(Sender: TObject;
      const Index: Integer; Image: TBitmap; var Cancel: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function NamaGambar : string;
  end;

var
  JPGku : TJPEGImage;
  asalScan : Integer;
  Form2: TForm2;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
if VirtualTable1.IsEmpty then
ShowMessage('Data Masih Kosong') else
Close;
form3.showmodal;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  sourceIndex : Integer;
  source : TTwainSource;
begin
  DelphiTwain1.LibraryLoaded :=True;
  DelphiTwain1.SourceManagerLoaded :=True;
  sourceIndex := DelphiTwain1.SelectSource();

  if(sourceIndex <> -1) then
  begin
    source :=DelphiTwain1.Source[sourceIndex];
    source.Loaded := True;
    source.Enabled := True;
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if VirtualTable1.IsEmpty then
ShowMessage('Data Kosong') else
VirtualTable1.Delete;
end;

procedure TForm2.DelphiTwain1TwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
  var Lokasi, Gambar : string;
begin
  Image1.Picture.Assign(Image);
  Cancel := True;
  Gambar := NamaGambar;
  Lokasi := ExtractFilePath(Application.ExeName)+'\HGambar\';
  JPGku := TJPEGImage.Create;
  JPGku.Assign(Image1.Picture.Bitmap);
  JPGku.Free;
  VirtualTable1.Append;
  VirtualTable1['Image'] := Gambar;
  VirtualTable1.Post;
end;

function TForm2.NamaGambar: string;
begin

end;

end.
