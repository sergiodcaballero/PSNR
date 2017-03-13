

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
                       INCLUDE('GESTION019.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION005.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_ESTADO_DEUDA_CIRCULO_IMPAGOS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(FACTURA)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:TOTAL)
                       PROJECT(FAC:IDSOCIO)
                       JOIN(PAG:FK_PAGOS_FACTURA,FAC:IDFACTURA)
                         PROJECT(PAG:ANO)
                         PROJECT(PAG:FECHA)
                         PROJECT(PAG:IDPAGOS)
                         PROJECT(PAG:MES)
                       END
                       JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         JOIN(PAG1:FK_PAGOSXCIRCULO_SOCIO,SOC:IDSOCIO)
                           PROJECT(PAG1:IDCIRCULO)
                           JOIN(CIR:PK_CIRCULO,PAG1:IDCIRCULO)
                             PROJECT(CIR:DESCRIPCION)
                           END
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2635,6250,7052),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1635),USE(?Header)
                         IMAGE('Logo.JPG'),AT(10,42,1583,948),USE(?Image1)
                         STRING('INFORME ESTADO DE DEUDA POR DISTRITO'),AT(1656,813),USE(?String1),FONT(,,,FONT:bold+FONT:underline), |
  TRN
                         STRING(@s50),AT(1240,1052,3771,208),USE(CIR:DESCRIPCION)
                         STRING(@n-5),AT(5375,1333),USE(GLO:ANO_HASTA),RIGHT(1)
                         STRING('PERIODO HASTA:'),AT(3667,1333),USE(?String33),TRN
                         STRING(@n-5),AT(4833,1333),USE(GLO:MES_HASTA),RIGHT(1)
                         STRING('PERIODO DESDE:'),AT(302,1333),USE(?String32),TRN
                         STRING(@n-5),AT(1500,1333),USE(GLO:MES)
                         STRING(@n-5),AT(2000,1333),USE(GLO:ANO)
                         LINE,AT(10,1604,6229,0),USE(?Line1),COLOR(COLOR:Black)
                       END
break1                 BREAK(SOC:IDSOCIO),USE(?BREAK1)
                         HEADER,AT(0,0,,323),USE(?GROUPHEADER1)
                           STRING('Nº SOCIO:'),AT(21,21),USE(?String33:2),TRN
                           STRING(@n-7),AT(813,21),USE(SOC:IDSOCIO)
                           STRING('MATRICULA:'),AT(1510,21),USE(?String34),TRN
                           STRING(@s7),AT(2438,21),USE(SOC:MATRICULA)
                           STRING('NOMBRE:'),AT(3156,21),USE(?String35),TRN
                           STRING(@s30),AT(3948,21),USE(SOC:NOMBRE)
                           LINE,AT(10,281,6219,0),USE(?Line4),COLOR(COLOR:Black)
                         END
