

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION026.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION017.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION027.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! VER FACTURAS DETALLE 
!!! </summary>
Imprimir_Ver_Factura_detalle PROCEDURE (FILTRO,ORDEN)

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(FACTURA)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:TOTAL)
                       JOIN(DET:FK_DETALLE_FACTURA,FAC:IDFACTURA)
                         PROJECT(DET:CONCEPTO)
                         PROJECT(DET:IDFACTURA)
                         PROJECT(DET:MONTO)
                       END
                       JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
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

Report               REPORT,AT(1000,2000,6250,7688),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1000),USE(?Header)
                         STRING('GENERACION DE RECIBOS DEUDA -  DETALLADA'),AT(1521,792),USE(?String1),FONT('Arial', |
  10,,FONT:bold+FONT:underline),TRN
                         IMAGE('Logo.JPG'),AT(10,52,1375,875),USE(?Image1)
                       END
break1                 BREAK(DET:IDFACTURA),USE(?BREAK1)
                         HEADER,AT(0,0,,698),USE(?GROUPHEADER1)
                           LINE,AT(10,10,6229,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING('ID RECIBO S.:'),AT(31,52),USE(?String10),TRN
                           STRING(@n-7),AT(896,52),USE(FAC:IDFACTURA),RIGHT(1)
                           STRING('COLEGIADO:'),AT(1583,52),USE(?String11),FONT(,,,FONT:bold),TRN
                           STRING(@n-7),AT(2396,52),USE(FAC:IDSOCIO),FONT(,,,FONT:bold),RIGHT(1)
                           STRING(@s30),AT(3000,52),USE(SOC:NOMBRE),FONT(,,,FONT:bold)
                           STRING('MAT.'),AT(5313,52),USE(?String12),FONT(,,,FONT:bold),TRN
                           STRING(@n-7),AT(5656,52),USE(SOC:MATRICULA),FONT(,,,FONT:bold)
                           STRING('MES:'),AT(42,292),USE(?String13),TRN
                           STRING(@n-3),AT(542,292),USE(FAC:MES),RIGHT(1)
                           STRING('AÑO:'),AT(1021,292),USE(?String14),TRN
                           STRING(@n-5),AT(1458,292),USE(FAC:ANO),RIGHT(1)
                           STRING('ESTADO:'),AT(3833,292),USE(?String16),TRN
                           STRING(@s21),AT(4521,292),USE(FAC:ESTADO)
                           LINE,AT(10,469,6229,0),USE(?Line4),COLOR(COLOR:Black)
                           STRING('ID RECIBO S.'),AT(104,500),USE(?String27),TRN
                           STRING('CONCEPTO'),AT(2948,500),USE(?String28),TRN
                           LINE,AT(10,667,6229,0),USE(?Line5),COLOR(COLOR:Black)
                           STRING('MONTO'),AT(5771,500),USE(?String29),TRN
                         END
detail1                  DETAIL,AT(0,0,,229),USE(?DETAIL1)
                           STRING(@n-14),AT(10,0),USE(DET:IDFACTURA)
                           STRING(@s50),AT(1635,0,3188,177),USE(DET:CONCEPTO)
                           STRING(@n$-10.2),AT(5615,10,563,177),USE(DET:MONTO)
                           LINE,AT(10,187,6229,0),USE(?Line6),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,240),USE(?GROUPFOOTER1)
                           STRING('TOTAL FAC:'),AT(4813,0),USE(?String15),TRN
                           STRING(@n$-10.2),AT(5677,0),USE(FAC:TOTAL)
                           BOX,AT(10,167,7365,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         END
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         STRING('CANT. REG. :'),AT(10,0),USE(?String17),TRN
                         STRING('MONTO TOTAL:'),AT(3604,10),USE(?String18),TRN
                         STRING(@n$-10.2),AT(4802,10,698,208),USE(FAC:TOTAL,,?FAC:TOTAL:2),SUM
                         LINE,AT(21,219,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,240),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2563,344),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5292,333),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                         STRING(@n-14),AT(875,10),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:2),CNT,TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Imprimir_Ver_Factura_detalle')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Imprimir_Ver_Factura_detalle',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:IDFACTURA)
  ThisReport.AddSortOrder(FAC:PK_FACTURA)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:FACTURA.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  THISREPORT.SETFILTER(FILTRO)
  THISREPORT.SETORDER(ORDEN)
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
    INIMgr.Update('Imprimir_Ver_Factura_detalle',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA')
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDSOCIO,RepGen:XML,TargetAttr:TagName,'FAC:IDSOCIO')
  SELF.Attribute.Set(?FAC:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagName,'FAC:MES')
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagName,'FAC:ANO')
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagName,'FAC:ESTADO')
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DET:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DET:IDFACTURA,RepGen:XML,TargetAttr:TagName,'DET:IDFACTURA')
  SELF.Attribute.Set(?DET:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DET:CONCEPTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DET:CONCEPTO,RepGen:XML,TargetAttr:TagName,'DET:CONCEPTO')
  SELF.Attribute.Set(?DET:CONCEPTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DET:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DET:MONTO,RepGen:XML,TargetAttr:TagName,'DET:MONTO')
  SELF.Attribute.Set(?DET:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagName,'FAC:TOTAL')
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
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
                 LocE::Titulo     = 'Facturacion Detallada'
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
           LocE::Subject   = 'Facturacion Detallada'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Dialogo  = 0
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
          LOcE::Qpar.QP:Par  = 'Facturacion Detallada'
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
                 LocE::Titulo     = 'Facturacion Detallada'
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
                 LocE::Titulo     = 'Facturacion Detallada'
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
          LOcE::Qpar.QP:Par  = 'Facturacion Detallada'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'Facturacion Detallada'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Dialogo  = 0
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
  SELF.SetDocumentInfo('CW Report','Gestion','Imprimir_Ver_Factura','Imprimir_Ver_Factura','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
Imprimir_Ver_Factura PROCEDURE (FILTRO,ORDEN)

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(FACTURA)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:TOTAL)
                       JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
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

