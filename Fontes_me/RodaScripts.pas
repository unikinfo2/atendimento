unit RodaScripts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, IBDatabase, IBCustomDataSet, IBQuery,
  IBSQL, DBTables;

type
  TRodaScripts_f = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    memoScript: TMemo;
    memoErro: TMemo;
    qryAux: TQuery;
    procedure RodaScript;
  private
    ArqIni : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RodaScripts_f: TRodaScripts_f;

implementation
uses funcoes, Principal;
{$R *.dfm}



procedure TRodaScripts_f.RodaScript;
var vArq      : TextFile;
    vFileName : String;
    vUltimo   : String;
    vLinha    : String;
    vQtde     : Integer;
    vQtdeEr   : Integer;
    vLinha2   : String;
begin
  vFileName := extractfilepath(application.ExeName) + 'Scripts_Atendimento.sql';
  if Sistema = 'FINANCEIRO' then
  begin
    if not fileexists(vFileName) then
      vFileName := extractfilepath(application.ExeName) + 'Scripts_Atendimento2.sql';
  end;
  if fileexists(vFileName) then
  begin
    qryAux.close;
    qryAux.Sql.Text := 'SELECT * FROM SEG_LIBERA';
    qryAux.open;
    vUltimo := qryAux.FieldByName('ultimo_script').AsString;
    if vUltimo <> '' then
    begin
      if StrToDateTime(vUltimo) >= StrToDateTime(getFileDate(vFileName)) then
      begin
        close;
        exit;
      end;
    end;

    assignfile(vArq, vFileName);
    ReSet(vArq);
    vQtde   := 0;
    vQtdeEr := 0;

    while not eof(vArq) do
    begin
      readLn(vArq, vLinha);
      if copy(TrimLeft(vLinha),1,2) = '/*' then
        continue;
      if Trim(vLinha) = '' then
        continue;

      vLinha2 := vLinha;
      delete(vLinha2,pos(';', vLinha2),1);
      while pos('"', vLinha2) > 0 do delete(vLinha2, pos('"', vLinha2), 1);

      memoScript.Lines.Add(vLinha2);

      if pos(';', vLinha) > 0  then
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Text := memoScript.Lines.Text;
        try
          {frmPrincipal.Database1.StartTransaction;}
          qryAux.ExecSQL;
          {frmPrincipal.Database1.Commit;}
          inc(vQtde);
        except
          memoErro.Lines.Add('');
          memoErro.Lines.Add('/* Erro */');
          memoErro.Lines.AddStrings(memoScript.Lines);
          inc(vQtdeEr);
          {frmPrincipal.Database1.Rollback;}
        end;
        memoScript.Lines.Clear;
      end;
    end;
    closefile(vArq);
    memoScript.Lines.add('Quantidade de Scripts rodados Sem erro: '+IntToStr(vQtde));
    memoScript.Lines.add('Quantidade de Scripts rodados Com erro: '+IntToStr(vQtdeEr));
    memoScript.Lines.add('-----------------------------------------------------------');
    memoScript.Lines.add('Quantidade Total de Scripts           : '+IntToStr(vQtde+vQtdeEr));

    qryAux.close;
    qryAux.Sql.Text := 'UPDATE SEG_LIBERA SET ULTIMO_SCRIPT = ''' + getFileDate(vFileName) + '''';
    qryAux.ExecSQL;
    {frmPrincipal.Database1.Commit;}
    frmPrincipal.Database1.Close;
    frmPrincipal.Database1.Open;
  end;
end;
end.
