unit ConversionProject.DataSource.MenuCard;

interface

uses
  Codolex.Adapters.EntityDataSet,
  Codolex.Collections,
  Codolex.Collections.List,
  Codolex.Database.Entity.Interfaces,
  Codolex.Database.NonPersistentEntity,
  Codolex.Database.NonPersistentEntity.Interfaces,
  Codolex.EntityDataBroker.Interfaces,
  Codolex.EntityDataBroker.NonPersistent,
  Codolex.Framework.Attributes,
  Codolex.Framework.CodolexField,
  Codolex.Framework.Types,
  Codolex.Framework.Types.Binary,
  Data.DB,
  REST.Json.Types,
  System.Rtti;

type
  IMenuCard = interface;
  Imenu = interface;
  Imenuitem = interface;
  Ipopup = interface;
  
  TMenuCard = class;
  Tmenu = class;
  Tmenuitem = class;
  Tpopup = class;
  
  TMenuCardDataBroker = class;
  TmenuDataBroker = class;
  TmenuitemDataBroker = class;
  TpopupDataBroker = class;
  
  TMenuCardDataSetAdapter = class;
  TmenuDataSetAdapter = class;
  TmenuitemDataSetAdapter = class;
  TpopupDataSetAdapter = class;
  
  
  IMenuCard = interface(INonPersistentEntity)
    ['{514B9408-021A-473E-9F75-7E447AAE1820}']
  
    function GetMenuCardID: TCodolexField<Integer>;
    procedure SetMenuCardID(const Value: TCodolexField<Integer>);
    function GetmenuID: TCodolexField<Integer>;
    procedure SetmenuID(const Value: TCodolexField<Integer>);
    function Getmenu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>;
    procedure Setmenu(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>);
  
    property MenuCardID: TCodolexField<Integer> read GetMenuCardID write SetMenuCardID;
    property menuID: TCodolexField<Integer> read GetmenuID write SetmenuID;
    property menu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu> read Getmenu write Setmenu;
  end;
  
  TMenuCard = class(TNonPersistentEntity, IMenuCard)
  private
    FMenuCardID: TCodolexField<Integer>;
    FmenuID: TCodolexField<Integer>;
    [JSONMarshalled(False)] Fmenu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>;
  public
    function GetMenuCardID: TCodolexField<Integer>;
    procedure SetMenuCardID(const Value: TCodolexField<Integer>);
    function GetmenuID: TCodolexField<Integer>;
    procedure SetmenuID(const Value: TCodolexField<Integer>);
    function Getmenu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>;
    procedure Setmenu(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>);
  
    property MenuCardID: TCodolexField<Integer> read GetMenuCardID write SetMenuCardID;
    property menuID: TCodolexField<Integer> read GetmenuID write SetmenuID;
    property menu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu> read Getmenu write Setmenu;
  end;
  
  [EntityDataBroker('ConversionProject.DataSource.MenuCard.IMenuCard')]
  TMenuCardDataBroker = class(TEntityDataBrokerNonPersistent, IEntityDataBrokerNonPersistent)
  end;
  
  [EntityDataSetAdapter('ConversionProject.DataSource.MenuCard.IMenuCard')]
  TMenuCardDataSetAdapter = class(TCodolexEntityDataSetAdapter)
  protected
    procedure MapToDataSet; override;
    procedure MapToEntity; override;
    function CreateNewEntity: ICodolexEntity; override;
    procedure GetFieldValueFromEntity(const FieldName: string; var Value: Variant); override;
    procedure SetFieldValueInEntity(const FieldName: string; const Value: Variant); override;
    procedure AddFieldDefsTo(const FieldDefs: TFieldDefs); override;
  end;
  
  Imenu = interface(INonPersistentEntity)
    ['{31E4C593-B366-4B08-9BA5-5CAE522528FA}']
  
    function GetmenuID: TCodolexField<Integer>;
    procedure SetmenuID(const Value: TCodolexField<Integer>);
    function Getid: TCodolexField<string>;
    procedure Setid(const Value: TCodolexField<string>);
    function Getvalue: TCodolexField<string>;
    procedure Setvalue(const Value: TCodolexField<string>);
    function GetpopupID: TCodolexField<Integer>;
    procedure SetpopupID(const Value: TCodolexField<Integer>);
    function Getpopup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>;
    procedure Setpopup(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>);
    function GetMenuCard: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard>;
    procedure SetMenuCard(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard>);
  
    property menuID: TCodolexField<Integer> read GetmenuID write SetmenuID;
    property id: TCodolexField<string> read Getid write Setid;
    property value: TCodolexField<string> read Getvalue write Setvalue;
    property popupID: TCodolexField<Integer> read GetpopupID write SetpopupID;
    property popup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup> read Getpopup write Setpopup;
    property MenuCard: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard> read GetMenuCard write SetMenuCard;
  end;
  
  Tmenu = class(TNonPersistentEntity, Imenu)
  private
    FmenuID: TCodolexField<Integer>;
    Fid: TCodolexField<string>;
    Fvalue: TCodolexField<string>;
    FpopupID: TCodolexField<Integer>;
    [JSONMarshalled(False)] Fpopup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>;
    [JSONMarshalled(False)] FMenuCard: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard>;
  public
    function GetmenuID: TCodolexField<Integer>;
    procedure SetmenuID(const Value: TCodolexField<Integer>);
    function Getid: TCodolexField<string>;
    procedure Setid(const Value: TCodolexField<string>);
    function Getvalue: TCodolexField<string>;
    procedure Setvalue(const Value: TCodolexField<string>);
    function GetpopupID: TCodolexField<Integer>;
    procedure SetpopupID(const Value: TCodolexField<Integer>);
    function Getpopup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>;
    procedure Setpopup(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>);
    function GetMenuCard: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard>;
    procedure SetMenuCard(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard>);
  
    property menuID: TCodolexField<Integer> read GetmenuID write SetmenuID;
    property id: TCodolexField<string> read Getid write Setid;
    property value: TCodolexField<string> read Getvalue write Setvalue;
    property popupID: TCodolexField<Integer> read GetpopupID write SetpopupID;
    property popup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup> read Getpopup write Setpopup;
    property MenuCard: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard> read GetMenuCard write SetMenuCard;
  end;
  
  [EntityDataBroker('ConversionProject.DataSource.MenuCard.Imenu')]
  TmenuDataBroker = class(TEntityDataBrokerNonPersistent, IEntityDataBrokerNonPersistent)
  end;
  
  [EntityDataSetAdapter('ConversionProject.DataSource.MenuCard.Imenu')]
  TmenuDataSetAdapter = class(TCodolexEntityDataSetAdapter)
  protected
    procedure MapToDataSet; override;
    procedure MapToEntity; override;
    function CreateNewEntity: ICodolexEntity; override;
    procedure GetFieldValueFromEntity(const FieldName: string; var Value: Variant); override;
    procedure SetFieldValueInEntity(const FieldName: string; const Value: Variant); override;
    procedure AddFieldDefsTo(const FieldDefs: TFieldDefs); override;
  end;
  
  Imenuitem = interface(INonPersistentEntity)
    ['{461A1226-C9EF-40D4-8B61-F0F4902F035E}']
  
    function GetmenuitemID: TCodolexField<Integer>;
    procedure SetmenuitemID(const Value: TCodolexField<Integer>);
    function Getvalue: TCodolexField<string>;
    procedure Setvalue(const Value: TCodolexField<string>);
    function Getonclick: TCodolexField<string>;
    procedure Setonclick(const Value: TCodolexField<string>);
    function GetpopupID: TCodolexField<Integer>;
    procedure SetpopupID(const Value: TCodolexField<Integer>);
    function Getpopup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>;
    procedure Setpopup(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>);
  
    property menuitemID: TCodolexField<Integer> read GetmenuitemID write SetmenuitemID;
    property value: TCodolexField<string> read Getvalue write Setvalue;
    property onclick: TCodolexField<string> read Getonclick write Setonclick;
    property popupID: TCodolexField<Integer> read GetpopupID write SetpopupID;
    property popup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup> read Getpopup write Setpopup;
  end;
  
  Tmenuitem = class(TNonPersistentEntity, Imenuitem)
  private
    FmenuitemID: TCodolexField<Integer>;
    Fvalue: TCodolexField<string>;
    Fonclick: TCodolexField<string>;
    FpopupID: TCodolexField<Integer>;
    [JSONMarshalled(False)] Fpopup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>;
  public
    function GetmenuitemID: TCodolexField<Integer>;
    procedure SetmenuitemID(const Value: TCodolexField<Integer>);
    function Getvalue: TCodolexField<string>;
    procedure Setvalue(const Value: TCodolexField<string>);
    function Getonclick: TCodolexField<string>;
    procedure Setonclick(const Value: TCodolexField<string>);
    function GetpopupID: TCodolexField<Integer>;
    procedure SetpopupID(const Value: TCodolexField<Integer>);
    function Getpopup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>;
    procedure Setpopup(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>);
  
    property menuitemID: TCodolexField<Integer> read GetmenuitemID write SetmenuitemID;
    property value: TCodolexField<string> read Getvalue write Setvalue;
    property onclick: TCodolexField<string> read Getonclick write Setonclick;
    property popupID: TCodolexField<Integer> read GetpopupID write SetpopupID;
    property popup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup> read Getpopup write Setpopup;
  end;
  
  [EntityDataBroker('ConversionProject.DataSource.MenuCard.Imenuitem')]
  TmenuitemDataBroker = class(TEntityDataBrokerNonPersistent, IEntityDataBrokerNonPersistent)
  end;
  
  [EntityDataSetAdapter('ConversionProject.DataSource.MenuCard.Imenuitem')]
  TmenuitemDataSetAdapter = class(TCodolexEntityDataSetAdapter)
  protected
    procedure MapToDataSet; override;
    procedure MapToEntity; override;
    function CreateNewEntity: ICodolexEntity; override;
    procedure GetFieldValueFromEntity(const FieldName: string; var Value: Variant); override;
    procedure SetFieldValueInEntity(const FieldName: string; const Value: Variant); override;
    procedure AddFieldDefsTo(const FieldDefs: TFieldDefs); override;
  end;
  
  Ipopup = interface(INonPersistentEntity)
    ['{E1A47507-B334-4138-B2DA-023966E0E312}']
  
    function GetpopupID: TCodolexField<Integer>;
    procedure SetpopupID(const Value: TCodolexField<Integer>);
    function Getmenu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>;
    procedure Setmenu(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>);
    function Getmenuitem: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>>;
    procedure Setmenuitem(const Value: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>>);
  
    property popupID: TCodolexField<Integer> read GetpopupID write SetpopupID;
    property menu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu> read Getmenu write Setmenu;
    property menuitem: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>> read Getmenuitem write Setmenuitem;
  end;
  
  Tpopup = class(TNonPersistentEntity, Ipopup)
  private
    FpopupID: TCodolexField<Integer>;
    [JSONMarshalled(False)] Fmenu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>;
    [JSONMarshalled(False)] Fmenuitem: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>>;
  public
    function GetpopupID: TCodolexField<Integer>;
    procedure SetpopupID(const Value: TCodolexField<Integer>);
    function Getmenu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>;
    procedure Setmenu(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>);
    function Getmenuitem: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>>;
    procedure Setmenuitem(const Value: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>>);
  
    property popupID: TCodolexField<Integer> read GetpopupID write SetpopupID;
    property menu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu> read Getmenu write Setmenu;
    property menuitem: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>> read Getmenuitem write Setmenuitem;
  end;
  
  [EntityDataBroker('ConversionProject.DataSource.MenuCard.Ipopup')]
  TpopupDataBroker = class(TEntityDataBrokerNonPersistent, IEntityDataBrokerNonPersistent)
  end;
  
  [EntityDataSetAdapter('ConversionProject.DataSource.MenuCard.Ipopup')]
  TpopupDataSetAdapter = class(TCodolexEntityDataSetAdapter)
  protected
    procedure MapToDataSet; override;
    procedure MapToEntity; override;
    function CreateNewEntity: ICodolexEntity; override;
    procedure GetFieldValueFromEntity(const FieldName: string; var Value: Variant); override;
    procedure SetFieldValueInEntity(const FieldName: string; const Value: Variant); override;
    procedure AddFieldDefsTo(const FieldDefs: TFieldDefs); override;
  end;
  
  function MenuCardDataBroker: IEntityDataBrokerNonPersistent;
  function menuDataBroker: IEntityDataBrokerNonPersistent;
  function menuitemDataBroker: IEntityDataBrokerNonPersistent;
  function popupDataBroker: IEntityDataBrokerNonPersistent;

