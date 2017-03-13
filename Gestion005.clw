

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('NetEmail.inc'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION005.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_PADRON_LOCALIDAD_TOTAL_2 PROCEDURE 

EC:::GolDesde         SHORT
EC:::GolHasta         SHORT
EC::Cancelar         BYTE
Ec::QImagen     QUEUE
PrtPagina               STRING(250)
                      END
EcReporte          REPORT('REPORTEEC')
                      END
Ec::CtrlPagina    SHORT
Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:CELULAR)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:IDCIRCULO)
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                       END
                       JOIN(LOC:PK_LOCALIDAD,SOC:IDLOCALIDAD)
                         PROJECT(LOC:COD_TELEFONICO)
                         PROJECT(LOC:CP)
                         PROJECT(LOC:DESCRIPCION)
                       END
                       JOIN(CIR:PK_CIRCULO,SOC:IDCIRCULO)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(979,1250,6521,9396),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(979,240,6500,1000),USE(?Header)
                         IMAGE('Logo.JPG'),AT(21,21,1396,969),USE(?Image1)
                         STRING('Padrón de Matriculados al:'),AT(3531,73),USE(?ReportDatePrompt),TRN
                         STRING('<<-- Date Stamp -->'),AT(5167,63),USE(?ReportDateStamp),TRN
                       END
break1                 BREAK(LOC:IDLOCALIDAD),USE(?BREAK1)
                         HEADER,AT(0,0,,438),USE(?GROUPHEADER1)
                           LINE,AT(10,10,6458,0),USE(?Line1),COLOR(COLOR:Black)
                           STRING(@s20),AT(656,115),USE(LOC:DESCRIPCION)
                           STRING(@n-14),AT(2958,115),USE(LOC:CP)
                           STRING(@s10),AT(5292,104),USE(LOC:COD_TELEFONICO)
                           STRING('CP:'),AT(2625,115),USE(?String8),TRN
                           STRING('Cod. Telefónico:'),AT(4198,104),USE(?String9),TRN
                           STRING('Localidad:'),AT(21,115),USE(?String7),TRN
                         END
detail1                  DETAIL,AT(0,0,,510),USE(?DETAIL1)
                           LINE,AT(10,10,6469,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING('Mat.'),AT(21,52),USE(?String22),TRN
                           STRING(@s30),AT(1219,52),USE(SOC:NOMBRE)
                           STRING(@s10),AT(3594,52),USE(LOC:COD_TELEFONICO,,?LOC:COD_TELEFONICO:2)
                           STRING(@s7),AT(281,52),USE(SOC:MATRICULA)
                           STRING('Nombre'),AT(771,52),USE(?String23),TRN
                           STRING(@s50),AT(500,281),USE(SOC:DIRECCION_LABORAL)
                           STRING(@s10),AT(4260,52),USE(SOC:TELEFONO_LABORAL)
                           STRING('Movil:'),AT(5021,52),USE(?String32),TRN
                           STRING(@s15),AT(5354,52),USE(SOC:CELULAR)
                           STRING('Teléfono'),AT(3146,52),USE(?String29),TRN
                           STRING('Domicilio'),AT(10,281),USE(?String28),TRN
                           STRING(@s50),AT(3000,281,3167,177),USE(SOC:EMAIL)
                           STRING('e-mail:'),AT(2656,281),USE(?String27),TRN
                           LINE,AT(10,469,6448,0),USE(?Line4),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,323),USE(?GROUPFOOTER1)
                           STRING('Cantidad:'),AT(21,21),USE(?String20),TRN
                           STRING(@n-14),AT(542,21),USE(SOC:IDSOCIO),CNT,RESET(break1)
                           BOX,AT(10,229,7729,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         END
                       END
                       FOOTER,AT(969,10667,6521,563),USE(?Footer)
                         STRING('Cantidad Total:'),AT(21,21),USE(?String31),TRN
                         STRING(@n-14),AT(802,21),USE(SOC:IDSOCIO,,?SOC:IDSOCIO:2),CNT
                         LINE,AT(10,219,7271,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,302),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,302),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5583,281),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(948,250,6552,10979),USE(?Form)
                       END
                     END
LocE::Direccion            STRING(5000)
LocE::DireccionCC          STRING(5000)
LocE::DireccionCCO         STRING(5000)
LocE::Subject              STRING(255)
LocE::Body                 STRING(2048)
LocE::FileName             STRING(5000)
LocE::Retorno              LONG
LocE::Flags                SHORT
LocE::Dialogo              BYTE
QAtach                   QUEUE
Attach                     CSTRING(5000)
                         END
Loc::Attach                 string(5000)
Loc::Cadena                 String(1)
Loc::Archivo                string(500)

LocE::GolDesde          SHORT
LocE::GolHasta          SHORT
LocE::Cancelar          BYTE
LocE::Atach             STRING(10000)
LocE::FileSend          STRING(5000)
LocE::Titulo            STRING(500)
LocE::NombreFile        STRING(500)
LocE::Qpar      QUEUE,PRE(QP)
Par                     CSTRING(1000)
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
Open                   PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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

?Menu_eMail     EQUATE(-1026)
?EnviarxMailWMF     EQUATE(-1027)
?EnviarxMailWord    EQUATE(-1028)
?EnviaraWord        EQUATE(-1029)
Gol_wo WINDOW,AT(,,236,43),FONT('Tahoma',8,,FONT:regular),CENTER,GRAY
       IMAGE('Mail.ico'),AT(8,7),USE(?Imgout),CENTERED
       PROGRESS,USE(?ProgOutlook),AT(38,9,164,9),RANGE(0,100)
       GROUP,AT(38,21,164,9),USE(?Group1),BOXED,BEVEL(-1)
         STRING('Generando Archivos de Mail'),AT(76,21),USE(?StrOut),TRN
       END
     END
WGolPrompt WINDOW,AT(,,160,80),FONT('Tahoma',8,,FONT:bold),CENTER,GRAY
       GROUP,AT(2,2,156,76),USE(?Group_gol),BOXED,BEVEL(-1)
         IMAGE('mail.ico'),AT(5,5,30,17),USE(?Image_gol),CENTERED
         GROUP,AT(36,8,88,36),USE(?Group2),BOXED,BEVEL(1,1)
           PROMPT('Pagina Desde:'),AT(43,14),USE(?Prompt_gol)
           SPIN(@n02),AT(92,14,25,10),USE(LocE::GolDesde),RANGE(1,100),STEP(1)
           PROMPT('Pagina Hasta:'),AT(43,28),USE(?Prompt_Gol2)
           SPIN(@n02),AT(92,28,25,10),USE(LocE::GolHasta),RANGE(1,100),STEP(1)
         END
         BUTTON('Enviar'),AT(27,59,50,14),USE(?Enviar),LEFT,ICON('wizok.ico')
         BUTTON('Cancelar'),AT(83,59,50,14),USE(?Cancelar),LEFT,ICON('wizcncl.ico')
       END
     END
