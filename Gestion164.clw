

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION164.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
CUPON_DE_PAGO5:IMPRIMIR PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:FECHA_VENCIMIENTO LONG                                 ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(FACTURAXCUPON)
                       PROJECT(FAC2:IDSOCIO)
                       PROJECT(FAC2:IDFACTURA)
                       JOIN(SOC:PK_SOCIOS,FAC2:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                       JOIN(FAC:PK_FACTURA,FAC2:IDFACTURA)
                         PROJECT(FAC:ANO)
                         PROJECT(FAC:IDFACTURA)
                         PROJECT(FAC:MES)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(302,240,7885,13490),PRE(RPT),PAPER(PAPER:LEGAL),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
Detail                 DETAIL,AT(,,,3177),USE(?Detail)
                         IMAGE('Logo_nombre.JPG'),AT(63,177,2500,531),USE(?Image1)
                         STRING(@P##-########-#P),AT(3083,719),USE(GLO:CUIT,,?GLO:CUIT:2)
                         IMAGE('Logo_nombre.JPG'),AT(2740,167,2500,531),USE(?Image2)
                         IMAGE('Logo_nombre.JPG'),AT(5344,167,2500,531),USE(?Image3)
                         STRING(@n-14),AT(7052,719),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:3),LEFT(1)
                         STRING(@P##-########-#P),AT(375,719),USE(GLO:CUIT),TRN
                         STRING(@n-14),AT(1844,719),USE(FAC:IDFACTURA),LEFT(1)
                         STRING(@n-14),AT(4479,719),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:2),LEFT(1)
                         STRING('C.U.I.T: '),AT(0,719),USE(?String2),TRN
                         STRING('C.U.I.T: '),AT(2688,719),USE(?String24),TRN
                         STRING('C.U.I.T: '),AT(5323,719),USE(?String25),TRN
                         STRING(@P##-########-#P),AT(5698,719),USE(GLO:CUIT,,?GLO:CUIT:3)
                         STRING('Nro. Cup�n:'),AT(3906,719),USE(?String67),TRN
                         STRING('Nro. Cup�n:'),AT(1260,719),USE(?String66),TRN
                         LINE,AT(2656,10,0,3156),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Cta. Cte. Nro.'),AT(10,938),USE(?String3),TRN
                         STRING('Cta. Cte. Nro.'),AT(2688,938),USE(?String26),TRN
                         STRING('Cta. Cte. Nro.'),AT(5344,938),USE(?String27),TRN
                         STRING('Nro. Cup�n:'),AT(6531,719),USE(?String68),TRN
                         STRING(@s255),AT(10,1125,2646,177),USE(GLO:DIRECCION),TRN
                         STRING(@s255),AT(5333,1125,2510,177),USE(GLO:DIRECCION,,?GLO:DIRECCION:3),TRN
                         STRING(@s255),AT(2688,1125,2625,177),USE(GLO:DIRECCION,,?GLO:DIRECCION:2),TRN
                         LINE,AT(5313,3167,0,-3156),USE(?Line2),COLOR(COLOR:Black)
                         LINE,AT(10,3156,7865,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Apellido y Nombre:'),AT(10,1313),USE(?String5),TRN
                         STRING('Apellido y Nombre:'),AT(5333,1313),USE(?String34),TRN
                         STRING('Apellido y Nombre:'),AT(2688,1313),USE(?String35),TRN
                         STRING(@s30),AT(5333,1500,2063,177),USE(SOC:NOMBRE,,?SOC:NOMBRE:3),LEFT(1)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(2708,0),USE(?String22),TRN
                         STRING(@s30),AT(10,1500,2010,177),USE(SOC:NOMBRE),LEFT(1)
                         STRING(@s30),AT(2688,1500),USE(SOC:NOMBRE,,?SOC:NOMBRE:2),LEFT(1)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(5333,0),USE(?String23),TRN
                         STRING(@s7),AT(354,1688),USE(SOC:IDSOCIO)
                         STRING('Mat.:'),AT(917,1688),USE(?String9),TRN
                         STRING('Socio:'),AT(10,1688),USE(?String7),TRN
                         STRING('Periodo:'),AT(10,1875),USE(?String11),TRN
                         STRING(@P/ ####P),AT(760,1875),USE(FAC:ANO),RIGHT(1)
                         STRING('Periodo:'),AT(2688,1875),USE(?String45),TRN
                         STRING(@s3),AT(3156,1875),USE(FAC:MES,,?FAC:MES:3),RIGHT(1)
                         STRING('Peridodo:'),AT(5344,1875),USE(?String50),TRN
                         STRING(@s3),AT(500,1875),USE(FAC:MES,,?FAC:MES:2),RIGHT(1)
                         STRING(@s7),AT(3875,1688),USE(SOC:MATRICULA,,?SOC:MATRICULA:3)
                         STRING('Vencimiento:'),AT(1250,1875),USE(?String15),TRN
                         STRING('Vencimiento:'),AT(3927,1875),USE(?String51),TRN
                         STRING(@s3),AT(5896,1875),USE(FAC:MES,,?FAC:MES:4),RIGHT(1)
                         STRING(@P/ ####P),AT(3458,1875),USE(FAC:ANO,,?FAC:ANO:2),RIGHT(1)
                         STRING(@P/ ####P),AT(6167,1875),USE(FAC:ANO,,?FAC:ANO:3),RIGHT(1)
                         BOX,AT(948,2104,740,198),USE(?Box6),COLOR(COLOR:Black)
                         STRING(@D6),AT(7250,1875),USE(LOC:FECHA_VENCIMIENTO,,?LOC:FECHA_VENCIMIENTO:3),RIGHT(1)
                         BOX,AT(6260,2104,740,198),USE(?Box12),COLOR(COLOR:Black)
                         STRING(@D6),AT(4688,1875),USE(LOC:FECHA_VENCIMIENTO,,?LOC:FECHA_VENCIMIENTO:2),RIGHT(1)
                         STRING('Vencimiento:'),AT(6604,1875),USE(?String52),TRN
                         STRING(@D6),AT(1917,1875),USE(LOC:FECHA_VENCIMIENTO),RIGHT(1)
                         STRING('Cuota Social:'),AT(10,2115),USE(?String16),TRN
                         STRING('Cuota Social:'),AT(5344,2115),USE(?String54),TRN
                         BOX,AT(6260,2323,740,198),USE(?Box11),COLOR(COLOR:Black)
                         BOX,AT(3750,2323,740,198),USE(?Box8),COLOR(COLOR:Black)
                         STRING('Cuota Convenio:'),AT(2688,2344),USE(?String69),TRN
                         STRING('Cuota Convenio:'),AT(5344,2344),USE(?String70),TRN
                         BOX,AT(6260,2542,740,198),USE(?Box10),COLOR(COLOR:Black)
                         BOX,AT(3750,2542,740,198),USE(?Box7),COLOR(COLOR:Black)
                         STRING('Cuota Social:'),AT(2688,2115),USE(?String53),TRN
                         BOX,AT(3750,2104,740,198),USE(?Box9),COLOR(COLOR:Black)
                         BOX,AT(938,2323,740,198),USE(?Box5),COLOR(COLOR:Black)
                         STRING('Cuota Convenio:'),AT(10,2344),USE(?String65),TRN
                         BOX,AT(938,2542,740,198),USE(?Box4),COLOR(COLOR:Black)
                         STRING('Total Depositado:'),AT(5344,2781),USE(?String62),TRN
                         STRING('Tal�n Para el Socio'),AT(5969,2990),USE(?String64),TRN
                         STRING('Tal�n Para el Colegio de Odont�logos'),AT(3094,2990),USE(?String63),TRN
                         BOX,AT(6260,2771,740,198),USE(?Box3),COLOR(COLOR:Black)
                         STRING('Descuento:'),AT(2688,2552),USE(?String59),TRN
                         STRING('Descuento:'),AT(5344,2552),USE(?String60),TRN
                         STRING('Descuento:'),AT(10,2552),USE(?String19),TRN
                         BOX,AT(938,2771,740,198),USE(?Box1),COLOR(COLOR:Black)
                         BOX,AT(3750,2771,740,198),USE(?Box2),COLOR(COLOR:Black)
                         STRING('Total Depositado:'),AT(10,2781),USE(?String20),TRN
                         STRING('Total Depositado:'),AT(2688,2781),USE(?String61),TRN
                         STRING('Tal�n Para el Banco'),AT(365,2990),USE(?String21),TRN
                         STRING(@s7),AT(1208,1688),USE(SOC:MATRICULA)
                         STRING(@s7),AT(5688,1688),USE(SOC:IDSOCIO,,?SOC:IDSOCIO:3)
                         STRING('Socio:'),AT(5344,1688),USE(?String39),TRN
                         STRING('Mat.:'),AT(3615,1688),USE(?String38),TRN
                         STRING('Socio:'),AT(2688,1688),USE(?String37),TRN
                         STRING(@s7),AT(3010,1688),USE(SOC:IDSOCIO,,?SOC:IDSOCIO:2)
                         STRING('Mat.:'),AT(6375,1688),USE(?String40),TRN
                         STRING(@s7),AT(6625,1688),USE(SOC:MATRICULA,,?SOC:MATRICULA:2)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(10,0),USE(?String1),FONT(,8),TRN
                       END
                       FORM,AT(292,240,7906,13500),USE(?Form)
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
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO5:IMPRIMIR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURAXCUPON.Open                                ! File FACTURAXCUPON used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUPON_DE_PAGO5:IMPRIMIR',ProgressWindow)   ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:FACTURAXCUPON, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC2:IDSOCIO)
  ThisReport.AddSortOrder(FAC2:FK_FACTURAXCUPON_SOCIO)
  ThisReport.AddRange(FAC2:IDSOCIO,GLO:IDSOCIO)
  ThisReport.SetFilter('FAC:ESTADO = ''''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:FACTURAXCUPON.SetQuickScan(1,Propagate:OneMany)
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
    Relate:FACTURAXCUPON.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO5:IMPRIMIR',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagName,'GLO:CUIT:2')
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA:3')
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagName,'GLO:CUIT')
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA')
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA:2')
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagName,'String2')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagName,'GLO:CUIT:3')
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagName,'String67')
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagName,'String66')
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagName,'String68')
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION:3')
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION:2')
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagName,'String5')
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:3')
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO')
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagName,'FAC:ANO')
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagName,'FAC:MES:3')
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagName,'String50')
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagName,'FAC:MES:2')
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA:3')
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagName,'String51')
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagName,'FAC:MES:4')
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagName,'FAC:ANO:2')
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagName,'FAC:ANO:3')
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO:3')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO:2')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagName,'String52')
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagName,'String54')
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagName,'String69')
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagName,'String70')
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagName,'String53')
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagName,'String65')
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagName,'String62')
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagName,'String64')
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagName,'String63')
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagName,'String59')
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagName,'String60')
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagName,'String61')
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO:3')
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO:2')
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA:2')
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:FECHA_VENCIMIENTO = DATE(FAC:MES,10,FAC:ANO)
  TOMA# = LOC:FECHA_VENCIMIENTO +30
  LOC:FECHA_VENCIMIENTO = DATE(MONTH(TOMA#),10,YEAR(TOMA#))
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


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
                 LocE::Titulo     = 'CUPON DE PAGO DE CUOTA'
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
           LocE::Subject   = 'CUPON DE PAGO DE CUOTA'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Direccion = GLO:EMAIL
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
          LOcE::Qpar.QP:Par  = 'CUPON DE PAGO DE CUOTA'
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
                 LocE::Titulo     = 'CUPON DE PAGO DE CUOTA'
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
                 LocE::Titulo     = 'CUPON DE PAGO DE CUOTA'
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
          LOcE::Qpar.QP:Par  = 'CUPON DE PAGO DE CUOTA'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CUPON DE PAGO DE CUOTA'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Direccion = GLO:EMAIL
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
  SELF.SetDocumentInfo('CW Report','Gestion','CUPON_DE_PAGO4:IMPRIMIR','CUPON_DE_PAGO4:IMPRIMIR','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

