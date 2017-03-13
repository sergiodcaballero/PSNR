

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION013.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION014.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
IMPRIMIR_COBRO_SEGURO_LIQ PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:LETRAS           STRING(100)                           ! 
Process:View         VIEW(PAGOS_LIQUIDACION)
                       PROJECT(PAGL:FECHA)
                       PROJECT(PAGL:IDPAGOS)
                       PROJECT(PAGL:IDRECIBO)
                       PROJECT(PAGL:SEGURO)
                       PROJECT(PAGL:SUCURSAL)
                       PROJECT(PAGL:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,PAGL:IDSOCIO)
                         PROJECT(SOC:DIRECCION)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
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
detail                 DETAIL,AT(,,,279),USE(?unnamed:4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI)
                         STRING(' COMPROBANTE  SEGURO '),AT(58,4),USE(?String38),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         STRING(' - NO VALIDO COMO FACTURA -'),AT(63,11),USE(?String39),TRN
                         STRING('Fecha:'),AT(127,21),USE(?String22),FONT(,12),TRN
                         STRING(@d17),AT(141,21),USE(PAGL:FECHA,,?PAGL:FECHA:2),FONT(,12),RIGHT(1)
                         STRING('Señor/es:'),AT(1,44),USE(?String14),TRN
                         STRING('Matrícula:'),AT(137,52),USE(?String9),TRN
                         STRING(@s30),AT(23,44,94,6),USE(SOC:NOMBRE)
                         STRING(@n-14),AT(153,52),USE(SOC:MATRICULA)
                         STRING('La suma de:'),AT(1,63),USE(?String17),TRN
                         STRING(@n-10.2),AT(23,63),USE(PAGL:SEGURO)
                         STRING('Domicilio:'),AT(1,52),USE(?String16),TRN
                         STRING(@s100),AT(24,52,96,6),USE(SOC:DIRECCION)
                         STRING('--'),AT(44,63),USE(?String34),TRN
                         STRING(' Cuotas Seguro:'),AT(1,76,29,5),USE(?String18),TRN
                         TEXT,AT(39,76,140,29),USE(GLO:CARGA_sTRING),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                         STRING(@s100),AT(49,63,127,6),USE(LOC:LETRAS),TRN
                         STRING('Aclaración:.{86}'),AT(73,126),USE(?String21),TRN
                         STRING('Fecha:'),AT(121,163),USE(?String37),FONT(,12),TRN
                         STRING(@d17),AT(137,163),USE(PAGL:FECHA),FONT(,12)
                         STRING('Señor/es:'),AT(1,182),USE(?String26),TRN
                         STRING(@s30),AT(20,182,115,6),USE(SOC:NOMBRE,,?SOC:NOMBRE:2)
                         STRING('Domicilio:'),AT(1,190),USE(?String27),TRN
                         STRING(@s100),AT(23,190,88,6),USE(SOC:DIRECCION,,?SOC:DIRECCION:2)
                         STRING('Matrícula:'),AT(125,190),USE(?String28),TRN
                         STRING(@n-14),AT(141,190),USE(SOC:MATRICULA,,?SOC:MATRICULA:2)
                         STRING('--'),AT(45,213),USE(?String35),TRN
                         STRING('La suma de: '),AT(1,213),USE(?String29),TRN
                         STRING(@n-10.2),AT(22,213),USE(PAGL:SEGURO,,?PAGL:SEGURO:3)
                         STRING(@s100),AT(51,213,117,6),USE(LOC:LETRAS,,?LOC:LETRAS:2)
                         STRING('Cuotas Seguro:'),AT(1,228),USE(?String30),TRN
                         TEXT,AT(40,228,140,23),USE(GLO:CARGA_sTRING,,?GLO:CARGA_sTRING:2),FONT('Arial',8,,FONT:regular, |
  CHARSET:ANSI)
                         STRING('SON $:'),AT(6,260),USE(?String25),FONT(,12),TRN
                         STRING('Firma:.{92}'),AT(74,256),USE(?String23),TRN
                         STRING('Aclaración:.{86}'),AT(73,265),USE(?String24),TRN
                         STRING('Res Carg.'),AT(1,268),USE(?String36),FONT(,8),TRN
                         STRING(@P####-P),AT(14,268),USE(PAGL:SUCURSAL),FONT(,8),RIGHT(1)
                         STRING(@n-14),AT(23,268),USE(PAGL:IDRECIBO),FONT(,8),RIGHT(1)
                         STRING(@n-10.2),AT(22,260),USE(PAGL:SEGURO,,?PAGL:SEGURO:4)
                         STRING('Firma:.{92}'),AT(74,117),USE(?String20),TRN
                         STRING('SON $:'),AT(1,120),USE(?String19),FONT(,12),TRN
                         STRING(@n-10.2),AT(18,120),USE(PAGL:SEGURO,,?PAGL:SEGURO:2)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_COBRO_SEGURO_LIQ')
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
  INIMgr.Fetch('IMPRIMIR_COBRO_SEGURO_LIQ',ProgressWindow) ! Restore window settings from non-volatile store
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
    INIMgr.Update('IMPRIMIR_COBRO_SEGURO_LIQ',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:FECHA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:FECHA:2,RepGen:XML,TargetAttr:TagName,'PAGL:FECHA:2')
  SELF.Attribute.Set(?PAGL:FECHA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagName,'PAGL:SEGURO')
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagName,'GLO:CARGA_sTRING')
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagName,'LOC:LETRAS')
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA:2')
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SEGURO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SEGURO:3,RepGen:XML,TargetAttr:TagName,'PAGL:SEGURO:3')
  SELF.Attribute.Set(?PAGL:SEGURO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagName,'LOC:LETRAS:2')
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CARGA_sTRING:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CARGA_sTRING:2,RepGen:XML,TargetAttr:TagName,'GLO:CARGA_sTRING:2')
  SELF.Attribute.Set(?GLO:CARGA_sTRING:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SUCURSAL,RepGen:XML,TargetAttr:TagName,'PAGL:SUCURSAL')
  SELF.Attribute.Set(?PAGL:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:IDRECIBO,RepGen:XML,TargetAttr:TagName,'PAGL:IDRECIBO')
  SELF.Attribute.Set(?PAGL:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SEGURO:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SEGURO:4,RepGen:XML,TargetAttr:TagName,'PAGL:SEGURO:4')
  SELF.Attribute.Set(?PAGL:SEGURO:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SEGURO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SEGURO:2,RepGen:XML,TargetAttr:TagName,'PAGL:SEGURO:2')
  SELF.Attribute.Set(?PAGL:SEGURO:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:LETRAS =PKSNumTexto(PAGL:SEGURO)
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

!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
IMPRIMIR_COBRO_CUOTA_LIQ PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:LETRAS           STRING(100)                           ! 
LOC:MONTO            REAL                                  ! 
Process:View         VIEW(PAGOS_LIQUIDACION)
                       PROJECT(PAGL:FECHA)
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
                         STRING('Fecha:'),AT(127,17),USE(?String22),FONT(,12),TRN
                         STRING(@d17),AT(141,17),USE(PAGL:FECHA,,?PAGL:FECHA:2),FONT(,12),RIGHT(1)
                         STRING('Señor/es:'),AT(1,44),USE(?String14),TRN
                         STRING(@s30),AT(23,44,62,6),USE(SOC:NOMBRE)
                         STRING('Domicilio:'),AT(1,52),USE(?String16),TRN
                         STRING(@s100),AT(24,52,77,6),USE(SOC:DIRECCION)
                         STRING(' Cuotas:'),AT(24,70),USE(?String18),TRN
                         TEXT,AT(39,70,140,29),USE(GLO:DETALLE_RECIBO),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                         STRING('Fecha:'),AT(121,163),USE(?String37),FONT(,12),TRN
                         STRING(@d17),AT(137,163),USE(PAGL:FECHA),FONT(,12)
                         STRING('Señor/es:'),AT(1,182),USE(?String26),TRN
                         STRING(@s30),AT(20,182,65,6),USE(SOC:NOMBRE,,?SOC:NOMBRE:2)
                         STRING('Domicilio:'),AT(1,188),USE(?String27),TRN
                         STRING(@s100),AT(23,187,58,6),USE(SOC:DIRECCION,,?SOC:DIRECCION:2)
                         STRING('<0DH,0AH>Cuotas:'),AT(25,211),USE(?String30),TRN
                         TEXT,AT(40,211,140,23),USE(GLO:DETALLE_RECIBO,,?GLO:DETALLE_RECIBO:2),FONT('Arial',8,,FONT:regular, |
  CHARSET:ANSI)
                         STRING('SON $:'),AT(127,259),USE(?String25),FONT(,12),TRN
                         STRING('Res Carg.'),AT(1,268),USE(?String36),FONT(,8),TRN
                         STRING(@P###-P),AT(14,268),USE(GLO:SUCURSAL),FONT(,8),RIGHT(1)
                         STRING(@n-14),AT(23,268),USE(GLO:RECIBO),FONT(,8),RIGHT(1)
                         STRING(@n$-10.2),AT(143,259),USE(LOC:MONTO,,?LOC:MONTO:4)
                         STRING('SON $:'),AT(126,118),USE(?String19),FONT(,12),TRN
                         STRING(@n$-10.2),AT(143,119),USE(LOC:MONTO,,?LOC:MONTO:2)
                         STRING('CUIT:<0DH,0AH>'),AT(109,44),USE(?STRING1)
                         STRING('IVA:<0DH,0AH>'),AT(109,53),USE(?STRING2)
                         STRING(@P##-########-#P),AT(122,44),USE(SOC:CUIT)
                         STRING(@s30),AT(122,53),USE(TIP7:DECRIPCION)
                         STRING('CUIT:<0DH,0AH>'),AT(92,182),USE(?STRING3)
                         STRING('IVA:'),AT(92,188),USE(?STRING4)
                         STRING(@P##-########-#P),AT(102,182),USE(SOC:CUIT,,?SOC:CUIT:2)
                         STRING(@s30),AT(102,188),USE(TIP7:DECRIPCION,,?TIP7:DECRIPCION:2)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_COBRO_CUOTA_LIQ')
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
  INIMgr.Fetch('IMPRIMIR_COBRO_CUOTA_LIQ',ProgressWindow)  ! Restore window settings from non-volatile store
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
    INIMgr.Update('IMPRIMIR_COBRO_CUOTA_LIQ',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO,RepGen:XML,TargetAttr:TagName,'GLO:DETALLE_RECIBO')
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO:2,RepGen:XML,TargetAttr:TagName,'GLO:DETALLE_RECIBO:2')
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.Attribute.Set(?LOC:MONTO:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:MONTO:4,RepGen:XML,TargetAttr:TagName,'LOC:MONTO:4')
  SELF.Attribute.Set(?LOC:MONTO:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:MONTO:2,RepGen:XML,TargetAttr:TagName,'LOC:MONTO:2')
  SELF.Attribute.Set(?LOC:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagName,'STRING1')
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagName,'STRING2')
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagName,'SOC:CUIT')
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION')
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  LOC:MONTO = PAGL:CUOTA + PAGL:GASTOS_ADM
  LOC:LETRAS =PKSNumTexto(LOC:MONTO)
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

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Cargar_Recibo PROCEDURE 

Window               WINDOW('Cargar Recibo'),AT(,,171,62),FONT('MS Sans Serif',8,,FONT:regular),GRAY
                       ENTRY(@P###-P),AT(47,5,22,10),USE(GLO:SUCURSAL),RIGHT(1)
                       ENTRY(@n-14),AT(75,4,60,10),USE(GLO:RECIBO),RIGHT(1)
                       BUTTON('&Aceptar'),AT(33,31,77,19),USE(?OkButton),LEFT,ICON(ICON:Tick),DEFAULT,FLAT
                       PROMPT('ID  RECIBO:'),AT(4,5),USE(?GLO:RECIBO:Prompt)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('Cargar_Recibo')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:SUCURSAL
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Cargar_Recibo',Window)                     ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INGRESOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cargar_Recibo',Window)                  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?OkButton
      !!!! controla que no exista el recibo
      ING:SUCURSAL = GLO:SUCURSAL
      ING:IDRECIBO =  GLO:RECIBO
      get(ingresos,ING:IDX_INGRESOS_UNIQUE)
      if not errorcode() = 35 then
         message('El Recibo ya existe, Verifique')
         select(?GLO:RECIBO)
         cycle
      End
      !thiswindow.close()
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a SUBCUENTAS Record
!!! </summary>
SelectSUBCUENTAS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SUBCUENTAS)
                       PROJECT(SUB:DESCRIPCION)
                       PROJECT(SUB:IDSUBCUENTA)
                       PROJECT(SUB:IDCUENTA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SUB:DESCRIPCION        LIKE(SUB:DESCRIPCION)          !List box control field - type derived from field
SUB:IDSUBCUENTA        LIKE(SUB:IDSUBCUENTA)          !List box control field - type derived from field
SUB:IDCUENTA           LIKE(SUB:IDCUENTA)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a SUBCUENTAS Record'),AT(,,236,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectSUBCUENTAS'),SYSTEM
                       LIST,AT(8,30,220,124),USE(?Browse:1),HVSCROLL,FORMAT('163L(2)|M~DESCRIPCION~@s50@64L(2)' & |
  '|M~IDSUBCUENTA~C(0)@n-5@56L(2)|M~IDCUENTA~C(0)@n-5@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de SUBCUENTAS')
                       BUTTON('&Elegir'),AT(179,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,228,172),USE(?CurrentTab)
                         TAB('CUENTA'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(183,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('SelectSUBCUENTAS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SUB:IDSUBCUENTA',SUB:IDSUBCUENTA)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SUBCUENTAS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SUB:INTEG_113)                        ! Add the sort order for SUB:INTEG_113 for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,SUB:IDSUBCUENTA,,BRW1)         ! Initialize the browse locator using  using key: SUB:INTEG_113 , SUB:IDSUBCUENTA
  BRW1.SetFilter('(SUB:IDCUENTA = 10)')                    ! Apply filter expression to browse
  BRW1.AddField(SUB:DESCRIPCION,BRW1.Q.SUB:DESCRIPCION)    ! Field SUB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDSUBCUENTA,BRW1.Q.SUB:IDSUBCUENTA)    ! Field SUB:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDCUENTA,BRW1.Q.SUB:IDCUENTA)          ! Field SUB:IDCUENTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSUBCUENTAS',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectSUBCUENTAS',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PAGOS_LIQUIDACION File