implementation

uses
  Codolex.Framework;

function MenuCardDataBroker: IEntityDataBrokerNonPersistent;
begin
  Result := TMenuCardDataBroker.Create();
end;

{ TMenuCard }

function TMenuCard.GetMenuCardID: TCodolexField<Integer>;
begin
  Result := FMenuCardID;
end;

procedure TMenuCard.SetMenuCardID(const Value: TCodolexField<Integer>);
begin
  if FMenuCardID <> Value then
  begin
    FMenuCardID := Value;
    NotifyChange('MenuCardID');
  end;
end;

function TMenuCard.GetmenuID: TCodolexField<Integer>;
begin
  Result := FmenuID;
end;

procedure TMenuCard.SetmenuID(const Value: TCodolexField<Integer>);
begin
  if FmenuID <> Value then
  begin
    FmenuID := Value;
    NotifyChange('menuID');
  end;
end;

function TMenuCard.Getmenu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>;
begin
  Result := Fmenu;
end;

procedure TMenuCard.Setmenu(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>);
begin
  if Fmenu <> Value then
  begin
    Fmenu := Value;
    NotifyChange('menu');
  end;
end;

{ TMenuCardDataSetAdapter }

procedure TMenuCardDataSetAdapter.MapToDataSet;
begin
  inherited;
  
  var Entity := FEntity as TMenuCard;
  
  FDataset.FieldByName('MenuCardID').AsInteger := Entity.MenuCardID;
  FDataset.FieldByName('menuID').AsInteger := Entity.menuID;