?MenuECPrint     EQUATE(-1009)
?MenuECPrintPag2  EQUATE(-1012)
?MenuECPrintPag  EQUATE(-1010)
ECPrompt WINDOW('Configuracion del Reporte'),AT(,,164,83),FONT('MS Sans Serif',8,,),CENTER,GRAY
       GROUP,AT(2,2,159,39),USE(?Group_gol),BOXED,BEVEL(-1)
         PROMPT('Pagina Desde:'),AT(37,6),USE(?Prompt_gol)
         SPIN(@n03b),AT(90,6,25,10),USE(EC:::GolDesde),RANGE(1,999),STEP(1)
         PROMPT('Pagina Hasta:'),AT(38,22),USE(?Prompt_Gol2)
         SPIN(@n03b),AT(90,22,25,10),USE(EC:::GolHasta),RANGE(1,999),STEP(1)
       END
       GROUP,AT(2,41,159,19),USE(?gec),BOXED,BEVEL(-1)
         BUTTON('Configuracion Impresora'),AT(3,41,156,18),USE(?Conf),FLAT,LEFT,ICON(ICON:Print1),STD(STD:PrintSetup)
       END
       GROUP,AT(2,61,159,19),USE(?ECGrop),BOXED,BEVEL(-1)
         BUTTON('Imprimir'),AT(6,63,64,16),USE(?EcPrint),FLAT,LEFT,ICON(ICON:Print)
         BUTTON('Cancelar'),AT(93,63,64,16),USE(?Cancelar),FLAT,LEFT,ICON(ICON:NoPrint)
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
!!! Inicio Ec. Templates
SendMailPrompt     ROUTINE
  OPEN(WGolPrompt)
  ALERT(EnterKey)
      POST(Event:OpenWindow)
      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF EVENT:AlertKey
           CASE KEYCODE()
             OF EnterKey
                MiControl# = FOCUS()
                CASE MiControl#{Prop:Type}
                  OF CREATE:Button
                     POST(EVENT:ACCEPTED,MiControl#)
                  ELSE
                     IF FOCUS()<> ?Enviar
                        PRESSKEY(TabKey)
                        CYCLE
                     ELSE
                        POST(Event:Accepted,?Enviar)
                     END!IF
                END!CASE
           END!CASE
        END!CASE EVENT
        CASE FIELD()
        OF ?Enviar
          CASE Event()
          OF Event:Accepted
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          ! Se presiono el ENTER estando posicionado el OK
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        OF ?Cancelar
          CASE Event()
          OF Event:Accepted
            LocE::Cancelar = True
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        END
      END !END ACCEPT
  CLOSE(WGolPrompt)
!************ Fin de ROUTINE Ec_Mail*********************

!!! Evolution Consulting FREE Templates Start!!!
ImprimirPrompt    ROUTINE
 OPEN(ECPrompt)
 DISPLAY()
 ALERT(EnterKey)
      POST(Event:OpenWindow)
      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF EVENT:AlertKey
           CASE KEYCODE()
             OF EnterKey
                MiControl# = FOCUS()
                CASE MiControl#{Prop:Type}
                  OF CREATE:Button
                     POST(EVENT:ACCEPTED,MiControl#)
                  ELSE
                     IF FOCUS()<> ?EcPrint
                        PRESSKEY(TabKey)
                        CYCLE
                     ELSE
                        POST(Event:Accepted,?EcPrint)
                     END!IF
                END!CASE
           END!CASE
        END!CASE EVENT
        CASE FIELD()
        OF ?EcPrint
          CASE Event()
          OF Event:Accepted
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?EcPrint
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          POST(Event:Accepted,?EcPrint)
                       END!IF
                  END!CASE
             END!CASE
          END
        OF ?Cancelar
          CASE Event()
          OF Event:Accepted
            EC::Cancelar  = True
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?EcPrint
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          POST(Event:Accepted,?EcPrint)
                       END!IF
                  END!CASE
             END!CASE
          END
        END
      END !END ACCEPT
  CLOSE(ECPrompt)

!!! Evolution Consulting FREE Templates End!!!

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_PADRON_LOCALIDAD_TOTAL_2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_PADRON_LOCALIDAD_TOTAL_2',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, 0)
  ThisReport.AddSortOrder(SOC:FK_SOCIOS_LOCALIDAD)
  ThisReport.AppendOrder('SOC:NOMBRE')
  ThisReport.SetFilter('SOC:BAJA = ''NO''')
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
    INIMgr.Update('IMPRIMIR_PADRON_LOCALIDAD_TOTAL_2',ProgressWindow) ! Save window data to non-volatile store
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
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagName,'LOC:CP')
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:COD_TELEFONICO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:COD_TELEFONICO,RepGen:XML,TargetAttr:TagName,'LOC:COD_TELEFONICO')
  SELF.Attribute.Set(?LOC:COD_TELEFONICO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:COD_TELEFONICO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:COD_TELEFONICO:2,RepGen:XML,TargetAttr:TagName,'LOC:COD_TELEFONICO:2')
  SELF.Attribute.Set(?LOC:COD_TELEFONICO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION_LABORAL')
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO_LABORAL')
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CELULAR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CELULAR,RepGen:XML,TargetAttr:TagName,'SOC:CELULAR')
  SELF.Attribute.Set(?SOC:CELULAR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagName,'SOC:EMAIL')
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO')
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO:2')
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  PRINT(RPT:detail1)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  CREATE(?Menu_eMail,CREATE:Menu)
  ?Menu_eMail{PROP:text} = 'Enviar x eMail'
  ?Menu_eMail{PROP:use} = LASTFIELD()+301
  UNHIDE(?Menu_eMail)
  
  if 'Enviar Imagenes [WMF]' <> '' !!! Activa Envio de Imagen
    CREATE(?EnviarxMailWmf,CREATE:Item,?Menu_eMail)
    ?EnviarxMailwmf{PROP:use} = LASTFIELD()+302
    ?EnviarxMailwmf{PROP:text} = 'Enviar Imagenes [WMF]'
  UNHIDE(?EnviarxMailwmf)
  end
  
  if 'Enviar Reporte en Word' <> '' !!! Activa Envio de Imagen a Word
    CREATE(?EnviarxMailWord,CREATE:Item,?Menu_eMail)
    ?EnviarxMailWord{PROP:use} = LASTFIELD()+303
    ?EnviarxMailWord{PROP:text} = 'Enviar Reporte en Word'
    UNHIDE(?EnviarxMailWord)
  end
  
  if 'Enviar Reporte a Word' <> '' !!! Activa Envio de Imagen a Word
  CREATE(?EnviaraWord,CREATE:Item,?Menu_eMail)
  ?EnviaraWord{PROP:use} = LASTFIELD()+304
  ?EnviaraWord{PROP:text} = 'Enviar Reporte a Word'
  UNHIDE(?EnviaraWord)
  end
  
  !!! Evolution Consulting FREE Templates Start!!!
   CREATE(?MenuECPrint,CREATE:Menu)
   ?MenuECPrint{PROP:text} = 'Imprimir'
   CREATE(?MenuECPrintPag, Create:item,?MenuECPrint)
   ?MenuECPrintPag{PROP:Text} = 'Pagina Actual'
   CREATE(?MenuECPrintPag2, Create:item,?MenuECPrint)
   ?MenuECPrintPag2{PROP:Text} = 'Pagina Desde / Hasta'
  
  !!! Evolution Consulting FREE Templates End!!!


