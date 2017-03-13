

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION121.INC'),ONCE        !Local module procedure declarations
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

