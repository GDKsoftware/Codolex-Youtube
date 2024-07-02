unit EntityConversion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnJsonToEntity: TButton;
    btnEntityToJson: TButton;
    btnKeyValuetoEntity: TButton;
    btnEntityToKeyValue: TButton;
    procedure btnJsonToEntityClick(Sender: TObject);
    procedure btnEntityToJsonClick(Sender: TObject);
    procedure btnKeyValuetoEntityClick(Sender: TObject);
    procedure btnEntityToKeyValueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ConversionProject.Conversion.Json, ConversionProject.Conversion.KeyValue;

{$R *.dfm}

procedure TForm1.btnEntityToJsonClick(Sender: TObject);
begin
TJson.EntityToJson();

end;

procedure TForm1.btnEntityToKeyValueClick(Sender: TObject);
begin
TKeyValue.EntityToKeyValue();

end;

procedure TForm1.btnJsonToEntityClick(Sender: TObject);
begin
TJson.JsonToEntity();

end;

procedure TForm1.btnKeyValuetoEntityClick(Sender: TObject);
begin
TKeyValue.KeyValueToEntity();

end;

end.
