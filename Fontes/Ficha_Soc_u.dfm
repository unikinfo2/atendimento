?
 TFICHA_SOC_F 0?  TPF0?TFicha_Soc_fFicha_Soc_fLeft? Top? Height?CaptionCadastro de S?ciosOldCreateOrder	PixelsPerInch`
TextHeight ? TPanelPanel1Left Top WidthHeighthAlignalClientTabOrder  TLabelLabel1Left	TopWidth@HeightCaption
Nome/Raz?o  TLabelLabel2Left	Top1Width.HeightCaptionEndere?o  TLabelLabel3Left	Top\WidthHeightCaptionR.G.  TLabelLabel4Left? Top\Width4HeightCaptionCPF/CNPJ  TLabelLabel5Left?Top\WidthOHeightCaption?rg?o Expedidor  TLabelLabel6Left? Top? Width+HeightCaption	Profiss?o  TLabelLabel7Left?Top? Width?HeightCaption?rg?o Classe  TLabelLabel8Left	Top? Width[HeightCaptionValor Capital Social  TLabelLabel9Left? Top? WidthZHeightCaption% do Capital Social  TLabelLabel10LeftTop? WidthHeightCaptionT?tulo  TLabelLabel11Left?Top? WidthnHeightCaptionN?mero do Documento  TLabelLabel12LeftTop'WidthPHeightCaptionN?mero do INSS  TLabelLabel13Left? Top'WidthsHeightCaptionTempo de Filia??o INSS  TLabelLabel14Left?Top'WidthHHeightCaptionN?mero do PIS  TDBEditDBEdit1Left	TopWidthCHeight	DataField
NOME_RAZAO
DataSourcedsSocioTabOrder   TDBEditDBEdit2Left	Top@Width?Height	DataFieldENDERECO
DataSourcedsSocioTabOrder  TDBEditDBEdit3Left	TopkWidthyHeight	DataFieldRG
DataSourcedsSocioTabOrder  TDBEditDBEdit4Left?TopjWidthyHeight	DataFieldORGAO_EMISSOR
DataSourcedsSocioTabOrder  TDBEditDBEdit5Left? TopkWidthyHeight	DataFieldCPF_CNPJ
DataSourcedsSocioTabOrder  TDBEditDBEdit6Left? Top? WidthyHeight	DataField	PROFISSAO
DataSourcedsSocioTabOrder  TDBRadioGroupDBRadioGroup1Left
Top? WidthHeightDCaption Estado Civil Columns	DataFieldESTADO_CIVIL
DataSourcedsSocioItems.StringsSolteiroCasado
DivorciadoViuvoSeparado Judicialmente TabOrder
Values.StringsSCDVJ   TDBEditDBEdit7Left?Top? Width? Height	DataFieldORGAO_CLASSE
DataSourcedsSocioTabOrder  TRxDBCalcEditRxDBCalcEdit1Left	TopWidthyHeight	DataFieldVALOR_CAP_SOC
DataSourcedsSocioDisplayFormat,0.00	NumGlyphsTabOrder  TRxDBCalcEditRxDBCalcEdit2Left? TopWidthyHeight	DataFieldPORC_CAP_SOC
DataSourcedsSocio	NumGlyphsTabOrder  TDBEditDBEdit8LeftTop? WidthyHeight	DataFieldTITULO
DataSourcedsSocioTabOrder  TDBRadioGroupDBRadioGroup2Left)Top? WidthTHeight2Caption Sexo 	DataFieldSEXO
DataSourcedsSocioItems.Strings	MasculinoFeminino TabOrderValues.StringsMF   TDBEditDBEdit9Left?Top? Width? Height	DataFieldORGAO_NUMERO
DataSourcedsSocioTabOrder	  TDBCheckBoxDBCheckBox1Left\TopWidthYHeightCaptionProcurador ?	DataField
PROCURADOR
DataSourcedsSocioTabOrderValueCheckedSValueUncheckedN  TDBRadioGroupDBRadioGroup3Left,Top? Width? Height2Caption Posi??o do S?cio Columns	DataFieldSITUACAO_SOC
DataSourcedsSocioItems.StringsInclus?oExclus?o	Altera??oRemanescente TabOrderValues.StringsIEAR   TDBEditDBEdit10LeftTop5Width? Height	DataFieldNUM_INSS_SOC
DataSourcedsSocioTabOrder  TDBEditDBEdit11Left? Top5WidthzHeight	DataFieldTEMPO_INSS_SOC
DataSourcedsSocioTabOrder  TDBEditDBEdit12Left?Top5WidthzHeight	DataFieldNUM_PIS_SOC
DataSourcedsSocioTabOrder  TDBCheckBoxDBCheckBox2LeftTopTWidth? HeightCaptionContribui atualmente com o INSS	DataFieldCONTRIB_ATU_INSS
DataSourcedsSocioTabOrderValueCheckedSValueUncheckedN   ?TPanelPanel2Left TophWidthHeight&AlignalBottomTabOrder TBitBtnBitBtn2Left? TopWidthUHeightCaption&GravaTabOrder OnClickBitBtn2Click
Glyph.Data
z  v  BMv      v   (                                    ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 3333 pw 3333wwww3333 ?? 3333w?3w3333 ?? 3333w??w3333    ????wwww        wwwwwwww??????333337???????????? ?̜?w7swwww????9?3?????w?  ?𙙓ww77ww???????????www ?  9?3w7ww7w????9?3???s7w???3y?3w7??ww3?????3??swws3   33333www33333	NumGlyphs   ?	TMainMenusubmenuLeft8Topt  ?TRxCalculatorCalculator1Left4TopD  TQueryqrySocioDatabaseNamedbRequestLive	SQL.StringsRSELECT * FROM GC_FICHA_SOC WHERE COD_FICHA = :COD_FICHA AND COD_SOCIO = :COD_SOCIO Left|Toph	ParamDataDataTypeftStringName	COD_FICHA	ParamType	ptUnknown DataTypeftStringName	COD_SOCIO	ParamType	ptUnknown    TDataSourcedsSocioAutoEditDataSetqrySocioLeft? Topl   