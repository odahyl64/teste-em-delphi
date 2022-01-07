unit UVendaModel;

interface

uses
  uEnumerado, FireDAC.Comp.Client, uVendaDao;
type
  TVendaModel = class
  private
    FAcao: TAcao;
    FCodigo: Integer;
    FNome: string;
    procedure SetAcao(const Value: TAcao);
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    function Obter: TFDQuery;
    function Salvar: Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Acao: TAcao read FAcao write SetAcao;
  end;
implementation
{ TVenda }


function TVendaModel.GetId(AAutoIncrementar: Integer): Integer;
var
  VVendaDao: TVendaDao;
begin
  VVendaDao := TVendaDao.Create;
  try
    Result := VVendaDao.GetId(AAutoIncrementar);
  finally
    VVendaDao.Free;
  end;
end;
function TVendaModel.Obter: TFDQuery;
var
  VVendaDao: TVendaDao;
begin
  VVendaDao := TVendaDao.Create;
  try
    Result := VVendaDao.Obter;
  finally
    VVendaDao.Free;
  end;
end;
function TVendaModel.Salvar: Boolean;
var
  VVendaDao: TVendaDao;
begin
  Result := False;
  VVendaDao := TVendaDao.Create;
  try
    case FAcao of
      uEnumerado.tacIncluir: Result := VVendaDao.Incluir(Self);
      uEnumerado.tacAlterar: Result := VVendaDao.Alterar(Self);
      uEnumerado.tacExcluir: Result := VVendaDao.Excluir(Self);
    end;
  finally
    VVendaDao.Free;
  end;
end;
procedure TVendaModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;
procedure TVendaModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;
procedure TVendaModel.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
