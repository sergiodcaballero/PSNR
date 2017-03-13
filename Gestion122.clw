

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION122.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
IMPRIMIR_COBRO_GTO_ADM PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:LETRAS           STRING(100)                           ! 
Process:View         VIEW(PAGOS_LIQUIDACION)
                       PROJECT(PAGL:FECHA)
                       PROJECT(PAGL:GASTOS_ADM)
                       PROJECT(PAGL:IDPAGOS)
                       PROJECT(PAGL:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,PAGL:IDSOCIO)
                         PROJECT(SOC:CUIT)
                         PROJECT(SOC:DIRECCION)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:TIPOIVA)
                         JOIN(TIP7:PK_TIPO_IVA,SOC:TIPOIVA)
                           PROJECT(TIP7:DECRIPCION)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(16,5,182,278),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  MM
detail                 DETAIL,AT(0,0,,279),USE(?unnamed:4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI)
                         STRING('Fecha:'),AT(127,18),USE(?String22),FONT(,12),TRN
                         STRING(@d17),AT(141,18),USE(PAGL:FECHA,,?PAGL:FECHA:2),FONT(,12),RIGHT(1)
                         STRING('Señor/es:'),AT(1,44),USE(?String14),TRN
                         STRING(@s30),AT(23,44,60,6),USE(SOC:NOMBRE)
                         STRING('Domicilio:'),AT(1,49),USE(?String16),TRN
                         STRING(@s100),AT(24,49,64,6),USE(SOC:DIRECCION)
                         STRING('Cuotas:'),AT(24,67),USE(?String18),TRN
                         TEXT,AT(39,67,140,29),USE(GLO:GTO_ADM),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                         STRING('Fecha:'),AT(121,159),USE(?String37),FONT(,12),TRN
                         STRING(@d17),AT(137,159),USE(PAGL:FECHA),FONT(,12)
                         STRING('Señor/es:'),AT(1,182),USE(?String26),TRN
                         STRING(@s30),AT(20,182,71,6),USE(SOC:NOMBRE,,?SOC:NOMBRE:2)
                         STRING('Domicilio:'),AT(1,187),USE(?String27),TRN
                         STRING(@s100),AT(23,187,68,6),USE(SOC:DIRECCION,,?SOC:DIRECCION:2)
                         STRING('Cuotas:'),AT(27,209,8),USE(?String30),TRN
                         TEXT,AT(40,209,137,23),USE(GLO:GTO_ADM,,?GLO:GTO_ADM:2),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                         STRING('SON $:'),AT(121,260),USE(?String25),FONT(,12),TRN
                         STRING('Res Carg.'),AT(1,268),USE(?String36),FONT(,8),TRN
                         STRING(@P###-P),AT(14,268),USE(GLO:SUCURSAL),FONT(,8),RIGHT(1)
                         STRING(@n-14),AT(23,268),USE(GLO:RECIBO),FONT(,8),RIGHT(1)
                         STRING(@n$-10.2),AT(137,261),USE(PAGL:GASTOS_ADM,,?PAGL:GASTOS_ADM:4)
                         STRING('SON $:'),AT(127,119),USE(?String19),FONT(,12),TRN
                         STRING(@n$-10.2),AT(144,119),USE(PAGL:GASTOS_ADM,,?PAGL:GASTOS_ADM:2)
                         STRING('CUIT:'),AT(96,44),USE(?STRING1)
                         STRING('IVA:<0DH,0AH>'),AT(96,49),USE(?STRING2)
                         STRING(@s30),AT(108,49),USE(TIP7:DECRIPCION)
                         STRING(@P##-########-#P),AT(108,44),USE(SOC:CUIT)
                         STRING('CUIT:'),AT(109,183),USE(?STRING3)
                         STRING('IVA:<0DH,0AH>'),AT(109,187),USE(?STRING4)
                         STRING(@P##-########-#P),AT(123,183),USE(SOC:CUIT,,?SOC:CUIT:2)
                         STRING(@s30),AT(123,187,56),USE(TIP7:DECRIPCION,,?TIP7:DECRIPCION:2)
                       END
                       FORM,AT(16,5,182,278),USE(?unnamed:3)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_COBRO_GTO_ADM')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PAGOS_LIQUIDACION.Open                            ! File PAGOS_LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_COBRO_GTO_ADM',ProgressWindow)    ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:PAGOS_LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, PAGL:IDPAGOS)
  ThisReport.AddSortOrder(PAGL:PK_PAGOS_LIQUIDACION)
  ThisReport.AddRange(PAGL:IDPAGOS,GLO:PAGO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PAGOS_LIQUIDACION.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PAGOS_LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_COBRO_GTO_ADM',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:FECHA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:FECHA:2,RepGen:XML,TargetAttr:TagName,'PAGL:FECHA:2')
  SELF.Attribute.Set(?PAGL:FECHA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:GTO_ADM,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:GTO_ADM,RepGen:XML,TargetAttr:TagName,'GLO:GTO_ADM')
  SELF.Attribute.Set(?GLO:GTO_ADM,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagName,'PAGL:FECHA')
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION:2')
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:GTO_ADM:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:GTO_ADM:2,RepGen:XML,TargetAttr:TagName,'GLO:GTO_ADM:2')
  SELF.Attribute.Set(?GLO:GTO_ADM:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:SUCURSAL,RepGen:XML,TargetAttr:TagName,'GLO:SUCURSAL')
  SELF.Attribute.Set(?GLO:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:RECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:RECIBO,RepGen:XML,TargetAttr:TagName,'GLO:RECIBO')
  SELF.Attribute.Set(?GLO:RECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:GASTOS_ADM:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:GASTOS_ADM:4,RepGen:XML,TargetAttr:TagName,'PAGL:GASTOS_ADM:4')
  SELF.Attribute.Set(?PAGL:GASTOS_ADM:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:GASTOS_ADM:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:GASTOS_ADM:2,RepGen:XML,TargetAttr:TagName,'PAGL:GASTOS_ADM:2')
  SELF.Attribute.Set(?PAGL:GASTOS_ADM:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagName,'STRING1')
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagName,'STRING2')
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION')
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagName,'SOC:CUIT')
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagName,'STRING3')
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagName,'STRING4')
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagName,'SOC:CUIT:2')
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION:2')
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:LETRAS =PKSNumTexto(PAGL:GASTOS_ADM)
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_PAGO','IMPRIMIR_PAGO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