detail1                  DETAIL,AT(0,0,,552),USE(?DETAIL1)
                           STRING('Nº  RECIBO S.:'),AT(42,21),USE(?String10),TRN
                           STRING(@n-7),AT(1021,21),USE(FAC:IDFACTURA),RIGHT(1)
                           STRING(@n-5),AT(3906,21),USE(FAC:ANO),RIGHT(1)
                           STRING('MES:'),AT(2552,31),USE(?String13),TRN
                           STRING(@n-3),AT(2948,31),USE(FAC:MES),RIGHT(1)
                           STRING('AÑO:'),AT(3594,31),USE(?String14),TRN
                           STRING('TOTAL REC:'),AT(4469,31),USE(?String15),TRN
                           STRING(@n$-10.2),AT(5281,31),USE(FAC:TOTAL)
                           STRING('Nº PAGO:'),AT(42,313),USE(?String28),TRN
                           STRING(@n-7),AT(719,313),USE(PAG:IDPAGOS)
                           STRING('MES:'),AT(2125,313),USE(?String29),TRN
                           STRING(@s2),AT(2552,313),USE(PAG:MES)
                           STRING('AÑO:'),AT(3198,313),USE(?String30),TRN
                           STRING(@s4),AT(3719,313),USE(PAG:ANO)
                           STRING('FECHA:'),AT(4927,313),USE(?String31),TRN
                           STRING(@d17),AT(5479,313),USE(PAG:FECHA)
                           LINE,AT(10,521,6229,0),USE(?Line1:2),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,302),USE(?GROUPFOOTER1)
                           STRING('CANT. POR COLEGIADO:'),AT(21,21),USE(?String36),TRN
                           STRING(@n-7),AT(1635,21),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:3),RIGHT(1),CNT,RESET(break1)
                           STRING(@n$-10.2),AT(4469,0),USE(FAC:TOTAL,,?FAC:TOTAL:3),SUM,RESET(break1)
                           STRING('MONTO POR COLEGIADO:'),AT(2729,0),USE(?String38),TRN
                           BOX,AT(10,229,6688,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         END
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         STRING('CANT. REG. :'),AT(10,0),USE(?String17),TRN
                         STRING('MONTO TOTAL:'),AT(3604,10),USE(?String18),TRN
                         STRING(@n$-10.2),AT(4813,10,698,208),USE(FAC:TOTAL,,?FAC:TOTAL:2),SUM
                         LINE,AT(10,260,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,302),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,302),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,302),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                         STRING(@n-14),AT(875,10),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:2),CNT,TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

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
  GlobalErrors.SetProcedureName('IMPRIMIR_ESTADO_DEUDA_CIRCULO_IMPAGOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:IDSOCIO',GLO:IDSOCIO)                          ! Added by: Report
  BIND('GLO:PERIODO',GLO:PERIODO)                          ! Added by: Report
  BIND('GLO:PERIODO_HASTA',GLO:PERIODO_HASTA)              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_ESTADO_DEUDA_CIRCULO_IMPAGOS',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.AppendOrder('SOC:NOMBRE')
  ThisReport.SetFilter('PAG1:IDCIRCULO = GLO:IDSOCIO  AND FAC:ESTADO = ''''  AND  FAC:PERIODO >= GLO:PERIODO  AND FAC:PERIODO <<= GLO:PERIODO_HASTA')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:FACTURA.SetQuickScan(1,Propagate:OneMany)
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
    Relate:FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_ESTADO_DEUDA_CIRCULO_IMPAGOS',ProgressWindow) ! Save window data to non-volatile store
  END
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
  SELF.Attribute.Set(?CIR:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CIR:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'CIR:DESCRIPCION')
  SELF.Attribute.Set(?CIR:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:ANO_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:ANO_HASTA,RepGen:XML,TargetAttr:TagName,'GLO:ANO_HASTA')
  SELF.Attribute.Set(?GLO:ANO_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagName,'String33')
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:MES_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:MES_HASTA,RepGen:XML,TargetAttr:TagName,'GLO:MES_HASTA')
  SELF.Attribute.Set(?GLO:MES_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:MES,RepGen:XML,TargetAttr:TagName,'GLO:MES')
  SELF.Attribute.Set(?GLO:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:ANO,RepGen:XML,TargetAttr:TagName,'GLO:ANO')
  SELF.Attribute.Set(?GLO:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33:2,RepGen:XML,TargetAttr:TagName,'String33:2')
  SELF.Attribute.Set(?String33:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO')
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA')
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagName,'FAC:ANO')
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagName,'FAC:MES')
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagName,'FAC:TOTAL')
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagName,'PAG:IDPAGOS')
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagName,'PAG:MES')
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagName,'PAG:ANO')
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagName,'PAG:FECHA')
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA:3')
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:TOTAL:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:TOTAL:3,RepGen:XML,TargetAttr:TagName,'FAC:TOTAL:3')
  SELF.Attribute.Set(?FAC:TOTAL:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:TOTAL:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:TOTAL:2,RepGen:XML,TargetAttr:TagName,'FAC:TOTAL:2')
  SELF.Attribute.Set(?FAC:TOTAL:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA:2')
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_ESTADO_DEUDA_SOCIO_PAGOS','IMPRIMIR_ESTADO_DEUDA_SOCIO_PAGOS','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the LIQUIDACION_INFORME File
!!! </summary>
LIQUIDACION_EMAIL_21 PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::6:TAGFLAG          BYTE(0)
DASBRW::6:TAGMOUSE         BYTE(0)
DASBRW::6:TAGDISPSTATUS    BYTE(0)
DASBRW::6:QUEUE           QUEUE
PUNTERO                       LIKE(PUNTERO)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
T                    STRING(20)                            ! 
LOC:PARA             CSTRING(255)                          ! 
LOC:ASUNTO           CSTRING(255)                          ! 
LOC:CUERPO           CSTRING(10000)                        ! 
LOC:ATTACH           CSTRING(255)                          ! 
LOC:HANDLE           LONG                                  ! 
LOC:OP               CSTRING(255)                          ! 
LOC:FILE             CSTRING(255)                          ! 
LOC:PATH             CSTRING(255)                          ! 
LOC:PARAM            CSTRING(255)                          ! 
LOC:SHOW             LONG                                  ! 
LOC:RETHANDLE        LONG                                  ! 
EmailServer          STRING(80)                            ! 
EmailPort            USHORT                                ! 
EmailFrom            STRING(255)                           ! 
EmailTo              STRING(1024)                          ! 
EmailSubject         STRING(255)                           ! 
EmailCC              STRING(1024)                          ! 
EmailBCC             STRING(1024)                          ! 
EmailFileList        STRING(1024)                          ! 
EmailMessageText     STRING(16384)                         ! 
MessageHTML          STRING(255)                           ! 
LOC:MENSAJE1         STRING(200)                           ! 
LOC:MENSAJE2         STRING(300)                           ! 
LOC:MENSAJE3         STRING(300)                           ! 
LOC:MENSAJE4         STRING(500)                           ! 
loc:cantidad         LONG                                  ! 
LOC:PARAE            CSTRING(10000)                        ! 
BRW1::View:Browse    VIEW(LIQUIDACION_INFORME)
                       PROJECT(LIQINF:IDSOCIO)
                       PROJECT(LIQINF:NOMBRE)
                       PROJECT(LIQINF:EMAIL)
                       PROJECT(LIQINF:DESC_OS)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
LIQINF:IDSOCIO         LIKE(LIQINF:IDSOCIO)           !List box control field - type derived from field
LIQINF:NOMBRE          LIKE(LIQINF:NOMBRE)            !List box control field - type derived from field
LIQINF:EMAIL           LIKE(LIQINF:EMAIL)             !List box control field - type derived from field
LIQINF:DESC_OS         LIKE(LIQINF:DESC_OS)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Informe de Liquidación'),AT(,,355,238),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('LIQUIDACION_EMAIL_2'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('13L(1)|M@s1@41L(1)|M~IDSOCIO~C(0)' & |
  '@n-7@80L(2)|M~NOMBRE~@s100@80L(2)|M~EMAIL~@s100@32L(2)|M~CANT~L(0)@n-7.2@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de LIQUIDACION_INFORME')
                       BUTTON('&Marcar'),AT(6,178,63,13),USE(?DASTAG)
                       BUTTON('Marcar Todo'),AT(73,178,63,13),USE(?DASTAGAll)
                       BUTTON('&Desmarcar Todo'),AT(140,178,63,13),USE(?DASUNTAGALL)
                       BUTTON('&Rev tags'),AT(218,211,50,13),USE(?DASREVTAG),DISABLE,HIDE
                       BUTTON('Mostrar Marcados'),AT(207,178,63,13),USE(?DASSHOWTAG)
                       PROMPT('Cantidad:'),AT(8,158),USE(?loc:cantidad:Prompt)
                       ENTRY(@n-14),AT(39,158,60,10),USE(loc:cantidad),RIGHT(1),TRN
                       BUTTON('Enviar Liquidación'),AT(10,210,102,19),USE(?Button2),LEFT,ICON(ICON:Connect),FLAT
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                         END
                       END
                       BUTTON('&Salir'),AT(306,223,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::6:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = LIQINF:IDSOCIO
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = LIQINF:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::6:TAGMOUSE = 1 THEN
    DASBRW::6:TAGMOUSE = 0
  ELSE
  DASBRW::6:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::6:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = LIQINF:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::6:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::6:QUEUE = TAGS
    ADD(DASBRW::6:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::6:QUEUE.PUNTERO = LIQINF:IDSOCIO
     GET(DASBRW::6:QUEUE,DASBRW::6:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = LIQINF:IDSOCIO
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASSHOWTAG Routine
   CASE DASBRW::6:TAGDISPSTATUS
   OF 0
      DASBRW::6:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Mostrar Seleccionado'
      ?DASSHOWTAG{PROP:Msg}  = 'Mostrar Seleccionado'
      ?DASSHOWTAG{PROP:Tip}  = 'Mostrar Seleccionado'
   OF 1
      DASBRW::6:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Mostrar No Seleccionado'
      ?DASSHOWTAG{PROP:Msg}  = 'Mostrar No Seleccionado'
      ?DASSHOWTAG{PROP:Tip}  = 'Mostrar No Seleccionado'
   OF 2
      DASBRW::6:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Mostrar Todo'
      ?DASSHOWTAG{PROP:Msg}  = 'Mostrar Todo'
      ?DASSHOWTAG{PROP:Tip}  = 'Mostrar Todo'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW1.ResetSort(1)
   SELECT(?Browse:1,CHOICE(?Browse:1))
   EXIT
!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
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
  GlobalErrors.SetProcedureName('LIQUIDACION_EMAIL_21')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('LIQINF:DESC_OS',LIQINF:DESC_OS)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:EMAILS.Open                                       ! File EMAILS used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION_INFORME.Open                          ! File LIQUIDACION_INFORME used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LIQUIDACION_INFORME,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,LIQINF:PK_LIQUIDACION_INFORME)        ! Add the sort order for LIQINF:PK_LIQUIDACION_INFORME for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,LIQINF:IDSOCIO,,BRW1)          ! Initialize the browse locator using  using key: LIQINF:PK_LIQUIDACION_INFORME , LIQINF:IDSOCIO
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(LIQINF:IDSOCIO,BRW1.Q.LIQINF:IDSOCIO)      ! Field LIQINF:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(LIQINF:NOMBRE,BRW1.Q.LIQINF:NOMBRE)        ! Field LIQINF:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(LIQINF:EMAIL,BRW1.Q.LIQINF:EMAIL)          ! Field LIQINF:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(LIQINF:DESC_OS,BRW1.Q.LIQINF:DESC_OS)      ! Field LIQINF:DESC_OS is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_EMAIL_21',QuickWindow)         ! Restore window settings from non-volatile store
  global:firsttime = 1
  EmailServer  = clip(SMTP)
  EmailPort    = PUERTO
  EmailFrom    = clip(GLO:MAILEMP)
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  FREE(TAGS)
  ?DASSHOWTAG{PROP:Text} = 'Mostrar Todo'
  ?DASSHOWTAG{PROP:Msg}  = 'Mostrar Todo'
  ?DASSHOWTAG{PROP:Tip}  = 'Mostrar Todo'
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  ?Browse:1{Prop:Alrt,239} = SpaceKey
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
  FREE(TAGS)
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
    Relate:EMAILS.Close
    Relate:LIQUIDACION_INFORME.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_EMAIL_21',QuickWindow)      ! Save window data to non-volatile store
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
    OF ?Button2
      IF REPORTE_LARGO = 'EMAILSEGURO' THEN 
          SUB" = 'Seguro'
          limite" = '2 (DOS) CUOTAS AUTOMATICAMENTE se le dara de baja al Seguro (CIRCULAR Nro 1)'
      ELSE 
          SUB" = 'Matrícula'
          limite" = '6 (DOS) CUOTAS, NO ESTARÁ EN EL PADRÓN DE PROFESIONALES'
      end     
          
      
      EmailSubject =  'Informe de Estado de Deuda de '&SUB"&' - Colegio de Psicólogos del Valle Inferior de Rió Negro'
      EmailFileList = CLIP(LOC:ATTACH)
      
      ! Carga tabla  con los tags
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          LIQINF:IDSOCIO = tags:Puntero
          If NOT Access:LIQUIDACION_INFORME.Fetch(LIQINF:PK_LIQUIDACION_INFORME)  then
                 loc:mensaje1= 'Estimado Colegiado/a '&clip(LIQINF:NOMBRE)&': por la presente, hacemos entrega del Informe de Estado de Deuda de su '&SUB"&' Profesional a la fecha.'
                 LOC:MENSAJE2 = 'Total de Deuda:'&format(LIQINF:MONTO,@n$-13.2)&Chr(13)&Chr(10)&Chr(13)&Chr(10)
                 LOC:MENSAJE3 = 'Lo esperamos en la sede del Colegio para regularizar su situación con la tesorería. De haber realizado el pago parcial o total de la deuda, ya sea por depósito o transferencia bancaria, por favor informar por correo electrónico adjunto el comprobante para emitir el recibo.'
                 LOC:MENSAJE4 = 'Saludos Colegio de Psicólogos del Valle Inferior de Río Negro'
                 EmailMessageText = clip(loc:mensaje1)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&clip(LIQINF:MENSAJE)&Chr(13)&Chr(10)&clip(LOC:MENSAJE2)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&clip(LOC:MENSAJE3)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&clip(LOC:MENSAJE4)
                 EmailTo= clip(LIQINF:EMAIL)
                 cantidad# = cantidad# + 1
                 SendEmail(EmailServer, EmailPort, EmailFrom, EmailTo, EmailSubject, EmailCC, EmailBcc, EmailFileList, EmailMessageText)
                 IF NOT ERRORCODE() THEN
                  !!!!
                 END
                 LOC:PARAE = LOC:PARAE&';'&CLip(LIQINF:EMAIL)
         end
      
      End
      !!! GUARDA EL EMAIL
      EML:PARA       = LOC:PARAE
      EML:TITULO     = EmailSubject
      EML:MENSAJE    = EmailMessageText
      EML:ADJUNTO    = LOC:ATTACH
      EML:FECHA      = today()
      EML:HORA       = clock()
      ACCESS:EMAILS.INSERT()
      !! MARCA EMAIL ENVIADO
      
      MESSAGE('SE ENVIARON '&CANTIDAD#&' DE E-MAILS')
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  CASE FIELD()
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:PreAlertKey
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF Keycode() = SpaceKey
         POST(EVENT:Accepted,?DASTAG)
         CYCLE
      END
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?Browse:1
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::6:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::6:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::6:TAGFLAG = 0
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


BRW1.ResetFromView PROCEDURE

loc:cantidad:Cnt     LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:LIQUIDACION_INFORME.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    loc:cantidad:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  loc:cantidad = loc:cantidad:Cnt
  PARENT.ResetFromView
  Relate:LIQUIDACION_INFORME.SetQuickScan(0)
  SETCURSOR()


BRW1.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = LIQINF:IDSOCIO
     GET(TAGS,TAGS.PUNTERO)
    IF ERRORCODE()
      T = ''
    ELSE
      T = '*'
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  PARENT.SetQueueRecord()      !FIX FOR CFW 4 (DASTAG)
  PARENT.SetQueueRecord


BRW1.TakeKey PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  IF Keycode() = SpaceKey
    RETURN ReturnValue
  END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue = PARENT.TakeKey()
  RETURN ReturnValue


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  IF BRW1::RecordStatus NOT=Record:OK THEN RETURN BRW1::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = LIQINF:IDSOCIO
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::6:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW1::RecordStatus
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
Liquidacion_reporte_111 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SEGURO_FACTURA)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,IMM,MDI,SYSTEM,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('Liquidacion_reporte_111')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:PERIODO',GLO:PERIODO)                          ! Added by: Process
  BIND('GLO:PERIODO_HASTA',GLO:PERIODO_HASTA)              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LIQUIDACION_INFORME.Open                          ! File LIQUIDACION_INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SEGURO.Open                                       ! File SEGURO used by this procedure, so make sure it's RelationManager is open
  Relate:SEGURO_FACTURA.Open                               ! File SEGURO_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Liquidacion_reporte_111',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:SEGURO_FACTURA, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('SEG5:ESTADO = ''''  AND SEG5:PERIODO >= GLO:PERIODO  AND SEG5:PERIODO <<= GLO:PERIODO_HASTA')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SEGURO_FACTURA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION_INFORME.Close
    Relate:RANKING.Close
    Relate:SEGURO.Close
    Relate:SEGURO_FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Liquidacion_reporte_111',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  LIQUIDACION_EMAIL_21()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GLO:IDSOCIO = SEG5:IDSOCIO
  !!! DISPARA SQL
  MES# = MONTH(FECHA_DESDE)
  PERIODO" = clip(YEAR(FECHA_DESDE)&FORMAT(MES#,@N02))
  MES# = MONTH(FECHA_HASTA)
  PERIODO2" = clip(YEAR(FECHA_HASTA)&FORMAT(MES#,@N02))
  
  RAN:C1 = ''
  RANKING{PROP:SQL} = 'DELETE FROM RANKING'
  RANKING{PROP:SQL} = 'SELECT COUNT(seguro_FACTURA.IDSOCIO)FROM seguro_FACTURA WHERE seguro_FACTURA.estado = ''''  AND  seguro_FACTURA.PERIODO > '''&PERIODO"&'''  AND seguro_FACTURA.PERIODO < '''&PERIODO2"&'''  AND seguro_FACTURA.idsocio = '''&GLO:IDSOCIO&''' GROUP BY seguro_FACTURA.IDSOCIO'
  NEXT(RANKING)
  CANTIDAD# = RAN:C1
  
  IF CANTIDAD# > 1 THEN !!! eL CONTROL DE CUOTA  
      LIQINF:IDSOCIO = SEG5:IDSOCIO
      GET(LIQUIDACION_INFORME,LIQINF:PK_LIQUIDACION_INFORME)
      IF ERRORCODE() = 35 THEN
          !!! NO ENCONTRO REGISTRO
          SOC:IDSOCIO = SEG5:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          LIQINF:NOMBRE =  SOC:NOMBRE
          if  SOC:BAJA = 'NO' and SOC:BAJA_TEMPORARIA = 'NO' then   !!! controla que sea activos
             IF SOC:EMAIL = '' THEN
                  LIQINF:EMAIL  =  GLO:MAILEMP
              ELSE
                  LIQINF:EMAIL  = SOC:EMAIL
              END
              !!!! busco si estas activo.- 
              SEG:IDSOCIO = SOC:IDSOCIO
              ACCESS:SEGURO.TRYFETCH(SEG:FK_SEGURO_SOCIOS)
              IF SEG:BAJA = 'NO' THEN 
                  !!!!!!
                  LIQINF:MONTO             =  SEG5:TOTAL
                  LIQINF:DESC_OS           = CANTIDAD#
                  LIQINF:DEBITO            =  0
                  LIQINF:SEGURO            =  0
                  LIQINF:DEBITO_COMISION   =  0
                  LIQINF:DEBITO_PAGO_CUOTA =  0
                  LIQINF:MONTO_TOTAL       =  0
                  !! saca Os
                  LIQINF:MENSAJE           =  'Período Adeudado Seguro:'&clip(SEG5:MES)&'-'&clip(SEG5:ANO)&', Monto'&format(SEG5:TOTAL,@n$-13.2)&Chr(13)&Chr(10)           !', Monto: $'&LIQ:MONTO_TOTAL&Chr(13)&Chr(10)
                  ACCESS:LIQUIDACION_INFORME.INSERT()
              END     
         end
      ELSE
          LIQINF:MONTO             = LIQINF:MONTO + SEG5:TOTAL
          LIQINF:MENSAJE           = LIQINF:MENSAJE&'Período Adeudado Seguro:'&clip(SEG5:MES)&'-'&clip(SEG5:ANO)&', Monto'&format(SEG5:TOTAL,@n$-13.2)&Chr(13)&Chr(10)           !', Monto: $'&LIQ:MONTO_TOTAL&Chr(13)&Chr(10)
          
          ACCESS:LIQUIDACION_INFORME.UPDATE()
      END
  END
  REPORTE_LARGO = 'EMAILSEGURO'
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
ESTADO_DEUDA_EMAIL1 PROCEDURE 

QuickWindow          WINDOW('Reporte de Pagos de Liquidaciones'),AT(,,260,83),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Liquidaciones_pagos_informe'),SYSTEM
                       PROMPT('FECHA DESDE:'),AT(1,14),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(56,14,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(128,14),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(184,14,60,10),USE(FECHA_HASTA),RIGHT(1)
                       BUTTON('&Dudas Cuotas'),AT(22,48,57,18),USE(?Ok),LEFT,ICON(ICON:Print1),CURSOR('mano.cur'), |
  FLAT,MSG('Acepta Operacion'),TIP('Acepta Operacion')
                       BUTTON('&Cancelar'),AT(189,50,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       BUTTON('&Dudas Seguro'),AT(99,48,57,18),USE(?Ok:2),LEFT,ICON(ICON:Print1),CURSOR('mano.cur'), |
  FLAT,MSG('Acepta Operacion'),TIP('Acepta Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('ESTADO_DEUDA_EMAIL1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
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
  Relate:LIQUIDACION_INFORME.Open                          ! File LIQUIDACION_INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ESTADO_DEUDA_EMAIL1',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION_INFORME.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ESTADO_DEUDA_EMAIL1',QuickWindow)       ! Save window data to non-volatile store
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
    OF ?Ok
      MESD# = MONTH(FECHA_DESDE)
      ANOD# = YEAR(FECHA_DESDE)
      GLO:PERIODO =  FORMAT(ANOD#,@N04)&FORMAT(MESD#,@N02)
      
      MESH# = MONTH(FECHA_HASTA)
      ANOH# = YEAR(FECHA_HASTA)
      GLO:PERIODO_HASTA =  FORMAT(ANOH#,@N04)&FORMAT(MESH#,@N02)
      LIQUIDACION_INFORME{PROP:SQL} = 'DELETE FROM LIQUIDACION_INFORME'
      REPORTE_LARGO = ''
      
    OF ?Ok:2
      MESD# = MONTH(FECHA_DESDE)
      ANOD# = YEAR(FECHA_DESDE)
      GLO:PERIODO =  FORMAT(ANOD#,@N04)&FORMAT(MESD#,@N02)
      
      MESH# = MONTH(FECHA_HASTA)
      ANOH# = YEAR(FECHA_HASTA)
      GLO:PERIODO_HASTA =  FORMAT(ANOH#,@N04)&FORMAT(MESH#,@N02)
      LIQUIDACION_INFORME{PROP:SQL} = 'DELETE FROM LIQUIDACION_INFORME'
      REPORTE_LARGO = 'EMAILSEGURO'
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Ok
      ThisWindow.Update()
      START(Liquidacion_reporte_11, 25000)
      ThisWindow.Reset
    OF ?Ok:2
      ThisWindow.Update()
      START(Liquidacion_reporte_111, 25000)
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
!!! Generated from procedure template - Process
!!! </summary>
Liquidacion_reporte_11 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,IMM,MDI,SYSTEM,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('Liquidacion_reporte_11')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:PERIODO',GLO:PERIODO)                          ! Added by: Process
  BIND('GLO:PERIODO_HASTA',GLO:PERIODO_HASTA)              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION_INFORME.Open                          ! File LIQUIDACION_INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Liquidacion_reporte_11',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:IDSOCIO)
  ThisProcess.AddSortOrder(FAC:FK_FACTURA_SOCIO)
  ThisProcess.SetFilter('FAC:ESTADO = ''''  AND FAC:PERIODO >= GLO:PERIODO  AND FAC:PERIODO <<= GLO:PERIODO_HASTA')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
    Relate:LIQUIDACION_INFORME.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Liquidacion_reporte_11',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  LIQUIDACION_EMAIL_21()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GLO:IDSOCIO = FAC:IDSOCIO
  !!! DISPARA SQL
  MES# = MONTH(FECHA_DESDE)
  PERIODO" = clip(YEAR(FECHA_DESDE)&FORMAT(MES#,@N02))
  MES# = MONTH(FECHA_HASTA)
  PERIODO2" = clip(YEAR(FECHA_HASTA)&FORMAT(MES#,@N02))
  
  RAN:C1 = ''
  RANKING{PROP:SQL} = 'DELETE FROM RANKING'
  RANKING{PROP:SQL} = 'SELECT COUNT(FACTURA.IDSOCIO)FROM FACTURA WHERE FACTURA.estado = ''''  AND  FACTURA.PERIODO > '''&PERIODO"&'''  AND FACTURA.PERIODO < '''&PERIODO2"&'''  AND FACTURA.idsocio = '''&GLO:IDSOCIO&''' GROUP BY FACTURA.IDSOCIO'
  NEXT(RANKING)
  CANTIDAD# = RAN:C1
  
  IF CANTIDAD# > GLO:CANTIDAD_CUOTAS THEN !!! eL CONTROL DE CUOTA  
      LIQINF:IDSOCIO = FAC:IDSOCIO
      GET(LIQUIDACION_INFORME,LIQINF:PK_LIQUIDACION_INFORME)
      IF ERRORCODE() = 35 THEN
          !!! NO ENCONTRO REGISTRO
          SOC:IDSOCIO = FAC:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          LIQINF:NOMBRE =  SOC:NOMBRE
          if  SOC:BAJA = 'NO' and SOC:BAJA_TEMPORARIA = 'NO' then   !!! controla que sea activos
             IF SOC:EMAIL = '' THEN
                  LIQINF:EMAIL  =  GLO:MAILEMP
              ELSE
                  LIQINF:EMAIL  = SOC:EMAIL
              END
              !!!!!!
              LIQINF:MONTO             =  FAC:TOTAL
              LIQINF:DESC_OS           = CANTIDAD#
              LIQINF:DEBITO            =  0
              LIQINF:SEGURO            =  0
              LIQINF:DEBITO_COMISION   =  0
              LIQINF:DEBITO_PAGO_CUOTA =  0
              LIQINF:MONTO_TOTAL       =  0
              !! saca Os
              LIQINF:MENSAJE           =  'Período Adeudado:'&clip(FAC:MES)&'-'&clip(FAC:ANO)&', Monto'&format(FAC:TOTAL,@n$-13.2)&Chr(13)&Chr(10)           !', Monto: $'&LIQ:MONTO_TOTAL&Chr(13)&Chr(10)
              ACCESS:LIQUIDACION_INFORME.INSERT()
         end
      ELSE
          LIQINF:MONTO             = LIQINF:MONTO + FAC:TOTAL
          LIQINF:MENSAJE           = LIQINF:MENSAJE&'Período Adeudado:'&clip(FAC:MES)&'-'&clip(FAC:ANO)&', Monto'&format(FAC:TOTAL,@n$-13.2)&Chr(13)&Chr(10)           !', Monto: $'&LIQ:MONTO_TOTAL&Chr(13)&Chr(10)
          ! LIQINF:MENSAJE           = LIQINF:MENSAJE&clip(FAC:MES)&'-'&clip(FAC:ANO)&','
          ACCESS:LIQUIDACION_INFORME.UPDATE()
      END
  END
  RETURN ReturnValue


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the RANKING File
!!! </summary>
DEUDA3 PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(RANKING)
                       PROJECT(RAN:C2)
                       PROJECT(RAN:C3)
                       PROJECT(RAN:C4)
                       PROJECT(RAN:C5)
                       PROJECT(RAN:C6)
                       PROJECT(RAN:C7)
                       PROJECT(RAN:C1)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RAN:C2                 LIKE(RAN:C2)                   !List box control field - type derived from field
RAN:C3                 LIKE(RAN:C3)                   !List box control field - type derived from field
RAN:C4                 LIKE(RAN:C4)                   !List box control field - type derived from field
RAN:C5                 LIKE(RAN:C5)                   !List box control field - type derived from field
RAN:C6                 LIKE(RAN:C6)                   !List box control field - type derived from field
RAN:C7                 LIKE(RAN:C7)                   !List box control field - type derived from field
RAN:C1                 LIKE(RAN:C1)                   !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Estado de Deuda de los Colegiados'),AT(,,449,305),FONT('Arial',8,,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('DEUDA3'),SYSTEM
                       LIST,AT(6,39,434,231),USE(?Browse:1),HVSCROLL,FORMAT('25L(2)|M~MAT~@s5@168L(2)|M~NOMBRE' & |
  '~@s50@80C(2)|M~CANTIDAD CUOTAS~L@N3@60C(2)|M~MONTO CUOTA~L@N$-12.1@89C(2)|M~CUOTAS C' & |
  'ONV A PAGAR~L@N3@89C(2)|M~MONTO CONV A PAGAR~L@N$-12.1@80L(2)|M~IDSOCIO~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de RANKING'),VCR
                       BUTTON('&Filtro'),AT(5,281,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(51,282,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,441,273),USE(?CurrentTab)
                         TAB('NOMBRE'),USE(?Tab:1)
                           PROMPT('NOMBRE:'),AT(7,24),USE(?RAN:C3:Prompt)
                           ENTRY(@s50),AT(36,23,235,10),USE(RAN:C3)
                         END
                         TAB('MATRICULA'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(398,287,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist6 QUEUE,PRE(QHL6)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar6 QUEUE,PRE(Q6)
FieldPar                 CSTRING(800)
                         END
QPar26 QUEUE,PRE(Qp26)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado6          STRING(100)
Loc::Titulo6          STRING(100)
SavPath6          STRING(2000)
Evo::Group6  GROUP,PRE()
Evo::Procedure6          STRING(100)
Evo::App6          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE5                 QueryListClass                        ! QBE List Class. 
QBV5                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_6  SHORT
Gol_woI_6 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_6),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_6),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_6),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_6),TRN
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
PrintExBrowse6 ROUTINE

 OPEN(Gol_woI_6)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_6 = BRW1.FileLoaded
 IF Not  EC::LoadI_6
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_6)
 SETCURSOR()
  Evo::App6          = 'Gestion'
  Evo::Procedure6          = GlobalErrors.GetProcedureName()& 6
 
  FREE(QPar6)
  Q6:FieldPar  = '1,2,3,4,5,6,7,'
  ADD(QPar6)  !!1
  Q6:FieldPar  = ';'
  ADD(QPar6)  !!2
  Q6:FieldPar  = 'Spanish'
  ADD(QPar6)  !!3
  Q6:FieldPar  = ''
  ADD(QPar6)  !!4
  Q6:FieldPar  = true
  ADD(QPar6)  !!5
  Q6:FieldPar  = ''
  ADD(QPar6)  !!6
  Q6:FieldPar  = true
  ADD(QPar6)  !!7
 !!!! Exportaciones
  Q6:FieldPar  = 'HTML|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'EXCEL|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'WORD|'
  Q6:FieldPar  = CLIP( Q6:FieldPar)&'ASCII|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'XML|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'PRT|'
  ADD(QPar6)  !!8
  Q6:FieldPar  = 'All'
  ADD(QPar6)   !.9.
  Q6:FieldPar  = ' 0'
  ADD(QPar6)   !.10
  Q6:FieldPar  = 0
  ADD(QPar6)   !.11
  Q6:FieldPar  = '1'
  ADD(QPar6)   !.12
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.13
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.14
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.15
 
   Q6:FieldPar  = '16'
  ADD(QPar6)   !.16
 
   Q6:FieldPar  = 1
  ADD(QPar6)   !.17
   Q6:FieldPar  = 2
  ADD(QPar6)   !.18
   Q6:FieldPar  = '2'
  ADD(QPar6)   !.19
   Q6:FieldPar  = 12
  ADD(QPar6)   !.20
 
   Q6:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar6)   !.21
 
   Q6:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar6)   !.22
 
   CLEAR(Q6:FieldPar)
  ADD(QPar6)   ! 23 Caracteres Encoding para xml
 
  Q6:FieldPar  = '0'
  ADD(QPar6)   ! 24 Use Open Office
 
   Q6:FieldPar  = 'golmedo'
  ADD(QPar6) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q6:FieldPar  = ' BrowseExport'
  ADD(QPar6)   ! 26  BrowseExport
  Q6:FieldPar  = ' '
  ADD(QPar6)   ! 27  
  Q6:FieldPar  = ' ' 
  ADD(QPar6)   ! 28  
  Q6:FieldPar  = 'BEXPORT' 
  ADD(QPar6)   ! 29 Gestion019.clw
 !!!!!
 
 
  FREE(QPar26)
       Qp26:F2N  = 'MAT'
  Qp26:F2P  = '@s5'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'NOMBRE'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'DIR LABORAL'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'TE LABORAL'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'SOCIAL'
  Qp26:F2P  = '@N2'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'CONVENIO CAIDO'
  Qp26:F2P  = '@s2'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'IDSOCIO'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
  SysRec# = false
  FREE(Loc::QHlist6)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar26,SysRec#)
         QHL6:Id      = SysRec#
         QHL6:Nombre  = Qp26:F2N
         QHL6:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL6:Pict    = Qp26:F2P
         QHL6:Tot    = Qp26:F2T
         ADD(Loc::QHlist6)
      Else
        break
     END
  END
  Loc::Titulo6 ='LISTADO DE ESTADO DE DEUDA DE COLEGIADOS '
 
 SavPath6 = PATH()
  Exportar(Loc::QHlist6,BRW1.Q,QPar6,0,Loc::Titulo6,Evo::Group6)
 IF Not EC::LoadI_6 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath6)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('DEUDA3')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:RANKING,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE5.Init(QBV5, INIMgr,'DEUDA3', GlobalErrors)
  QBE5.QkSupport = True
  QBE5.QkMenuIcon = 'QkQBE.ico'
  QBE5.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,RAN:IDX_C2)                           ! Add the sort order for RAN:IDX_C2 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,RAN:C2,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C2 , RAN:C2
  BRW1.AddSortOrder(,RAN:IDX_C3)                           ! Add the sort order for RAN:IDX_C3 for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?RAN:C3,RAN:C3,,BRW1)           ! Initialize the browse locator using ?RAN:C3 using key: RAN:IDX_C3 , RAN:C3
  BRW1.AddField(RAN:C2,BRW1.Q.RAN:C2)                      ! Field RAN:C2 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C3,BRW1.Q.RAN:C3)                      ! Field RAN:C3 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C4,BRW1.Q.RAN:C4)                      ! Field RAN:C4 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C5,BRW1.Q.RAN:C5)                      ! Field RAN:C5 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C6,BRW1.Q.RAN:C6)                      ! Field RAN:C6 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C7,BRW1.Q.RAN:C7)                      ! Field RAN:C7 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C1,BRW1.Q.RAN:C1)                      ! Field RAN:C1 is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('DEUDA3',QuickWindow)                       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE5,1)
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
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('DEUDA3',QuickWindow)                    ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse6
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
!!! </summary>
DEUDAS PROCEDURE 

Window               WINDOW('Estado de Deuda de Socios '),AT(,,222,109),FONT('Arial',8,,FONT:bold),GRAY,MDI
                       BUTTON('&Generar Listado de Padrón con Deudas TOTALES'),AT(17,5,188,28),USE(?OkButton),LEFT, |
  ICON(ICON:NextPage),DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(78,53,67,17),USE(?CancelButton),LEFT,ICON('salir.ico'),FLAT
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
  GlobalErrors.SetProcedureName('DEUDAS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SQL.Open                                          ! File SQL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('DEUDAS',Window)                            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
    Relate:SQL.Close
  END
  IF SELF.Opened
    INIMgr.Update('DEUDAS',Window)                         ! Save window data to non-volatile store
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
      DISABLE(?OkButton)
      DISABLE(?CancelButton)
      SQL{PROP:SQL} = 'DELETE FROM RANKING'
      SQL{PROP:SQL} = 'SELECT SOCIOS.idsocio, SOCIOS.matricula, SOCIOS.nombre, COUNT(FACTURA.IDSOCIO), sum (FACTURA.TOTAL) FROM SOCIOS, FACTURA WHERE SOCIOS.idsocio = FACTURA.idsocio AND FACTURA.estado = ''''  AND SOCIOS.BAJA = ''NO'' AND SOCIOS.BAJA_TEMPORARIA = ''NO'' GROUP BY  SOCIOS.idsocio, SOCIOS.matricula, SOCIOS.nombre'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          SELECT(GLO:FECHA_LARGO)
          RETURN LEVEL:BENIGN
      END
      LOOP
          NEXT(SQL)
          IF ERRORCODE() THEN BREAK.
          RAN:C1 = SQL:VAR1
          RAN:C2 = SQL:VAR2
          RAN:C3 = SQL:VAR3
          RAN:C4 = SQL:VAR4
          RAN:C5 = SQL:VAR5
          ADD(RANKING)
          if errorcode() then message(error()).
      END
      
      
      
      
      DEUDA2()
       POST(EVENT:CloseWindow)
    OF ?CancelButton
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
!!! Generated from procedure template - Process
!!! </summary>
DEUDA2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(CONVENIO_DETALLE)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,MDI,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('DEUDA2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('DEUDA2',ProgressWindow)                    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:CONVENIO_DETALLE, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON5:IDSOLICITUD)
  ThisProcess.AddSortOrder(CON5:PK_CONVENIO_DETALLE)
  ThisProcess.SetFilter('CON5:CANCELADO = ''''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='PROCESANDO DEUDAS'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(CONVENIO_DETALLE,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO_DETALLE.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('DEUDA2',ProgressWindow)                 ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  DEUDA3()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  RAN:C1 = CON5:IDSOCIO
  GET(RANKING,RAN:PK_RANKING)
  IF ERRORCODE() = 35 THEN
      RAN:C4 = 0
      RAN:C5 = 0
      RAN:C6 =  1
      RAN:C7 =  CON5:MONTO_CUOTA
      !! BUSCA DATOS SOCIO
      SOC:IDSOCIO = CON5:IDSOCIO
      ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
      RAN:C1 =  SOC:IDSOCIO
      RAN:C2 =  SOC:MATRICULA
      RAN:C3 = SOC:NOMBRE
      ACCESS:RANKING.INSERT()
  ELSE
      RAN:C6 = RAN:C6 + 1
      CUOTA$ = RAN:C7
      RAN:C7 = CON5:MONTO_CUOTA +  CUOTA$
      ACCESS:RANKING.UPDATE()
  END
      
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CANTIDAD_DEUDA_SOCIO2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:BAJA_TEMPORARIA)
                       PROJECT(SOC:CANTIDAD)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2625,6250,7063),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1625),USE(?Header)
                         IMAGE('logo.jpg'),AT(10,10,1427,948),USE(?Image1)
                         STRING('CUOTAS ADEUDADAS POR COLEGIADO'),AT(1281,906),USE(?String1),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         BOX,AT(10,1333,6365,271),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Nombre'),AT(917,1344),USE(?String10),TRN
                         STRING('Cant Cuotas'),AT(5323,1344),USE(?String12),TRN
                         STRING('Baja Temp'),AT(3802,1344),USE(?String13),TRN
                         STRING('Matricula'),AT(2667,1344),USE(?String11),TRN
                       END
Detail                 DETAIL,AT(0,0,,250),USE(?Detail)
                         STRING(@s30),AT(21,0),USE(SOC:NOMBRE)
                         STRING(@n-14),AT(5177,0),USE(SOC:CANTIDAD)
                         STRING(@s2),AT(4021,0),USE(SOC:BAJA_TEMPORARIA)
                         LINE,AT(10,219,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@n-7),AT(2667,0),USE(SOC:MATRICULA)
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         STRING('Cantidad de Registros: '),AT(10,-10),USE(?String5),TRN
                         STRING(@n-7),AT(1469,0),USE(SOC:CANTIDAD,,?SOC:CANTIDAD:2),CNT
                         LINE,AT(21,219,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(31,302),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2135,302),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5302,281),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
                       END
                     END
ProcessSortSelectionVariable         STRING(1024)          ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionQueue       QUEUE
SQDS_Order                STRING(1)
SQDS_Description          STRING(50)
SQDS_Field                STRING(100)
SQDS_Sort                 SHORT
                         END
SQDSIndex                SHORT(0)
SortSelectionWindow WINDOW('Select the Order'),AT(,,203,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Select the order to process the data.'),AT(6,4,162,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,162,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(?SortSelectionList),VSCROLL,FORMAT('6C@s1@100L@s100@')
       BUTTON,AT(173,28,25,13),ICON('SUP.ICO'),MSG('Move field up'),TIP('Move field up'),USE(?SButtonUp),LEFT,FLAT
       BUTTON,AT(173,41,25,13),ICON('SDOWN.ICO'),MSG('Move field down'),TIP('Move field down'),USE(?SButtonDown),LEFT,FLAT
       BUTTON,AT(173,54,25,13),ICON('SCH-ORD.ICO'),MSG('Change Order'),TIP('Change Order'),USE(?SButtonChangeOrder),LEFT,FLAT
       BUTTON('&OK'),AT(58,74,52,14),ICON('SOK.ICO'),MSG('Accept data and close the window'),TIP('Accept data and close the window'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancel'),AT(114,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancel operation'),TIP('Cancel operation'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ! Loading the order fields into the queue
      SortSelectionQueue.SQDS_Order      ='+'
      SortSelectionQueue.SQDS_Description='Nombre'
      SortSelectionQueue.SQDS_Field      ='SOC:NOMBRE'
      SortSelectionQueue.SQDS_Sort       =1
      ADD(SortSelectionQueue)
      SortSelectionQueue.SQDS_Order      ='+'
      SortSelectionQueue.SQDS_Description='Matricula'
      SortSelectionQueue.SQDS_Field      ='SOC:MATRICULA'
      SortSelectionQueue.SQDS_Sort       =2
      ADD(SortSelectionQueue)
      SortSelectionQueue.SQDS_Order      ='-'
      SortSelectionQueue.SQDS_Description='Cantidad'
      SortSelectionQueue.SQDS_Field      ='SOC:CANTIDAD'
      SortSelectionQueue.SQDS_Sort       =3
      ADD(SortSelectionQueue)

      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=SortSelectionQueue
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              SQDSIndex=?SortSelectionList{PROP:Selected}
              GET(SortSelectionQueue,SQDSIndex)
              IF NOT ERRORCODE() THEN
                 IF SortSelectionQueue.SQDS_Order='-' THEN
                    SortSelectionQueue.SQDS_Order='+'
                 ELSE
                    SortSelectionQueue.SQDS_Order='-'
                 END
                 PUT(SortSelectionQueue)
                 DISPLAY()
              END
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            ProcessSortSelectionVariable=''
            LOOP SQDSIndex=1 TO RECORDS(SortSelectionQueue)
                 GET(SortSelectionQueue,SQDSIndex)
                 IF NOT ERRORCODE() THEN
                    IF CLIP(ProcessSortSelectionVariable) THEN
                       ProcessSortSelectionVariable = CLIP(ProcessSortSelectionVariable)&','&SortSelectionQueue.SQDS_Order&SortSelectionQueue.SQDS_Field
                    ELSE
                       ProcessSortSelectionVariable = SortSelectionQueue.SQDS_Order&SortSelectionQueue.SQDS_Field
                    END
                 END
            END
            POST(Event:CloseWindow)
        OF ?SButtonDown
           SQDSIndex=?SortSelectionList{PROP:Selected}
           GET(SortSelectionQueue,SQDSIndex)
           IF NOT ERRORCODE() THEN
              IF SortSelectionQueue.SQDS_Sort<>RECORDS(SortSelectionQueue) THEN
                 SortSelectionQueue.SQDS_Sort=SortSelectionQueue.SQDS_Sort+1
                 PUT(SortSelectionQueue)
                 GET(SortSelectionQueue,SQDSIndex+1)
                 SortSelectionQueue.SQDS_Sort=SortSelectionQueue.SQDS_Sort-1
                 PUT(SortSelectionQueue)
                 SORT(SortSelectionQueue,SortSelectionQueue.SQDS_Sort)
                 ?SortSelectionList{PROP:Selected}=SQDSIndex+1
                 DISPLAY()
              END
           END
        OF ?SButtonUp
           SQDSIndex=?SortSelectionList{PROP:Selected}
           GET(SortSelectionQueue,SQDSIndex)
           IF NOT ERRORCODE() THEN
              IF SortSelectionQueue.SQDS_Sort<>1 THEN
                 SortSelectionQueue.SQDS_Sort=SortSelectionQueue.SQDS_Sort-1
                 PUT(SortSelectionQueue)
                 GET(SortSelectionQueue,SQDSIndex-1)
                 SortSelectionQueue.SQDS_Sort=SortSelectionQueue.SQDS_Sort+1
                 PUT(SortSelectionQueue)
                 SORT(SortSelectionQueue,SortSelectionQueue.SQDS_Sort)
                 ?SortSelectionList{PROP:Selected}=SQDSIndex-1
                 DISPLAY()
              END
           END
        OF ?SButtonChangeOrder
           SQDSIndex=?SortSelectionList{PROP:Selected}
           GET(SortSelectionQueue,SQDSIndex)
           IF NOT ERRORCODE() THEN
              IF SortSelectionQueue.SQDS_Order='-' THEN
                 SortSelectionQueue.SQDS_Order='+'
              ELSE
                 SortSelectionQueue.SQDS_Order='-'
              END
              PUT(SortSelectionQueue)
              DISPLAY()
           END
        END
      END
      CLOSE(SortSelectionWindow)
      FREE(SortSelectionQueue)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_CANTIDAD_DEUDA_SOCIO2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:MONTO',GLO:MONTO)                              ! Added by: Report
  BIND('GLO:PAGO',GLO:PAGO)                                ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CANTIDAD_DEUDA_SOCIO2',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (CLIP(ProcessSortSelectionVariable))
     ThisReport.AppendOrder(CLIP(ProcessSortSelectionVariable))
  END
  ThisReport.SetFilter('SOC:CANTIDAD >= GLO:MONTO and SOC:CANTIDAD <<= GLO:PAGO AND SOC:BAJA = ''NO''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CANTIDAD_DEUDA_SOCIO2',ProgressWindow) ! Save window data to non-volatile store
  END
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
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CANTIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CANTIDAD,RepGen:XML,TargetAttr:TagName,'SOC:CANTIDAD')
  SELF.Attribute.Set(?SOC:CANTIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:BAJA_TEMPORARIA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:BAJA_TEMPORARIA,RepGen:XML,TargetAttr:TagName,'SOC:BAJA_TEMPORARIA')
  SELF.Attribute.Set(?SOC:BAJA_TEMPORARIA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagName,'String5')
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CANTIDAD:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CANTIDAD:2,RepGen:XML,TargetAttr:TagName,'SOC:CANTIDAD:2')
  SELF.Attribute.Set(?SOC:CANTIDAD:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CANTIDAD_DEUDA_SOCIO2','IMPRIMIR_CANTIDAD_DEUDA_SOCIO2','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! CANTIDAD DE CUOTAS ADEUDADAS
!!! </summary>
IMPRIMIR_CANTIDAD_DEUDA_SOCIO PROCEDURE 

Window               WINDOW('Cantidad de Cuotas Adeudadas por Socio'),AT(,,187,79),FONT('Arial',10,,FONT:regular), |
  GRAY
                       PROMPT('Cantidad Mímima:'),AT(26,4),USE(?GLO:MONTO:Prompt)
                       ENTRY(@n-14),AT(92,4,60,10),USE(GLO:MONTO)
                       PROMPT('Cantidad Máxima:'),AT(26,25),USE(?GLO:PAGO:Prompt)
                       ENTRY(@n-14),AT(92,25,60,10),USE(GLO:PAGO),REQ
                       BUTTON('&Imprimir'),AT(20,58,67,14),USE(?OkButton),LEFT,ICON(ICON:Print1),DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(98,58,70,14),USE(?CancelButton),LEFT,ICON(ICON:Cross),FLAT
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CANTIDAD_DEUDA_SOCIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:MONTO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CANTIDAD_DEUDA_SOCIO',Window)     ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CANTIDAD_DEUDA_SOCIO',Window)  ! Save window data to non-volatile store
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
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      START(IMPRIMIR_CANTIDAD_DEUDA_SOCIO2, 25000)
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

