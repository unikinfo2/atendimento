program Atendimento;

uses
  Forms,
  SysUtils,
  Deriva_u in 'Deriva_u.pas' {Deriva_f},
  Principal in 'Principal.pas' {frmPrincipal},
  CadCliente_u in 'CadCliente_u.pas' {CadCliente_f},
  LogOn_u in 'LogOn_u.pas' {LogOn_f},
  SPLASH2 in 'SPLASH2.pas' {frmSplash},
  CadFerido_u in 'CadFerido_u.PAS' {CadFeriado_f},
  CadFuncionario_u in 'CadFuncionario_u.pas' {CadFuncionario_f},
  Atendimento_dm in 'Atendimento_dm.pas' {dmPesq: TDataModule},
  CadVisita_u in 'CadVisita_u.pas' {CadVisita_f},
  VisitaSolicit_u in 'VisitaSolicit_u.pas' {VisitaSolicit_f},
  CadLigacao_u in 'CadLigacao_u.pas' {CadLigacao_f},
  LigacaoSolicit_u in 'LigacaoSolicit_u.pas' {LigacaoSolicit_f},
  Atendimento_u in 'Atendimento_u.pas' {Atendimento_f},
  MostraOcorrencia_u in 'MostraOcorrencia_u.pas' {MostraOcorrencia_f},
  EMail_u in 'EMail_u.pas' {EMail_f},
  DocEmitido_u in 'DocEmitido_u.pas' {DocEmitido_f},
  CadAssunto_u in 'CadAssunto_u.PAS' {CadAssunto_f},
  GeraVencimento_u in 'GeraVencimento_u.pas' {GeraVencimento_f},
  mens_EnvioEmail in 'mens_EnvioEmail.pas' {mens_EnvioEmail_f},
  GraficoAtendimento in 'GraficoAtendimento.pas' {GraficoAtendimento_f},
  Agenda_u in 'Agenda_u.pas' {Agenda_f},
  Pendencia_u in 'Pendencia_u.pas' {Pendencia_f},
  Ficha2_u in 'Ficha2_u.pas' {Ficha2_f},
  Ficha_Soc_u in 'Ficha_Soc_u.pas' {Ficha_Soc_f},
  qrDocumentoPro in 'qrDocumentoPro.pas' {qrDocumentoPro_f: TQuickRep},
  EmiteDocumentoProt_u in 'EmiteDocumentoProt_u.pas' {EmiteDocumentoProt_f},
  EmiteDarf_u in 'EmiteDarf_u.pas' {EmiteDarf_f},
  EmiteDocAssoc_u in 'EmiteDocAssoc_u.pas' {EmiteDocAssoc_f},
  qrClientesCompleta in 'qrClientesCompleta.pas' {qrClientesCompleta_f: TQuickRep},
  qrAndamentoLegal in 'qrAndamentoLegal.pas' {qrAndamentoLegal_f: TQuickRep},
  EmiteContato_u in 'EmiteContato_u.pas' {EmiteContato_f},
  EmiteLigacoes_u in 'EmiteLigacoes_u.pas' {EmiteLigacoes_f},
  qrLigacao_u in 'qrLigacao_u.pas' {qrLigacao_f: TQuickRep},
  CopiaProtocolo in 'CopiaProtocolo.pas' {CopiaProtocolo_f},
  qrProtocolo2 in 'qrProtocolo2.pas' {qrProtocolo2_f: TQuickRep},
  Financeiro_dm in '..\..\Financeiro\Fontes\Financeiro_dm.pas' {dmFinanc: TDataModule},
  EmiteRelatorios_u in 'EmiteRelatorios_u.pas' {EmiteRelatorios_f},
  qrDocEmitido in 'qrDocEmitido.pas' {qrDocEmitido_f: TQuickRep},
  EmiteAtendLig_u in 'EmiteAtendLig_u.pas' {EmiteAtendLig_f},
  qrAtendLig in 'qrAtendLig.pas' {qrAtendLig_f: TQuickRep},
  qrClientes in 'qrClientes.pas' {qrClientes_f: TQuickRep},
  qrContato in 'qrContato.pas' {qrContato_f: TQuickRep},
  CadConfiguracao in 'CadConfiguracao.pas' {CadConfiguracao_f},
  CadMemorando_u in 'CadMemorando_u.pas' {CadMemorando_f},
  LerMemorando_u in 'LerMemorando_u.pas' {LerMemorando_f},
  qrMemorando in 'qrMemorando.pas' {qrMemorando_f: TQuickRep},
  qrProtocolo3 in 'qrProtocolo3.pas' {qrProtocolo3_f: TQuickRep},
  qrProtocolo in 'qrProtocolo.pas' {qrProtocolo_f: TQuickRep},
  Funcoes in 'Funcoes.pas',
  ImpEtq_u in 'ImpEtq_u.pas' {ImpEtq_f},
  qrClientesSimples in 'qrClientesSimples.pas' {qrClientesSimples_f: TQuickRep},
  RodaScripts in 'RodaScripts.pas' {RodaScripts_f},
  Sobre_u in 'Sobre_u.pas' {Sobre_f},
  ImportaCli_u in 'ImportaCli_u.pas' {ImportaCli_f},
  EmiteCliente_u in 'EmiteCliente_u.pas' {EmiteCliente_f},
  CadOcorrencia_u in 'CadOcorrencia_u.pas' {CadOcorrencia_f},
  Ficha_u in 'Ficha_u.pas' {Ficha_f},
  AssociaClienteDoc in 'AssociaClienteDoc.pas' {AssociaClienteDoc_f},
  CadDepartamento_u in 'CadDepartamento_u.PAS' {CadDepartamento_f},
  CadDocumento_u in 'CadDocumento_u.PAS' {CadDocumento_f},
  GerenciaOcorrencia_u in 'GerenciaOcorrencia_u.pas' {GerenciaOcorrencia_f};

{$R *.RES}

begin
  Application.Initialize;
  frmSplash := TfrmSplash.Create(application);
  frmSplash.show;
  frmSplash.Update;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TLogOn_f, LogOn_f);
  Application.CreateForm(TdmPesq, dmPesq);
  Application.CreateForm(TdmFinanc, dmFinanc);
  frmSplash.Hide;
  frmSplash.Free;
  if fileexists(extractfilepath(application.ExeName) + 'Scripts_Atendimento.sql') then
  begin
    RodaScripts_f := TRodaScripts_f.Create(application);
    RodaScripts_f.Show;
    RodaScripts_f.RodaScript;
  end;
  Application.Run;
end.
