unit UVendaDao;

interface

uses
  FireDAC.Comp.Client, UConexao, UVendaModel, System.SysUtils;
type
  TVendaDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    function Incluir(AVendaModel: TVendaModel): Boolean;
    function Alterar(AVendaModel: TVendaModel): Boolean;
    function Excluir(AVendaModel: TVendaModel): Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    function Obter: TFDQuery;
  end;

implementation

{ TClienteDao }

uses uVendaControl, UVendaModel;

function TVendaDao.Alterar(AVendaModel: TVendaModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('update Venda set quantidade = :quantidade where (codigo = :codigo)', [AVendaModel.Nome, AVendaModel.Codigo]);
    Result := True;
  finally
    VQry.Free;
  end;
end;
constructor TVendaDao.Create;
begin
  FConexao := TVendaControl.GetInterface().Conexao;
end;
function TVendaDao.Excluir(AVendaModel: TVendaModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('delete from venda where (codigo = :codigo)', [AVendaModel.Codigo]);
    Result := True;
  finally
    VQry.Free;
  end;
end;
function TVendaDao.GetId(AAutoIncrementar: Integer): Integer;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Open('select gen_id(gen_venda_id, ' + IntToStr(AAutoIncrementar) + ' ) from rdb$database');
    try
      Result := VQry.Fields[0].AsInteger;
    finally
      VQry.Close;
    end;
  finally
    VQry.Free;
  end;
end;
function TVendaDao.Incluir(AVendaModel: TVendaModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('insert into venda (codigo, quantidade, pcvenda) values (:codigo, :quantidade, :pcvenda)', [AVendaModel.Codigo, AVendaModel.Nome]);
    Result := True;
  finally
    VQry.Free;

end;
function TVendaDao.Obter: TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  VQry.Open('select codigo, quantidade from venda order by 1');
  Result := VQry;
end;

end;

end.
