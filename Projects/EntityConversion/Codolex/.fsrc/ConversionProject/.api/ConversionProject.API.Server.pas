unit ConversionProject.API.Server;

interface

uses
  Codolex.MVCFramework,
  Codolex.MVCFramework.Commons,
  Codolex.MVCFramework.Middleware.Analytics,
  Codolex.MVCFramework.Middleware.CORS,
  Codolex.MVCFramework.Middleware.Compression,
  Codolex.MVCFramework.Middleware.ETag,
  Codolex.MVCFramework.Middleware.StaticFiles,
  Codolex.MVCFramework.Middleware.Swagger,
  Codolex.MVCFramework.Middleware.Trace,
  Codolex.MVCFramework.Swagger.Commons,
  ConversionProject.API.Authentication,
  IdHTTPWebBrokerBridge,
  System.Classes,
  System.IOUtils,
  System.SysUtils,
  Web.HTTPApp,
  Web.WebReq;

type
  TConversionProjectApiServer = class
  private
    FWebBrokerBridge: TIdHTTPWebBrokerBridge;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    
    procedure OnAuthentication(const Action: TOnAuthenticationEvent);
    
    procedure Start(const Port: Integer);
    procedure Stop;
    
    function IsActive: Boolean;
  end;
  
  TConversionProjectApiWebModule = class(TWebModule)
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
  private
    FMVC: TMVCEngine;
  end;

var
  ApiServerInstance: TConversionProjectApiServer;
  ApiWebModuleClass: TComponentClass = TConversionProjectApiWebModule;


implementation

uses
  Codolex.MVCFramework.JWT,
  Codolex.MVCFramework.Middleware.JWT;

{$R *.dfm}


{ TConversionProjectApiServer }

procedure TConversionProjectApiServer.AfterConstruction;
begin
  inherited;
  FWebBrokerBridge := TIdHTTPWebBrokerBridge.Create(nil);
  OnAuthenticationConversionProjectAPI := nil;
end;

procedure TConversionProjectApiServer.BeforeDestruction;
begin
  inherited;
  FWebBrokerBridge.Free;
end;

procedure TConversionProjectApiServer.OnAuthentication(const Action: TOnAuthenticationEvent);
begin
  OnAuthenticationConversionProjectAPI := Action;
end;

procedure TConversionProjectApiServer.Start(const Port: Integer);
begin
  if FWebBrokerBridge.Active then
    Exit;

  WebRequestHandler.WebModuleClass := ApiWebModuleClass;

  FWebBrokerBridge.OnParseAuthentication := TMVCParseAuthentication.OnParseAuthentication;

  FWebBrokerBridge.DefaultPort := Port;
  FWebBrokerBridge.KeepAlive := True;
  FWebBrokerBridge.MaxConnections := 20;
  FWebBrokerBridge.ListenQueue := 500;

  FWebBrokerBridge.Active := True;
end;

procedure TConversionProjectApiServer.Stop;
begin
  EnterInShutdownState;
  FWebBrokerBridge.Active := False;
end;

function TConversionProjectApiServer.IsActive: Boolean;
begin
  Result := FWebBrokerBridge.Active;
end;

{ TConversionProjectApiWebModule }

procedure TConversionProjectApiWebModule.WebModuleCreate(Sender: TObject);
begin
  FMVC := TMVCEngine.Create(Self,
    procedure(Config: TMVCConfig)
    begin
      Config[TMVCConfigKey.SessionTimeout] := '0';
      Config[TMVCConfigKey.DefaultContentType] := TMVCConstants.DEFAULT_CONTENT_TYPE;
      Config[TMVCConfigKey.DefaultContentCharset] := TMVCConstants.DEFAULT_CONTENT_CHARSET;
      Config[TMVCConfigKey.AllowUnhandledAction] := 'false';
      Config[TMVCConfigKey.LoadSystemControllers] := 'true';
      Config[TMVCConfigKey.DefaultViewFileExtension] := 'html';
      Config[TMVCConfigKey.ViewPath] := 'templates';
      Config[TMVCConfigKey.MaxEntitiesRecordCount] := IntToStr(TMVCConstants.MAX_RECORD_COUNT);
      Config[TMVCConfigKey.ExposeServerSignature] := 'false';
      Config[TMVCConfigKey.ExposeXPoweredBy] := 'true';
      Config[TMVCConfigKey.MaxRequestSize] := IntToStr(TMVCConstants.DEFAULT_MAX_REQUEST_SIZE);
    end);

  
  var ClaimsSetup: TJWTClaimsSetup := procedure(const JWT: TJWT)
        begin
          JWT.Claims.Issuer := 'Codolex Authority';
          JWT.Claims.ExpirationTime := Now + EncodeTime(8, 0, 0, 0);
          JWT.Claims.NotBefore := Now - EncodeTime(0, 5, 0, 0);
        end;
  
  FMVC.AddMiddleware(
        TMVCJWTAuthenticationMiddleware.Create(
          TConversionProjectAuthCriteria.Create,
          ClaimsSetup,
          '{0EB42CF2-F48D-4C63-B339-CA560D826944}',
          '/auth/login',
          [TJWTCheckableClaim.ExpirationTime,
           TJWTCheckableClaim.NotBefore])
  );
  

  var SwaggerInfo: TMVCSwaggerInfo;
  FMVC.AddMiddleware(TMVCSwaggerMiddleware.Create(FMVC, SwaggerInfo, '/api/swagger.json'));
  FMVC.AddMiddleware(TMVCAnalyticsMiddleware.Create(GetAnalyticsDefaultLogger));
  FMVC.AddMiddleware(TMVCStaticFilesMiddleware.Create('/static', TPath.Combine(ExtractFilePath(GetModuleName(HInstance)), 'www')));
  FMVC.AddMiddleware(TMVCStaticFilesMiddleware.Create('/docs', TPath.Combine(ExtractFilePath(GetModuleName(HInstance)), 'swagger')));
  FMVC.AddMiddleware(TMVCTraceMiddleware.Create);
  FMVC.AddMiddleware(TMVCCORSMiddleware.Create);
  FMVC.AddMiddleware(TMVCCompressionMiddleware.Create);
  FMVC.AddMiddleware(TMVCETagMiddleware.Create);
end;

procedure TConversionProjectApiWebModule.WebModuleDestroy(Sender: TObject);
begin
  FMVC.Free;
end;

end.
