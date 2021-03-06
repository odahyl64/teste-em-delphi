unit vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UVendaControl, uEnumerado,
  Data.Win.ADODB, UConexao, Data.FMTBcd, Data.SqlExpr, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.DApt;

type
  TFrmPrincipal = class(TForm)
    Label1: TLabel;
    edtCodigo: TEdit;
    edtQuantidade: TEdit;
    Label2: TLabel;
    Button4: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    EdtPcVenda: TEdit;
    Connection: TFDConnection;
    DriverLink: TFDPhysMySQLDriverLink;
    DSVenda: TDataSource;
    Query: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button5Click(Sender: TObject);
  private
    Conexao : TConexao;
    FVendaControl: TVendaControl;

    procedure CarregarVenda;
    procedure CarregarEdits;
  end;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  FVendaControl.VendaModel.Acao   := uEnumerado.tacIncluir;
  FVendaControl.VendaModel.Nome   := edtNome.Text;
  if FVendaControl.Salvar() then
    ShowMessage('Incluido com sucesso.');
  Self.CarregarVenda();

end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  FVendaControl.VendaModel.Acao   := uEnumerado.tacAlterar;
  FVendaControl.VendaModel.Codigo := StrToInt(edtCodigo.Text);
  FVendaControl.VendaModel.Quantidade   := edtQuantidade.Text;
  FVendaControl.VendaModel.PcVenda      := edtPcVenda.Text;
  if FVendaControl.Salvar() then
    ShowMessage('Alterado com sucesso.');
  Self.CarregarVenda();

end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
begin
  VCodigo := InputBox('Excluir', 'Digite o c?digo da Venda', EmptyStr);

  if VCodigo.Trim <> EmptyStr then
  begin
    if (Application.MessageBox(PChar('Deseja excluir o registro?'), 'Confirma??o', MB_YESNO
      + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes) then
    begin
      FVendaControl.VendaModel.Acao   := uEnumerado.tacExcluir;
      FVendaControl.VendaModel.Codigo := StrToInt(edtCodigo.Text);
      if FVendaControl.Salvar() then
        ShowMessage('Excluido com sucesso.');
      Self.CarregarVenda();
    end;
  end;

end;

procedure TFrmPrincipal.Button4Click(Sender: TObject);
begin
  FVendaControl.VendaModel.Codigo := FVendaControl.VendaModel.GetId(1);
  edtCodigo.Text := FVendaControl.VendaModel.Codigo.ToString();
  edtQuantidade.Clear;
  edtQuantidade.SetFocus();
  edtPcVenda.Clear;
  EdtPcVenda.SetFocus();

end;

procedure TFrmPrincipal.Button5Click(Sender: TObject);
begin
  try
     adoConnection.open();
     showmessage('conector');
end;

procedure TFrmPrincipal.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Self.CarregarEdits();

end;

procedure TFrmPrincipal.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.CarregarEdits();

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FVendaControl := TVendaControl.Create;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Self.CarregarVenda();

{  if mmTableClientes.RecordCount > 0 then
  begin
    Self.CarregarEdits();
  end;
 }
end;

end.