end;

procedure TMenuCardDataSetAdapter.MapToEntity;
begin
  inherited;
  
  var Entity := FEntity as TMenuCard;
  
  Entity.MenuCardID := TCodolexField<Integer>.Create(FDataset.FieldByName('MenuCardID').AsInteger);
  Entity.menuID := TCodolexField<Integer>.Create(FDataset.FieldByName('menuID').AsInteger);
end;

function TMenuCardDataSetAdapter.CreateNewEntity: ICodolexEntity;
begin
  inherited;
  Result := TMenuCard.Create;
end;

procedure TMenuCardDataSetAdapter.GetFieldValueFromEntity(const FieldName: string; var Value: Variant);
begin
  inherited;
  
  var Entity := FEntity as TMenuCard;
  
  if FieldName = 'MenuCardID' then
    Value := Entity.MenuCardID
  else
  if FieldName = 'menuID' then
    Value := Entity.menuID;
end;

procedure TMenuCardDataSetAdapter.SetFieldValueInEntity(const FieldName: string; const Value: Variant);
begin
  inherited;
  
  var Entity := FEntity as TMenuCard;
  
  if FieldName = 'MenuCardID' then
    Entity.MenuCardID := Value
  else
  if FieldName = 'menuID' then
    Entity.menuID := Value;
