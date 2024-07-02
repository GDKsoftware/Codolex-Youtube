unit ConversionProject.Conversion.KeyValue;

interface

uses
  ConversionProject.Conversion.KeyValue.Interfaces;

type
  TKeyValue = class(TInterfacedObject, ConversionProject.Conversion.KeyValue.Interfaces.IKeyValue)
  public
    class procedure EntityToKeyValue;
    class procedure KeyValueToEntity;
  end;

implementation

uses
  ConversionProject.DataSource.MenuCard,
  System.Classes,
  System.SysUtils,
  System.UITypes,
  Vcl.Dialogs;

class procedure TKeyValue.EntityToKeyValue;
begin
  var menuitem: ConversionProject.DataSource.MenuCard.Imenuitem;
  menuitem := ConversionProject.DataSource.MenuCard.Tmenuitem.Create;
  menuitem.menuitemID := 1;
  menuitem.value := 'KeyValueTest';
  menuitem.popupID := 2;
  var menuitemKeyValues: string;
  var StringList := TStringList.Create;
  try
    StringList.AddPair('menuitemID', menuitem.menuitemID.Value.ToString);
    StringList.AddPair('value', menuitem.value);
    StringList.AddPair('onclick', menuitem.onclick);
    StringList.AddPair('popupID', menuitem.popupID.Value.ToString);
    menuitemKeyValues := StringList.Text;
  finally
    StringList.Free;
  end;
  var DialogResult: Integer;
  DialogResult := MessageDlg(menuitemKeyValues, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
end;

class procedure TKeyValue.KeyValueToEntity;
begin
  var KeyValuesList: TStringList;
  KeyValuesList := TStringList.Create;
  KeyValuesList.Values['MenuItemID'] := '1';
  KeyValuesList.Values['value'] := 'KeyValueTest';
  var menuitem: ConversionProject.DataSource.MenuCard.Imenuitem;
  var KeyValueList := KeyValuesList;
  menuitem := ConversionProject.DataSource.MenuCard.Tmenuitem.Create;
  if KeyValueList.IndexOfName('menuitemID') <> -1 then menuitem.menuitemID := KeyValueList.Values['menuitemID'].ToInteger;
  if KeyValueList.IndexOfName('value') <> -1 then menuitem.value := KeyValueList.Values['value'];
  if KeyValueList.IndexOfName('onclick') <> -1 then menuitem.onclick := KeyValueList.Values['onclick'];
  if KeyValueList.IndexOfName('popupID') <> -1 then menuitem.popupID := KeyValueList.Values['popupID'].ToInteger;
  var DialogResult: Integer;
  DialogResult := MessageDlg(MenuItem.value, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
end;

end.