!!! </summary>
Pagos_Liquidacion PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PAGOS_LIQUIDACION)
                       PROJECT(PAGL:IDPAGOS)
                       PROJECT(PAGL:IDSOCIO)
                       PROJECT(PAGL:FECHA)
                       PROJECT(PAGL:SOCIOS_LIQUIDACION)
                       PROJECT(PAGL:MONTO_FACTURA)
                       PROJECT(PAGL:MONTO)
                       PROJECT(PAGL:DEBITO)
                       PROJECT(PAGL:CUOTA)
                       PROJECT(PAGL:SEGURO)
                       PROJECT(PAGL:GASTOS_ADM)
                       PROJECT(PAGL:MONTO_IMP_CHEQUE)
                       JOIN(SOC:PK_SOCIOS,PAGL:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAGL:IDPAGOS           LIKE(PAGL:IDPAGOS)             !List box control field - type derived from field
PAGL:IDSOCIO           LIKE(PAGL:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAGL:FECHA             LIKE(PAGL:FECHA)               !List box control field - type derived from field
PAGL:SOCIOS_LIQUIDACION LIKE(PAGL:SOCIOS_LIQUIDACION) !List box control field - type derived from field
PAGL:MONTO_FACTURA     LIKE(PAGL:MONTO_FACTURA)       !List box control field - type derived from field
PAGL:MONTO             LIKE(PAGL:MONTO)               !List box control field - type derived from field
PAGL:DEBITO            LIKE(PAGL:DEBITO)              !List box control field - type derived from field
PAGL:CUOTA             LIKE(PAGL:CUOTA)               !List box control field - type derived from field
PAGL:SEGURO            LIKE(PAGL:SEGURO)              !List box control field - type derived from field
PAGL:GASTOS_ADM        LIKE(PAGL:GASTOS_ADM)          !List box control field - type derived from field
PAGL:MONTO_IMP_CHEQUE  LIKE(PAGL:MONTO_IMP_CHEQUE)    !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(LIQUIDACION)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:IDPAGO_LIQUIDACION)
                       PROJECT(LIQ:IDOS)
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMBRE)
                         PROJECT(OBR:IDOS)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