end;

procedure TMenuCardDataSetAdapter.AddFieldDefsTo(const FieldDefs: TFieldDefs);
begin
  inherited;
  
  var FieldDef: TFieldDef;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'MenuCardID';
  FieldDef.DataType := ftInteger;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'menuID';
  FieldDef.DataType := ftInteger;
end;

function menuDataBroker: IEntityDataBrokerNonPersistent;
begin
  Result := TmenuDataBroker.Create();
end;

{ Tmenu }

function Tmenu.GetmenuID: TCodolexField<Integer>;
begin
  Result := FmenuID;
end;

procedure Tmenu.SetmenuID(const Value: TCodolexField<Integer>);
begin
  if FmenuID <> Value then
  begin
    FmenuID := Value;
    NotifyChange('menuID');
  end;
end;

function Tmenu.Getid: TCodolexField<string>;
begin
  Result := Fid;
end;

procedure Tmenu.Setid(const Value: TCodolexField<string>);
begin
  if Fid <> Value then
  begin
    Fid := Value;
    NotifyChange('id');
  end;
end;

function Tmenu.Getvalue: TCodolexField<string>;
begin
  Result := Fvalue;
end;

procedure Tmenu.Setvalue(const Value: TCodolexField<string>);
begin
  if Fvalue <> Value then
  begin
    Fvalue := Value;
    NotifyChange('value');
  end;
