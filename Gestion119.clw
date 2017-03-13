

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION119.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_PAGO_LIQUIDACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:TOTAL_PARCIAL    PDECIMAL(7,2)                         ! 
Process:View         VIEW(PAGOS_LIQUIDACION)
                       PROJECT(PAGL:CANT_CUOTA)
                       PROJECT(PAGL:CANT_CUOTA_S)
                       PROJECT(PAGL:CREDITO)
                       PROJECT(PAGL:CUOTA)
                       PROJECT(PAGL:FECHA)
                       PROJECT(PAGL:GASTOS_ADM)
                       PROJECT(PAGL:GASTOS_BANCARIOS)
                       PROJECT(PAGL:IDPAGOS)
                       PROJECT(PAGL:MONTO)
                       PROJECT(PAGL:MONTO_IMP_TOTAL)
                       PROJECT(PAGL:SEGURO)
                       PROJECT(PAGL:SOCIOS_LIQUIDACION)
                       PROJECT(PAGL:IDSOCIO)
                       JOIN(LIQ:IDX_LIQUIDACION_PAGO,PAGL:IDPAGOS)
                         PROJECT(LIQ:ANO)
                         PROJECT(LIQ:DEBITO)
                         PROJECT(LIQ:MES)
                         PROJECT(LIQ:MONTO)
                         PROJECT(LIQ:IDOS)
                         JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                           PROJECT(OBR:NOMPRE_CORTO)
                         END
                       END
                       JOIN(SOC:PK_SOCIOS,PAGL:IDSOCIO)
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

