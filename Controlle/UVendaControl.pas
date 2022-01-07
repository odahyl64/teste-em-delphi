unit UVendaControl;

interface

uses
  uVendaModel, System.SysUtils, FireDAC.Comp.Client;
type
  TVendaControl = class
  private
    FVendaModel: TVendaModel;
  public
    constructor Create;
    destructor Destroy; override;
    function Salvar: Boolean;
    function Obter: TFDQuery;
    function GetId(AAutoIncrementar: Integer): Integer;
    property VendaModel: TVendaModel read FVendaModel write FVendaModel;
  end;
implementation
{ TVendaControl }
constructor TVendaControl.Create;
begin
  FVendaModel := TVendaModel.Create;
end;
destructor TVendaControl.Destroy;
begin
  FVendaModel.Free;
  inherited;
end;
function TVendaControl.GetId(AAutoIncrementar: Integer): Integer;
begin
  Result := FVendaModel.GetId(AAutoIncrementar);
end;
function TVendaControl.Obter: TFDQuery;
begin
  Result := FVendaModel.Obter;
end;
function TVendaControl.Salvar: Boolean;
begin
  Result := FVendaModel.Salvar;
end;

end.
