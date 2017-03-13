

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION149.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
RECIBO_LIQUIDACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(LIQUIDACION)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:CANTIDAD)
                       PROJECT(LIQ:FECHA_CARGA)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:MONTO)
                       PROJECT(LIQ:IDUSUARIO)
                       PROJECT(LIQ:IDOS)
                       PROJECT(LIQ:IDSOCIO)
                       JOIN(LIQC:FK_LIQUIDACION_CODIGO_LIQ,LIQ:IDLIQUIDACION)
                         PROJECT(LIQC:CANTIDAD)
                         PROJECT(LIQC:TOTAL)
                         PROJECT(LIQC:VALOR)
                         PROJECT(LIQC:IDOS)
                         PROJECT(LIQC:IDNOMENCLADOR)
                         JOIN(NOM2:PK_NOMENCLADORXOS,LIQC:IDOS,LIQC:IDNOMENCLADOR)
                           PROJECT(NOM2:IDNOMENCLADOR)
                           JOIN(NOM:PK_NOMENCLADOR,NOM2:IDNOMENCLADOR)
                             PROJECT(NOM:CODIGO)
                             PROJECT(NOM:DESCRIPCION)
                           END
                         END
                       END
                       JOIN(USU:PK_USUARIO,LIQ:IDUSUARIO)
                         PROJECT(USU:DESCRIPCION)
                       END
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMPRE_CORTO)
                       END
                       JOIN(SOC:PK_SOCIOS,LIQ:IDSOCIO)
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

Report               REPORT,AT(979,3781,6917,3677),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),THOUS
                       HEADER,AT(990,1010,6927,2781),USE(?unnamed)
                         STRING('Presentación  Nº'),AT(4292,42),USE(?String1),FONT(,12,,FONT:bold),TRN
                         IMAGE('Logo.jpg'),AT(10,-10,1635,958),USE(?Image1)
                         STRING(@n-7),AT(5667,52),USE(LIQ:IDLIQUIDACION),LEFT
                         STRING('Fecha:'),AT(5135,292),USE(?String15),TRN
                         STRING(@d17),AT(5583,292),USE(LIQ:FECHA_CARGA)
                         STRING('El Colegio de Psicólogos del Valle inferior de Río Negro .  recibe del Socio Ma' & |
  'tricula Nº :'),AT(21,1365,4979,188),USE(?String3),TRN
                         STRING(@s7),AT(5010,1365),USE(SOC:MATRICULA)
                         STRING('Comprobante de Entrega de Liquidación a Obra Sociales'),AT(1260,1010),USE(?String23), |
  FONT(,12,,FONT:bold+FONT:underline),TRN
                         STRING(@s30),AT(2313,1583),USE(SOC:NOMBRE)
                         LINE,AT(10,1333,6896,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('la presentación de la facturación de la obra social '),AT(31,1813),USE(?String8),TRN
                         STRING(@s30),AT(3042,1813),USE(OBR:NOMPRE_CORTO)
                         STRING(@n$-12.2),AT(4156,2115),USE(LIQ:MONTO)
                         STRING('cuyo monto facturado es de: '),AT(2438,2115),USE(?String16),TRN
                         STRING(@P-####P),AT(2010,2115),USE(LIQ:ANO)
                         STRING('Cantidad de Códigos:'),AT(4990,2115),USE(?String20),TRN
                         STRING(@n-3),AT(1750,2115),USE(LIQ:MES)
                         STRING('correspondiente al periodo:'),AT(10,2115),USE(?String10),TRN
                         STRING(@n-4),AT(6229,2115),USE(LIQ:CANTIDAD),RIGHT(1)
                         LINE,AT(10,2375,6906,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('Detalle de Presentación'),AT(31,2396),USE(?String24),TRN
                         BOX,AT(10,2552,6906,219),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Código'),AT(63,2573),USE(?String29),TRN
                         STRING('Cant'),AT(5052,2573),USE(?String32),TRN
                         STRING('Descripción'),AT(1875,2573),USE(?String30),TRN
                         STRING('Total '),AT(6083,2573),USE(?String33),TRN
                         STRING('Monto '),AT(4052,2573),USE(?String31),TRN
                       END
detail                 DETAIL,AT(0,0,,292),USE(?unnamed:4)
                         STRING(@s100),AT(677,10,2771,188),USE(NOM:DESCRIPCION)
                         STRING(@p##.##.##p),AT(31,10),USE(NOM:CODIGO)
                         STRING(@n$-7.2),AT(4281,10),USE(LIQC:VALOR)
                         STRING(@n-3),AT(5375,10),USE(LIQC:CANTIDAD),RIGHT(1)
                         STRING(@n$-10.2),AT(6240,10),USE(LIQC:TOTAL)
                         LINE,AT(10,208,6865,0),USE(?Line2),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(948,7469,6927,1448),USE(?unnamed:2)
                         STRING('La carga fue realizada por:'),AT(10,0),USE(?String22),TRN
                         STRING(@s20),AT(1656,21),USE(USU:DESCRIPCION)
                         LINE,AT(42,448,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(52,531),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2156,531),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5656,531),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(979,1000,6948,7927),USE(?unnamed:3)
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
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
                     END

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
  GlobalErrors.SetProcedureName('RECIBO_LIQUIDACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('RECIBO_LIQUIDACION',ProgressWindow)        ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LIQ:IDLIQUIDACION)
  ThisReport.AddSortOrder(LIQ:PK_LIQUIDACION)
  ThisReport.AddRange(LIQ:IDLIQUIDACION,GLO:IDSOLICITUD)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:LIQUIDACION.SetQuickScan(1,Propagate:OneMany)
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
    Relate:LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('RECIBO_LIQUIDACION',ProgressWindow)     ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:IDLIQUIDACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:IDLIQUIDACION,RepGen:XML,TargetAttr:TagName,'LIQ:IDLIQUIDACION')
  SELF.Attribute.Set(?LIQ:IDLIQUIDACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:FECHA_CARGA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:FECHA_CARGA,RepGen:XML,TargetAttr:TagName,'LIQ:FECHA_CARGA')
  SELF.Attribute.Set(?LIQ:FECHA_CARGA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagName,'OBR:NOMPRE_CORTO')
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagName,'LIQ:MONTO')
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagName,'LIQ:ANO')
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagName,'LIQ:MES')
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:CANTIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:CANTIDAD,RepGen:XML,TargetAttr:TagName,'LIQ:CANTIDAD')
  SELF.Attribute.Set(?LIQ:CANTIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagName,'String33')
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?NOM:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?NOM:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'NOM:DESCRIPCION')
  SELF.Attribute.Set(?NOM:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?NOM:CODIGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?NOM:CODIGO,RepGen:XML,TargetAttr:TagName,'NOM:CODIGO')
  SELF.Attribute.Set(?NOM:CODIGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQC:VALOR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQC:VALOR,RepGen:XML,TargetAttr:TagName,'LIQC:VALOR')
  SELF.Attribute.Set(?LIQC:VALOR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQC:CANTIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQC:CANTIDAD,RepGen:XML,TargetAttr:TagName,'LIQC:CANTIDAD')
  SELF.Attribute.Set(?LIQC:CANTIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQC:TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQC:TOTAL,RepGen:XML,TargetAttr:TagName,'LIQC:TOTAL')
  SELF.Attribute.Set(?LIQC:TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'USU:DESCRIPCION')
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


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