end;

function Tmenu.GetpopupID: TCodolexField<Integer>;
begin
  Result := FpopupID;
end;

procedure Tmenu.SetpopupID(const Value: TCodolexField<Integer>);
begin
  if FpopupID <> Value then
  begin
    FpopupID := Value;
    NotifyChange('popupID');
  end;
end;

function Tmenu.Getpopup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>;
begin
  Result := Fpopup;
end;

procedure Tmenu.Setpopup(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>);
begin
  if Fpopup <> Value then
  begin
    Fpopup := Value;
    NotifyChange('popup');
  end;
end;

function Tmenu.GetMenuCard: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard>;
begin
  Result := FMenuCard;
end;

procedure Tmenu.SetMenuCard(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.IMenuCard>);
begin
  if FMenuCard <> Value then
  begin
    FMenuCard := Value;
    NotifyChange('MenuCard');
  end;
end;

{ TmenuDataSetAdapter }

procedure TmenuDataSetAdapter.MapToDataSet;
begin
  inherited;
  
  var Entity := FEntity as Tmenu;
  
  FDataset.FieldByName('menuID').AsInteger := Entity.menuID;
  FDataset.FieldByName('id').AsString := Entity.id;
  FDataset.FieldByName('value').AsString := Entity.value;
  FDataset.FieldByName('popupID').AsInteger := Entity.popupID;
end;

procedure TmenuDataSetAdapter.MapToEntity;
begin
  inherited;
  
  var Entity := FEntity as Tmenu;
  
  Entity.menuID := TCodolexField<Integer>.Create(FDataset.FieldByName('menuID').AsInteger);
  Entity.id := TCodolexField<string>.Create(FDataset.FieldByName('id').AsString);
  Entity.value := TCodolexField<string>.Create(FDataset.FieldByName('value').AsString);
  Entity.popupID := TCodolexField<Integer>.Create(FDataset.FieldByName('popupID').AsInteger);
end;

function TmenuDataSetAdapter.CreateNewEntity: ICodolexEntity;
begin
  inherited;
  Result := Tmenu.Create;
end;

procedure TmenuDataSetAdapter.GetFieldValueFromEntity(const FieldName: string; var Value: Variant);
begin
  inherited;
  
  var Entity := FEntity as Tmenu;
  
  if FieldName = 'menuID' then
    Value := Entity.menuID
  else
  if FieldName = 'id' then
    Value := Entity.id
  else
  if FieldName = 'value' then
    Value := Entity.value
  else
  if FieldName = 'popupID' then
    Value := Entity.popupID;
end;

procedure TmenuDataSetAdapter.SetFieldValueInEntity(const FieldName: string; const Value: Variant);
begin
  inherited;
  
  var Entity := FEntity as Tmenu;
  
  if FieldName = 'menuID' then
    Entity.menuID := Value
  else
  if FieldName = 'id' then
    Entity.id := Value
  else
  if FieldName = 'value' then
    Entity.value := Value
  else
  if FieldName = 'popupID' then
    Entity.popupID := Value;
