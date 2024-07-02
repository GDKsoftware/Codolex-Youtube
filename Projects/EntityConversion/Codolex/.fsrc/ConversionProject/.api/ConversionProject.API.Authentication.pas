unit ConversionProject.API.Authentication;

interface

uses
  Codolex.MVCFramework,
  System.Generics.Collections;

type
  TOnAuthenticationEvent = reference to function(const UserName, Password: string; const UserRoles: TList<string>; const SessionData: TDictionary<string, string>): Boolean;
  
  TConversionProjectAuthCriteria = class(TInterfacedObject, IMVCAuthenticationHandler)
  public
    procedure OnRequest(const AContext: TWebContext; const AControllerQualifiedClassName: string; const AActionName: string; var AAuthenticationRequired: Boolean);
    procedure OnAuthentication(const AContext: TWebContext; const AUserName: string; const APassword: string; AUserRoles: TList<String>; var AIsValid: Boolean; const ASessionData: TDictionary<string, string>);
    procedure OnAuthorization(const AContext: TWebContext; AUserRoles: TList<string>; const AControllerQualifiedClassName: string; const AActionName: string; var AIsAuthorized: Boolean);
  end;

var
  OnAuthenticationConversionProjectAPI: TOnAuthenticationEvent;

implementation

{ TConversionProjectAuthCriteria }

procedure TConversionProjectAuthCriteria.OnRequest(const AContext: TWebContext; const AControllerQualifiedClassName: string; const AActionName: string; var AAuthenticationRequired: Boolean);
begin
  AAuthenticationRequired := False;
end;

procedure TConversionProjectAuthCriteria.OnAuthentication(const AContext: TWebContext; const AUserName: string; const APassword: string; AUserRoles: TList<String>; var AIsValid: Boolean; const ASessionData: TDictionary<string, string>);
begin
  if Assigned(OnAuthenticationConversionProjectAPI) then
    AIsValid := OnAuthenticationConversionProjectAPI(AUserName, APassword, AUserRoles, ASessionData)
  else
    AIsValid := True;
end;

procedure TConversionProjectAuthCriteria.OnAuthorization(const AContext: TWebContext; AUserRoles: TList<string>; const AControllerQualifiedClassName: string; const AActionName: string; var AIsAuthorized: Boolean);
begin
  AIsAuthorized := True;
end;


end.
