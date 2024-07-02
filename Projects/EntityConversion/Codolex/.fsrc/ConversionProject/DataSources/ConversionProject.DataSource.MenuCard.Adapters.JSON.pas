unit ConversionProject.DataSource.MenuCard.Adapters.JSON;

interface

uses
  Codolex.Adapters.EntityJSON,
  Codolex.Adapters.EntityJSON.Interfaces,
  ConversionProject.DataSource.MenuCard,
  System.Json;

type
  IMenuCardJSONAdapter = ICodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.IMenuCard>;
  TMenuCardJSONAdapter = class(TCodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.IMenuCard>, IMenuCardJSONAdapter)
  public
    function  CreateEntity: ConversionProject.DataSource.MenuCard.IMenuCard; override;
    procedure MapToEntity(const JSON: TJSONValue; const Entity: ConversionProject.DataSource.MenuCard.IMenuCard); override;
    function  MapFromEntity(const Entity: ConversionProject.DataSource.MenuCard.IMenuCard): TJSONObject; override;
  end;
  
  ImenuJSONAdapter = ICodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.Imenu>;
  TmenuJSONAdapter = class(TCodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.Imenu>, ImenuJSONAdapter)
  public
    function  CreateEntity: ConversionProject.DataSource.MenuCard.Imenu; override;
    procedure MapToEntity(const JSON: TJSONValue; const Entity: ConversionProject.DataSource.MenuCard.Imenu); override;
    function  MapFromEntity(const Entity: ConversionProject.DataSource.MenuCard.Imenu): TJSONObject; override;
  end;
  
  ImenuitemJSONAdapter = ICodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.Imenuitem>;
  TmenuitemJSONAdapter = class(TCodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.Imenuitem>, ImenuitemJSONAdapter)
  public
    function  CreateEntity: ConversionProject.DataSource.MenuCard.Imenuitem; override;
    procedure MapToEntity(const JSON: TJSONValue; const Entity: ConversionProject.DataSource.MenuCard.Imenuitem); override;
    function  MapFromEntity(const Entity: ConversionProject.DataSource.MenuCard.Imenuitem): TJSONObject; override;
  end;
  
  IpopupJSONAdapter = ICodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.Ipopup>;
  TpopupJSONAdapter = class(TCodolexEntityJSONAdapter<ConversionProject.DataSource.MenuCard.Ipopup>, IpopupJSONAdapter)
  public
    function  CreateEntity: ConversionProject.DataSource.MenuCard.Ipopup; override;
    procedure MapToEntity(const JSON: TJSONValue; const Entity: ConversionProject.DataSource.MenuCard.Ipopup); override;
    function  MapFromEntity(const Entity: ConversionProject.DataSource.MenuCard.Ipopup): TJSONObject; override;
  end;
  

implementation

uses
  Codolex.Collections,
  Codolex.Framework.Helpers.JSON;

 { ::TEntityAdapter }

function TMenuCardJSONAdapter.CreateEntity: ConversionProject.DataSource.MenuCard.IMenuCard;
begin
  Result := ConversionProject.DataSource.MenuCard.TMenuCard.Create;
end;

