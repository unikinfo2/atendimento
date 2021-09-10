unit Atendimento_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MedPesquisaBDE;

type
  TdmPesq = class(TDataModule)
    PesCliente: TPesquisaBDE;
    PesDocto: TPesquisaBDE;
    pesDepto: TPesquisaBDE;
    pesFunc: TPesquisaBDE;
    PesLig: TPesquisaBDE;
    pesVis: TPesquisaBDE;
    pesAtendimento: TPesquisaBDE;
    pesOcorrencia: TPesquisaBDE;
    pesDoctoEmi: TPesquisaBDE;
    pesEMail: TPesquisaBDE;
    pesAgenda: TPesquisaBDE;
    pesClienteFunc: TPesquisaBDE;
    pesFicha: TPesquisaBDE;
    PesMemo: TPesquisaBDE;
    pesFunc2: TPesquisaBDE;
    pesFeriado: TPesquisaBDE;
    PesLivro: TPesquisaBDE;
    pesAssunto: TPesquisaBDE;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPesq: TdmPesq;

implementation
uses Principal;

{$R *.DFM}


end.
 