end;

procedure TmenuDataSetAdapter.AddFieldDefsTo(const FieldDefs: TFieldDefs);
begin
  inherited;
  
  var FieldDef: TFieldDef;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'menuID';
  FieldDef.DataType := ftInteger;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'id';
  FieldDef.DataType := ftString;
  FieldDef.Size := 4;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'value';
  FieldDef.DataType := ftString;
  FieldDef.Size := 4;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'popupID';
  FieldDef.DataType := ftInteger;
end;

function menuitemDataBroker: IEntityDataBrokerNonPersistent;
begin
  Result := TmenuitemDataBroker.Create();
end;

{ Tmenuitem }

function Tmenuitem.GetmenuitemID: TCodolexField<Integer>;
begin
  Result := FmenuitemID;
end;

procedure Tmenuitem.SetmenuitemID(const Value: TCodolexField<Integer>);
begin
  if FmenuitemID <> Value then
  begin
    FmenuitemID := Value;
    NotifyChange('menuitemID');
  end;
end;

function Tmenuitem.Getvalue: TCodolexField<string>;
begin
  Result := Fvalue;
end;

procedure Tmenuitem.Setvalue(const Value: TCodolexField<string>);
begin
  if Fvalue <> Value then
  begin
    Fvalue := Value;
    NotifyChange('value');
  end;
end;

function Tmenuitem.Getonclick: TCodolexField<string>;
begin
  Result := Fonclick;
end;

procedure Tmenuitem.Setonclick(const Value: TCodolexField<string>);
begin
  if Fonclick <> Value then
  begin
    Fonclick := Value;
    NotifyChange('onclick');
  end;
end;

function Tmenuitem.GetpopupID: TCodolexField<Integer>;
begin
  Result := FpopupID;
end;

procedure Tmenuitem.SetpopupID(const Value: TCodolexField<Integer>);
begin
  if FpopupID <> Value then
  begin
    FpopupID := Value;
    NotifyChange('popupID');
  end;
end;

function Tmenuitem.Getpopup: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>;
begin
  Result := Fpopup;
end;

procedure Tmenuitem.Setpopup(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Ipopup>);
begin
  if Fpopup <> Value then
  begin
    Fpopup := Value;
    NotifyChange('popup');
  end;
end;

{ TmenuitemDataSetAdapter }

procedure TmenuitemDataSetAdapter.MapToDataSet;
begin
  inherited;
  
  var Entity := FEntity as Tmenuitem;
  
  FDataset.FieldByName('menuitemID').AsInteger := Entity.menuitemID;
  FDataset.FieldByName('value').AsString := Entity.value;
  FDataset.FieldByName('onclick').AsString := Entity.onclick;
  FDataset.FieldByName('popupID').AsInteger := Entity.popupID;
end;

procedure TmenuitemDataSetAdapter.MapToEntity;
begin
  inherited;
  
  var Entity := FEntity as Tmenuitem;
  
  Entity.menuitemID := TCodolexField<Integer>.Create(FDataset.FieldByName('menuitemID').AsInteger);
  Entity.value := TCodolexField<string>.Create(FDataset.FieldByName('value').AsString);
  Entity.onclick := TCodolexField<string>.Create(FDataset.FieldByName('onclick').AsString);
  Entity.popupID := TCodolexField<Integer>.Create(FDataset.FieldByName('popupID').AsInteger);
end;

function TmenuitemDataSetAdapter.CreateNewEntity: ICodolexEntity;
begin
  inherited;
  Result := Tmenuitem.Create;
end;

procedure TmenuitemDataSetAdapter.GetFieldValueFromEntity(const FieldName: string; var Value: Variant);
begin
  inherited;
  
  var Entity := FEntity as Tmenuitem;
  
  if FieldName = 'menuitemID' then
    Value := Entity.menuitemID
  else
  if FieldName = 'value' then
    Value := Entity.value
  else
  if FieldName = 'onclick' then
    Value := Entity.onclick
  else
  if FieldName = 'popupID' then
    Value := Entity.popupID;