procedure TMenuCardJSONAdapter.MapToEntity(const JSON: TJSONValue; const Entity: ConversionProject.DataSource.MenuCard.IMenuCard);
begin
  var Value: TJSONValue;
  if JSON.TryGetValue<TJSONValue>('MenuCardID', Value) then Entity.MenuCardID := Value.AsType<Integer>;
  if JSON.TryGetValue<TJSONValue>('menuID', Value) then Entity.menuID := Value.AsType<Integer>;
  
  if HasReachedMaxDepth then Exit;
  
  var ChildEntityJson: TJSONObject;
  if JSON.TryGetValue<TJSONObject>('menu', ChildEntityJson) then
  begin
    Entity.menu := AddAssociation<ConversionProject.DataSource.MenuCard.Imenu>(ChildEntityJson, 'menu')
      .Adapter(TmenuJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
      .Parse;
    
    Entity.menu.Value.MenuCard := Entity;
  end;
end;

function TMenuCardJSONAdapter.MapFromEntity(const Entity: ConversionProject.DataSource.MenuCard.IMenuCard): TJSONObject;
begin
  Result := CreateJsonResult(Entity);
  Result.AddPair('MenuCardID', Entity.MenuCardID.Value);
  Result.AddPair('menuID', Entity.menuID.Value);
  
  if HasReachedMaxDepth then Exit;
  
  AddAssociation<ConversionProject.DataSource.MenuCard.Imenu>(Result, 'menu')
    .Adapter(TmenuJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
    .Entity(Entity.menu)
    .Add;
end;

 { TMenuCardJSONAdapter }

function TmenuJSONAdapter.CreateEntity: ConversionProject.DataSource.MenuCard.Imenu;
begin
  Result := ConversionProject.DataSource.MenuCard.Tmenu.Create;
end;

procedure TmenuJSONAdapter.MapToEntity(const JSON: TJSONValue; const Entity: ConversionProject.DataSource.MenuCard.Imenu);
begin
  var Value: TJSONValue;
  if JSON.TryGetValue<TJSONValue>('menuID', Value) then Entity.menuID := Value.AsType<Integer>;
  if JSON.TryGetValue<TJSONValue>('id', Value) then Entity.id := Value.AsType<string>;
  if JSON.TryGetValue<TJSONValue>('value', Value) then Entity.value := Value.AsType<string>;
  if JSON.TryGetValue<TJSONValue>('popupID', Value) then Entity.popupID := Value.AsType<Integer>;
  
  if HasReachedMaxDepth then Exit;
  
  var ChildEntityJson1: TJSONObject;
  if JSON.TryGetValue<TJSONObject>('popup', ChildEntityJson1) then
  begin
    Entity.popup := AddAssociation<ConversionProject.DataSource.MenuCard.Ipopup>(ChildEntityJson1, 'popup')
      .Adapter(TpopupJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
      .Parse;
    
    Entity.popup.Value.menu := Entity;
  end;
  
  var ChildEntityJson2: TJSONObject;
  if JSON.TryGetValue<TJSONObject>('MenuCard', ChildEntityJson2) then
  begin
    Entity.MenuCard := AddAssociation<ConversionProject.DataSource.MenuCard.IMenuCard>(ChildEntityJson2, 'MenuCard')
      .Adapter(TMenuCardJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
      .Parse;
    
    Entity.MenuCard.Value.menu := Entity;
  end;
end;

function TmenuJSONAdapter.MapFromEntity(const Entity: ConversionProject.DataSource.MenuCard.Imenu): TJSONObject;
begin
  Result := CreateJsonResult(Entity);
  Result.AddPair('menuID', Entity.menuID.Value);
  Result.AddPair('id', Entity.id.Value);
  Result.AddPair('value', Entity.value.Value);
  Result.AddPair('popupID', Entity.popupID.Value);
  
  if HasReachedMaxDepth then Exit;
  
  AddAssociation<ConversionProject.DataSource.MenuCard.Ipopup>(Result, 'popup')
    .Adapter(TpopupJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
    .Entity(Entity.popup)
    .Add;
  
  AddAssociation<ConversionProject.DataSource.MenuCard.IMenuCard>(Result, 'MenuCard')
    .Adapter(TMenuCardJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
    .Entity(Entity.MenuCard)
    .Add;
end;

 { TmenuJSONAdapter }

function TmenuitemJSONAdapter.CreateEntity: ConversionProject.DataSource.MenuCard.Imenuitem;
begin
  Result := ConversionProject.DataSource.MenuCard.Tmenuitem.Create;
end;

procedure TmenuitemJSONAdapter.MapToEntity(const JSON: TJSONValue; const Entity: ConversionProject.DataSource.MenuCard.Imenuitem);
begin
  var Value: TJSONValue;
  if JSON.TryGetValue<TJSONValue>('menuitemID', Value) then Entity.menuitemID := Value.AsType<Integer>;
  if JSON.TryGetValue<TJSONValue>('value', Value) then Entity.value := Value.AsType<string>;
  if JSON.TryGetValue<TJSONValue>('onclick', Value) then Entity.onclick := Value.AsType<string>;
  if JSON.TryGetValue<TJSONValue>('popupID', Value) then Entity.popupID := Value.AsType<Integer>;
  
  if HasReachedMaxDepth then Exit;
  
  if IsAtStartingPoint then
  begin
    var ChildEntityJson3: TJSONObject;
    if JSON.TryGetValue<TJSONObject>('popup', ChildEntityJson3) then
    begin
      Entity.popup := AddAssociation<ConversionProject.DataSource.MenuCard.Ipopup>(ChildEntityJson3, 'popup')
        .Adapter(TpopupJSONAdapter.Create(True, FIncludeEntityState))
        .Parse;
      
    end;
  end;
end;

function TmenuitemJSONAdapter.MapFromEntity(const Entity: ConversionProject.DataSource.MenuCard.Imenuitem): TJSONObject;
begin
  Result := CreateJsonResult(Entity);
  Result.AddPair('menuitemID', Entity.menuitemID.Value);
  Result.AddPair('value', Entity.value.Value);
  Result.AddPair('onclick', Entity.onclick.Value);
  Result.AddPair('popupID', Entity.popupID.Value);
  
  if HasReachedMaxDepth then Exit;
  
  if IsAtStartingPoint then
  begin
    AddAssociation<ConversionProject.DataSource.MenuCard.Ipopup>(Result, 'popup')
      .Adapter(TpopupJSONAdapter.Create(True, FIncludeEntityState))
      .Entity(Entity.popup)
      .Add;
  end;
end;

 { TmenuitemJSONAdapter }

function TpopupJSONAdapter.CreateEntity: ConversionProject.DataSource.MenuCard.Ipopup;
begin
  Result := ConversionProject.DataSource.MenuCard.Tpopup.Create;
end;

procedure TpopupJSONAdapter.MapToEntity(const JSON: TJSONValue; const Entity: ConversionProject.DataSource.MenuCard.Ipopup);
begin
  var Value: TJSONValue;
  if JSON.TryGetValue<TJSONValue>('popupID', Value) then Entity.popupID := Value.AsType<Integer>;
  
  if HasReachedMaxDepth then Exit;
  
  var ChildEntityJson4: TJSONObject;
  if JSON.TryGetValue<TJSONObject>('menu', ChildEntityJson4) then
  begin
    Entity.menu := AddAssociation<ConversionProject.DataSource.MenuCard.Imenu>(ChildEntityJson4, 'menu')
      .Adapter(TmenuJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
      .Parse;
    
    Entity.menu.Value.popup := Entity;
  end;
  
  var ChildCollectionJson: TJSONArray;
  if JSON.TryGetValue<TJSONArray>('menuitem', ChildCollectionJson) then
  begin
    var ChildJsonItem: TJSONValue;
    Entity.menuitem := TCodolexCollections.CreateList<ConversionProject.DataSource.MenuCard.Imenuitem>;
    for ChildJsonItem in ChildCollectionJson do
    begin
      var ChildEntity := AddAssociation<ConversionProject.DataSource.MenuCard.Imenuitem>((ChildJsonItem as TJSONObject), 'menuitem')
        .Adapter(TmenuitemJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
        .Parse;
      
      ChildEntity.popup := Entity;
      Entity.menuitem.Value.Add(ChildEntity);
    end;
  end;
end;

function TpopupJSONAdapter.MapFromEntity(const Entity: ConversionProject.DataSource.MenuCard.Ipopup): TJSONObject;
begin
  Result := CreateJsonResult(Entity);
  Result.AddPair('popupID', Entity.popupID.Value);
  
  if HasReachedMaxDepth then Exit;
  
  AddAssociation<ConversionProject.DataSource.MenuCard.Imenu>(Result, 'menu')
    .Adapter(TmenuJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
    .Entity(Entity.menu)
    .Add;
  
  if Entity.menuitem.HasValue and (Entity.menuitem.Value.Count > 0) then
  begin
    var Collection := TJSONArray.Create;
    Result.AddPair('menuitem', Collection);
    for var Item in Entity.menuitem.Value do
    begin
      AddAssociation<ConversionProject.DataSource.MenuCard.Imenuitem>(Collection)
        .Adapter(TmenuitemJSONAdapter.Create(FCurrentDepth, FIncludeEntityState))
        .Entity(Item)
        .Add;
    end;
  end;
end;


end.
