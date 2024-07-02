unit ConversionProject.Conversion.Json;

interface

uses
  ConversionProject.Conversion.Json.Interfaces;

type
  TJson = class(TInterfacedObject, ConversionProject.Conversion.Json.Interfaces.IJson)
  public
    class procedure EntityToJson;
    class procedure JsonToEntity;
  end;

implementation

uses
  Codolex.Adapters.EntityJSON.Interfaces,
  Codolex.Collections,
  ConversionProject.DataSource.MenuCard,
  ConversionProject.DataSource.MenuCard.Adapters.JSON,
  System.JSON,
  System.UITypes,
  Vcl.Dialogs;

class procedure TJson.EntityToJson;
begin
  var popup: ConversionProject.DataSource.MenuCard.Ipopup;
  popup := ConversionProject.DataSource.MenuCard.Tpopup.Create;
  popup.popupID := 1;
  var menuitem: ConversionProject.DataSource.MenuCard.Imenuitem;
  menuitem := ConversionProject.DataSource.MenuCard.Tmenuitem.Create;
  menuitem.menuitemID := 1;
  menuitem.value := 'FirstItem';
  menuitem.popupID := 1;
  var menuitemList: ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>;
  menuitemList := TCodolexCollections.CreateList<ConversionProject.DataSource.MenuCard.Imenuitem>;
  menuitemList.Add(menuitem);
  popup.menuitem := menuitemList;
  var JSONpopup: string;
  
  var Adapter: ICodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.Ipopup>;
  Adapter := TpopupJSONAdapter.Create;
  var JSONObject := Adapter.MapFromEntity(popup);
  try
    JSONpopup := JSONObject.Format;
  finally
    JSONObject.Free;
  end;
  var DialogResult: Integer;
  DialogResult := MessageDlg(JSONpopup, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
end;

class procedure TJson.JsonToEntity;
begin
  var MenuCardString: string;
  MenuCardString := '{"menu": {' +
'  "id": "file",' +
'  "value": "File",' +
'  "popup": {' +
'    "menuitem": [' +
'      {"value": "New", "onclick": "CreateNewDoc()"},' +
'      {"value": "Open", "onclick": "OpenDoc()"},' +
'      {"value": "Close", "onclick": "CloseDoc()"}' +
'    ]' +
'  }' +
'}}';
  var MenuCard: ConversionProject.DataSource.MenuCard.IMenuCard;
  MenuCard := nil;
  var ResultCollection := TCodolexCollections.CreateList<ConversionProject.DataSource.MenuCard.IMenuCard>;
  var ParsedJson := TJsonObject.ParseJSONValue(MenuCardString, True, True);
  try
    var Entity: ConversionProject.DataSource.MenuCard.IMenuCard;
    var Adapter1: ICodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.IMenuCard>;
    Adapter1 := TMenuCardJSONAdapter.Create;
    
    if (ParsedJson is TJsonArray) then
    begin
      var JsonArray := ParsedJson as TJsonArray;
      var NbOfItems := JsonArray.Count;
      
      if (NbOfItems = 0) then
        Exit;
      
      for var ArrayElement in JsonArray do
      begin
        if not (ArrayElement is TJsonObject) then
          Continue;
        
        var ElementObject := ArrayElement.GetValue<TJsonObject>();
        
        Entity := Adapter1.MapToEntity(ElementObject);
        
        ResultCollection.Add(Entity);
      end;
    end
    else if ParsedJson is TJsonObject then
    begin
      Entity := Adapter1.MapToEntity(ParsedJson);
      
      ResultCollection.Add(Entity);
    end;
    
    finally
      ParsedJson.Free;
      MenuCard := ResultCollection.First;
    end;
    var menu: ConversionProject.DataSource.MenuCard.Imenu;
    menu := MenuCard.menu;
    var popup: ConversionProject.DataSource.MenuCard.Ipopup;
    popup := menu.popup;
    var menuitem: ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>;
    menuitem := popup.menuitem;
    var FirstMenuItem: ConversionProject.DataSource.MenuCard.Imenuitem;
    FirstMenuItem := menuitem.First;
    var DialogResult: Integer;
    DialogResult := MessageDlg(FirstMenuItem.Value, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  end;

end.