Previewer.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
        CASE ACCEPTED()
        OF ?MenuECPrintPag
           OPEN(EcReporte)
           EcReporte{PROP:PREVIEW}=Ec::QImagen
           ENDPAGE(EcReporte)
           FREE(Ec::QImagen)
           Ec::QImagen.PrtPagina=SELF.ImageQueue
           ADD(Ec::QImagen)
           EcReporte{PROP:flushpreview} = TRUE
           FREE(Ec::QImagen)
           CLOSE(EcReporte)
        OF ?MenuECPrintPag2
           EC:::GolDesde  = 1
           EC:::GolHasta  = RECORDS(SELF.ImageQueue)
           Do ImprimirPrompt
           OPEN(EcReporte)
           EcReporte{PROP:PREVIEW}=Ec::QImagen
           ENDPAGE(EcReporte)
           FREE(Ec::QImagen)
           loop a# = 1 to RECORDS(SELF.ImageQueue)
               IF a# >= EC:::GolDesde  and a# <= EC:::GolHasta
                    get(SELF.ImageQueue,a#)
                    if self.InPageList(a#)
                       Ec::QImagen.PrtPagina=SELF.ImageQueue
                       ADD(Ec::QImagen)
                    end
               END
           END
           IF Not EC::Cancelar Then EcReporte{PROP:flushpreview} = TRUE.
           FREE(Ec::QImagen)
           CLOSE(EcReporte)
        END
  
  !!! Evolution Consulting FREE Templates End!!!
  ReturnValue = PARENT.TakeAccepted()
  RETURN ReturnValue


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  LocE::GolDesde =1
  LocE::GolHasta =RECORDS(SELF.ImageQueue)
  LocE::Cancelar = False
  case event()
    of EVENT:Accepted
    Case field()
     of ?EnviarxMailWmf
           Do SendMailPrompt
      IF NOT LocE::Cancelar
           FREE(QAtach)
           OPEN(Gol_wo)
           DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'PADRON DE ODONTOLOGOS'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
           LocE::Flags     = False
           LocE::Subject   = 'PADRON DE ODONTOLOGOS'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Dialogo  = 1
           SAVEPath"   = PATH()
           IF LocE::Dialogo THEN LocE::Flags  =MAPI_DIALOG.
            E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
           SETPATH(SAVEPath")
           POST(Event:CloseWindow)
       END !! NOT LocE::Cancelar
     Of ?EnviaraWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          LOcE::Qpar.QP:Par  = 'PADRON DE ODONTOLOGOS'
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = false
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  =         0
          ADD(LocE::Qpar)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'PADRON DE ODONTOLOGOS'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          SETPATH(SAVEPath")
          CLOSE(Gol_wo)
          POST(Event:CloseWindow)
       END
     of ?EnviarxMailWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'PADRON DE ODONTOLOGOS'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::Nombrefile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::Nombrefile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::nombrefile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::nombrefile)
                 end
              END
           end
          LOcE::Qpar.QP:Par  = 'PADRON DE ODONTOLOGOS'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'PADRON DE ODONTOLOGOS'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Dialogo  = 1
             SAVEPath"   = PATH()
             IF LocE::Dialogo THEN LocE::Flags  +=MAPI_DIALOG.
             E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
             SETPATH(SAVEPath")
             CLOSE(Gol_wo)
             POST(Event:CloseWindow)
          END
       END
    END !! CASE Field
  end!Case Event
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_PADRON_CIRCULO_LOCALIDAD_TOTAL','IMPRIMIR_PADRON_CIRCULO_LOCALIDAD_TOTAL','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
EXPORT_ESPECIALIDAD_MINISTERIO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
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
  GlobalErrors.SetProcedureName('EXPORT_ESPECIALIDAD_MINISTERIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ESPECIALIDAD.Open                                 ! File ESPECIALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:MINESP.Open                                       ! File MINESP used by this procedure, so make sure it's RelationManager is open
  Relate:PADRONXESPECIALIDAD.Open                          ! File PADRONXESPECIALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('EXPORT_ESPECIALIDAD_MINISTERIO',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:MATRICULA)
  ThisProcess.AddSortOrder(SOC:IDX_SOCIOS_MATRICULA)
  ThisProcess.SetFilter('SOC:BAJA = ''NO''  AND SOC:BAJA_TEMPORARIA = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  MESP:NRO = '1'
  MESP:COLEGIO = 'PSICOLOGOS'
  ADD(MINESP)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  GLO:NRO_CUOTA = 0
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ESPECIALIDAD.Close
    Relate:MINESP.Close
    Relate:PADRONXESPECIALIDAD.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('EXPORT_ESPECIALIDAD_MINISTERIO',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  MESP:NRO  =  '3'
  MESP:COLEGIO =  'PSICOLOGOS'
  MESP:IDSOCIO =  GLO:NRO_CUOTA
  
  MESP:NOMBRE  = ''
  MESP:IDESPECIALIDAD = ''
  MESP:ESPECIALIDAD   = ''
  MESP:FECHA_INICIO  =  ''
  ADD(MINESP)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  MESP:NRO = '5'
  MESP:COLEGIO                = 'PSIOCOLOGOS'
  MESP:IDSOCIO                = SOC:MATRICULA
  MESP:NOMBRE                 = SOC:NOMBRE
  !!!!!!!!BUSCA PADRON POR ESPECIALIDAD
  PAD:IDSOCIO =   SOC:IDSOCIO
  SET(PAD:FK_PADRONXESPECIALIDAD_SOCI,PAD:FK_PADRONXESPECIALIDAD_SOCI)
  LOOP
      IF ACCESS:PADRONXESPECIALIDAD.NEXT() THEN BREAK.
      IF PAD:IDSOCIO <>  SOC:IDSOCIO  THEN BREAK.
      ESP:IDESPECIALIDAD = PAD:IDESPECIALIDAD
      ACCESS:ESPECIALIDAD.TRYFETCH(ESP:PK_ESPECIALIDAD)
      MESP:IDESPECIALIDAD         = ESP:IDESPECIALIDAD
      MESP:ESPECIALIDAD           = ESP:DESCRIPCION
      !MESP:FECHA_INICIO           =
      ADD(MINESP)
      IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
      GLO:NRO_CUOTA = GLO:NRO_CUOTA + 1
  END
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Exportar Datos al Ministerio de Salud
!!! </summary>
Export_Ministerio PROCEDURE 

Window               WINDOW('Exportar Datos al Ministerio de Salud '),AT(,,181,64),FONT('MS Sans Serif',8,,FONT:regular), |
  CENTER,GRAY
                       BUTTON('&Generar Archivo'),AT(41,6,100,18),USE(?OkButton),LEFT,ICON(ICON:Save),DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(53,41,63,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
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
  GlobalErrors.SetProcedureName('Export_Ministerio')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Export_Ministerio',Window)                 ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('Export_Ministerio',Window)              ! Save window data to non-volatile store
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
      MESSAGE('Se generará los archivos para ser enviados al | Ministerio de Salud de la Pcia. de Río Negro')
      open(minsalud)
      empty(minsalud)
      if errorcode() then
          Message('Ocurrio un error en Exportar Padron al Ministerio')
          cycle
      end
      close(minesp)
      open(minesp)
      empty(minesp)
      if errorcode() then
          Message('Ocurrio un error en Exportar Padron al Ministerio')
          cycle
      end
      close(minesp)
      
      EXPORT_PADRON_MINISTERIO()
      EXPORT_ESPECIALIDAD_MINISTERIO()
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      !!! CAMBIO DE NOMBRE
      A"= 'PASICOLOGOS_'
      B" = YEAR(TODAY())
      C" = MONTH(TODAY())
      SS" = clip(A")&clip(B")&'_'&clip(C")&'.msm'
      copy ('MINSALUD.TXT', 'PROFE.TXT')
      COPY ('MINESP.TXT', 'ESP.TXT')
      RENAME ('PROFE.TXT', SS")
      
      AA"= '`PSICOLOGOS_ESPE_'
      B" = YEAR(TODAY())
      C" = MONTH(TODAY())
      SSS" = clip(AA")&clip(B")&'_'&clip(C")&'.msm'
      rename ('ESP.TXT',SSS")
      
      MESSAGE('Se realizó exportación  con Exito| El archivo generado se llama '&clip(SS")&' y '&clip(SSS")&' | Los mismos se encuentran ubicados en  '&PATH()&'| Copielo en un diskette ','Exportación de Padrón',ICON:EXCLAMATION)
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

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
EXPORT_PADRON_MINISTERIO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
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
  GlobalErrors.SetProcedureName('EXPORT_PADRON_MINISTERIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:MINSALUD.Open                                     ! File MINSALUD used by this procedure, so make sure it's RelationManager is open
  Relate:NIVEL_FORMACION.Open                              ! File NIVEL_FORMACION used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_DOC.Open                                     ! File TIPO_DOC used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_TITULO.Open                                  ! File TIPO_TITULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('EXPORT_PADRON_MINISTERIO',ProgressWindow)  ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:MATRICULA)
  ThisProcess.AddSortOrder(SOC:IDX_SOCIOS_MATRICULA)
  ThisProcess.SetFilter('SOC:BAJA = ''NO''  AND SOC:BAJA_TEMPORARIA = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  MINS:NRO = '1'
  MINS:IDCOLEGIO = 'PSICOLOGOS'
  ADD(MINSALUD)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  GLO:NRO_CUOTA = 0
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INSTITUCION.Close
    Relate:LOCALIDAD.Close
    Relate:MINSALUD.Close
    Relate:NIVEL_FORMACION.Close
    Relate:SOCIOS.Close
    Relate:TIPO_DOC.Close
    Relate:TIPO_TITULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('EXPORT_PADRON_MINISTERIO',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  MINS:NRO      =  '3'
  MINS:IDCOLEGIO =  'PSICOLOGOS'
  MINS:MATRICULA  =  GLO:NRO_CUOTA
  MINS:APELLIDO                 = ''
  MINS:NOMBRES                  = ''
  MINS:NOMBRE                   = ''
  MINS:N_DOCUMENTO              = ''
  MINS:SEXO                     = ''
  MINS:DIRECCION                = ''
  MINS:TELEFONO                 = ''
  MINS:FECHA_ALTA               = ''
  MINS:FECHA_NACIMIENTO         =  ''
  MINS:FECHA_BAJA               = ''
  MINS:DIRECCION_LABORAL        = ''
  MINS:TELEFONO_LABORAL         = ''
  MINS:BAJA                     = ''
  MINS:FECHA_EGRESO             = ''
  MINS:LUGAR_NACIMIENTO         = ''
  MINS:DESCRIPCION_MINISTERIO   =  ''
  MINS:IDCENTRO_SALUD           =  ''
  MINS:DESCRIPCION_CENTRO_SALUD =  ''
  MINS:TIPO_INSTITUCION         =  ''
  MINS:TIPO_DOC                 = ''
  MINS:LOCALIDAD                = ''
  MINS:INSTITUCION              =  ''
  MINS:TITULO                   =  ''
  MINS:NIVEL_FORMACION          =  ''
  MINS:GRADO                    =  ''
  MINS:TIPO_TITULO              =  ''
  ADD(MINSALUD)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  MINS:NRO                      = '5'
  MINS:IDCOLEGIO                = 'PSIOCOLOGOS'
  MINS:MATRICULA                = SOC:MATRICULA
  MINS:APELLIDO                 = SOC:APELLIDO
  MINS:NOMBRES                  = SOC:NOMBRES
  MINS:NOMBRE                   = SOC:NOMBRE
  MINS:N_DOCUMENTO              = SOC:N_DOCUMENTO
  MINS:SEXO                     = SOC:SEXO
  MINS:DIRECCION                = SOC:DIRECCION
  MINS:TELEFONO                 = SOC:TELEFONO
  MINS:CELULAR                  = SOC:CELULAR
  MINS:EMAIL                    = SOC:EMAIL
  MINS:FECHA_ALTA               = FORMAT(SOC:FECHA_ALTA,@D6)
  MINS:FECHA_NACIMIENTO         = FORMAT(SOC:FECHA_NACIMIENTO,@D6)
  MINS:FECHA_BAJA               =  FORMAT(SOC:FECHA_BAJA,@D6)
  MINS:ANO                      = SOC:ANO
  MINS:DIRECCION_LABORAL        = SOC:DIRECCION_LABORAL
  MINS:TELEFONO_LABORAL         = SOC:TELEFONO_LABORAL
  MINS:BAJA                     = SOC:BAJA
  MINS:LIBRO                    = SOC:LIBRO
  MINS:FOLIO                    = SOC:FOLIO
  MINS:ACTA                     = SOC:ACTA
  MINS:PROVISORIO               = SOC:PROVISORIO
  MINS:FECHA_EGRESO             =  FORMAT(SOC:FECHA_EGRESO,@D6)
  MINS:BAJA_TEMPORARIA          = SOC:BAJA_TEMPORARIA
  MINS:FECHA_TITULO             =  FORMAT(SOC:FECHA_TITULO,@D6)
  MINS:LUGAR_NACIMIENTO         = SOC:LUGAR_NACIMIENTO
  MINS:DESCRIPCION_MINISTERIO   =  ''
  MINS:IDCENTRO_SALUD           =  ''
  MINS:DESCRIPCION_CENTRO_SALUD =  ''
  MINS:TIPO_INSTITUCION         =  SOC:TIPO_TITULO
  MINS:TIPO_TITULO              =  SOC:TIPO_TITULO
  !!BUSCA TIPO DOC
  TIP3:ID_TIPO_DOC = SOC:ID_TIPO_DOC
  ACCESS:TIPO_DOC.TRYFETCH(TIP3:PK_TIPO_DOC)
  MINS:TIPO_DOC                 = TIP3:DESCRIPCION
  !!bUSCA LOCALIDAD
  LOC:IDLOCALIDAD = SOC:IDLOCALIDAD
  ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
  MINS:LOCALIDAD  = LOC:DESCRIPCION
  !! bUSCA iNSTITUCION
  INS2:IDINSTITUCION = SOC:IDINSTITUCION
  ACCESS:INSTITUCION.TRYFETCH(INS2:PK_INSTITUCION)
  MINS:INSTITUCION              =  INS2:NOMBRE
  !! BUSCA TIPO TITULO
  TIP6:IDTIPOTITULO = SOC:IDTIPOTITULO
  ACCESS:TIPO_TITULO.TRYFETCH(TIP6:PK_TIPO_TITULO)
  MINS:TITULO                   =  TIP6:DESCRIPCION
  NIV:IDNIVELFOMACION = TIP6:IDNIVELFORMACION
  ACCESS:NIVEL_FORMACION.TRYFETCH(NIV:PK_NIVEL_FORMACION)
  MINS:NIVEL_FORMACION          =  NIV:DESCRIPCION
  MINS:GRADO                    =  NIV:GRADO
  MINS:TIPO_TITULO              =  TIP6:DESCRIPCION
  !!!!!!!!!!!!!!!!!
  
  ADD(MINSALUD)
  IF ERRORCODE() = 35 THEN MESSAGE(ERROR()).
  GLO:NRO_CUOTA = GLO:NRO_CUOTA + 1
  
  
  
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
SendEmail PROCEDURE (string pEmailServer, string pEmailPort, string pEmailFrom, string pEmailTo, string pEmailSubject, string pEmailCC, string pEmailBcc, string pEmailFileList, string pEmailMessageText)

FilesOpened          BYTE                                  ! 
EmailServer          STRING(255)                           ! 
EmailPort            LONG                                  ! 
EmailFrom            STRING(255)                           ! 
EmailTo              STRING(1024)                          ! 
EmailSubject         STRING(252)                           ! 
EmailCC              STRING(1024)                          ! 
EmailBCC             STRING(1024)                          ! 
EmailFileList        STRING(8192)                          ! 
EmailMessageText     STRING(16384)                         ! 
Email_Spacer         USHORT                                ! 
EmailUser            STRING(255)                           ! 
EmailPassword        STRING(255)                           ! 
EmailHelo            STRING(255)                           ! 
EmailSSL             LONG                                  ! 
EmailStartTLS        LONG                                  ! 
EmailEmbedList       STRING(8192)                          ! 
EmailMessageHTML     STRING(16384)                         ! 
EmailCaRoot          STRING(255)                           ! 
window               WINDOW('Sending Email'),AT(,,68,30),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,AUTO,GRAY, |
  IMM,SYSTEM
                       BUTTON('&Send'),AT(9,8,50,15),USE(?EmailSend),LEFT,TIP('Send Email Now')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
!Local Data Classes
ThisSendEmail        CLASS(NetEmailSend)                   ! Generated by NetTalk Extension (Class Definition)
ErrorTrap              PROCEDURE(string errorStr,string functionName),DERIVED
MessageSent            PROCEDURE(),DERIVED

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
  GlobalErrors.SetProcedureName('SendEmail')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EmailSend
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(window)                                        ! Open window
  window{prop:hide} = 1
  post(event:accepted,?EmailSend)
                                               ! Generated by NetTalk Extension (Start)
  ThisSendEmail.SuppressErrorMsg = 1         ! No Object Generated Error Messages ! Generated by NetTalk Extension
  ThisSendEmail.init()
  if ThisSendEmail.error <> 0
    ! Put code in here to handle if the object does not initialise properly
  end
  ! Generated by NetTalk Extension
  ThisSendEmail.OptionsMimeTextTransferEncoding = '7bit'           ! '7bit', '8bit' or 'quoted-printable'
  ThisSendEmail.OptionsMimeHtmlTransferEncoding = 'quoted-printable'           ! '7bit', '8bit' or 'quoted-printable'
  Do DefineListboxStyle
  INIMgr.Fetch('SendEmail',window)                         ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ThisSendEmail.Kill()                      ! Generated by NetTalk Extension
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('SendEmail',window)                      ! Save window data to non-volatile store
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
    OF ?EmailSend
      ThisWindow.Update()
      EmailServer      = pEmailServer
      EmailPort        = pEmailPort
      EmailTo          = pEmailTo
      EmailFrom        = pEmailFrom
      EmailCC          = pEmailCC
      EmailBCC         = pEmailBCC
      EmailSubject     = pEmailSubject
      EmailFileList    = pEmailFileList
      EmailMessageText = pEmailMessageText
      EmailUser = clip (USUARIO_SMTP)          ! New 31/12/2001
      EmailPassword = clip (PASSWORD_SMTP)  ! New 31/12/2001
      !ThisSendEmail.SecureEmail = 0 !SMTP_SEGURO
      
      ! Generated by NetTalk Extension
      ThisSendEmail.Server = EmailServer
      ThisSendEmail.Port = EmailPort
      ThisSendEmail.AuthUser = EmailUser
      ThisSendEmail.AuthPassword = EmailPassword
      ThisSendEmail.SSL = EmailSSL
      ThisSendEmail.SecureEmailStartTLS = EmailStartTLS
      If ThisSendEmail.SSL or ThisSendEmail.SecureEmailStartTLS
        ThisSendEmail.SSLCertificateOptions.CertificateFile = ''
        ThisSendEmail.SSLCertificateOptions.PrivateKeyFile = ''
        ThisSendEmail.SSLCertificateOptions.DontVerifyRemoteCertificateWithCARoot = 1
        ThisSendEmail.SSLCertificateOptions.DontVerifyRemoteCertificateCommonName = 1
        ThisSendEmail.SSLCertificateOptions.CARootFile = EmailCARoot
      End
      If ThisSendEmail.SecureEmailStartTLS
        ThisSendEmail.SSLCertificateOptions.DontVerifyRemoteCertificateCommonName = 1 ! Fudge this for now, as the certificate is not known when NetSimple does the CommonName check
      End
      ThisSendEmail.From = EmailFrom
      ThisSendEmail.ToList = EmailTo
      ThisSendEmail.ccList = EmailCC
      ThisSendEmail.bccList = EmailBCC
      ThisSendEmail.Subject = EmailSubject
      ThisSendEmail.AttachmentList = EmailFileList
      ThisSendEmail.EmbedList = EmailEmbedList
      ThisSendEmail.SetRequiredMessageSize (0, len(clip(EmailMessageText)), 0) ! You must call this function before populating self.MessageText  #ELSIF ( <> '')
      if ThisSendEmail.Error = 0
        ThisSendEmail.MessageText = EmailMessageText
        display()
        ThisSendEmail.SendMail(NET:EMailMadeFromPartsMode)
        display()
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    ThisSendEmail.TakeEvent()                 ! Generated by NetTalk Extension
  ReturnValue = PARENT.TakeEvent()
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
    OF EVENT:CloseWindow
      ! Generated by NetTalk Extension
      if records (ThisSendEmail.DataQueue) > 0
        if Message ('The email is still being sent.|Are you sure you want to quit?','Email Sending',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No) = Button:No
          cycle
        end
      end
      ! Generated by NetTalk Extension
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisSendEmail.ErrorTrap PROCEDURE(string errorStr,string functionName)


  CODE
  ! Only display the error message once
  if global:firsttime = 1
    global:firsttime = 0
    self.SuppressErrorMsg = 0
  else
    self.SuppressErrorMsg = 1
  end
  PARENT.ErrorTrap(errorStr,functionName)
  post(event:closewindow)


ThisSendEmail.MessageSent PROCEDURE


  CODE
  PARENT.MessageSent
  post(event:closewindow)

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SOCIOS file
!!! </summary>
CUMPLE2 PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::12:TAGFLAG         BYTE(0)
DASBRW::12:TAGMOUSE        BYTE(0)
DASBRW::12:TAGDISPSTATUS   BYTE(0)
DASBRW::12:QUEUE          QUEUE
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
loc:email            STRING(400)                           ! 
! our data
StartPos             long
EndPos               long
ParamPath            string (255)
Param1               string (255)
count                long
tempFileList         string (Net:StdEmailAttachmentListSize)
QuickerDisplay       byte
MessageCount         long
BRW1::View:Browse    VIEW(CUMPLE)
                       PROJECT(CUM:DIA)
                       PROJECT(CUM:NOMBRE)
                       PROJECT(CUM:EMAIL)
                       PROJECT(CUM:FECHA_NAC)
                       PROJECT(CUM:IDSOCIO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
T_NormalFG             LONG                           !Normal forground color
T_NormalBG             LONG                           !Normal background color
T_SelectedFG           LONG                           !Selected forground color
T_SelectedBG           LONG                           !Selected background color
T_Icon                 LONG                           !Entry's icon ID
CUM:DIA                LIKE(CUM:DIA)                  !List box control field - type derived from field
CUM:DIA_NormalFG       LONG                           !Normal forground color
CUM:DIA_NormalBG       LONG                           !Normal background color
CUM:DIA_SelectedFG     LONG                           !Selected forground color
CUM:DIA_SelectedBG     LONG                           !Selected background color
CUM:DIA_Icon           LONG                           !Entry's icon ID
CUM:NOMBRE             LIKE(CUM:NOMBRE)               !List box control field - type derived from field
CUM:NOMBRE_NormalFG    LONG                           !Normal forground color
CUM:NOMBRE_NormalBG    LONG                           !Normal background color
CUM:NOMBRE_SelectedFG  LONG                           !Selected forground color
CUM:NOMBRE_SelectedBG  LONG                           !Selected background color
CUM:NOMBRE_Icon        LONG                           !Entry's icon ID
CUM:EMAIL              LIKE(CUM:EMAIL)                !List box control field - type derived from field
CUM:EMAIL_NormalFG     LONG                           !Normal forground color
CUM:EMAIL_NormalBG     LONG                           !Normal background color
CUM:EMAIL_SelectedFG   LONG                           !Selected forground color
CUM:EMAIL_SelectedBG   LONG                           !Selected background color
CUM:EMAIL_Icon         LONG                           !Entry's icon ID
CUM:FECHA_NAC          LIKE(CUM:FECHA_NAC)            !List box control field - type derived from field
CUM:FECHA_NAC_NormalFG LONG                           !Normal forground color
CUM:FECHA_NAC_NormalBG LONG                           !Normal background color
CUM:FECHA_NAC_SelectedFG LONG                         !Selected forground color
CUM:FECHA_NAC_SelectedBG LONG                         !Selected background color
CUM:FECHA_NAC_Icon     LONG                           !Entry's icon ID
CUM:IDSOCIO            LIKE(CUM:IDSOCIO)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Enviar E-mails a los Colegiados'),AT(,,499,233),FONT('Arial',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseSOCIOS'),SYSTEM
                       LIST,AT(8,35,478,82),USE(?Browse:1),HVSCROLL,FORMAT('22L(2)|M*I~T~C(0)@s1@32R(2)|M*I~DI' & |
  'A~C(0)@n-3@200L(2)|M*I~NOMBRE~C(0)@s50@400L(2)|M*I~EMAIL~C(0)@s100@40L(2)|M*I~FECHA_' & |
  'NAC~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de SOCIOS'),VCR
                       BUTTON('&Filtros'),AT(7,122,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       SHEET,AT(4,2,486,138),USE(?CurrentTab)
                         TAB('Hoy'),USE(?Tab:1)
                         END
                         TAB('Semana'),USE(?Tab:2)
                         END
                       END
                       BOX,AT(154,123,17,13),USE(?Box2),COLOR(COLOR:Black),FILL(COLOR:Teal),LINEWIDTH(1)
                       BUTTON('&Salir'),AT(450,209,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       STRING(''),AT(16,223,297,10),USE(?Status),TRN
                       PROMPT('Cumpleaños en el día de la fecha'),AT(175,125),USE(?Prompt3)
                       BOX,AT(61,124,17,10),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Red),LINEWIDTH(1)
                       PROMPT('Cumpleaños Vencido'),AT(81,124),USE(?Prompt2)
                       PROGRESS,AT(15,211,437,8),USE(?OurProgress),COLOR(COLOR:White,,COLOR:Lime),HIDE,RANGE(0,100)
                       BUTTON('&Borrar'),AT(103,207,49,14),USE(?Delete:3),LEFT,CURSOR('mano.cur'),DISABLE,HIDE,MSG('Borra Registro'), |
  TIP('Borra Registro')
                       GROUP,AT(5,141,485,27),USE(?Group1),BOXED
                         BUTTON('&Marcar'),AT(11,149,80,13),USE(?DASTAG),FLAT
                         BUTTON('Marcar Todo '),AT(305,149,80,13),USE(?DASTAGAll),FLAT
                         BUTTON('&Desmarcar Todo'),AT(109,149,80,13),USE(?DASUNTAGALL),FLAT
                         BUTTON('&Revertir Marca'),AT(207,149,80,13),USE(?DASREVTAG),FLAT
                         BUTTON('Mostrar solo Marca'),AT(403,149,80,13),USE(?DASSHOWTAG),FLAT
                       END
                       GROUP('E-Mail'),AT(4,169,485,39),USE(?Group2),BOXED
                         PROMPT('AÑADIDO:'),AT(22,185),USE(?LOC:ATTACH:Prompt)
                         ENTRY(@s254),AT(60,185,110,10),USE(LOC:ATTACH)
                         BUTTON('...'),AT(172,185,12,12),USE(?LookupFile)
                         BUTTON('Enviar E-mail'),AT(192,177,82,21),USE(?Button12),LEFT,ICON('mail.ico'),FLAT
                         BUTTON('Ver e-Mails Enviados'),AT(280,177,82,21),USE(?Button13),LEFT,ICON('pin_blue.ico'), |
  FLAT
                         BUTTON('Enviar x SMTP '),AT(358,181,80,17),USE(?Button14),LEFT,ICON('mail.ico'),DISABLE,FLAT, |
  HIDE
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE2                 QueryListClass                        ! QBE List Class. 
QBV2                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FileLookup7          SelectFileClass
!Local Data Classes
ThisEmailSend        CLASS(NetEmailSend)                   ! Generated by NetTalk Extension (Class Definition)

                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::12:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = CUM:IDSOCIO
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = CUM:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  Queue:Browse:1.T_NormalFG = -1
  Queue:Browse:1.T_NormalBG = -1
  Queue:Browse:1.T_SelectedFG = -1
  Queue:Browse:1.T_SelectedBG = -1
    Queue:Browse:1.T_Icon = 0
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::12:TAGMOUSE = 1 THEN
    DASBRW::12:TAGMOUSE = 0
  ELSE
  DASBRW::12:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::12:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = CUM:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::12:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::12:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::12:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::12:QUEUE = TAGS
    ADD(DASBRW::12:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::12:QUEUE.PUNTERO = CUM:IDSOCIO
     GET(DASBRW::12:QUEUE,DASBRW::12:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = CUM:IDSOCIO
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::12:DASSHOWTAG Routine
   CASE DASBRW::12:TAGDISPSTATUS
   OF 0
      DASBRW::12:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Ver  Solo Marcados'
      ?DASSHOWTAG{PROP:Msg}  = 'Ver  Solo Marcados'
      ?DASSHOWTAG{PROP:Tip}  = 'Ver  Solo Marcados'
   OF 1
      DASBRW::12:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Mostrar Desmarcados'
      ?DASSHOWTAG{PROP:Msg}  = 'Mostrar Desmarcados'
      ?DASSHOWTAG{PROP:Tip}  = 'Mostrar Desmarcados'
   OF 2
      DASBRW::12:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Ver Todo'
      ?DASSHOWTAG{PROP:Msg}  = 'Ver Todo'
      ?DASSHOWTAG{PROP:Tip}  = 'Ver Todo'
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
  GlobalErrors.SetProcedureName('CUMPLE2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CUM:FECHA_NAC',CUM:FECHA_NAC)                      ! Added by: DAS_TagBrowseABC(DAS_TagingABC)
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CUMPLE.Open                                       ! File CUMPLE used by this procedure, so make sure it's RelationManager is open
  Relate:EMAIL.Open                                        ! File EMAIL used by this procedure, so make sure it's RelationManager is open
  Relate:EMAILS.Open                                       ! File EMAILS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CUMPLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
                                               ! Generated by NetTalk Extension (Start)
  ThisEmailSend.init()
  if ThisEmailSend.error <> 0
    ! Put code in here to handle if the object does not initialise properly
  end
  Do DefineListboxStyle
  !ProcedureTemplate = Window
  QBE2.Init(QBV2, INIMgr,'VER_SOCIOS', GlobalErrors)
  QBE2.QkSupport = True
  QBE2.QkMenuIcon = 'QkQBE.ico'
  QBE2.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CUM:por_dia)                          ! Add the sort order for CUM:por_dia for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CUM:FECHA_NAC,1,BRW1)          ! Initialize the browse locator using  using key: CUM:por_dia , CUM:FECHA_NAC
  BRW1.SetFilter('(day(today()) <<> day(CUM:FECHA_NAC))')  ! Apply filter expression to browse
  BRW1.AddSortOrder(,CUM:por_dia)                          ! Add the sort order for CUM:por_dia for sort order 2
  BRW1.SetFilter('(day(today()) = day(CUM:FECHA_NAC) and month( CUM:FECHA_NAC) = month (today()))') ! Apply filter expression to browse
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(CUM:DIA,BRW1.Q.CUM:DIA)                    ! Field CUM:DIA is a hot field or requires assignment from browse
  BRW1.AddField(CUM:NOMBRE,BRW1.Q.CUM:NOMBRE)              ! Field CUM:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CUM:EMAIL,BRW1.Q.CUM:EMAIL)                ! Field CUM:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(CUM:FECHA_NAC,BRW1.Q.CUM:FECHA_NAC)        ! Field CUM:FECHA_NAC is a hot field or requires assignment from browse
  BRW1.AddField(CUM:IDSOCIO,BRW1.Q.CUM:IDSOCIO)            ! Field CUM:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CUMPLE2',QuickWindow)                      ! Restore window settings from non-volatile store
  global:firsttime = 1
  EmailServer  = clip(SMTP)
  EmailPort    = PUERTO
  EmailFrom    = clip(GLO:MAILEMP)
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE2,1)
  FileLookup7.Init
  FileLookup7.ClearOnCancel = True
  FileLookup7.Flags=BOR(FileLookup7.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup7.SetMask('All Files','*.*')                   ! Set the file mask
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  FREE(TAGS)
  ?DASSHOWTAG{PROP:Text} = 'Ver Todo'
  ?DASSHOWTAG{PROP:Msg}  = 'Ver Todo'
  ?DASSHOWTAG{PROP:Tip}  = 'Ver Todo'
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  ?Browse:1{Prop:Alrt,239} = SpaceKey
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ThisEmailSend.Kill()                              ! Generated by NetTalk Extension
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
    Relate:CUMPLE.Close
    Relate:EMAIL.Close
    Relate:EMAILS.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUMPLE2',QuickWindow)                   ! Save window data to non-volatile store
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
    OF ?Button12
      EmailSubject =  'Salutación por su Cumpleaños'
      EmailFileList = CLIP(LOC:ATTACH)
      
      ! Carga tabla  con los tags
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CUM:IDSOCIO = tags:Puntero
          If NOT Access:cumple.Fetch(CUM:PK_CUMPLE)
                 loc:email = 'Estimado/a '&clip(CUM:NOMBRE)&':'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'Que el bienestar y la prosperidad siempre la acompañen a donde quiera que vaya, que su vida personal se llene de éxitos prósperos y que la alegría de este día se convierta en una vorágine constante en su vida.'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'Feliz Cumpleaños!!!'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'Comisión Directiva'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'Colegio de Psicologos del Valle Inferior de Río Negro'
                 EmailMessageText = clip(loc:email)
                 EmailTo= clip(CUM:EMAIL)
                 cantidad# = cantidad# + 1
                 SendEmail(EmailServer, EmailPort, EmailFrom, EmailTo, EmailSubject, EmailCC, EmailBcc, EmailFileList, EmailMessageText)
                 IF NOT ERRORCODE() THEN
                  SOC:IDSOCIO = CUM:IDSOCIO
                  ACCESS:SOCIOS.TRyFETCH(SOC:PK_SOCIOS)
                  SOC:CUMPLE = YEAR(TODAY())
                  ACCESS:SOCIOS.UPDATE()
                 END
                 PARA" = PARA"&';'&clip(SOC:EMAIL)
         end
      
      End
         !!! GUARDA EL EMAIL
         EML:PARA       = PARA"
         EML:TITULO     = LOC:ASUNTO
         EML:MENSAJE    = LOC:CUERPO
         EML:ADJUNTO    = LOC:ATTACH
         EML:FECHA      = today()
         EML:HORA       = clock()
         ACCESS:EMAILS.INSERT()
         !! MARCA EMAIL ENVIADO
      
      MESSAGE('SE ENVIARON '&CANTIDAD#&' DE E-MAILS')
      
    OF ?Button14
      EmailSubject =  CLIP(LOC:ASUNTO)
      EmailFileList = CLIP(LOC:ATTACH)
      EmailMessageText = LOC:CUERPO
      
      ! Carga tabla  con los tags
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          SOC:IDSOCIO = tags:Puntero
          If NOT Access:SOCIOS.Fetch(SOC:PK_SOCIOS)
                 EmailTo= clip(SOC:EMAIL)
                 cantidad# = cantidad# + 1
                 PARA" = PARA"&';'&clip(SOC:EMAIL)
                  !! manda email
                  ThisEmailSend.Server = clip(SMTP)
                  ThisEmailSend.Port = clip(PUERTO)
                  ThisEmailSend.ToList = Emailto
                  ThisEmailSend.ccList = ''
                  ThisEmailSend.bccList = ''
                  ThisEmailSend.From = GLO:MAILEMP
                  ThisEmailSend.Helo = ''
                  ThisEmailSend.Subject = EmailSubject
                  ThisEmailSend.ReplyTo = ''
                  ThisEmailSend.Organization = ''
                  ThisEmailSend.DeliveryReceiptTo = ''
                  ThisEmailSend.DispositionNotificationTo = ''
                  ThisEmailSend.References = ''     ! Used for replies e.g. '<<00cd01c02dde$765a6880$0802a8c0@spiff> <<00dc01c02de0$35fbea00$0802a8c0@spiff>'
                  ThisEmailSend.AttachmentList = LOC:ATTACH
                  ThisEmailSend.EmbedList = ''!EmbedList
                  ThisEmailSend.AuthUser = clip (USUARIO_SMTP)
                  ThisEmailSend.AuthPassword = clip (PASSWORD_SMTP)
                  !ThisEmailSend.SecureEmail = SMTP_SEGURO
                  !ThisEmailSend.MessageText = EmailMessageText
                  ThisEmailSend.SetRequiredMessageSize (0, len(clip(EmailMessageText)), len(clip(MessageHTML)))
      
                  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  ! ThisEmailSend.SendMail(NET:EMailMadeFromPartsMode)  ! Put email in queue and start sending it now
                  !!!!!!!!!!!!!!1
                  if ThisEmailSend.Error = 0
                        if len(clip(EmailMessageText)) > 0
                          ThisEmailSend.MessageText = EmailMessageText
                        end
                        if len(clip(MessageHTML)) > 0
                          ThisEmailSend.MessageHTML = MessageHTML
                        end
      
                        ThisEmailSend.SendMail(NET:EMailMadeFromPartsMode)  ! Put email in queue and start sending it now
                        if ThisEmailSend.error <> 0
                          ! Handle Send Error (This error is a connection error - not a sending error)
                          ?status{prop:text} = 'Could not connect to email server.'
                        else
                          if records (ThisEmailSend.DataQueue) > 0
                            ?status{prop:text} = 'Sending ' & records (ThisEmailSend.DataQueue) & ' email(s)'
                          else
                            ?status{prop:text} = ''
                          end
                        end
      
                        if QuickerDisplay = 0
                          setcursor
                        end
                        display(?status)
                              
                  end
      
          end
      End
         !!! GUARDA EL EMAIL
         EML:PARA       = PARA"
         EML:TITULO     = LOC:ASUNTO
         EML:MENSAJE    = LOC:CUERPO
         EML:ADJUNTO    = LOC:ATTACH
         EML:FECHA      = today()
         EML:HORA       = clock()
         ACCESS:EMAILS.INSERT()
      
      MESSAGE('SE ENVIARON '&CANTIDAD#&' DE E-MAILS')
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?LookupFile
      ThisWindow.Update()
      LOC:ATTACH = FileLookup7.Ask(0)
      DISPLAY
    OF ?Button13
      ThisWindow.Update()
      START(VER_MAILS, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    ThisEmailSend.TakeEvent()                 ! Generated by NetTalk Extension
  ReturnValue = PARENT.TakeEvent()
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
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::12:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::12:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::12:TAGFLAG = 0
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CUM:IDSOCIO
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
  
  IF (CUM:DIA = day(today()) and month( CUM:FECHA_NAC) = month (today()))
    SELF.Q.T_NormalFG = 8421376                            ! Set conditional color values for T
    SELF.Q.T_NormalBG = 16777215
    SELF.Q.T_SelectedFG = 16777215
    SELF.Q.T_SelectedBG = 8421376
    SELF.Q.CUM:DIA_NormalFG = 8421376                      ! Set conditional color values for CUM:DIA
    SELF.Q.CUM:DIA_NormalBG = 16777215
    SELF.Q.CUM:DIA_SelectedFG = 16777215
    SELF.Q.CUM:DIA_SelectedBG = 8421376
    SELF.Q.CUM:NOMBRE_NormalFG = 8421376                   ! Set conditional color values for CUM:NOMBRE
    SELF.Q.CUM:NOMBRE_NormalBG = 16777215
    SELF.Q.CUM:NOMBRE_SelectedFG = 16777215
    SELF.Q.CUM:NOMBRE_SelectedBG = 8421376
    SELF.Q.CUM:EMAIL_NormalFG = 8421376                    ! Set conditional color values for CUM:EMAIL
    SELF.Q.CUM:EMAIL_NormalBG = 16777215
    SELF.Q.CUM:EMAIL_SelectedFG = 16777215
    SELF.Q.CUM:EMAIL_SelectedBG = 8421376
    SELF.Q.CUM:FECHA_NAC_NormalFG = 8421376                ! Set conditional color values for CUM:FECHA_NAC
    SELF.Q.CUM:FECHA_NAC_NormalBG = 16777215
    SELF.Q.CUM:FECHA_NAC_SelectedFG = 16777215
    SELF.Q.CUM:FECHA_NAC_SelectedBG = 8421376
  ELSIF (CUM:DIA < day(today()) and month( CUM:FECHA_NAC) = month (today()))
    SELF.Q.T_NormalFG = 255                                ! Set conditional color values for T
    SELF.Q.T_NormalBG = 16777215
    SELF.Q.T_SelectedFG = 16777215
    SELF.Q.T_SelectedBG = 255
    SELF.Q.CUM:DIA_NormalFG = 255                          ! Set conditional color values for CUM:DIA
    SELF.Q.CUM:DIA_NormalBG = 16777215
    SELF.Q.CUM:DIA_SelectedFG = 16777215
    SELF.Q.CUM:DIA_SelectedBG = 255
    SELF.Q.CUM:NOMBRE_NormalFG = 255                       ! Set conditional color values for CUM:NOMBRE
    SELF.Q.CUM:NOMBRE_NormalBG = 16777215
    SELF.Q.CUM:NOMBRE_SelectedFG = 16777215
    SELF.Q.CUM:NOMBRE_SelectedBG = 255
    SELF.Q.CUM:EMAIL_NormalFG = 255                        ! Set conditional color values for CUM:EMAIL
    SELF.Q.CUM:EMAIL_NormalBG = 16777215
    SELF.Q.CUM:EMAIL_SelectedFG = 16777215
    SELF.Q.CUM:EMAIL_SelectedBG = 255
    SELF.Q.CUM:FECHA_NAC_NormalFG = 255                    ! Set conditional color values for CUM:FECHA_NAC
    SELF.Q.CUM:FECHA_NAC_NormalBG = 16777215
    SELF.Q.CUM:FECHA_NAC_SelectedFG = 16777215
    SELF.Q.CUM:FECHA_NAC_SelectedBG = 255
  ELSE
    SELF.Q.T_NormalFG = -1                                 ! Set color values for T
    SELF.Q.T_NormalBG = -1
    SELF.Q.T_SelectedFG = -1
    SELF.Q.T_SelectedBG = -1
    SELF.Q.CUM:DIA_NormalFG = -1                           ! Set color values for CUM:DIA
    SELF.Q.CUM:DIA_NormalBG = -1
    SELF.Q.CUM:DIA_SelectedFG = -1
    SELF.Q.CUM:DIA_SelectedBG = -1
    SELF.Q.CUM:NOMBRE_NormalFG = -1                        ! Set color values for CUM:NOMBRE
    SELF.Q.CUM:NOMBRE_NormalBG = -1
    SELF.Q.CUM:NOMBRE_SelectedFG = -1
    SELF.Q.CUM:NOMBRE_SelectedBG = -1
    SELF.Q.CUM:EMAIL_NormalFG = -1                         ! Set color values for CUM:EMAIL
    SELF.Q.CUM:EMAIL_NormalBG = -1
    SELF.Q.CUM:EMAIL_SelectedFG = -1
    SELF.Q.CUM:EMAIL_SelectedBG = -1
    SELF.Q.CUM:FECHA_NAC_NormalFG = -1                     ! Set color values for CUM:FECHA_NAC
    SELF.Q.CUM:FECHA_NAC_NormalBG = -1
    SELF.Q.CUM:FECHA_NAC_SelectedFG = -1
    SELF.Q.CUM:FECHA_NAC_SelectedBG = -1
  END
  SELF.Q.T_Icon = 0
  SELF.Q.CUM:DIA_Icon = 0
  SELF.Q.CUM:NOMBRE_Icon = 0
  SELF.Q.CUM:EMAIL_Icon = 0
  SELF.Q.CUM:FECHA_NAC_Icon = 0


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
     TAGS.PUNTERO = CUM:IDSOCIO
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::12:TAGDISPSTATUS
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
!!! Generated from procedure template - Window
!!! Actualizacion EMAILS
!!! </summary>
UpdateEMAILS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::EML:Record  LIKE(EML:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion EMAILS'),AT(,,531,243),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateEMAILS'),SYSTEM
                       PROMPT('IDEMAIL:'),AT(1,4),USE(?EML:IDEMAIL:Prompt),TRN
                       ENTRY(@n-14),AT(54,4,64,10),USE(EML:IDEMAIL),DISABLE
                       PROMPT('PARA:'),AT(1,23),USE(?Prompt5)
                       TEXT,AT(53,23,464,40),USE(EML:PARA),VSCROLL,BOXED
                       PROMPT('TITULO:'),AT(1,70),USE(?EML:TITULO:Prompt),TRN
                       ENTRY(@s100),AT(53,70,461,10),USE(EML:TITULO)
                       TEXT,AT(53,90,464,102),USE(EML:MENSAJE),VSCROLL,BOXED
                       PROMPT('MENSAJE:'),AT(1,90),USE(?Prompt6)
                       PROMPT('ADJUNTO:'),AT(1,202),USE(?EML:ADJUNTO:Prompt),TRN
                       ENTRY(@s100),AT(52,202,289,10),USE(EML:ADJUNTO)
                       BUTTON('&Aceptar'),AT(41,225,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,HIDE,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza' & |
  ' el Formulario')
                       BUTTON('&Cancelar'),AT(469,220,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateEMAILS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EML:IDEMAIL:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(EML:Record,History::EML:Record)
  SELF.AddHistoryField(?EML:IDEMAIL,1)
  SELF.AddHistoryField(?EML:PARA,2)
  SELF.AddHistoryField(?EML:TITULO,3)
  SELF.AddHistoryField(?EML:MENSAJE,4)
  SELF.AddHistoryField(?EML:ADJUNTO,5)
  SELF.AddUpdateFile(Access:EMAILS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:EMAILS.Open                                       ! File EMAILS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:EMAILS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?EML:IDEMAIL{PROP:ReadOnly} = True
    ?EML:PARA{PROP:ReadOnly} = True
    ?EML:TITULO{PROP:ReadOnly} = True
    ?EML:MENSAJE{PROP:ReadOnly} = True
    ?EML:ADJUNTO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateEMAILS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EMAILS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateEMAILS',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
!!! Browse the EMAILS File
!!! </summary>
VER_MAILS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(EMAILS)
                       PROJECT(EML:FECHA)
                       PROJECT(EML:HORA)
                       PROJECT(EML:PARA)
                       PROJECT(EML:TITULO)
                       PROJECT(EML:MENSAJE)
                       PROJECT(EML:ADJUNTO)
                       PROJECT(EML:IDEMAIL)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EML:FECHA              LIKE(EML:FECHA)                !List box control field - type derived from field
EML:HORA               LIKE(EML:HORA)                 !List box control field - type derived from field
EML:PARA               LIKE(EML:PARA)                 !List box control field - type derived from field
EML:TITULO             LIKE(EML:TITULO)               !List box control field - type derived from field
EML:MENSAJE            LIKE(EML:MENSAJE)              !List box control field - type derived from field
EML:ADJUNTO            LIKE(EML:ADJUNTO)              !List box control field - type derived from field
EML:IDEMAIL            LIKE(EML:IDEMAIL)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('vISTA DE LOS EMAILS ENVIADOS'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('VER_MAILS'),SYSTEM
                       LIST,AT(8,39,342,115),USE(?Browse:1),HVSCROLL,FORMAT('49L(2)|M~FECHA~@d17@37L(2)|M~HORA' & |
  '~@t7@80L(2)|M~PARA~@s254@80L(2)|M~TITULO~@s100@80L(2)|M~MENSAJE~@s254@80L(2)|M~ADJUN' & |
  'TO~@s100@64R(2)|M~IDEMAIL~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de EMAILS')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  DISABLE,FLAT,HIDE,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('EMAILS'),USE(?Tab:2)
                         END
                         TAB('TITULO'),USE(?Tab:3)
                           PROMPT('TITULO:'),AT(9,25),USE(?EML:TITULO:Prompt)
                           ENTRY(@s100),AT(59,24,232,10),USE(EML:TITULO)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('VER_MAILS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('EML:IDEMAIL',EML:IDEMAIL)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:EMAILS.Open                                       ! File EMAILS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:EMAILS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,EML:EMAILS_TITULO)                    ! Add the sort order for EML:EMAILS_TITULO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?EML:TITULO,EML:TITULO,,BRW1)   ! Initialize the browse locator using ?EML:TITULO using key: EML:EMAILS_TITULO , EML:TITULO
  BRW1.AddSortOrder(,EML:PK_EMAILS)                        ! Add the sort order for EML:PK_EMAILS for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,EML:IDEMAIL,,BRW1)             ! Initialize the browse locator using  using key: EML:PK_EMAILS , EML:IDEMAIL
  BRW1.AddField(EML:FECHA,BRW1.Q.EML:FECHA)                ! Field EML:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(EML:HORA,BRW1.Q.EML:HORA)                  ! Field EML:HORA is a hot field or requires assignment from browse
  BRW1.AddField(EML:PARA,BRW1.Q.EML:PARA)                  ! Field EML:PARA is a hot field or requires assignment from browse
  BRW1.AddField(EML:TITULO,BRW1.Q.EML:TITULO)              ! Field EML:TITULO is a hot field or requires assignment from browse
  BRW1.AddField(EML:MENSAJE,BRW1.Q.EML:MENSAJE)            ! Field EML:MENSAJE is a hot field or requires assignment from browse
  BRW1.AddField(EML:ADJUNTO,BRW1.Q.EML:ADJUNTO)            ! Field EML:ADJUNTO is a hot field or requires assignment from browse
  BRW1.AddField(EML:IDEMAIL,BRW1.Q.EML:IDEMAIL)            ! Field EML:IDEMAIL is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('VER_MAILS',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateEMAILS
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EMAILS.Close
  END
  IF SELF.Opened
    INIMgr.Update('VER_MAILS',QuickWindow)                 ! Save window data to non-volatile store
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
    UpdateEMAILS
    ReturnValue = GlobalResponse
  END
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
CUMPLE PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,MDI,TIMER(1)
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
  GlobalErrors.SetProcedureName('CUMPLE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CUMPLE.Open                                       ! File CUMPLE used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUMPLE',ProgressWindow)                    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CUMPLE.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUMPLE',ProgressWindow)                 ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  CUMPLE2()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  A#= TODAY() - 5
  B# = TODAY() + 5
  AA# = DATE(MONTH(A#),DAY(A#),YEAR(SOC:FECHA_NACIMIENTO))
  BB# = DATE(MONTH(B#),DAY(B#),YEAR(SOC:FECHA_NACIMIENTO))
  C#= YEAR(TODAY())
  
  IF SOC:FECHA_NACIMIENTO >= AA#  AND SOC:FECHA_NACIMIENTO <= BB# AND SOC:EMAIL <> '' AND SOC:BAJA = 'NO' AND SOC:CUMPLE < C# THEN
      CUM:IDSOCIO     =   SOC:IDSOCIO
      CUM:NOMBRE      =   SOC:NOMBRES&' '&SOC:APELLIDO
      CUM:EMAIL       =   SOC:EMAIL
      CUM:FECHA_NAC   =   SOC:FECHA_NACIMIENTO
      CUM:DIA         =   DAY(SOC:FECHA_NACIMIENTO)
      CUM:MENSAGE     =   'El Colegio de Psicólogos del Valle Inferior de Rió Negro le desea Feliz Cumpleaños'
      CUM:ANO         =   year(SOC:FECHA_NACIMIENTO)
      ACCESS:CUMPLE.INSERT()
  end
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
CUMPLE1 PROCEDURE 

Window               WINDOW('Envio de Emails'),AT(,,169,74),FONT('Arial',8,,FONT:bold),GRAY,MDI
                       BUTTON('&Enviar Mensaje de Cumpleaños'),AT(17,5,131,27),USE(?OkButton),LEFT,ICON(ICON:NextPage), |
  DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(43,41,67,17),USE(?CancelButton),LEFT,ICON('salir.ico'),FLAT
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
  GlobalErrors.SetProcedureName('CUMPLE1')
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
  INIMgr.Fetch('CUMPLE1',Window)                           ! Restore window settings from non-volatile store
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
    INIMgr.Update('CUMPLE1',Window)                        ! Save window data to non-volatile store
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
      open(cumple)
      empty(cumple)
      if errorcode() then message(error()).
      close(cumple)
      
      
      CUMPLE()
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

