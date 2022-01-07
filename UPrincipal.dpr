program UPrincipal;

uses
  Vcl.Forms,
  vendas in 'View\vendas.pas' {FrmPrincipal},
  UVendaControl in 'Controlle\UVendaControl.pas',
  UVendaModel in 'Model\UVendaModel.pas',
  UEnumerado in 'Model\UEnumerado.pas',
  UVendaDao in 'Dao\UVendaDao.pas',
  UConexao in 'Dao\UConexao.pas',
  USistemaControl in 'Controlle\USistemaControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
