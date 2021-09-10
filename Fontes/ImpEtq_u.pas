unit ImpEtq_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls,
  ToolEdit, RpDefine, RpBase, RpSystem;

type
  TImpEtq_f = class(TDeriva_f)
    BitBtn1: TBitBtn;
    rgOrdem: TRadioGroup;
    rgFiltro: TRadioGroup;
    rgCliente: TRadioGroup;
    rgTipo: TRadioGroup;
    rgTipoList: TRadioGroup;
    rvSystem1: TRvSystem;
    qryCli: TQuery;
    chkEnd: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure rvSystem1Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImpEtq_f: TImpEtq_f;

implementation

uses qrClientes,
     Atendimento_dm,
     qrClientesSimples,
     qrClientesCompleta,
     funcoes;

{$R *.DFM}

procedure TImpEtq_f.BitBtn1Click(Sender: TObject);
var sSql : String;
begin
  inherited;

  sSql := 'SELECT * FROM GC_CLIENTE  CLI ';

  if rgFiltro.itemindex = 0   then sSql := sSql + ' WHERE cli.ativo_cli IS NOT NULL';
  if rgFiltro.itemindex = 1   then sSql := sSql + ' WHERE cli.ativo_cli = ''A''';
  if rgFiltro.itemindex = 2   then sSql := sSql + ' WHERE cli.ativo_cli = ''P''';
  if rgFiltro.itemindex = 3   then sSql := sSql + ' WHERE cli.ativo_cli = ''I''';

  if rgCliente.itemindex = 1  then sSql := sSql + ' AND (cli.email_cli IS NOT NULL)';
  if rgCliente.itemindex = 2  then sSql := sSql + ' AND (cli.email_cli IS NULL)';

  if rgTipoList.itemindex = 1 then sSql := sSql + ' AND cli.tipo_clifor IN (''C'',''R'')';
  if rgTipoList.itemindex = 2 then sSql := sSql + ' AND cli.tipo_clifor IN (''F'',''R'')';

  if rgOrdem.itemindex = 0    then sSql := sSql + ' ORDER BY CLI.NOME_CLI';
  if rgOrdem.itemindex = 1    then sSql := sSql + ' ORDER BY CLI.COD_CLIENTE';

  qryCli.close;
  qryCli.sql.Text := sSql;
  qryCli.open;
  rvSystem1.Execute;
end;

procedure TImpEtq_f.rvSystem1Print(Sender: TObject);
var vQtd,  numEtq, x : Integer;
    vEtq : Array[1..5] of array[1..3] of String;
begin
  inherited;
  with Sender as TBaseReport do
  begin
    SomaLinha(Sender as TBaseReport);
    vQtd := 1;
    if rgTipo.ItemIndex = 0 then
    begin
      ClearTabs;
      SetPen(clBlack,psClear,1,pmCopy);
      SetTab(0.37,pjLeft,3.0,5,BOXLINEALL,0);
      SaveTabs(1);
      numEtq := 1;
    end
    else if rgTipo.ItemIndex = 1 then
    begin
      ClearTabs;
      SetPen(clBlack,psClear,1,pmCopy);
      SetTab(0.37,pjLeft,3.0,15,BOXLINEALL,0);
      SetTab(NA,pjLeft,3.0,15,BOXLINEALL,0);
      SaveTabs(1);
      numEtq := 2;
    end
    else
    begin
      ClearTabs;
      SetPen(clBlack,psClear,1,pmCopy);
      SetTab(0.37,pjLeft,2.9,15,BOXLINEALL,0);
      SetTab(NA,pjLeft,2.9,15,BOXLINEALL,0);
      SetTab(NA,pjLeft,2.9,15,BOXLINEALL,0);
      SaveTabs(1);
      numEtq := 3;
    end;

    for x := 1 to 3 do
    begin
      vEtq[1,x] := '';
      vEtq[2,x] := '';
      vEtq[3,x] := '';
      vEtq[4,x] := '';
      vEtq[5,x] := '';
    end;

    while not qryCli.eof do
    begin
      vEtq[1,vQtd] := qryCli.FieldByName('cod_cliente').AsString+'-'+qryCli.FieldByName('nome_cli').AsString;
      if chkEnd.Checked then
      begin
        vEtq[2,vQtd] := qryCli.FieldByName('end_cob_cli').AsString;
        vEtq[3,vQtd] := qryCli.FieldByName('bairro_cob_cli').AsString + ' ' + qryCli.FieldByName('cidade_cob_cli').AsString + ' - ' + qryCli.FieldByName('uf_cob_cli').AsString;
        vEtq[4,vQtd] := qryCli.FieldByName('cep_cob_cli').AsString;
        vEtq[5,vQtd] := '';
      end
      else
      begin
        vEtq[2,vQtd] := qryCli.FieldByName('endereco_cli').AsString + ' ' + qryCli.FieldByName('complemento_cli').AsString;
        vEtq[3,vQtd] := qryCli.FieldByName('bairro_cli').AsString + ' ' + qryCli.FieldByName('cidade_cli').AsString + ' - ' + qryCli.FieldByName('uf_cli').AsString;
        vEtq[4,vQtd] := qryCli.FieldByName('cep_cli').AsString;
        vEtq[5,vQtd] := '';
      end;
      inc(vQtd);

      if vQtd > numEtq then
      begin
        ClearTabs;
        SetPen(clBlack,psClear,1,pmCopy);
        restoretabs(1);
        for x := 1 to 5 do
        begin
          SetFont('Arial', 8);
          PrintTab( vEtq[x,1]);
          PrintTab( vEtq[x,2]);
          PrintTab( vEtq[x,3]);
          SomaLinha(Sender as TBaseReport);
          ClearTabs;
          SetPen(clBlack,psClear,1,pmCopy);
          restoretabs(1);
          vEtq[x,1] := '';
          vEtq[x,2] := '';
          vEtq[x,3] := '';
        end;
        SomaLinha(Sender as TBaseReport);
        vQtd := 1;
      end;
      qryCli.Next;
    end;
  end;
end;

end.