end;

procedure TmenuitemDataSetAdapter.SetFieldValueInEntity(const FieldName: string; const Value: Variant);
begin
  inherited;
  
  var Entity := FEntity as Tmenuitem;
  
  if FieldName = 'menuitemID' then
    Entity.menuitemID := Value
  else
  if FieldName = 'value' then
    Entity.value := Value
  else
  if FieldName = 'onclick' then
    Entity.onclick := Value
  else
  if FieldName = 'popupID' then
    Entity.popupID := Value;
end;

procedure TmenuitemDataSetAdapter.AddFieldDefsTo(const FieldDefs: TFieldDefs);
begin
  inherited;
  
  var FieldDef: TFieldDef;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'menuitemID';
  FieldDef.DataType := ftInteger;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'value';
  FieldDef.DataType := ftString;
  FieldDef.Size := 5;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'onclick';
  FieldDef.DataType := ftString;
  FieldDef.Size := 14;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'popupID';
  FieldDef.DataType := ftInteger;
end;

function popupDataBroker: IEntityDataBrokerNonPersistent;
begin
  Result := TpopupDataBroker.Create();
end;

{ Tpopup }

function Tpopup.GetpopupID: TCodolexField<Integer>;
begin
  Result := FpopupID;
end;

procedure Tpopup.SetpopupID(const Value: TCodolexField<Integer>);
begin
  if FpopupID <> Value then
  begin
    FpopupID := Value;
    NotifyChange('popupID');
  end;
end;

function Tpopup.Getmenu: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>;
begin
  Result := Fmenu;
end;

procedure Tpopup.Setmenu(const Value: TCodolexField<ConversionProject.DataSource.MenuCard.Imenu>);
begin
  if Fmenu <> Value then
  begin
    Fmenu := Value;
    NotifyChange('menu');
  end;
end;

function Tpopup.Getmenuitem: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>>;
begin
  Result := Fmenuitem;
end;

procedure Tpopup.Setmenuitem(const Value: TCodolexField<ICodolexList<ConversionProject.DataSource.MenuCard.Imenuitem>>);
begin
  if Fmenuitem <> Value then
  begin
    Fmenuitem := Value;
    NotifyChange('menuitem');
  end;
end;

{ TpopupDataSetAdapter }

procedure TpopupDataSetAdapter.MapToDataSet;
begin
  inherited;
  
  var Entity := FEntity as Tpopup;
  
  FDataset.FieldByName('popupID').AsInteger := Entity.popupID;
end;

procedure TpopupDataSetAdapter.MapToEntity;
begin
  inherited;
  
  var Entity := FEntity as Tpopup;
  
  Entity.popupID := TCodolexField<Integer>.Create(FDataset.FieldByName('popupID').AsInteger);
end;

function TpopupDataSetAdapter.CreateNewEntity: ICodolexEntity;
begin
  inherited;
  Result := Tpopup.Create;
end;

procedure TpopupDataSetAdapter.GetFieldValueFromEntity(const FieldName: string; var Value: Variant);
begin
  inherited;
  
  var Entity := FEntity as Tpopup;
  
  if FieldName = 'popupID' then
    Value := Entity.popupID;
end;

procedure TpopupDataSetAdapter.SetFieldValueInEntity(const FieldName: string; const Value: Variant);
begin
  inherited;
  
  var Entity := FEntity as Tpopup;
  
  if FieldName = 'popupID' then
    Entity.popupID := Value;
end;

procedure TpopupDataSetAdapter.AddFieldDefsTo(const FieldDefs: TFieldDefs);
begin
  inherited;
  
  var FieldDef: TFieldDef;
  
  FieldDef := FieldDefs.AddFieldDef;
  FieldDef.Name := 'popupID';
  FieldDef.DataType := ftInteger;
end;


end.