LIQ:IDLIQUIDACION      LIKE(LIQ:IDLIQUIDACION)        !List box control field - type derived from field
LIQ:MES                LIKE(LIQ:MES)                  !List box control field - type derived from field
LIQ:ANO                LIKE(LIQ:ANO)                  !List box control field - type derived from field
OBR:NOMBRE             LIKE(OBR:NOMBRE)               !List box control field - type derived from field
LIQ:IDPAGO_LIQUIDACION LIKE(LIQ:IDPAGO_LIQUIDACION)   !List box control field - type derived from field
OBR:IDOS               LIKE(OBR:IDOS)                 !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Cargar Pagos Liquidación de Obras Sociales'),AT(,,367,288),FONT('Arial',8,COLOR:Black, |
  FONT:bold),RESIZE,CENTER,GRAY,IMM,MDI,HLP('Pagos_Liquidacion'),SYSTEM
                       BUTTON('&Filtro'),AT(95,158,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       LIST,AT(8,37,342,118),USE(?Browse:1),HVSCROLL,FORMAT('33L(2)|M~ID~C(0)@n-7@34L(2)|M~IDS' & |
  'OCIO~C(0)@n-5@120L(2)|M~NOMBRE~C(0)@s30@53R(2)|M~FECHA~C(0)@d17@56R(2)|M~SOCIOS LIQU' & |
  'IDACION~C(0)@n-14@[46D(1)|M~MONTO LIQ~C(0)@n-7.2@76L(1)|M~MONTO PAGADO~C(0)@n$-10.2@' & |
  '40L(1)|M~DEBITO~C(0)@n$-10.2@40L(1)|M~CUOTA~C(0)@n$-10.2@40L(1)|M~SEGURO~C(0)@n$-10.' & |
  '2@40L(1)|M~GASTOS ADM~C(0)@n$-10.2@40L(1)|M~MONTO IMP CHEQUE~C(0)@n$-10.2@]|M~DETALLE~'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de PAGOS_LIQUIDACION'),VCR
                       BUTTON('&Ver'),AT(220,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Cargar un Pago'),AT(281,158,71,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       GROUP('Liquidaciones Pagadas '),AT(7,174,350,86),USE(?Group1),BOXED
                         LIST,AT(11,187,341,69),USE(?List),HVSCROLL,FORMAT('28L|M~ID~L(2)@n-7@21L|M~MES~L(2)@n-3' & |
  '@23L|M~ANO~L(2)@n-5@400L|M~OBRA SOCIAL~L(2)@s100@56L|M~IDPAGO LIQUIDACION~L(2)@n-5@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records'),VCR
                       END
                       SHEET,AT(3,4,361,262),USE(?CurrentTab)
                         TAB('Id'),USE(?Tab:2)
                         END
                         TAB('Socio'),USE(?Tab2)
                           PROMPT('IDSOCIO:'),AT(10,24),USE(?PAGL:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(40,24,60,10),USE(PAGL:IDSOCIO),RIGHT(1)
                         END
                       END
                       BUTTON('E&xportar'),AT(156,158,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Salir'),AT(312,269,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('Re Imprimir Liq.'),AT(9,158,74,14),USE(?Button6),LEFT,ICON(ICON:Print1),FLAT
                     END

Loc::QHlist9 QUEUE,PRE(QHL9)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar9 QUEUE,PRE(Q9)
FieldPar                 CSTRING(800)
                         END
QPar29 QUEUE,PRE(Qp29)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado9          STRING(100)
Loc::Titulo9          STRING(100)
SavPath9          STRING(2000)
Evo::Group9  GROUP,PRE()
Evo::Procedure9          STRING(100)
Evo::App9          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_9  SHORT
Gol_woI_9 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_9),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_9),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_9),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_9),TRN
       END
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
PrintExBrowse9 ROUTINE

 OPEN(Gol_woI_9)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_9 = BRW1.FileLoaded
 IF Not  EC::LoadI_9
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_9)
 SETCURSOR()
  Evo::App9          = 'Gestion'
  Evo::Procedure9          = GlobalErrors.GetProcedureName()& 9
 
  FREE(QPar9)
  Q9:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,'
  ADD(QPar9)  !!1
  Q9:FieldPar  = ';'
  ADD(QPar9)  !!2
  Q9:FieldPar  = 'Spanish'
  ADD(QPar9)  !!3
  Q9:FieldPar  = ''
  ADD(QPar9)  !!4
  Q9:FieldPar  = true
  ADD(QPar9)  !!5
  Q9:FieldPar  = ''
  ADD(QPar9)  !!6
  Q9:FieldPar  = true
  ADD(QPar9)  !!7
 !!!! Exportaciones
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'EXCEL|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'WORD|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'PRT|'
  ADD(QPar9)  !!8
  Q9:FieldPar  = 'All'
  ADD(QPar9)   !.9.
  Q9:FieldPar  = ' 0'
  ADD(QPar9)   !.10
  Q9:FieldPar  = 0
  ADD(QPar9)   !.11
  Q9:FieldPar  = '1'
  ADD(QPar9)   !.12
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.13
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.14
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.15
 
   Q9:FieldPar  = '16'
  ADD(QPar9)   !.16
 
   Q9:FieldPar  = 1
  ADD(QPar9)   !.17
   Q9:FieldPar  = 2
  ADD(QPar9)   !.18
   Q9:FieldPar  = '2'
  ADD(QPar9)   !.19
   Q9:FieldPar  = 12
  ADD(QPar9)   !.20
 
   Q9:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar9)   !.21
 
   Q9:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar9)   !.22
 
   CLEAR(Q9:FieldPar)
  ADD(QPar9)   ! 23 Caracteres Encoding para xml
 
  Q9:FieldPar  = '0'
  ADD(QPar9)   ! 24 Use Open Office
 
   Q9:FieldPar  = 'golmedo'
  ADD(QPar9) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q9:FieldPar  = ' BrowseExport'
  ADD(QPar9)   ! 26  BrowseExport
  Q9:FieldPar  = ' '
  ADD(QPar9)   ! 27  
  Q9:FieldPar  = ' ' 
  ADD(QPar9)   ! 28  
  Q9:FieldPar  = 'BEXPORT' 
  ADD(QPar9)   ! 29 Gestion013.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = 'ID'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDSOCIO'
  Qp29:F2P  = '@n-5'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'NOMBRE'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'SOCIOS LIQUIDACION'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO LIQ'
  Qp29:F2P  = '@n-7.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO PAGADO'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DEBITO'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CUOTA'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'SEGURO'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'GASTOS ADM'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO IMP CHEQUE'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
  SysRec# = false
  FREE(Loc::QHlist9)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar29,SysRec#)
         QHL9:Id      = SysRec#
         QHL9:Nombre  = Qp29:F2N
         QHL9:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL9:Pict    = Qp29:F2P
         QHL9:Tot    = Qp29:F2T
         ADD(Loc::QHlist9)
      Else
        break
     END
  END
  Loc::Titulo9 ='Informe de Pagos de Liquidación'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,1,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Pagos_Liquidacion')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Query
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PAGL:IDPAGOS',PAGL:IDPAGOS)                        ! Added by: BrowseBox(ABC)
  BIND('PAGL:MONTO_FACTURA',PAGL:MONTO_FACTURA)            ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS_LIQUIDACION.Open                            ! File PAGOS_LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGOS_LIQUIDACION,SELF) ! Initialize the browse manager
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:LIQUIDACION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'Pagos_Liquidacion', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAGL:FK_PAGOS_LIQUIDACION_SOCIOS)     ! Add the sort order for PAGL:FK_PAGOS_LIQUIDACION_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?PAGL:IDSOCIO,PAGL:IDSOCIO,,BRW1) ! Initialize the browse locator using ?PAGL:IDSOCIO using key: PAGL:FK_PAGOS_LIQUIDACION_SOCIOS , PAGL:IDSOCIO
  BRW1.AddSortOrder(,PAGL:PK_PAGOS_LIQUIDACION)            ! Add the sort order for PAGL:PK_PAGOS_LIQUIDACION for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,PAGL:IDPAGOS,,BRW1)            ! Initialize the browse locator using  using key: PAGL:PK_PAGOS_LIQUIDACION , PAGL:IDPAGOS
  BRW1.AddField(PAGL:IDPAGOS,BRW1.Q.PAGL:IDPAGOS)          ! Field PAGL:IDPAGOS is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:IDSOCIO,BRW1.Q.PAGL:IDSOCIO)          ! Field PAGL:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:FECHA,BRW1.Q.PAGL:FECHA)              ! Field PAGL:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:SOCIOS_LIQUIDACION,BRW1.Q.PAGL:SOCIOS_LIQUIDACION) ! Field PAGL:SOCIOS_LIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:MONTO_FACTURA,BRW1.Q.PAGL:MONTO_FACTURA) ! Field PAGL:MONTO_FACTURA is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:MONTO,BRW1.Q.PAGL:MONTO)              ! Field PAGL:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:DEBITO,BRW1.Q.PAGL:DEBITO)            ! Field PAGL:DEBITO is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:CUOTA,BRW1.Q.PAGL:CUOTA)              ! Field PAGL:CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:SEGURO,BRW1.Q.PAGL:SEGURO)            ! Field PAGL:SEGURO is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:GASTOS_ADM,BRW1.Q.PAGL:GASTOS_ADM)    ! Field PAGL:GASTOS_ADM is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:MONTO_IMP_CHEQUE,BRW1.Q.PAGL:MONTO_IMP_CHEQUE) ! Field PAGL:MONTO_IMP_CHEQUE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse
  BRW7.RetainRow = 0
  BRW7.AddSortOrder(,LIQ:IDX_LIQUIDACION_PAGO)             ! Add the sort order for LIQ:IDX_LIQUIDACION_PAGO for sort order 1
  BRW7.AddRange(LIQ:IDPAGO_LIQUIDACION,Relate:LIQUIDACION,Relate:PAGOS_LIQUIDACION) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,LIQ:IDPAGO_LIQUIDACION,1,BRW7) ! Initialize the browse locator using  using key: LIQ:IDX_LIQUIDACION_PAGO , LIQ:IDPAGO_LIQUIDACION
  BRW7.AppendOrder('liq:IDLIQUIDACION')                    ! Append an additional sort order
  BRW7.AddField(LIQ:IDLIQUIDACION,BRW7.Q.LIQ:IDLIQUIDACION) ! Field LIQ:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW7.AddField(LIQ:MES,BRW7.Q.LIQ:MES)                    ! Field LIQ:MES is a hot field or requires assignment from browse
  BRW7.AddField(LIQ:ANO,BRW7.Q.LIQ:ANO)                    ! Field LIQ:ANO is a hot field or requires assignment from browse
  BRW7.AddField(OBR:NOMBRE,BRW7.Q.OBR:NOMBRE)              ! Field OBR:NOMBRE is a hot field or requires assignment from browse
  BRW7.AddField(LIQ:IDPAGO_LIQUIDACION,BRW7.Q.LIQ:IDPAGO_LIQUIDACION) ! Field LIQ:IDPAGO_LIQUIDACION is a hot field or requires assignment from browse
  BRW7.AddField(OBR:IDOS,BRW7.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Pagos_Liquidacion',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_PAGOS_LIQUIDACION
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
    Relate:PAGOS_LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('Pagos_Liquidacion',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Formulario_PAGOS_LIQUIDACION
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?Button6
      GLO:PAGO = PAGL:IDPAGOS
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
    OF ?Button6
      ThisWindow.Update()
      IMPRIMIR_PAGO_LIQUIDACION()
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion LIQUIDACION
!!! </summary>
LIQUIDACION_PAGO_FORM PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::LIQ:Record  LIKE(LIQ:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion LIQUIDACION'),AT(,,245,210),FONT('Arial',8,,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('LIQUIDACION_COBRO_FORM'),SYSTEM
                       PROMPT('IDLIQUIDACION:'),AT(5,7),USE(?LIQ:IDLIQUIDACION:Prompt),TRN
                       ENTRY(@n-7),AT(68,7,40,10),USE(LIQ:IDLIQUIDACION),LEFT,DISABLE,REQ
                       PROMPT('IDSOCIO:'),AT(5,21),USE(?LIQ:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(68,21,41,10),USE(LIQ:IDSOCIO),DISABLE
                       STRING(@s30),AT(117,20),USE(SOC:NOMBRE)
                       PROMPT('IDOS:'),AT(5,35),USE(?LIQ:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(68,35,42,10),USE(LIQ:IDOS),DISABLE
                       STRING(@s30),AT(116,36),USE(OBR:NOMPRE_CORTO)
                       PROMPT('MES:'),AT(5,49),USE(?LIQ:MES:Prompt),TRN
                       SPIN(@n-14),AT(68,49,41,10),USE(LIQ:MES),DISABLE,RANGE(1,12)
                       PROMPT('ANO:'),AT(119,53),USE(?LIQ:ANO:Prompt),TRN
                       SPIN(@n-14),AT(139,51,41,10),USE(LIQ:ANO),DISABLE,RANGE(2009,2999)
                       LINE,AT(0,66,249,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('Monto Presentado a Cobro:'),AT(2,71),USE(?Prompt18)
                       STRING(@n$-12.2),AT(98,70),USE(LIQ:MONTO)
                       STRING(@n$-12.2),AT(86,122),USE(LIQ:MONTO_PAGADO,,?LIQ:MONTO_PAGADO:2)
                       PROMPT('Débito de la OS.:'),AT(2,86),USE(?LIQ:DEBITO:Prompt),TRN
                       ENTRY(@n$-10.2),AT(99,85,44,10),USE(LIQ:DEBITO),DECIMAL(14),DISABLE
                       STRING('Monto debito pago Cuotas:'),AT(3,103),USE(?String10)
                       STRING(@n$-10.2),AT(97,102),USE(LIQ:DEBITO_PAGO_CUOTAS,,?LIQ:DEBITO_PAGO_CUOTAS:2)
                       STRING(@n10.2),AT(205,139),USE(LIQ:COMISION,,?LIQ:COMISION:2)
                       STRING(@n$-10.2),AT(86,140),USE(LIQ:DEBITO_COMISION)
                       PROMPT('Débito por Comisión:'),AT(0,142),USE(?Prompt16)
                       PROMPT('Débito por Cuotas: '),AT(0,154),USE(?Prompt12)
                       STRING(@n$-10.2),AT(86,154),USE(LIQ:DEBITO_PAGO_CUOTAS)
                       PROMPT('% Comision'),AT(161,139),USE(?Prompt13)
                       PROMPT('Total a Cobrar por el Colegiado:'),AT(0,171),USE(?Prompt14),FONT(,12,,FONT:bold)
                       STRING(@n10.2),AT(175,171),USE(LIQ:MONTO_TOTAL),FONT(,12,,FONT:bold)
                       LINE,AT(0,189,243,0),USE(?Line4),COLOR(COLOR:Black)
                       LINE,AT(0,117,241,0),USE(?Line3),COLOR(COLOR:Black)
                       PROMPT('Monto Pagado por la OS.'),AT(0,122),USE(?Prompt17)
                       BUTTON('&Aceptar'),AT(139,193,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(194,193,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  CASE SELF.Request
  OF ChangeRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & LIQ:IDLIQUIDACION & ')' ! Append status message to window title text
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LIQUIDACION_PAGO_FORM')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LIQ:IDLIQUIDACION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(LIQ:Record,History::LIQ:Record)
  SELF.AddHistoryField(?LIQ:IDLIQUIDACION,1)
  SELF.AddHistoryField(?LIQ:IDSOCIO,2)
  SELF.AddHistoryField(?LIQ:IDOS,3)
  SELF.AddHistoryField(?LIQ:MES,4)
  SELF.AddHistoryField(?LIQ:ANO,5)
  SELF.AddHistoryField(?LIQ:MONTO,8)
  SELF.AddHistoryField(?LIQ:MONTO_PAGADO:2,13)
  SELF.AddHistoryField(?LIQ:DEBITO,15)
  SELF.AddHistoryField(?LIQ:DEBITO_PAGO_CUOTAS:2,20)
  SELF.AddHistoryField(?LIQ:COMISION:2,16)
  SELF.AddHistoryField(?LIQ:DEBITO_COMISION,18)
  SELF.AddHistoryField(?LIQ:DEBITO_PAGO_CUOTAS,20)
  SELF.AddHistoryField(?LIQ:MONTO_TOTAL,21)
  SELF.AddUpdateFile(Access:LIQUIDACION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:FORMA_PAGO.Open                                   ! File FORMA_PAGO used by this procedure, so make sure it's RelationManager is open
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACIONXSOCIO.Open                            ! File LIQUIDACIONXSOCIO used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:LIQUIDACION
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?LIQ:IDLIQUIDACION{PROP:ReadOnly} = True
    ?LIQ:IDSOCIO{PROP:ReadOnly} = True
    ?LIQ:IDOS{PROP:ReadOnly} = True
    ?LIQ:MONTO{PROP:ReadOnly} = True
    ?LIQ:DEBITO{PROP:ReadOnly} = True
    ?LIQ:MONTO_TOTAL{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_PAGO_FORM',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
    Relate:CONF_EMP.Close
    Relate:CUENTAS.Close
    Relate:FACTURA.Close
    Relate:FONDOS.Close
    Relate:FORMA_PAGO.Close
    Relate:GASTOS.Close
    Relate:LIBDIARIO.Close
    Relate:LIQUIDACION.Close
    Relate:LIQUIDACIONXSOCIO.Close
    Relate:OBRA_SOCIAL.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_PAGO_FORM',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  OBR:IDOS = LIQ:IDOS                                      ! Assign linking field value
  Access:OBRA_SOCIAL.Fetch(OBR:PK_OBRA_SOCIAL)
  SOC:IDSOCIO = LIQ:IDSOCIO                                ! Assign linking field value
  Access:SOCIOS.Fetch(SOC:PK_SOCIOS)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectSOCIOS
      SelectOBRA_SOCIAL
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?OK
      LIQ:PAGADO = 'SI'
      LIQ:FECHA_PAGO = today()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LIQ:IDSOCIO
      SOC:IDSOCIO = LIQ:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          LIQ:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?LIQ:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION.TryValidateField(2)            ! Attempt to validate LIQ:IDSOCIO in LIQUIDACION
        SELECT(?LIQ:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:IDOS
      OBR:IDOS = LIQ:IDOS
      IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          LIQ:IDOS = OBR:IDOS
        ELSE
          SELECT(?LIQ:IDOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION.TryValidateField(3)            ! Attempt to validate LIQ:IDOS in LIQUIDACION
        SELECT(?LIQ:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:MES
      IF Access:LIQUIDACION.TryValidateField(4)            ! Attempt to validate LIQ:MES in LIQUIDACION
        SELECT(?LIQ:MES)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:MES
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:MES{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:ANO
      IF Access:LIQUIDACION.TryValidateField(5)            ! Attempt to validate LIQ:ANO in LIQUIDACION
        SELECT(?LIQ:ANO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:ANO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:ANO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  If  Self.Request=CHANGERecord AND SELF.RESPONSE = RequestCompleted Then
      !! DESCUENTO DE LO QUE COBRE EN EL TOTAL LO QUE ESTOY PAGANDO AHORA
      LXSOC:IDSOCIO    = LIQ:IDSOCIO
      LXSOC:PERIODO    = LIQ:PERIODO
      GET(LIQUIDACIONXSOCIO,LXSOC:PK_LIQUIDACIONXSOCIO)
      IF ERRORCODE() <> 35 THEN
          LXSOC:MONTO             =  LIQ:MONTO  - LXSOC:MONTO
          LXSOC:MONTO_PAGADO      =  LIQ:MONTO_PAGADO  - LXSOC:MONTO_PAGADO
          LXSOC:DEBITO            =  LIQ:DEBITO        - LXSOC:DEBITO
          LXSOC:CANTIDAD          =  LIQ:CANTIDAD      - LXSOC:CANTIDAD
          LXSOC:DEBITO_COMISION   =  LIQ:DEBITO_COMISION - LXSOC:DEBITO_COMISION
          LXSOC:MONTO_TOTAL       =  LIQ:MONTO_TOTAL     -  LXSOC:MONTO_TOTAL
          ACCESS:LIQUIDACIONXSOCIO.update()
      END
  
      !! ACTUALIZO FONDOS
  !!OJO  VER TAMBIEN EN LIBRO DIARIO
      SUB:IDSUBCUENTA = 6 !! SE TOMA COMO QUE SE LE ENTEGA UN CHEQUE !! OJO
  !!!
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
      !!! MODIFICA EL FLUJO DE FONDOS
      FON:IDFONDO = SUB:IDFONDO
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO - LIQ:MONTO_TOTAL !!RESTO LO QUE ESTOY SACANDO
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
  
      !! CARGO EN LA TABLA GASTOS
      !! BUSCO EL ID PROVEEDOR
      SOC:IDSOCIO = LIQ:IDSOCIO
      ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
      IDPROVEEDOR# = SOC:IDPROVEEDOR
      !! CARGO GASTO
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      GAS:IDUSUARIO        =   GLO:IDUSUARIO
      GAS:IDSUBCUENTA      =   6
      GAS:OBSERVACION      =   'PAGO CUOTA MAT:'&SOC:MATRICULA&', CUOTA: '&LIQ:MES&' AÑO: '&LIQ:ANO
      GAS:MONTO            =   LIQ:MONTO_TOTAL
      GAS:FECHA            =   LIQ:FECHA_COBRO
      GAS:HORA             =   CLOCK()
      GAS:MES              =   LIQ:MES
      GAS:ANO              =   LIQ:ANO
      GAS:PERIODO          =   LIQ:PERIODO
      GAS:IDPROVEEDOR      =   IDPROVEEDOR#
      GAS:SUCURSAL         =   LIQ:IDLIQUIDACION + 30000
      GAS:IDRECIBO         =   1
      !!! CARGA
      RANKING{PROP:SQL} = 'CALL SP_GEN_GASTOS_ID'
      NEXT(RANKING)
      GAS:IDGASTOS = RAN:C1
      !MESSAGE(GAS:IDGASTOS)
      ACCESS:GASTOS.INSERT()
  
      !!!!   CARGA EN CAJA SI SE DE CAJA
      IF SUB:CAJA = 'SI' THEN
          !!! CARGO CAJA
          CAJ:IDSUBCUENTA = 5
          CAJ:IDUSUARIO = GLO:IDUSUARIO
          CAJ:DEBE =  0
          CAJ:HABER = LIQ:MONTO_TOTAL
          CAJ:OBSERVACION = 'PAGO CUOTA SOCIO '&LIQ:IDSOCIO
          CAJ:FECHA = TODAY()
          CAJ:MES       =  MONTH(TODAY())
          CAJ:ANO       =  YEAR(TODAY())
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
         ! CAJ:SUCURSAL  =   GAS:SUCURSAL
         ! CAJ:RECIBO    =   GAS:IDRECIBO
          CAJ:TIPO      =   'EGRESO'
          CAJ:IDTRANSACCION = GAS:IDGASTOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          CAJ:MONTO = FON:MONTO 
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
          NEXT(RANKING)
          CAJ:IDCAJA = RAN:C1
          ACCESS:CAJA.INSERT()
          RAN:C1 = 0
      END
      CUE:IDCUENTA = 2
      ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
      IF CUE:TIPO = 'INGRESO' THEN
          LIB:IDSUBCUENTA = 6  !!
          LIB:DEBE = 0
          LIB:HABER = LIQ:MONTO_TOTAL
          LIB:OBSERVACION = 'PAGO LIQUIDACION A SOCIO '&PAG:IDSOCIO
          LIB:FECHA = TODAY()
          LIB:HORA = CLOCK()
          LIB:MES       =  MONTH(TODAY())
          LIB:ANO       =  YEAR(TODAY())
          LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
          LIB:SUCURSAL   =    GAS:SUCURSAL
          LIB:RECIBO       =  GAS:IDRECIBO
          LIB:IDPROVEEDOR  =  IDPROVEEDOR#
          LIB:TIPO         =  'GASTOS'
          LIB:IDTRANSACCION =  GAS:IDGASTOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          LIB:FONDO = FON:MONTO 
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
          NEXT(RANKING)
          LIB:IDLIBDIARIO = RAN:C1
          !!!!!!!!!!!
          ACCESS:LIBDIARIO.INSERT()
      END
  END !! IF DE CONTROL SI EXISTE EL DESCUENTO
  
  
  
  
        
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the LIQUIDACION File
!!! </summary>
LIQUIDACION_PAGO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(LIQUIDACION)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:PRESENTADO)
                       PROJECT(LIQ:IDSOCIO)
                       PROJECT(LIQ:PERIODO)
                       PROJECT(LIQ:TIPO_PERIODO)
                       PROJECT(LIQ:MONTO)
                       PROJECT(LIQ:DEBITO)
                       PROJECT(LIQ:COMISION)
                       PROJECT(LIQ:DEBITO_PAGO_CUOTAS)
                       PROJECT(LIQ:MONTO_TOTAL)
                       PROJECT(LIQ:FECHA_CARGA)
                       PROJECT(LIQ:FECHA_PRESENTACION)
                       PROJECT(LIQ:FECHA_PAGO)
                       PROJECT(LIQ:PAGADO)
                       PROJECT(LIQ:IDOS)
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMPRE_CORTO)
                         PROJECT(OBR:IDOS)
                       END
                       JOIN(SOC:PK_SOCIOS,LIQ:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LIQ:IDLIQUIDACION      LIKE(LIQ:IDLIQUIDACION)        !List box control field - type derived from field
LIQ:IDLIQUIDACION_Icon LONG                           !Entry's icon ID
LIQ:MES                LIKE(LIQ:MES)                  !List box control field - type derived from field
LIQ:ANO                LIKE(LIQ:ANO)                  !List box control field - type derived from field
LIQ:PRESENTADO         LIKE(LIQ:PRESENTADO)           !List box control field - type derived from field
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
LIQ:IDSOCIO            LIKE(LIQ:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
LIQ:PERIODO            LIKE(LIQ:PERIODO)              !List box control field - type derived from field
LIQ:TIPO_PERIODO       LIKE(LIQ:TIPO_PERIODO)         !List box control field - type derived from field
LIQ:MONTO              LIKE(LIQ:MONTO)                !List box control field - type derived from field
LIQ:DEBITO             LIKE(LIQ:DEBITO)               !List box control field - type derived from field
LIQ:COMISION           LIKE(LIQ:COMISION)             !List box control field - type derived from field
LIQ:DEBITO_PAGO_CUOTAS LIKE(LIQ:DEBITO_PAGO_CUOTAS)   !List box control field - type derived from field
LIQ:MONTO_TOTAL        LIKE(LIQ:MONTO_TOTAL)          !List box control field - type derived from field
LIQ:FECHA_CARGA        LIKE(LIQ:FECHA_CARGA)          !List box control field - type derived from field
LIQ:FECHA_PRESENTACION LIKE(LIQ:FECHA_PRESENTACION)   !List box control field - type derived from field
LIQ:FECHA_PAGO         LIKE(LIQ:FECHA_PAGO)           !List box control field - type derived from field
LIQ:PAGADO             LIKE(LIQ:PAGADO)               !List box control field - type derived from field
LIQ:IDOS               LIKE(LIQ:IDOS)                 !Browse key field - type derived from field
OBR:IDOS               LIKE(OBR:IDOS)                 !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('LIQUIDACIONES COBRADAS'),AT(,,521,329),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('CARGA_LIQUIDACION'),SYSTEM
                       LIST,AT(8,42,503,239),USE(?Browse:1),HVSCROLL,FORMAT('46L(2)|MI~ID~C(0)@n-7@23L(2)|M~ME' & |
  'S~C(0)@n-3@27L(2)|M~AÑO~C(0)@n-5@55L|M~PRESENTADO~C@s2@120L(2)|M~OBRA SOCIAL~C(0)@s3' & |
  '0@[120L(2)|M~NOMBRE~C(0)@s30@46L(2)|M~IDSOCIO~C(0)@n-7@49L(2)|M~MATRICULA~C(0)@n-5@]' & |
  '|M~Colegiado~32L(2)|M~PERIODO~@s6@80L(2)|M~TIPO PERIODO~@s30@[36L(1)|M~PRESENTADO~D(' & |
  '14)@n-10.2@40L(1)|M~DEBITO~C(0)@n10.2@40L(1)|M~COMISION COL~C(0)@n10.2@40L(1)|M~PAG ' & |
  'CUOTAS~D(14)@n10.2@48L(1)|M~MONTO A COBRAR~C(0)@N9.2@](231)|M~MONTOS~[62L(2)|M~FECHA' & |
  ' CARGA~C(0)@d17@93L(2)|M~FECHA PRESENTACION~C(0)@d17@40L(2)|M~FECHA PAGO~C(0)@d17@](' & |
  '222)|M~FECHAS~8R(2)|M~PAGADO~C(0)@s2@'),FROM(Queue:Browse:1),IMM,MSG('Administrador ' & |
  'de LIQUIDACION')
                       BUTTON('&Elegir'),AT(253,288,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(306,288,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('E&xportar'),AT(56,310,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(5,310,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       SHEET,AT(4,4,515,302),USE(?CurrentTab)
                         TAB('LIQUIDACION SIN PAGAR '),USE(?Tab:1)
                           BUTTON('Generar Diskette de Pago por Banco'),AT(11,286,103,17),USE(?Button7),LEFT,ICON(ICON:Save), |
  FLAT
                           BUTTON('&Cargar el Pago Manual'),AT(403,287,105,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                         END
                         TAB('LIQUIDACIONES PAGADAS'),USE(?Tab:2)
                         END
                         TAB('OBRA SOCIAL'),USE(?Tab:3)
                         END
                         TAB('PERIODO'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Salir'),AT(473,315,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist8 QUEUE,PRE(QHL8)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar8 QUEUE,PRE(Q8)
FieldPar                 CSTRING(800)
                         END
QPar28 QUEUE,PRE(Qp28)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado8          STRING(100)
Loc::Titulo8          STRING(100)
SavPath8          STRING(2000)
Evo::Group8  GROUP,PRE()
Evo::Procedure8          STRING(100)
Evo::App8          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE9                 QueryListClass                        ! QBE List Class. 
QBV9                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_8  SHORT
Gol_woI_8 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_8),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_8),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_8),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_8),TRN
       END
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
PrintExBrowse8 ROUTINE

 OPEN(Gol_woI_8)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_8 = BRW1.FileLoaded
 IF Not  EC::LoadI_8
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_8)
 SETCURSOR()
  Evo::App8          = 'Gestion'
  Evo::Procedure8          = GlobalErrors.GetProcedureName()& 8
 
  FREE(QPar8)
  Q8:FieldPar  = '1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,'
  ADD(QPar8)  !!1
  Q8:FieldPar  = ';'
  ADD(QPar8)  !!2
  Q8:FieldPar  = 'Spanish'
  ADD(QPar8)  !!3
  Q8:FieldPar  = ''
  ADD(QPar8)  !!4
  Q8:FieldPar  = true
  ADD(QPar8)  !!5
  Q8:FieldPar  = ''
  ADD(QPar8)  !!6
  Q8:FieldPar  = true
  ADD(QPar8)  !!7
 !!!! Exportaciones
  Q8:FieldPar  = 'HTML|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'EXCEL|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'WORD|'
  Q8:FieldPar  = CLIP( Q8:FieldPar)&'ASCII|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'XML|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'PRT|'
  ADD(QPar8)  !!8
  Q8:FieldPar  = 'All'
  ADD(QPar8)   !.9.
  Q8:FieldPar  = ' 0'
  ADD(QPar8)   !.10
  Q8:FieldPar  = 0
  ADD(QPar8)   !.11
  Q8:FieldPar  = '1'
  ADD(QPar8)   !.12
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.13
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.14
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.15
 
   Q8:FieldPar  = '16'
  ADD(QPar8)   !.16
 
   Q8:FieldPar  = 1
  ADD(QPar8)   !.17
   Q8:FieldPar  = 2
  ADD(QPar8)   !.18
   Q8:FieldPar  = '2'
  ADD(QPar8)   !.19
   Q8:FieldPar  = 12
  ADD(QPar8)   !.20
 
   Q8:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar8)   !.21
 
   Q8:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar8)   !.22
 
   CLEAR(Q8:FieldPar)
  ADD(QPar8)   ! 23 Caracteres Encoding para xml
 
  Q8:FieldPar  = '0'
  ADD(QPar8)   ! 24 Use Open Office
 
   Q8:FieldPar  = 'golmedo'
  ADD(QPar8) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q8:FieldPar  = ' BrowseExport'
  ADD(QPar8)   ! 26  BrowseExport
  Q8:FieldPar  = ' '
  ADD(QPar8)   ! 27  
  Q8:FieldPar  = ' ' 
  ADD(QPar8)   ! 28  
  Q8:FieldPar  = 'BEXPORT' 
  ADD(QPar8)   ! 29 Gestion013.clw
 !!!!!
 
 
  FREE(QPar28)
       Qp28:F2N  = 'ID'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MES'
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'ANO'
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PRESENTADO'
  Qp28:F2P  = '@s2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'NOMPRE CORTO'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'NOMBRE'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDSOCIO'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MATRICULA'
  Qp28:F2P  = '@n-5'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PERIODO'
  Qp28:F2P  = '@s6'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'TIPO PERIODO'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MONTO'
  Qp28:F2P  = '@n-7.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'DEBITO'
  Qp28:F2P  = '@n10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'COMISION COL'
  Qp28:F2P  = '@n10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PAG CUOTAS'
  Qp28:F2P  = '@n10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MONTO A COBRAR'
  Qp28:F2P  = '@n12.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA CARGA'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA PRESENTACION'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA PAGO'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PAGADO'
  Qp28:F2P  = '@s2'
  Qp28:F2T  = '0'
  ADD(QPar28)
  SysRec# = false
  FREE(Loc::QHlist8)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar28,SysRec#)
         QHL8:Id      = SysRec#
         QHL8:Nombre  = Qp28:F2N
         QHL8:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL8:Pict    = Qp28:F2P
         QHL8:Tot    = Qp28:F2T
         ADD(Loc::QHlist8)
      Else
        break
     END
  END
  Loc::Titulo8 ='Administrator the LIQUIDACION'
 
 SavPath8 = PATH()
  Exportar(Loc::QHlist8,BRW1.Q,QPar8,0,Loc::Titulo8,Evo::Group8)
 IF Not EC::LoadI_8 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath8)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LIQUIDACION_PAGO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('LIQ:TIPO_PERIODO',LIQ:TIPO_PERIODO)                ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_CARGA',LIQ:FECHA_CARGA)                  ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_PRESENTACION',LIQ:FECHA_PRESENTACION)    ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_PAGO',LIQ:FECHA_PAGO)                    ! Added by: BrowseBox(ABC)
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LIQUIDACION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE9.Init(QBV9, INIMgr,'CARGA_LIQUIDACION', GlobalErrors)
  QBE9.QkSupport = True
  QBE9.QkMenuIcon = 'QkQBE.ico'
  QBE9.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,LIQ:PK_LIQUIDACION)                   ! Add the sort order for LIQ:PK_LIQUIDACION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,LIQ:IDLIQUIDACION,,BRW1)       ! Initialize the browse locator using  using key: LIQ:PK_LIQUIDACION , LIQ:IDLIQUIDACION
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:COBRADO = ''SI''  AND LIQ:PAGADO = ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:FK_LIQUIDACION_OS)                ! Add the sort order for LIQ:FK_LIQUIDACION_OS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,LIQ:IDOS,,BRW1)                ! Initialize the browse locator using  using key: LIQ:FK_LIQUIDACION_OS , LIQ:IDOS
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:PAGADO = '''')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:IDX_LIQUIDACION_PERIODO)          ! Add the sort order for LIQ:IDX_LIQUIDACION_PERIODO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,LIQ:PERIODO,,BRW1)             ! Initialize the browse locator using  using key: LIQ:IDX_LIQUIDACION_PERIODO , LIQ:PERIODO
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:PAGADO = '''')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:PK_LIQUIDACION)                   ! Add the sort order for LIQ:PK_LIQUIDACION for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,LIQ:IDLIQUIDACION,,BRW1)       ! Initialize the browse locator using  using key: LIQ:PK_LIQUIDACION , LIQ:IDLIQUIDACION
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:COBRADO = ''SI''  AND LIQ:PAGADO = ''NO'')') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~POSTED2.ICO'
  BRW1.AddField(LIQ:IDLIQUIDACION,BRW1.Q.LIQ:IDLIQUIDACION) ! Field LIQ:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:MES,BRW1.Q.LIQ:MES)                    ! Field LIQ:MES is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:ANO,BRW1.Q.LIQ:ANO)                    ! Field LIQ:ANO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PRESENTADO,BRW1.Q.LIQ:PRESENTADO)      ! Field LIQ:PRESENTADO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMPRE_CORTO,BRW1.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:IDSOCIO,BRW1.Q.LIQ:IDSOCIO)            ! Field LIQ:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PERIODO,BRW1.Q.LIQ:PERIODO)            ! Field LIQ:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:TIPO_PERIODO,BRW1.Q.LIQ:TIPO_PERIODO)  ! Field LIQ:TIPO_PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:MONTO,BRW1.Q.LIQ:MONTO)                ! Field LIQ:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:DEBITO,BRW1.Q.LIQ:DEBITO)              ! Field LIQ:DEBITO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:COMISION,BRW1.Q.LIQ:COMISION)          ! Field LIQ:COMISION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:DEBITO_PAGO_CUOTAS,BRW1.Q.LIQ:DEBITO_PAGO_CUOTAS) ! Field LIQ:DEBITO_PAGO_CUOTAS is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:MONTO_TOTAL,BRW1.Q.LIQ:MONTO_TOTAL)    ! Field LIQ:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_CARGA,BRW1.Q.LIQ:FECHA_CARGA)    ! Field LIQ:FECHA_CARGA is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_PRESENTACION,BRW1.Q.LIQ:FECHA_PRESENTACION) ! Field LIQ:FECHA_PRESENTACION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_PAGO,BRW1.Q.LIQ:FECHA_PAGO)      ! Field LIQ:FECHA_PAGO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PAGADO,BRW1.Q.LIQ:PAGADO)              ! Field LIQ:PAGADO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:IDOS,BRW1.Q.LIQ:IDOS)                  ! Field LIQ:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(OBR:IDOS,BRW1.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_PAGO',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE9,1)
  BRW1.AskProcedure = 1                                    ! Will call: LIQUIDACION_PAGO_FORM
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_PAGO',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    LIQUIDACION_PAGO_FORM
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse8
    OF ?Button7
      ThisWindow.Update()
      START(GENERAR_DISKETTE, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.ChangeControl=?Change:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (LIQ:PRESENTADO = 'SI' AND LIQ:PAGADO = 'SI')
    SELF.Q.LIQ:IDLIQUIDACION_Icon = 1                      ! Set icon from icon list
  ELSE
    SELF.Q.LIQ:IDLIQUIDACION_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
GENERAR_DISKETTE PROCEDURE 

QuickWindow          WINDOW('Generar Diskette al Banco'),AT(,,202,220),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('LIQUIDACION_PRESENTACION0'),SYSTEM
                       PROMPT('MES:'),AT(5,5),USE(?GLO:MES:Prompt)
                       COMBO(@n-14),AT(55,4,38,10),USE(GLO:MES),DROP(10),FROM('1|2|3|4|5|6|7|8|9|10|11|12')
                       PROMPT('ANO:'),AT(5,21),USE(?GLO:ANO:Prompt)
                       COMBO(@n-14),AT(55,20,39,10),USE(GLO:ANO),DROP(10),FROM('2005|2006|2007|2008|2009|2010|' & |
  '2011|2012|2015|2016')
                       PROMPT('OBRA SOCIAL:'),AT(5,37),USE(?Glo:IDOS:Prompt)
                       ENTRY(@n-7),AT(55,36,22,10),USE(Glo:IDOS),REQ
                       BUTTON('...'),AT(80,36,12,12),USE(?CallLookup)
                       STRING(@s30),AT(93,38),USE(OBR:NOMPRE_CORTO)
                       PROMPT('FECHA ACRED:'),AT(0,55),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(54,53,46,10),USE(FECHA_DESDE),RIGHT(1),REQ
                       PROMPT('BANCO:'),AT(1,69),USE(?GLO:BANCO:Prompt)
                       ENTRY(@n-14),AT(53,69,22,10),USE(GLO:BANCO),REQ
                       BUTTON('...'),AT(78,69,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(91,71,107,10),USE(BAN2:DESCRIPCION)
                       PROMPT('Convenio: '),AT(51,84),USE(?Prompt6)
                       STRING(@n-11.0),AT(89,84),USE(BAN2:SUBEMPRESA)
                       STRING(@n-14),AT(132,84),USE(BAN2:CODIGO_BANCO)
                       LINE,AT(0,96,202,0),USE(?Line2),COLOR(COLOR:Black)
                       OPTION('GENERAR'),AT(43,97,116,25),USE(GLO:TIPO),BOXED
                         RADIO('NUEVO'),AT(47,108),USE(?GLO:TIPO:Radio1),VALUE('N')
                         RADIO('RECTIFICATORIA'),AT(87,108),USE(?GLO:TIPO:Radio2),VALUE('R')
                       END
                       LINE,AT(1,126,199,0),USE(?Line1),COLOR(COLOR:Black)
                       BUTTON('&Generar Diskette'),AT(118,133,80,26),USE(?Ok),LEFT,ICON(ICON:Save),CURSOR('mano.cur'), |
  FLAT,MSG('Acepta Operacion'),TIP('Acepta Operacion')
                       BUTTON('Simular Liquidación'),AT(6,131,80,26),USE(?Button4),LEFT,ICON(ICON:Help),FLAT
                       BUTTON('&Cancelar'),AT(77,170,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('GENERAR_DISKETTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:MES:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION_ENTREGA_BANCO.Open                    ! File LIQUIDACION_ENTREGA_BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('GENERAR_DISKETTE',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO.Close
    Relate:LIQUIDACION_ENTREGA_BANCO.Close
    Relate:OBRA_SOCIAL.Close
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_DISKETTE',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectOBRA_SOCIAL
      SelectBANCO
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?Ok
      GLO:SUBEMPRESA= BAN2:SUBEMPRESA
      GLO:CODIGO_BANCO = BAN2:CODIGO_BANCO
      IF FECHA_DESDE <> 0 THEN
          IF GLO:TIPO <> ''  THEN
              GLO:PERIODO =  GLO:ANO&(FORMAT(GLO:MES,@N02))
              Glo:IDOS = OBR:IDOS
              GLO:ESTADO = ''
              !!!
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              IF GLO:TIPO = 'N' THEN
                  BCO:DESCRIPCION   = 'NUEVA LIQUIDACION'
                  BCO:FECHA         = TODAY()
                  BCO:HORA          = CLOCK()
                  BCO:IDUSUARIO     = GLO:IDUSUARIO
                  BCO:MES           = GLO:MES
                  BCO:ANO           = GLO:ANO
                  BCO:PERIODO       = GLO:PERIODO
                  BCO:IDOS          = Glo:IDOS
                  BCO:TIPO          = 'N'
                  !!! CARGA
                  RANKING{PROP:SQL} = 'CALL sp_gen_liqu_banco_id'
                  NEXT(RANKING)
                  BCO:IDENTREGABNCO = RAN:C1
                  BCO:SECUENCIA     = RAN:C1
                  GLO:SECUENCIA =     RAN:C1 !! SE UTILIZA EN LA CARGA DEL DISKETTE
                  ACCESS:LIQUIDACION_ENTREGA_BANCO.INSERT()
              ELSE
                  BCO:DESCRIPCION   = 'RECTIFICATIVA LIQUIDACION'
                  BCO:FECHA         = TODAY()
                  BCO:HORA          = CLOCK()
                  BCO:IDUSUARIO     = GLO:IDUSUARIO
                  BCO:MES           = GLO:MES
                  BCO:ANO           = GLO:ANO
                  BCO:PERIODO       = GLO:PERIODO
                  BCO:IDOS          = Glo:IDOS
                  BCO:TIPO          = 'R'
                  !!! CARGA
                  RANKING{PROP:SQL} = 'CALL sp_gen_liqu_banco_id'
                  NEXT(RANKING)
                  BCO:IDENTREGABNCO = RAN:C1
                  BCO:SECUENCIA     = RAN:C1
                  GLO:SECUENCIA =     RAN:C1 !! SE UTILIZA EN LA CARGA DEL DISKETTE
                  ACCESS:LIQUIDACION_ENTREGA_BANCO.INSERT()
              END
              !!! LIMPIA RANKING
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              OPEN(LIQUIDACION_DISKETTE)
              EMPTY(LIQUIDACION_DISKETTE)
              IF ERRORCODE() THEN
                  MESSAGE(ERROR())
                  CYCLE
              ELSE
                  CLOSE(LIQUIDACION_DISKETTE)
              END
          ELSE
              MESSAGE('Se debe incoporar un tipo de generación')
              select(?Glo:IDOS)
              cycle
          end
      ELSE
          MESSAGE('La fecha de ACREDITACIÓN es obligatoria')
      end
    OF ?Button4
      GLO:SUBEMPRESA= BAN2:SUBEMPRESA
      GLO:CODIGO_BANCO = BAN2:CODIGO_BANCO
      IF FECHA_DESDE <> 0 THEN
          IF GLO:TIPO <> ''  THEN
              GLO:PERIODO =  GLO:ANO&(FORMAT(GLO:MES,@N02))
              Glo:IDOS = OBR:IDOS
              GLO:ESTADO = ''
              !!! LIMPIA RANKING
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              OPEN(LIQUIDACION_DISKETTE)
              EMPTY(LIQUIDACION_DISKETTE)
              IF ERRORCODE() THEN
                  MESSAGE(ERROR())
                  CYCLE
              ELSE
                  CLOSE(LIQUIDACION_DISKETTE)
              END
          END
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Glo:IDOS
      IF Glo:IDOS OR ?Glo:IDOS{PROP:Req}
        OBR:IDOS = Glo:IDOS
        IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            Glo:IDOS = OBR:IDOS
          ELSE
            SELECT(?Glo:IDOS)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      OBR:IDOS = Glo:IDOS
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        Glo:IDOS = OBR:IDOS
      END
      ThisWindow.Reset(1)
    OF ?GLO:BANCO
      IF GLO:BANCO OR ?GLO:BANCO{PROP:Req}
        BAN2:IDBANCO = GLO:BANCO
        IF Access:BANCO.TryFetch(BAN2:PK_BANCO)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            GLO:BANCO = BAN2:IDBANCO
          ELSE
            SELECT(?GLO:BANCO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      BAN2:IDBANCO = GLO:BANCO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        GLO:BANCO = BAN2:IDBANCO
      END
      ThisWindow.Reset(1)
    OF ?Ok
      ThisWindow.Update()
      START(LIQUIDACION_GENERAR_CONTROL_CBU, 25000)
      ThisWindow.Reset
    OF ?Button4
      ThisWindow.Update()
      START(LIQUIDACION_GENERAR_CONTROL_CBU_2, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the RANKING File
!!! </summary>
IMPRIMIR_RANKING PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(RANKING)
                       PROJECT(RAN:C1)
                       PROJECT(RAN:C2)
                       PROJECT(RAN:C3)
                     END
ProgressWindow       WINDOW('Reporte de RANKING'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('RANKING Report'),AT(250,850,7750,10333),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,604),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('ERROR EN GENERACION DE DISKETTE '),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif', |
  8,,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2583,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(5166,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         STRING('Nº SOCIO'),AT(50,390,2483,170),USE(?HeaderTitle:1),TRN
                         STRING('ERROR'),AT(2635,385,2483,170),USE(?HeaderTitle:2),TRN
                         STRING('TIPO ERROR'),AT(5216,390,2483,170),USE(?HeaderTitle:3),TRN
                       END
Detail                 DETAIL,AT(,,7750,208),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2583,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(5166,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:3),COLOR(COLOR:Black)
                         STRING(@s50),AT(50,50,2483,170),USE(RAN:C1),LEFT
                         STRING(@s50),AT(2633,50,2483,170),USE(RAN:C2),LEFT
                         STRING(@s50),AT(5216,50,2483,170),USE(RAN:C3),LEFT
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
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

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_RANKING')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_RANKING',ProgressWindow)          ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:RANKING, ?Progress:PctText, Progress:Thermometer, ProgressMgr, RAN:C2)
  ThisReport.AddSortOrder(RAN:IDX_C2)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:RANKING.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_RANKING',ProgressWindow)       ! Save window data to non-volatile store
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
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagName,'HeaderTitle:3')
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?RAN:C1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?RAN:C1,RepGen:XML,TargetAttr:TagName,'RAN:C1')
  SELF.Attribute.Set(?RAN:C1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?RAN:C2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?RAN:C2,RepGen:XML,TargetAttr:TagName,'RAN:C2')
  SELF.Attribute.Set(?RAN:C2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?RAN:C3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?RAN:C3,RepGen:XML,TargetAttr:TagName,'RAN:C3')
  SELF.Attribute.Set(?RAN:C3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
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


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_RANKING','IMPRIMIR_RANKING','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

