unit UConexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.stan.intf, System.SysUtils,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.FB, FireDAC.DApt, FireDAC.VCLUI.Wait;
type
  TConexao = class
  private
    FServidor: string;
    FMsgerro: string;
    FSenha: string;
    FBase: string;
    FLogin: string;
    FPorta: string;
    MySQL: string;
    FConexao: TFDConnection;

  public
    constructor Create (NomeConexao : TFDConnection);
    destructor Destroy; override;

    function fnc_conectar_banco_dados: boolean;

    property Conexao : TFDConnection Read FConexao Write FConexao;
    property Servidor : string Read FServidor Write FServidor;
    property Base     : string Read FBase Write FBase;
    property Login    : string Read FLogin Write FLogin;
    property Senha    : string Read FSenha Write FSenha;
    property Porta    : string Read FPorta Write FPorta;
    property Msgerro  : string Read FMsgerro Write FMsgerro;
  end;
implementation

{ TConexao }

constructor TConexao.Create(NomeConexao: TFDConnection);
begin
  FConexao := NomeConexao;
end;
destructor TConexao.Destroy;
begin
  FConexao.connected := False;
  inherited;
end;

function TConexao.fnc_conectar_banco_dados: boolean;
begin
   Result := True;

   FConexao.params.clear;

   FConexao.Params.Add('Serve=' + FServidor);
   FConexao.Params.Add('user_name=' + FLogin);
   FConexao.Params.Add('passorwd=' + FSenha);
   FConexao.Params.Add('port=' + FPorta);
   FConexao.Params.Add('Database=' + FBase);
   FConexao.Params.Add('DriverID' + MySQL);

   try
   FConexao.Connected := True;

   Except
     on e:Exception do
     begin
        FMsgErro := e.Message;
        Result := False;
     end;
   end;
end;

end.