Report               REPORT,AT(1000,2000,6250,7688),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1000),USE(?Header)
                         IMAGE('Logo.JPG'),AT(21,31,1750,875),USE(?Image1)
                         STRING('REPORTE DE RECIBO DEUDA'),AT(2177,708),USE(?String1),FONT(,,,FONT:bold+FONT:underline), |
  TRN
                         LINE,AT(10,948,6229,0),USE(?Line2),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,500),USE(?Detail)
                         STRING(@n-7),AT(979,10),USE(FAC:IDFACTURA),RIGHT(1)
                         STRING(@s30),AT(2979,10),USE(SOC:NOMBRE)
                         STRING(@n-3),AT(521,250),USE(FAC:MES),RIGHT(1)
                         STRING(@n-5),AT(1438,250),USE(FAC:ANO),RIGHT(1)
                         STRING(@n$-10.2),AT(2938,250),USE(FAC:TOTAL)
                         STRING(@s21),AT(4500,250),USE(FAC:ESTADO)
                         LINE,AT(10,469,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('MES:'),AT(21,250),USE(?String13),TRN
                         STRING('TOTAL REC:'),AT(2135,250),USE(?String15),TRN
                         STRING('ESTADO:'),AT(3813,250),USE(?String16),TRN
                         STRING('AÑO:'),AT(1000,250),USE(?String14),TRN
                         STRING('COLEGIADO:'),AT(1573,10),USE(?String11),TRN
                         STRING('MAT.'),AT(5292,10),USE(?String12),TRN
                         STRING('ID RECIBO S.:'),AT(10,10),USE(?String10),TRN
                         STRING(@s7),AT(2375,10),USE(FAC:IDSOCIO),RIGHT(1)
                         STRING(@s7),AT(5635,10),USE(SOC:MATRICULA)
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         STRING('CANT. REG. :'),AT(10,0),USE(?String17),TRN
                         STRING('MONTO TOTAL:'),AT(3604,10),USE(?String18),TRN
                         STRING(@n$-10.2),AT(4802,10,698,208),USE(FAC:TOTAL,,?FAC:TOTAL:2),SUM
                         LINE,AT(21,219,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,240),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2563,344),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5292,333),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                         STRING(@n-14),AT(875,10),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:2),CNT,TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Imprimir_Ver_Factura')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Imprimir_Ver_Factura',ProgressWindow)      ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:IDFACTURA)
  ThisReport.AddSortOrder(FAC:PK_FACTURA)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:FACTURA.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  THISREPORT.SETFILTER(FILTRO)
  THISREPORT.SETORDER(ORDEN)
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
    INIMgr.Update('Imprimir_Ver_Factura',ProgressWindow)   ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA')
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagName,'FAC:MES')
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagName,'FAC:ANO')
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagName,'FAC:TOTAL')
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagName,'FAC:ESTADO')
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDSOCIO,RepGen:XML,TargetAttr:TagName,'FAC:IDSOCIO')
  SELF.Attribute.Set(?FAC:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
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
                 LocE::Titulo     = 'Facturción Total '
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
           LocE::Subject   = 'Facturción Total '
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Dialogo  = 0
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
          LOcE::Qpar.QP:Par  = 'Facturción Total '
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
                 LocE::Titulo     = 'Facturción Total '
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
                 LocE::Titulo     = 'Facturción Total '
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
          LOcE::Qpar.QP:Par  = 'Facturción Total '
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'Facturción Total '
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Dialogo  = 0
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
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Imprimir_Ver_Factura','Imprimir_Ver_Factura','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
FACTURAR_CABECERA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('FACTURAR_CABECERA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_CABECERA',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
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
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURAR_CABECERA',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF SOC:BAJA_TEMPORARIA = 'NO' AND SOC:BAJA = 'NO' THEN
      FAC:IDSOCIO = SOC:IDSOCIO
      FAC:DESCUENTOESPECIAL  = SOC:DESCUENTO
      ! CONTROLA SI ES LA 1º VEZ QUE SE CARGA LA FACTURA
      PERIODO1# = GLO:PERIODO
      CON3:IDSOCIO = SOC:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          CON3:MES = MONTH (TODAY())
          CON3:ANO = YEAR (TODAY())
          CON3:PEDIODO = CON3:ANO&(FORMAT(CON3:MES,@N02))
          PRIMERA_VEZ" = 'SI'
          ADD(CONTROL_FACTURA)
          IF ERRORCODE() THEN MESSAGE(ERROR()).
          
      ELSE
           GLO:MES = CON3:MES
           GLO:ANO = CON3:ANO
           PERIODO2# = CON3:PEDIODO
           IF CON3:MES = 12 THEN
              GLO:MES = 1
              GLO:ANO = GLO:ANO + 1
           ELSE
               GLO:MES = GLO:MES + 1
           END
           
      END
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      GET(COBERTURA,COB:PK_COBERTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO COBERTURA')
      ELSE
         
          FAC:DESCUENTOCOBERTURA = COB:DESCUENTO
          FAC:INTERES = COB:INTERES
         
      END
    
      !MESSAGE ('EL PERIODO 1:'&PERIODO1#&', EL PERIODO 2:'&PERIODO2#&' 1º VEZ = '&PRIMERA_VEZ")
      IF PERIODO1# > PERIODO2# OR PRIMERA_VEZ"= 'SI' THEN !! CONTROLA QUE YA NO SE HAYA FACTURADO
          FAC:MES  = GLO:MES
          FAC:ANO = GLO:ANO
          FAC:TOTAL  = 0
          FAC:PERIODO =   GLO:ANO&(FORMAT(GLO:MES,@N02))
          FAC:IDUSUARIO = GLO:IDUSUARIO
          FAC:FECHA =TODAY()
          FAC:HORA = CLOCK()
          FAC:ESTADO = 'SIN DETALLE'
          add(FACTURA)
          
       END
  end ! fecha baja
  
  PERIODO1# = 0
  PERIODO2# = 0
  PRIMERA_VEZ" = ''
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Facturacion Total
!!! </summary>
FACTURACION_TOTAL PROCEDURE 

Window               WINDOW('Facturacion Total '),AT(,,185,70),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY
                       BUTTON('FACTURAR TOTAL SOCIOS'),AT(31,16,121,14),USE(?OkButton),LEFT,ICON(ICON:NextPage),DEFAULT, |
  FLAT
                       BUTTON('Cancelar'),AT(61,44,59,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
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
  GlobalErrors.SetProcedureName('FACTURACION_TOTAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:PERIODO_FACTURA.Open                              ! File PERIODO_FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURACION_TOTAL',Window)                 ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  IF GLO:NIVEL < 5 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
     
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PERIODO_FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURACION_TOTAL',Window)              ! Save window data to non-volatile store
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
      CLEAR (PER:RECORD,1)                                                !Point to first record
      SET (PER:IDX_PERIODO_FACTURA_PERIODO,PER:IDX_PERIODO_FACTURA_PERIODO)
      PREVIOUS(PERIODO_FACTURA)
      IF ERRORCODE()
          GLO:MES = MONTH (TODAY())
          GLO:ANO = YEAR (TODAY())
      ELSE
          GLO:MES     = PER:MES
          GLO:ANO     = PER:ANO
          IF PER:MES = 12 THEN
             GLO:MES = 1
             GLO:ANO = GLO:ANO + 1
          ELSE
             GLO:MES = GLO:MES + 1
          END
      END
      CLEAR(PERIODO_FACTURA)
      
      GLO:ESTADO = 'SIN DETALLE'
      GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
      
      
      CASE MESSAGE('SE FACTURARA EL PERIODO MES--> '&GLO:MES&' AÑO-->'&GLO:ANO,'FACTURACION TOTAL',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
      
                                                      !A ? icon with Yes and No buttons, the default button is No
      OF BUTTON:No                            !    the window is System Modal
      
      OF BUTTON:Yes
          
          !!!GUARDA PERIODO FACTURA ACTUAL
          PER:MES         = GLO:MES
          PER:ANO         = GLO:ANO
          PER:PERIODO     = PER:ANO&(FORMAT(PER:MES,@N02))
          PER:FECHA       = TODAY()
          PER:HORA        = CLOCK()
          PER:IDUSUARIO   = GLO:IDUSUARIO
          ADD(PERIODO_FACTURA)
          IF ERRORCODE() THEN MESSAGE(ERROR()).
      
          FACTURAR_CABECERA
          FACTURAR_DETALLE
      
          
      
          GLO:MES = 0
          GLO:ANO = 0
          GLO:PERIODO = ''
      
      END
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
    OF ?CancelButton
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
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
FACTURAR_DETALLE PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                       PROJECT(FAC:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
                         JOIN(SER2:FK_SERVICIOXSOCIO_SOCIOS,SOC:IDSOCIO)
                           PROJECT(SER2:IDSERVICIOS)
                           JOIN(SER:PK_SERVICIOS,SER2:IDSERVICIOS)
                           END
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('FACTURAR_DETALLE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_FACTURA.Open                              ! File DETALLE_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_COBERTURA.Open                               ! File TIPO_COBERTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_DETALLE',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, 0)
  ThisProcess.AddSortOrder(FAC:IDX_FACTURA_ESTADO)
  ThisProcess.AddRange(FAC:ESTADO,GLO:ESTADO)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}='FACTURANDO DETALLE'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SEND(SOCIOS,'QUICKSCAN=on')
  SEND(SERVICIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:CONVENIO.Close
    Relate:CONVENIO_DETALLE.Close
    Relate:DETALLE_FACTURA.Close
    Relate:FACTURA.Close
    Relate:TIPO_COBERTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURAR_DETALLE',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF FAC:ESTADO = GLO:ESTADO THEN
      DET:IDFACTURA =  FAC:IDFACTURA
      DET:MES     =    FAC:MES
      DET:ANO     =    FAC:ANO
      DET:PERIODO =    FAC:PERIODO
      ! SACA MONTOS
      !! 1º BUSCA SOCIO
      SOC:IDSOCIO = FAC:IDSOCIO
      ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
      FECHA_ALTA# = SOC:FECHA_ALTA_MIN
      DESCUENTO$ = SOC:DESCUENTO
      !!!  RECORRE COBERTURA POR SOCIOS
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      GET(COBERTURA,COB:PK_COBERTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO COBERTURA')
      ELSE
          DET:CONCEPTO = COB:DESCRIPCION
          DET:MONTO    = COB:MONTO 
          MONTO_FACTURA$ = MONTO_FACTURA$ + COB:MONTO
          !! BUSCO TIPO DE COBERTURA
          TIPC:IDCOBERTURA  = COB:IDCOBERTURA
          SET(TIPC:FK_TIPO_COBERTURA_1,TIPC:FK_TIPO_COBERTURA_1)
          LOOP
              IF ACCESS:TIPO_COBERTURA.NEXT() THEN BREAK.
              IF TIPC:IDCOBERTURA  <> COB:IDCOBERTURA THEN BREAK.
              EDADMAX# = TIPC:ANO_MAX + 1
              EDADMIN# = TIPC:ANO_MIN
              FECHA_DESDE = DATE(MONTH(TODAY()),DAY(TODAY()+1),YEAR(TODAY()) - EDADMAX#)
              FECHA_HASTA = DATE(MONTH(TODAY()),DAY(TODAY()),YEAR(TODAY()) - EDADMIN#)
              !MESSAGE('FECHA ALTA -->'&FORMAT(FECHA_ALTA#,@D6)&', FECHA DESDE -->'&FECHA_DESDE&', FECHA HASTA -->'&FECHA_HASTA)
              IF FECHA_ALTA# >=FECHA_DESDE AND FECHA_ALTA#<=FECHA_HASTA THEN
                  DET:MONTO = DET:MONTO + TIPC:DIFERENCIA_MONTO - DESCUENTO$ 
                  MONTO_FACTURA$ = MONTO_FACTURA$ + TIPC:DIFERENCIA_MONTO - DESCUENTO$ 
              END
          END !! LOOP
  
          ADD(DETALLE_FACTURA)
          IF ERRORCODE() THEN
              MESSAGE('NO GRABO COBERTURA')
          END
      END
  
      !!!
      !!! RECORRE SERVICIOS POR SOCIOS
      SER2:IDSOCIO = SOC:IDSOCIO
      Set(SER2:FK_SERVICIOXSOCIO_SOCIOS,SER2:FK_SERVICIOXSOCIO_SOCIOS)
      LOOP
          IF ACCESS:SERVICIOxSOCIO.NEXT() THEN BREAK.
          IF (SER2:IDSOCIO <> SOC:IDSOCIO) THEN BREAK.
          !!!BUSCO EL SERVICIO
          SER:IDSERVICIOS = SER2:IDSERVICIOS
          GET (SERVICIOS,SER:PK_SERVICIOS)
          IF ERRORCODE() = 35 THEN
                 MESSAGE('NO ENCONTRO EL SERVICIO')
          ELSE
                   DET:CONCEPTO = SER:DESCRIPCION
                   DET:MONTO    = SER:MONTO - SER:DESCUENTO
                   MONTO_FACTURA$ = MONTO_FACTURA$ + (SER:MONTO - SER:DESCUENTO)
                   ADD(DETALLE_FACTURA)
                   IF ERRORCODE() THEN
                       MESSAGE('NO GRABO SERVICIO')
                  END
         END
      END !! LOOP
  
  
      !!!!!!! SACADO PARA QUE CONVENIO SE PAGUE APARTE..
      !!!  RECORRE CONVENIOS
      CON5:IDSOCIO     = FAC:IDSOCIO
      CON5:PERIODO     = FAC:PERIODO
      SET(CON5:IDX_CONVENIO_DETALLE_SOCIO,CON5:IDX_CONVENIO_DETALLE_SOCIO)
      LOOP
          IF ACCESS:CONVENIO_DETALLE.NEXT() THEN BREAK.
          IF (CON5:IDSOCIO <> FAC:IDSOCIO) OR (CON5:PERIODO  <> FAC:PERIODO) THEN BREAK.
           IF CON5:IDSOCIO     = FAC:IDSOCIO AND CON5:PERIODO     = FAC:PERIODO AND CON5:CANCELADO = '' THEN
              DET:CONCEPTO = 'CONVENIO '&CON5:IDSOLICITUD&' '&CON5:OBSERVACION
              DET:MONTO    = CON5:MONTO_CUOTA
              MONTO_FACTURA$ = MONTO_FACTURA$ + CON5:MONTO_CUOTA
              ADD(DETALLE_FACTURA)
              IF ERRORCODE() THEN
                  MESSAGE('NO GRABO CONVENIO')
              END
              CON5:CANCELADO = 'SI'
              PUT(CONVENIO_DETALLE)
              !!!BUSCA CANCELACION EN TABLA CONVENIO
              IF CON5:DEUDA_INICIAL <= 0.1 THEN
                  CON4:IDSOLICITUD =  CON5:IDSOLICITUD
                  GET (CONVENIO,CON4:PK_CONVENIO)
                  IF ERRORCODE() = 35 THEN
                      MESSAGE('NO ENCONTRO EL CONVENIO')
                  ELSE
                     CON4:CANCELADO = 'SI'
                     CON4:FECHA_CANCELADO = TODAY()
                     PUT(CONVENIO)
                  END
              END
           ELSE
              MESSAGE('ERROR EN FACTURACION AVISE A AL ENCARGADO DEL SISTEMA')
           END
      END ! LOOP
  
      !!!
  
      !!! CARGA LA FACTURA
      FAC:ESTADO = ''
      FAC:TOTAL =  MONTO_FACTURA$
      PUT(FACTURA)
      CONTADOR$ = 0
      ! CONTROLA SI ES LA 1º VEZ QUE SE CARGA LA FACTURA
      CON3:IDSOCIO = FAC:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO CONTROL DE FACTURA FINAL')
      ELSE
          CON3:MES = FAC:MES
          CON3:ANO = FAC:ANO
          CON3:PEDIODO = FAC:ANO&(FORMAT(FAC:MES,@N02))
          PUT(CONTROL_FACTURA)
      END
  
  
  END
  
   SOC:IDSOCIO = FAC:IDSOCIO
   GET (SOCIOS,SOC:PK_SOCIOS)
   IF ERRORCODE() = 35 THEN
      MESSAGE ('NO ENCONTRO SOCIO')
   ELSE
      SOC:CANTIDAD = SOC:CANTIDAD +1 
      PUT(SOCIOS)
   END
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
FACTURAR_CABECERA1 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('FACTURAR_CABECERA1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_CABECERA1',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ThisProcess.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
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
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURAR_CABECERA1',ProgressWindow)     ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF SOC:BAJA_TEMPORARIA = 'NO' AND SOC:BAJA = 'NO' THEN
      !!!  RECORRE COBERTURA POR SOCIOS
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      GET(COBERTURA,COB:PK_COBERTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO COBERTURA')
      ELSE
          IF COB:FORMA_PAGO = 'ANUAL' THEN
              COBERTURA" = 'ANUAL'
          END
          FAC:DESCUENTOCOBERTURA = COB:DESCUENTO
          FAC:INTERES = COB:INTERES
      END
  
      FAC:IDSOCIO = SOC:IDSOCIO
      FAC:DESCUENTOESPECIAL  = SOC:DESCUENTO
      ! CONTROLA SI ES LA 1º VEZ QUE SE CARGA LA FACTURA
      PERIODO1# = GLO:PERIODO
      CON3:IDSOCIO = SOC:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          CON3:MES = GLO:MES
          CON3:ANO = GLO:ANO
          CON3:PEDIODO = CON3:ANO&(FORMAT(CON3:MES,@N02))
          PRIMERA_VEZ" = 'SI'
          ADD(CONTROL_FACTURA)
          IF ERRORCODE() THEN MESSAGE(ERROR()).
          
      ELSE
  
           !!! SI ES ANUAL
           IF COBERTURA" = 'ANUAL' THEN
               GLO:MES = CON3:MES
               GLO:ANO = CON3:ANO
               PERIODO2# = CON3:PEDIODO
               GLO:ANO = GLO:ANO + 1 !! SOLO AUMENTA EL AÑO
           ELSE
               !! ES MENSUAL
               GLO:MES = CON3:MES
               GLO:ANO = CON3:ANO
               PERIODO2# = CON3:PEDIODO
               IF CON3:MES = 12 THEN
                  GLO:MES = 1
                  GLO:ANO = GLO:ANO + 1
               ELSE
                   GLO:MES = GLO:MES + 1
               END
           END
      END
      COBERTURA" = ''
      !MESSAGE ('EL PERIODO 1:'&PERIODO1#&', EL PERIODO 2:'&PERIODO2#&' 1º VEZ = '&PRIMERA_VEZ")
      IF PERIODO1# > PERIODO2# OR PRIMERA_VEZ"= 'SI' THEN !! CONTROLA QUE YA NO SE HAYA FACTURADO
          FAC:MES  = GLO:MES
          FAC:ANO = GLO:ANO
          FAC:TOTAL  = 0
          FAC:PERIODO =   GLO:ANO&(FORMAT(GLO:MES,@N02))
          FAC:IDUSUARIO = GLO:IDUSUARIO
          FAC:FECHA =TODAY()
          FAC:HORA = CLOCK()
          FAC:ESTADO = 'SIN DETALLE'
          add(FACTURA)
          
       END
  end ! fecha baja
  
  PERIODO1# = 0
  PERIODO2# = 0
  PRIMERA_VEZ" = ''
  
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Facturacion Total
!!! </summary>
FACTURACION_INDIVIDUAL PROCEDURE 

Window               WINDOW('Facturacion Individual'),AT(,,250,91),FONT('Arial',8,,FONT:regular),CENTER,GRAY,IMM, |
  MDI,SYSTEM
                       PROMPT('IDSOCIO:'),AT(8,10),USE(?GLO:IDSOCIO:Prompt)
                       ENTRY(@n-14),AT(43,10,60,10),USE(GLO:IDSOCIO),REQ
                       BUTTON('...'),AT(106,9,12,12),USE(?CallLookup)
                       STRING(@s30),AT(123,10),USE(SOC:NOMBRE)
                       STRING(@n-14),AT(159,27),USE(SOC:MATRICULA)
                       LINE,AT(1,38,249,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('Matricula:'),AT(124,27),USE(?Prompt2)
                       BUTTON('FACTURAR SOCIO'),AT(82,45,86,14),USE(?OkButton),LEFT,ICON(ICON:NextPage),DEFAULT,FLAT
                       BUTTON('Cancelar'),AT(94,71,59,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
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
  GlobalErrors.SetProcedureName('FACTURACION_INDIVIDUAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:PERIODO_FACTURA.Open                              ! File PERIODO_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURACION_INDIVIDUAL',Window)            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
     
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:PERIODO_FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURACION_INDIVIDUAL',Window)         ! Save window data to non-volatile store
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
    SelectSOCIOS
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
    OF ?OkButton
      IF SOC:NOMBRE = '' THEN
          SELECT(?GLO:IDSOCIO)
          CYCLE
      ELSE
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          !!!  RECORRE COBERTURA POR SOCIOS
          COB:IDCOBERTURA = SOC:IDCOBERTURA
          GET(COBERTURA,COB:PK_COBERTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE ('NO ENCONTRO COBERTURA')
          ELSE
              IF COB:FORMA_PAGO = 'ANUAL' THEN
                  COBERTURA" = 'ANUAL'
              END
          END
      
          CON3:IDSOCIO = GLO:IDSOCIO
          GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE ('ES LA 1º FACTURA QUE SE EMITE PARA EL COLEGIADO')
              GLO:MES = MONTH(TODAY())
              GLO:ANO = YEAR(TODAY())
              GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
          ELSE
              IF COBERTURA" = 'ANUAL' THEN
                  GLO:MES = CON3:MES
                  GLO:ANO = CON3:ANO
                  PERIODO2# = CON3:PEDIODO
                  GLO:ANO = GLO:ANO + 1 !! SOLO AUMENTA EL AÑO
               ELSE
                  !! ES MENSUAL
                  COBERTURA" = 'MENSUAL'
                  GLO:MES = CON3:MES
                  GLO:ANO = CON3:ANO
                  PERIODO2# = CON3:PEDIODO
                  IF CON3:MES = 12 THEN
                      GLO:MES = 1
                      GLO:ANO = GLO:ANO + 1
                  ELSE
                       GLO:MES = GLO:MES + 1
                  END
              END
          END
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      
          GLO:ESTADO = 'SIN DETALLE'
          GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
      
          !!! BORRAR
          
      
          CASE MESSAGE('SE FACTURARA EL PERIODO MES--> '&GLO:MES&' AÑO-->'&GLO:ANO,'FACTURACION'&COBERTURA",ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
      
                                                          !A ? icon with Yes and No buttons, the default button is No
          OF BUTTON:No                            !    the window is System Modal
      
          OF BUTTON:Yes
              COBERTURA" = ''
              FACTURAR_CABECERA1
              FACTURAR_DETALLE1
              !!!GUARDA PERIODO FACTURA ACTUAL
      
              GLO:MES = 0
              GLO:ANO = 0
              GLO:PERIODO = ''
      
          END
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?GLO:IDSOCIO
      IF GLO:IDSOCIO OR ?GLO:IDSOCIO{PROP:Req}
        SOC:IDSOCIO = GLO:IDSOCIO
        IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDSOCIO = SOC:IDSOCIO
          ELSE
            SELECT(?GLO:IDSOCIO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = GLO:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?OkButton
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
    OF ?CancelButton
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
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
FACTURAR_DETALLE1 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                       PROJECT(FAC:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
                         JOIN(SER2:FK_SERVICIOXSOCIO_SOCIOS,SOC:IDSOCIO)
                           PROJECT(SER2:IDSERVICIOS)
                           JOIN(SER:PK_SERVICIOS,SER2:IDSERVICIOS)
                           END
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('FACTURAR_DETALLE1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:IDSOCIO',GLO:IDSOCIO)                          ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_FACTURA.Open                              ! File DETALLE_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_COBERTURA.Open                               ! File TIPO_COBERTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_DETALLE1',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:ESTADO)
  ThisProcess.AddSortOrder(FAC:IDX_FACTURA_ESTADO)
  ThisProcess.AddRange(FAC:ESTADO,GLO:ESTADO)
  ThisProcess.SetFilter('FAC:IDSOCIO = GLO:IDSOCIO')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SEND(SOCIOS,'QUICKSCAN=on')
  SEND(SERVICIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:CONVENIO.Close
    Relate:CONVENIO_DETALLE.Close
    Relate:DETALLE_FACTURA.Close
    Relate:FACTURA.Close
    Relate:TIPO_COBERTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURAR_DETALLE1',ProgressWindow)      ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF FAC:ESTADO = GLO:ESTADO THEN
      DET:IDFACTURA =  FAC:IDFACTURA
      DET:MES     =    FAC:MES
      DET:ANO     =    FAC:ANO
      DET:PERIODO =    FAC:PERIODO
      ! SACA MONTOS
      ! SACA MONTOS
      !! 1º BUSCA SOCIO
      SOC:IDSOCIO = FAC:IDSOCIO
      ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
      FECHA_ALTA# = SOC:FECHA_ALTA_MIN
      DESCUENTO$ = SOC:DESCUENTO
      !!!  RECORRE COBERTURA POR SOCIOS
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      GET(COBERTURA,COB:PK_COBERTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO COBERTURA')
      ELSE
          DET:CONCEPTO = COB:DESCRIPCION
          DET:MONTO    = COB:MONTO 
          MONTO_FACTURA$ = MONTO_FACTURA$ + COB:MONTO
          !! BUSCO TIPO DE COBERTURA
          TIPC:IDCOBERTURA  = COB:IDCOBERTURA
          SET(TIPC:FK_TIPO_COBERTURA_1,TIPC:FK_TIPO_COBERTURA_1)
          LOOP
              IF ACCESS:TIPO_COBERTURA.NEXT() THEN BREAK.
              IF TIPC:IDCOBERTURA  <> COB:IDCOBERTURA THEN BREAK.
              EDADMAX# = TIPC:ANO_MAX + 1
              EDADMIN# = TIPC:ANO_MIN
              FECHA_DESDE = DATE(MONTH(TODAY()),DAY(TODAY()+1),YEAR(TODAY()) - EDADMAX#)
              FECHA_HASTA = DATE(MONTH(TODAY()),DAY(TODAY()),YEAR(TODAY()) - EDADMIN#)
              !MESSAGE('FECHA ALTA -->'&FORMAT(FECHA_ALTA#,@D6)&', FECHA DESDE -->'&FECHA_DESDE&', FECHA HASTA -->'&FECHA_HASTA)
              IF FECHA_ALTA# >=FECHA_DESDE AND FECHA_ALTA#<=FECHA_HASTA THEN
                  DET:MONTO = DET:MONTO + TIPC:DIFERENCIA_MONTO - DESCUENTO$
                  MONTO_FACTURA$ = MONTO_FACTURA$ + TIPC:DIFERENCIA_MONTO - DESCUENTO$
              END
          END !! LOOP
          ADD(DETALLE_FACTURA)
          IF ERRORCODE() THEN
              MESSAGE('NO GRABO COBERTURA')
          END
      END
  
      !!!
      !!! RECORRE SERVICIOS POR SOCIOS
      SER2:IDSOCIO = SOC:IDSOCIO
      Set(SER2:FK_SERVICIOXSOCIO_SOCIOS,SER2:FK_SERVICIOXSOCIO_SOCIOS)
      LOOP
          IF ACCESS:SERVICIOxSOCIO.NEXT() THEN BREAK.
          IF (SER2:IDSOCIO <> SOC:IDSOCIO) THEN BREAK.
          !!!BUSCO EL SERVICIO
          SER:IDSERVICIOS = SER2:IDSERVICIOS
          GET (SERVICIOS,SER:PK_SERVICIOS)
          IF ERRORCODE() = 35 THEN
                 MESSAGE('NO ENCONTRO EL SERVICIO')
          ELSE
                   DET:CONCEPTO = SER:DESCRIPCION
                   DET:MONTO    = SER:MONTO - SER:DESCUENTO
                   MONTO_FACTURA$ = MONTO_FACTURA$ + (SER:MONTO - SER:DESCUENTO)
                   ADD(DETALLE_FACTURA)
                   IF ERRORCODE() THEN
                       MESSAGE('NO GRABO SERVICIO')
                  END
         END
      END !! LOOP
  
  
      !!!!!!  SE SACO PAR AQUE CONVENIO SE COBRE APARTE
      !!  RECORRE CONVENIOS
      CON5:IDSOCIO     = FAC:IDSOCIO
      CON5:PERIODO     = FAC:PERIODO
      SET(CON5:IDX_CONVENIO_DETALLE_SOCIO,CON5:IDX_CONVENIO_DETALLE_SOCIO)
      LOOP
          IF ACCESS:CONVENIO_DETALLE.NEXT() THEN BREAK.
          IF (CON5:IDSOCIO <> FAC:IDSOCIO) OR (CON5:PERIODO  <> FAC:PERIODO) THEN BREAK.
           IF CON5:IDSOCIO     = FAC:IDSOCIO AND CON5:PERIODO     = FAC:PERIODO AND CON5:CANCELADO = '' THEN
              DET:CONCEPTO = 'CONVENIO '&CON5:IDSOLICITUD&' '&CON5:OBSERVACION
              DET:MONTO    = CON5:MONTO_CUOTA
              MONTO_FACTURA$ = MONTO_FACTURA$ + CON5:MONTO_CUOTA
              ADD(DETALLE_FACTURA)
              IF ERRORCODE() THEN
                  MESSAGE('NO GRABO CONVENIO')
              END
              CON5:CANCELADO = 'SI'
              PUT(CONVENIO_DETALLE)
              !!!BUSCA CANCELACION EN TABLA CONVENIO
              IF CON5:DEUDA_INICIAL <= 0.1 THEN
                  CON4:IDSOLICITUD =  CON5:IDSOLICITUD
                  GET (CONVENIO,CON4:PK_CONVENIO)
                  IF ERRORCODE() = 35 THEN
                      MESSAGE('NO ENCONTRO EL CONVENIO')
                  ELSE
                     CON4:CANCELADO = 'SI'
                     CON4:FECHA_CANCELADO = TODAY()
                     PUT(CONVENIO)
                  END
              END
           ELSE
              MESSAGE('ERROR EN FACTURACION AVISE A AL ENCARGADO DEL SISTEMA')
           END
      END ! LOOP
  
      !!!
  
      !!! CARGA LA FACTURA
      FAC:ESTADO = ''
      FAC:TOTAL =  MONTO_FACTURA$
      PUT(FACTURA)
      CONTADOR$ = 0
      ! CONTROLA SI ES LA 1º VEZ QUE SE CARGA LA FACTURA
      CON3:IDSOCIO = FAC:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO CONTROL DE FACTURA FINAL')
      ELSE
          CON3:MES = FAC:MES
          CON3:ANO = FAC:ANO
          CON3:PEDIODO = FAC:ANO&(FORMAT(FAC:MES,@N02))
          PUT(CONTROL_FACTURA)
      END
  
  
  END
  SOC:IDSOCIO = FAC:IDSOCIO
  GET (SOCIOS,SOC:PK_SOCIOS)
  IF ERRORCODE() = 35 THEN
      MESSAGE ('NO ENCONTRO SOCIO')
  ELSE
      SOC:CANTIDAD = SOC:CANTIDAD +1
      PUT(SOCIOS)
  END
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Generar Cupon de Pagos
!!! </summary>
CUPON_DE_PAGO PROCEDURE 

Window               WINDOW('Generación de Cupon de Pago'),AT(,,199,75),FONT('Arial',10,,FONT:regular),CENTER,GRAY, |
  IMM,MDI,SYSTEM
                       BUTTON('&Generar Cupón'),AT(55,10,87,22),USE(?OkButton),LEFT,ICON(ICON:NextPage),DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(68,52,51,14),USE(?CancelButton),LEFT,ICON(ICON:Cross),FLAT
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
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:LOTE.Open                                         ! File LOTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUPON_DE_PAGO',Window)                     ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  IF GLO:NIVEL < 5 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
     
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LOTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO',Window)                  ! Save window data to non-volatile store
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
      OPEN(RANKING)
      EMPTY(RANKING)
      IF ERRORCODE() THEN
          MESSAGE(ERROR())
          CYCLE
      END
      CLOSE(RANKING)
      
      
      !!! CARGAR LOTE
      n# = 0
      CLEAR(LOT:RECORD,1)
      SET(LOT:PK_LOTE,LOT:PK_LOTE)
      PREVIOUS(LOTE)
      IF ERRORCODE()
          N# = 1
      ELSE
          N# = LOT:IDLOTE + 1
      END
      CLEAR(LOT:RECORD)
      LOT:IDLOTE = N#
      LOT:FECHA = TODAY()
      LOT:HORA  = CLOCK()
      LOT:IDUSUARIO = GLO:IDUSUARIO
      ADD(LOTE)
      IF ERRORCODE() THEN MESSAGE(ERROR()).
      GLO:IDLOTE = LOT:IDLOTE
      
      GLO:IDSOLICITUD = 0
      
      !!!
      
      CUPON_DE_PAGO1()
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      CUPON_DE_PAGO2()
      CUPON_DE_PAGO4:IMPRIMIR()
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
FACTURAR_DETALLE_CUPON PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                       PROJECT(FAC:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
                         JOIN(SER2:FK_SERVICIOXSOCIO_SOCIOS,SOC:IDSOCIO)
                           PROJECT(SER2:IDSERVICIOS)
                           JOIN(SER:PK_SERVICIOS,SER2:IDSERVICIOS)
                           END
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('FACTURAR_DETALLE_CUPON')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:IDSOCIO',GLO:IDSOCIO)                          ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_FACTURA.Open                              ! File DETALLE_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURAXCUPON.Open                                ! File FACTURAXCUPON used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_DETALLE_CUPON',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:ESTADO)
  ThisProcess.AddSortOrder(FAC:IDX_FACTURA_ESTADO)
  ThisProcess.AddRange(FAC:ESTADO,GLO:ESTADO)
  ThisProcess.SetFilter('FAC:IDSOCIO = GLO:IDSOCIO')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SEND(SOCIOS,'QUICKSCAN=on')
  SEND(SERVICIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  ProgressWindow{prop:hide}= true
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:CONVENIO.Close
    Relate:CONVENIO_DETALLE.Close
    Relate:DETALLE_FACTURA.Close
    Relate:FACTURA.Close
    Relate:FACTURAXCUPON.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURAR_DETALLE_CUPON',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF FAC:ESTADO = GLO:ESTADO THEN
      DET:IDFACTURA =  FAC:IDFACTURA
      DET:MES     =    FAC:MES
      DET:ANO     =    FAC:ANO
      DET:PERIODO =    FAC:PERIODO
      ! SACA MONTOS
      !!!  RECORRE COBERTURA POR SOCIOS
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      GET(COBERTURA,COB:PK_COBERTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO COBERTURA')
      ELSE
          DET:CONCEPTO = COB:DESCRIPCION
          DET:MONTO    = COB:MONTO 
          MONTO_FACTURA$ = MONTO_FACTURA$ + COB:MONTO
          FAC:DESCUENTOCOBERTURA = COB:DESCUENTO
          ADD(DETALLE_FACTURA)
          IF ERRORCODE() THEN
              MESSAGE('NO GRABO COBERTURA')
          END
      END
  
      !!!
      !!! RECORRE SERVICIOS POR SOCIOS
      SER2:IDSOCIO = SOC:IDSOCIO
      Set(SER2:FK_SERVICIOXSOCIO_SOCIOS,SER2:FK_SERVICIOXSOCIO_SOCIOS)
      LOOP
          IF ACCESS:SERVICIOxSOCIO.NEXT() THEN BREAK.
          IF (SER2:IDSOCIO <> SOC:IDSOCIO) THEN BREAK.
          !!!BUSCO EL SERVICIO
          SER:IDSERVICIOS = SER2:IDSERVICIOS
          GET (SERVICIOS,SER:PK_SERVICIOS)
          IF ERRORCODE() = 35 THEN
                 MESSAGE('NO ENCONTRO EL SERVICIO')
          ELSE
                   DET:CONCEPTO = SER:DESCRIPCION
                   DET:MONTO    = SER:MONTO - SER:DESCUENTO
                   MONTO_FACTURA$ = MONTO_FACTURA$ + (SER:MONTO - SER:DESCUENTO)
                   ADD(DETALLE_FACTURA)
                   IF ERRORCODE() THEN
                       MESSAGE('NO GRABO SERVICIO')
                  END
         END
      END !! LOOP
  
  
      !!!!!!!  SE SACO PAR AQUE CONVENIO SE COBRE APARTE
      !!!  RECORRE CONVENIOS
      !CON5:IDSOCIO     = FAC:IDSOCIO
      !CON5:PERIODO     = FAC:PERIODO
      !SET(CON5:IDX_CONVENIO_DETALLE_SOCIO,CON5:IDX_CONVENIO_DETALLE_SOCIO)
      !LOOP
      !    IF ACCESS:CONVENIO_DETALLE.NEXT() THEN BREAK.
      !    IF (CON5:IDSOCIO <> FAC:IDSOCIO) OR (CON5:PERIODO  <> FAC:PERIODO) THEN BREAK.
      !     IF CON5:IDSOCIO     = FAC:IDSOCIO AND CON5:PERIODO     = FAC:PERIODO AND CON5:CANCELADO = '' THEN
      !        DET:CONCEPTO = 'CONVENIO '&CON5:IDSOLICITUD&' '&CON5:OBSERVACION
      !        DET:MONTO    = CON5:MONTO_CUOTA
      !        MONTO_FACTURA$ = MONTO_FACTURA$ + CON5:MONTO_CUOTA
      !        ADD(DETALLE_FACTURA)
      !        IF ERRORCODE() THEN
      !            MESSAGE('NO GRABO CONVENIO')
      !        END
      !        CON5:CANCELADO = 'SI'
      !        PUT(CONVENIO_DETALLE)
      !        !!!BUSCA CANCELACION EN TABLA CONVENIO
      !        IF CON5:DEUDA_INICIAL <= 0.1 THEN
      !            CON4:IDSOLICITUD =  CON5:IDSOLICITUD
      !            GET (CONVENIO,CON4:PK_CONVENIO)
      !            IF ERRORCODE() = 35 THEN
      !                MESSAGE('NO ENCONTRO EL CONVENIO')
      !            ELSE
      !               CON4:CANCELADO = 'SI'
      !               CON4:FECHA_CANCELADO = TODAY()
      !               PUT(CONVENIO)
      !            END
      !        END
      !     ELSE
      !        MESSAGE('ERROR EN FACTURACION AVISE A AL ENCARGADO DEL SISTEMA')
      !     END
      !END ! LOOP
  
      !!!
  
      !!! CARGA LA FACTURA
      FAC:ESTADO = ''
      FAC:TOTAL =  MONTO_FACTURA$
      PUT(FACTURA)
      CONTADOR$ = 0
      ! CONTROLA SI ES LA 1º VEZ QUE SE CARGA LA FACTURA
      CON3:IDSOCIO = FAC:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO CONTROL DE FACTURA FINAL')
      ELSE
          CON3:MES = FAC:MES
          CON3:ANO = FAC:ANO
          CON3:PEDIODO = FAC:ANO&(FORMAT(FAC:MES,@N02))
          PUT(CONTROL_FACTURA)
      END
  
  
      !!!! CARGA LOTE POR CUPON
      FAC2:IDFACTURA  = FAC:IDFACTURA
      FAC2:IDSOCIO    = FAC:IDSOCIO
      FAC2:IDLOTE     = GLO:IDLOTE
      ADD(FACTURAXCUPON)
      IF ERRORCODE() THEN MESSAGE(ERROR()).
      !!
  
  END
  
  !!! CARGA CANTIDAD DE FACTURAS ADEUDADAS
  SOC:IDSOCIO = FAC:IDSOCIO
  GET (SOCIOS,SOC:PK_SOCIOS)
  IF ERRORCODE() = 35 THEN
      MESSAGE ('NO ENCONTRO SOCIO')
  ELSE
      SOC:CANTIDAD = SOC:CANTIDAD +1
      PUT(SOCIOS)
  END
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