Report               REPORT,AT(219,2740,7771,5948),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(198,208,7802,2521),USE(?Header)
                         IMAGE('Logo.jpg'),AT(0,-10,1875,1302),USE(?Image1)
                         STRING(@d17),AT(7000,438),USE(PAGL:FECHA),RIGHT(1)
                         STRING(@n-7),AT(7219,250),USE(PAGL:IDPAGOS)
                         STRING('Nº Liquidación'),AT(6073,250),USE(?String32),TRN
                         STRING('Fecha:'),AT(6542,427),USE(?String30),TRN
                         STRING('Pago de Liquidaciones por Cobro a Obras Sociales'),AT(1635,1354),USE(?String1),FONT(, |
  14,,FONT:underline),TRN
                         LINE,AT(21,1656,7771,0),USE(?Line7),COLOR(COLOR:Black)
                         STRING('Colegiado: '),AT(104,1688),USE(?String34),TRN
                         STRING(@n-5),AT(833,1688),USE(SOC:MATRICULA)
                         STRING(@s100),AT(1323,1688,6219,208),USE(SOC:NOMBRE)
                         STRING('Liquidacion Colegiado Nº: '),AT(94,1906),USE(?String43),FONT(,,,FONT:bold),TRN
                         STRING(@n-7),AT(1865,1896),USE(PAGL:SOCIOS_LIQUIDACION),FONT(,,,FONT:bold),TRN
                         LINE,AT(146,2125,7698,0),USE(?Line5),COLOR(COLOR:Black)
                         STRING('Monto Presentado'),AT(5010,2219),USE(?String25),TRN
                         STRING('Periodo'),AT(219,2219),USE(?String23),TRN
                         STRING('Obra Social'),AT(2625,2219),USE(?String24),TRN
                         STRING('Débitos'),AT(7146,2219),USE(?String26),TRN
                         LINE,AT(62,2458,7740,0),USE(?Line4),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,271),USE(?Detail)
                         STRING(@n-3),AT(42,21),USE(LIQ:MES)
                         LINE,AT(31,229,7719,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@n-5),AT(375,10),USE(LIQ:ANO)
                         STRING(@s30),AT(1823,10),USE(OBR:NOMPRE_CORTO)
                         STRING(@n$-12.2),AT(5094,10),USE(LIQ:MONTO)
                         STRING(@n$-10.2),AT(7031,10),USE(LIQ:DEBITO)
                       END
                       FOOTER,AT(229,8698,7760,2594),USE(?Footer)
                         STRING('Total Liquidación:'),AT(31,73),USE(?String8),TRN
                         STRING(@N$-12.`2),AT(1510,73),USE(LIQ:MONTO,,?LIQ:MONTO:2),LEFT(1),SUM
                         LINE,AT(1271,302,1042,0),USE(?Line9),COLOR(COLOR:Black)
                         BOX,AT(10,10,7708,52),USE(?Box2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Desc. Débitos'),AT(31,344),USE(?String14),TRN
                         STRING(@N$-10.`2),AT(1510,344),USE(LIQ:DEBITO,,?LIQ:DEBITO:2),LEFT(1),SUM
                         STRING('Desc. Pago Seguro:'),AT(31,938),USE(?String11),TRN
                         LINE,AT(1250,1958,1042,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('Desc. Cuota Solidaria:'),AT(31,542),USE(?String9),TRN
                         STRING(@N$-10.`2),AT(1510,542),USE(PAGL:GASTOS_ADM),LEFT(1)
                         STRING('Desc. Pago Cuotas:'),AT(31,740),USE(?String10),TRN
                         STRING(@N$-10.`2),AT(1510,740),USE(PAGL:CUOTA),LEFT(1)
                         STRING('Cant. Cuotas societarias  descontadas:'),AT(2271,740),USE(?String19),TRN
                         STRING(@n-3),AT(4729,740),USE(PAGL:CANT_CUOTA)
                         STRING(@N$-10.`2),AT(1510,938),USE(PAGL:SEGURO),LEFT(1)
                         STRING('Cant. Cuotas de Seguro descontadas:'),AT(2271,938),USE(?String20),TRN
                         STRING(@n-3),AT(4729,938),USE(PAGL:CANT_CUOTA_S)
                         LINE,AT(1271,1500,1042,0),USE(?Line8),COLOR(COLOR:Black)
                         STRING(@N$(12.`2)),AT(1510,1521),USE(LOC:TOTAL_PARCIAL),TRN
                         STRING('Crédito:'),AT(31,1750),USE(?String42),TRN
                         STRING(@N$-10.`2),AT(1510,1750),USE(PAGL:CREDITO)
                         STRING('Total Descuentos:'),AT(31,1521),USE(?String39),TRN
                         STRING('Desc. Imp. Deb/Cred:'),AT(31,1115),USE(?String37),TRN
                         STRING(@N$-10.`2),AT(1510,1115),USE(PAGL:MONTO_IMP_TOTAL),TRN
                         STRING('Desc. Gtos. Bancarios:'),AT(31,1292),USE(?String45),TRN
                         STRING(@N$-10.`2),AT(1510,1281,802,208),USE(PAGL:GASTOS_BANCARIOS)
                         STRING('Total Neto a Cobrar:'),AT(31,2000),USE(?String7),FONT(,12,,FONT:bold),TRN
                         STRING(@N$-12.`2),AT(1656,2010),USE(PAGL:MONTO),FONT(,12,,FONT:bold)
                         BOX,AT(10,2250,7760,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         LINE,AT(10,2323,7740,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,2354),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,2354),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,2354),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(208,198,7750,10750),USE(?Form)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_PAGO_LIQUIDACION')
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
  INIMgr.Fetch('IMPRIMIR_PAGO_LIQUIDACION',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
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
    INIMgr.Update('IMPRIMIR_PAGO_LIQUIDACION',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagName,'PAGL:FECHA')
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:IDPAGOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:IDPAGOS,RepGen:XML,TargetAttr:TagName,'PAGL:IDPAGOS')
  SELF.Attribute.Set(?PAGL:IDPAGOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagName,'String43')
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SOCIOS_LIQUIDACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SOCIOS_LIQUIDACION,RepGen:XML,TargetAttr:TagName,'PAGL:SOCIOS_LIQUIDACION')
  SELF.Attribute.Set(?PAGL:SOCIOS_LIQUIDACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagName,'LIQ:MES')
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagName,'LIQ:ANO')
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagName,'OBR:NOMPRE_CORTO')
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagName,'LIQ:MONTO')
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:DEBITO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:DEBITO,RepGen:XML,TargetAttr:TagName,'LIQ:DEBITO')
  SELF.Attribute.Set(?LIQ:DEBITO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MONTO:2,RepGen:XML,TargetAttr:TagName,'LIQ:MONTO:2')
  SELF.Attribute.Set(?LIQ:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:DEBITO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:DEBITO:2,RepGen:XML,TargetAttr:TagName,'LIQ:DEBITO:2')
  SELF.Attribute.Set(?LIQ:DEBITO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:GASTOS_ADM,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:GASTOS_ADM,RepGen:XML,TargetAttr:TagName,'PAGL:GASTOS_ADM')
  SELF.Attribute.Set(?PAGL:GASTOS_ADM,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:CUOTA,RepGen:XML,TargetAttr:TagName,'PAGL:CUOTA')
  SELF.Attribute.Set(?PAGL:CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:CANT_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:CANT_CUOTA,RepGen:XML,TargetAttr:TagName,'PAGL:CANT_CUOTA')
  SELF.Attribute.Set(?PAGL:CANT_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagName,'PAGL:SEGURO')
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:CANT_CUOTA_S,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:CANT_CUOTA_S,RepGen:XML,TargetAttr:TagName,'PAGL:CANT_CUOTA_S')
  SELF.Attribute.Set(?PAGL:CANT_CUOTA_S,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:TOTAL_PARCIAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:TOTAL_PARCIAL,RepGen:XML,TargetAttr:TagName,'LOC:TOTAL_PARCIAL')
  SELF.Attribute.Set(?LOC:TOTAL_PARCIAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagName,'String42')
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:CREDITO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:CREDITO,RepGen:XML,TargetAttr:TagName,'PAGL:CREDITO')
  SELF.Attribute.Set(?PAGL:CREDITO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:MONTO_IMP_TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:MONTO_IMP_TOTAL,RepGen:XML,TargetAttr:TagName,'PAGL:MONTO_IMP_TOTAL')
  SELF.Attribute.Set(?PAGL:MONTO_IMP_TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:GASTOS_BANCARIOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:GASTOS_BANCARIOS,RepGen:XML,TargetAttr:TagName,'PAGL:GASTOS_BANCARIOS')
  SELF.Attribute.Set(?PAGL:GASTOS_BANCARIOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:MONTO,RepGen:XML,TargetAttr:TagName,'PAGL:MONTO')
  SELF.Attribute.Set(?PAGL:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  LOC:TOTAL_PARCIAL = PAGL:MONTO - (PAGL:CREDITO + PAGL:MONTO_FACTURA)
  PRINT(RPT:Detail)
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


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_PAGO_LIQUIDACION','IMPRIMIR_PAGO_LIQUIDACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

