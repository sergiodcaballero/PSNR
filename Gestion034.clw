

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
                       INCLUDE('GESTION034.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION033.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION035.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a INSPECTOR Record
!!! </summary>
SelectINSPECTOR PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(INSPECTOR)
                       PROJECT(INS:IDINSPECTOR)
                       PROJECT(INS:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,INS:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
INS:IDINSPECTOR        LIKE(INS:IDINSPECTOR)          !List box control field - type derived from field
INS:IDSOCIO            LIKE(INS:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a INSPECTOR Record'),AT(,,403,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectINSPECTOR'),SYSTEM
                       LIST,AT(8,41,376,113),USE(?Browse:1),HVSCROLL,FORMAT('64L(2)|M~IDINSPECTOR~C(0)@n-7@[39' & |
  'L(2)|M~IDSOCIO~C(0)@n-7@49L(2)|M~MATRICULA~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@]|M~COLEGIADO~'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de INSPECTOR')
                       BUTTON('&Elegir'),AT(340,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,394,172),USE(?CurrentTab)
                         TAB('INSPECTOR'),USE(?Tab:2)
                           PROMPT('IDINSPECTOR:'),AT(8,25),USE(?INS:IDINSPECTOR:Prompt)
                           ENTRY(@n-14),AT(61,25,60,10),USE(INS:IDINSPECTOR),REQ
                         END
                         TAB('SOCIOS'),USE(?Tab:3)
                           PROMPT('IDSOCIO:'),AT(11,27),USE(?INS:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(61,26,60,10),USE(INS:IDSOCIO)
                           BUTTON('...'),AT(123,24,12,12),USE(?CallLookup)
                         END
                       END
                       BUTTON('&Salir'),AT(339,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
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
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectINSPECTOR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('INS:IDINSPECTOR',INS:IDINSPECTOR)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:INSPECTOR.Open                                    ! File INSPECTOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:INSPECTOR,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,INS:FK_INSPECTOR_SOCIOS)              ! Add the sort order for INS:FK_INSPECTOR_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?INS:IDSOCIO,INS:IDSOCIO,,BRW1) ! Initialize the browse locator using ?INS:IDSOCIO using key: INS:FK_INSPECTOR_SOCIOS , INS:IDSOCIO
  BRW1.AddSortOrder(,INS:PK_INSPECTOR)                     ! Add the sort order for INS:PK_INSPECTOR for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,INS:IDINSPECTOR,,BRW1)         ! Initialize the browse locator using  using key: INS:PK_INSPECTOR , INS:IDINSPECTOR
  BRW1.AddField(INS:IDINSPECTOR,BRW1.Q.INS:IDINSPECTOR)    ! Field INS:IDINSPECTOR is a hot field or requires assignment from browse
  BRW1.AddField(INS:IDSOCIO,BRW1.Q.INS:IDSOCIO)            ! Field INS:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectINSPECTOR',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:INSPECTOR.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectINSPECTOR',QuickWindow)           ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?INS:IDSOCIO
      SOC:IDSOCIO = INS:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          INS:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?INS:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = INS:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        INS:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
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
!!! Browse the CONSULTORIO File
!!! </summary>
BrowseCONSULTORIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTORIO)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDSOCIO)
                       PROJECT(CON2:TELEFONO)
                       PROJECT(CON2:IDLOCALIDAD)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:FECHA)
                       PROJECT(CON2:LIBRO)
                       PROJECT(CON2:FOLIO)
                       PROJECT(CON2:ACTA)
                       PROJECT(CON2:HABILITADO)
                       PROJECT(CON2:FECHA_HABILITACION)
                       PROJECT(CON2:FECHA_VTO)
                       PROJECT(CON2:ACTIVO)
                       PROJECT(CON2:IDINSPECTOR)
                       JOIN(INS:PK_INSPECTOR,CON2:IDINSPECTOR)
                         PROJECT(INS:IDINSPECTOR)
                       END
                       JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                         PROJECT(LOC:IDLOCALIDAD)
                       END
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON2:IDCONSULTORIO     LIKE(CON2:IDCONSULTORIO)       !List box control field - type derived from field
CON2:IDCONSULTORIO_NormalFG LONG                      !Normal forground color
CON2:IDCONSULTORIO_NormalBG LONG                      !Normal background color
CON2:IDCONSULTORIO_SelectedFG LONG                    !Selected forground color
CON2:IDCONSULTORIO_SelectedBG LONG                    !Selected background color
CON2:IDCONSULTORIO_Icon LONG                          !Entry's icon ID
CON2:IDSOCIO           LIKE(CON2:IDSOCIO)             !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
CON2:TELEFONO          LIKE(CON2:TELEFONO)            !List box control field - type derived from field
CON2:IDLOCALIDAD       LIKE(CON2:IDLOCALIDAD)         !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
CON2:DIRECCION         LIKE(CON2:DIRECCION)           !List box control field - type derived from field
CON2:FECHA             LIKE(CON2:FECHA)               !List box control field - type derived from field
CON2:LIBRO             LIKE(CON2:LIBRO)               !List box control field - type derived from field
CON2:FOLIO             LIKE(CON2:FOLIO)               !List box control field - type derived from field
CON2:ACTA              LIKE(CON2:ACTA)                !List box control field - type derived from field
CON2:HABILITADO        LIKE(CON2:HABILITADO)          !List box control field - type derived from field
CON2:FECHA_HABILITACION LIKE(CON2:FECHA_HABILITACION) !List box control field - type derived from field
CON2:FECHA_VTO         LIKE(CON2:FECHA_VTO)           !List box control field - type derived from field
CON2:ACTIVO            LIKE(CON2:ACTIVO)              !List box control field - type derived from field
CON2:IDINSPECTOR       LIKE(CON2:IDINSPECTOR)         !Browse key field - type derived from field
INS:IDINSPECTOR        LIKE(INS:IDINSPECTOR)          !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW11::View:Browse   VIEW(CONSULTRIO_ADHERENTE)
                       PROJECT(CON1:IDCONSULTORIO)
                       PROJECT(CON1:IDSOCIO)
                       PROJECT(CON1:IDCONSUL_ADE)
                       JOIN(SOC:PK_SOCIOS,CON1:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
CON1:IDCONSULTORIO     LIKE(CON1:IDCONSULTORIO)       !List box control field - type derived from field
CON1:IDSOCIO           LIKE(CON1:IDSOCIO)             !List box control field - type derived from field
CON1:IDCONSUL_ADE      LIKE(CON1:IDCONSUL_ADE)        !Primary key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM CONSULTORIO'),AT(,,528,316),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseCONSULTORIO'),SYSTEM
                       LIST,AT(8,41,505,138),USE(?Browse:1),HVSCROLL,FORMAT('37L(2)|M*I~ID~C(0)@n-7@[35L(2)|M~' & |
  'IDSOCIO~C(0)@n-7@31L(2)|M~MAT~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@]|M~COLEGIADO~40L(2' & |
  ')|M~TELEFONO CONSUL~L(0)@S20@[33L(2)|M~IDLOC~C(0)@n-7@80R(2)|M~DEC LOC~C(0)@s20@80L(' & |
  '2)|M~DIRECCION~@s50@]|M~LOCALIDAD~80R(2)|M~FECHA~C(0)@d17@64R(2)|M~LIBRO~C(0)@n-14@6' & |
  '4R(2)|M~FOLIO~C(0)@n-14@80L(2)|M~ACTA~@s20@8L(2)|M~HABILITADO~@s2@40L(2)|M~FECHA HAB' & |
  'ILITACION~@d17@40L(2)|M~FECHA VTO~@d17@8L(2)|M~ACTIVO~L(0)@s2@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de CONSULTORIO'),VCR
                       BUTTON('&Elegir'),AT(255,191,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(308,191,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(361,191,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(414,191,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(467,191,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('Imprimir Constancia'),AT(5,270,101,15),USE(?Button9),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('E&xportar'),AT(110,270,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(9,192,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       SHEET,AT(4,4,517,204),USE(?CurrentTab)
                         TAB('CONSULTORIO'),USE(?Tab:2)
                         END
                         TAB('INSPECTOR'),USE(?Tab:3)
                         END
                         TAB('LOCALIDAD'),USE(?Tab:4)
                         END
                         TAB('SOCIOS'),USE(?Tab:5)
                           PROMPT('IDSOCIO:'),AT(10,26),USE(?GLO:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(49,25,60,10),USE(GLO:IDSOCIO),REQ
                           BUTTON('...'),AT(115,23,12,12),USE(?CallLookup)
                         END
                       END
                       BUTTON('Cargar Detalle del Consultorio'),AT(166,270,127,14),USE(?BrowseCONSULTORIO_EQUIPO), |
  LEFT,ICON('COMPUTER.ICO'),FLAT,MSG('Ver Hijo'),TIP('Ver Hijio')
                       BUTTON('Imprimir Detalle  X Consultorio'),AT(297,270,118,14),USE(?Button8),LEFT,ICON(ICON:Print1), |
  FLAT
                       BUTTON('&Salir'),AT(477,295,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       IMAGE('bullet_ball_red.ico'),AT(6,292),USE(?Image2)
                       PROMPT('--> Vencidos'),AT(32,295),USE(?Prompt1)
                       PROMPT('--> Próximos a Vencer'),AT(102,295),USE(?Prompt3)
                       PROMPT('--> Habilitados'),AT(204,295),USE(?Prompt2)
                       BUTTON('Carga Adherente'),AT(263,292,85,16),USE(?Button12),LEFT,ICON('SSEC_USR.ICO'),FLAT
                       IMAGE('bullet_ball_green.ico'),AT(176,290,23,20),USE(?Image1)
                       IMAGE('bullet_ball_yellow.ico'),AT(76,292),USE(?Image3)
                       BUTTON('Imprimir Consultorio C Adherente'),AT(427,264,89,26),USE(?BUTTON1),LEFT,ICON(ICON:Print), |
  FLAT
                       GROUP('Adherentes'),AT(4,212,513,48),USE(?GROUP1),BOXED
                         LIST,AT(8,221,505,31),USE(?List),RIGHT(1),VSCROLL,FORMAT('46L(2)|M~MATRICULA~L(0)@n-5@4' & |
  '00L(2)|M~NOMBRE~L(0)@s100@60L(2)|M~IDCONSULTORIO~L(1)@n-14@60L(2)|M~IDSOCIO~L(1)@n-14@'), |
  FROM(Queue:Browse),IMM,SCROLL
                       END
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
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW11                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW11::Sort0:Locator StepLocatorClass                      ! Default Locator
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
  Q9:FieldPar  = '1,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,'
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
  Q9:FieldPar  = 'HTML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'EXCEL|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'WORD|'
  Q9:FieldPar  = CLIP( Q9:FieldPar)&'ASCII|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'XML|'
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
  ADD(QPar9)   ! 29 Gestion034.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = 'ID'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDSOCIO'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MAT'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'NOMBRE'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'TELEFONO CONSUL'
  Qp29:F2P  = '@P####-#########P'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDLOC'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DEC LOC'
  Qp29:F2P  = '@s20'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DIRECCION'
  Qp29:F2P  = '@s50'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'LIBRO'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FOLIO'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'ACTA'
  Qp29:F2P  = '@s20'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'HABILITADO'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA HABILITACION'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA VTO'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'ACTIVO'
  Qp29:F2P  = '@s2'
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
  Loc::Titulo9 ='Administrator the CONSULTORIO'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,0,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseCONSULTORIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON2:IDCONSULTORIO',CON2:IDCONSULTORIO)            ! Added by: BrowseBox(ABC)
  BIND('INS:IDINSPECTOR',INS:IDINSPECTOR)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('CON1:IDCONSUL_ADE',CON1:IDCONSUL_ADE)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTORIO,SELF) ! Initialize the browse manager
  BRW11.Init(?List,Queue:Browse.ViewPosition,BRW11::View:Browse,Queue:Browse,Relate:CONSULTRIO_ADHERENTE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'BrowseCONSULTORIO', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_INSPECTOR)        ! Add the sort order for CON2:FK_CONSULTORIO_INSPECTOR for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CON2:IDINSPECTOR,,BRW1)        ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_INSPECTOR , CON2:IDINSPECTOR
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_LOCALIDAD)        ! Add the sort order for CON2:FK_CONSULTORIO_LOCALIDAD for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CON2:IDLOCALIDAD,,BRW1)        ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_LOCALIDAD , CON2:IDLOCALIDAD
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_SOCIOS)           ! Add the sort order for CON2:FK_CONSULTORIO_SOCIOS for sort order 3
  BRW1.AddRange(CON2:IDSOCIO,GLO:IDSOCIO)                  ! Add single value range limit for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CON2:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_SOCIOS , CON2:IDSOCIO
  BRW1.AddSortOrder(,CON2:PK_CONSULTORIO)                  ! Add the sort order for CON2:PK_CONSULTORIO for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,CON2:IDCONSULTORIO,,BRW1)      ! Initialize the browse locator using  using key: CON2:PK_CONSULTORIO , CON2:IDCONSULTORIO
  ?Browse:1{PROP:IconList,1} = '~bullet_ball_green.ico'
  ?Browse:1{PROP:IconList,2} = '~bullet_ball_red.ico'
  ?Browse:1{PROP:IconList,3} = '~bullet_ball_yellow.ico'
  BRW1.AddField(CON2:IDCONSULTORIO,BRW1.Q.CON2:IDCONSULTORIO) ! Field CON2:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDSOCIO,BRW1.Q.CON2:IDSOCIO)          ! Field CON2:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CON2:TELEFONO,BRW1.Q.CON2:TELEFONO)        ! Field CON2:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDLOCALIDAD,BRW1.Q.CON2:IDLOCALIDAD)  ! Field CON2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:DIRECCION,BRW1.Q.CON2:DIRECCION)      ! Field CON2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA,BRW1.Q.CON2:FECHA)              ! Field CON2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:LIBRO,BRW1.Q.CON2:LIBRO)              ! Field CON2:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FOLIO,BRW1.Q.CON2:FOLIO)              ! Field CON2:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTA,BRW1.Q.CON2:ACTA)                ! Field CON2:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:HABILITADO,BRW1.Q.CON2:HABILITADO)    ! Field CON2:HABILITADO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA_HABILITACION,BRW1.Q.CON2:FECHA_HABILITACION) ! Field CON2:FECHA_HABILITACION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA_VTO,BRW1.Q.CON2:FECHA_VTO)      ! Field CON2:FECHA_VTO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTIVO,BRW1.Q.CON2:ACTIVO)            ! Field CON2:ACTIVO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDINSPECTOR,BRW1.Q.CON2:IDINSPECTOR)  ! Field CON2:IDINSPECTOR is a hot field or requires assignment from browse
  BRW1.AddField(INS:IDINSPECTOR,BRW1.Q.INS:IDINSPECTOR)    ! Field INS:IDINSPECTOR is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW11.Q &= Queue:Browse
  BRW11.RetainRow = 0
  BRW11.AddSortOrder(,CON1:FK_CONSULTRIO_ADHERENTE_CONSUL) ! Add the sort order for CON1:FK_CONSULTRIO_ADHERENTE_CONSUL for sort order 1
  BRW11.AddRange(CON1:IDCONSULTORIO,Relate:CONSULTRIO_ADHERENTE,Relate:CONSULTORIO) ! Add file relationship range limit for sort order 1
  BRW11.AddLocator(BRW11::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW11::Sort0:Locator.Init(,CON1:IDCONSULTORIO,,BRW11)    ! Initialize the browse locator using  using key: CON1:FK_CONSULTRIO_ADHERENTE_CONSUL , CON1:IDCONSULTORIO
  BRW11.AddField(SOC:MATRICULA,BRW11.Q.SOC:MATRICULA)      ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW11.AddField(SOC:NOMBRE,BRW11.Q.SOC:NOMBRE)            ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW11.AddField(CON1:IDCONSULTORIO,BRW11.Q.CON1:IDCONSULTORIO) ! Field CON1:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW11.AddField(CON1:IDSOCIO,BRW11.Q.CON1:IDSOCIO)        ! Field CON1:IDSOCIO is a hot field or requires assignment from browse
  BRW11.AddField(CON1:IDCONSUL_ADE,BRW11.Q.CON1:IDCONSUL_ADE) ! Field CON1:IDCONSUL_ADE is a hot field or requires assignment from browse
  BRW11.AddField(SOC:IDSOCIO,BRW11.Q.SOC:IDSOCIO)          ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCONSULTORIO',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 3                                    ! Will call: UpdateCONSULTORIO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW11.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCONSULTORIO',QuickWindow)         ! Save window data to non-volatile store
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
      SelectSOCIOS
      SelectSOCIOS
      UpdateCONSULTORIO
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
    OF ?Button9
      GLO:IDSOLICITUD = CON2:IDCONSULTORIO
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button9
      ThisWindow.Update()
      START(IMPRIMIR_CONSTANCIA, 25000)
      ThisWindow.Reset
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
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
    OF ?BrowseCONSULTORIO_EQUIPO
      ThisWindow.Update()
      BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS()
      ThisWindow.Reset
    OF ?Button8
      ThisWindow.Update()
      START(REPORT_CONSULTORIOXEQUIPO, 25000)
      ThisWindow.Reset
    OF ?Button12
      ThisWindow.Update()
      Cargar_DERENTE()
      ThisWindow.Reset
    OF ?BUTTON1
      ThisWindow.Update()
      imprimir_consultorio_adherente(Brw1.view{PROP:Filter}, Brw1.view{PROP:Order})
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?GLO:IDSOCIO
      SOC:IDSOCIO = GLO:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          GLO:IDSOCIO = SOC:IDSOCIO
        END
      END
      ThisWindow.Reset()
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
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
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
  
  IF (CON2:ACTIVO = 'NO')
    SELF.Q.CON2:IDCONSULTORIO_NormalFG = 255               ! Set conditional color values for CON2:IDCONSULTORIO
    SELF.Q.CON2:IDCONSULTORIO_NormalBG = 0
    SELF.Q.CON2:IDCONSULTORIO_SelectedFG = 0
    SELF.Q.CON2:IDCONSULTORIO_SelectedBG = 255
  ELSE
    SELF.Q.CON2:IDCONSULTORIO_NormalFG = -1                ! Set color values for CON2:IDCONSULTORIO
    SELF.Q.CON2:IDCONSULTORIO_NormalBG = -1
    SELF.Q.CON2:IDCONSULTORIO_SelectedFG = -1
    SELF.Q.CON2:IDCONSULTORIO_SelectedBG = -1
  END
  IF (CON2:FECHA_VTO < TODAY())
    SELF.Q.CON2:IDCONSULTORIO_Icon = 2                     ! Set icon from icon list
  ELSIF (CON2:FECHA_VTO < (TODAY() + 15))
    SELF.Q.CON2:IDCONSULTORIO_Icon = 3                     ! Set icon from icon list
  ELSIF (CON2:FECHA_VTO > (TODAY() + 15))
    SELF.Q.CON2:IDCONSULTORIO_Icon = 1                     ! Set icon from icon list
  ELSE
    SELF.Q.CON2:IDCONSULTORIO_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CONSTANCIA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CONSULTORIO)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:FECHA)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDLOCALIDAD)
                       PROJECT(CON2:IDSOCIO)
                       JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                       END
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
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

Report               REPORT,AT(500,2292,7240,7396),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',12,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(469,479,7271,1813),USE(?Header),FONT('Arial',10,,FONT:bold,CHARSET:ANSI)
                         IMAGE('Logo.jpg'),AT(42,31,1792,1521),USE(?Image1)
                         STRING('Ley:'),AT(1896,1354),USE(?String3),TRN
                         STRING(@s10),AT(2271,1354),USE(GLO:LEY)
                         STRING('Per. Jur.'),AT(3740,1354),USE(?String4),TRN
                         STRING(@s10),AT(4583,1354),USE(GLO:PER_JUR)
                         STRING(@s255),AT(10,1563,7260,208),USE(GLO:DIRECCION),CENTER
                         LINE,AT(10,1771,7250,0),USE(?Line1),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,5010),USE(?Detail)
                         STRING('Matricula: '),AT(73,250),USE(?String23),TRN
                         STRING(@s100),AT(2896,250,4292,229),USE(SOC:NOMBRE)
                         STRING('Dirección: '),AT(73,510),USE(?String27),TRN
                         STRING(@s50),AT(865,521,4760,229),USE(CON2:DIRECCION)
                         STRING('Localidad: '),AT(52,813),USE(?String29),TRN
                         STRING(@s50),AT(906,823),USE(LOC:DESCRIPCION)
                         GROUP('Datos de Consultorio a Habilitar '),AT(10,0,7229,1177),USE(?Group1),BOXED,TRN
                         END
                         STRING('Apellido y Nombre:'),AT(1479,240),USE(?String25),TRN
                         STRING(@n-5),AT(781,229,615,229),USE(SOC:MATRICULA)
                         STRING('Por medio de la presente dejo constancia, en carácter de declaración jurada, qu' & |
  'e las descripciones'),AT(10,1198,7208,229),USE(?String6),TRN
                         STRING('técnicas, las documentales aportadas y/o fotografías ilustrativas que adjunto a' & |
  ' la presente solicitud'),AT(10,1479,7448,229),USE(?String7),TRN
                         STRING('de habilitación de consultorio por ante las autoridades del Colegio de Psicólog' & |
  'os del Valle Inferior'),AT(10,1760,7208,229),USE(?String8),TRN
                         STRING('de la Provincia de Río Negro, en fecha'),AT(10,2042),USE(?String10),TRN
                         STRING(', dan cuenta fehaciente de las condiciones'),AT(3792,2042),USE(?String18),TRN
                         STRING(@d17),AT(2854,2042),USE(CON2:FECHA)
                         STRING('actuales del consultorio a ser habilitado.'),AT(10,2323),USE(?String11),TRN
                         STRING('Asimismo dejo expresado mi compromiso de dar notificación fehaciente de todo cambio'), |
  AT(10,2604),USE(?String12),TRN
                         STRING('o modificación que se presente en el lugar de prestación del servicio que conforme esta'), |
  AT(10,2885),USE(?String13),TRN
                         STRING(' presentación se efectúe a futuro.'),AT(10,3188),USE(?String14),TRN
                         STRING('En la Ciudad de Viedma, '),AT(31,3510),USE(?String15),TRN
                         STRING(@s50),AT(2010,3510,4781,229),USE(GLO:FECHA_LARGO)
                         STRING('Aclaración y Firma Matriculado: .{80}'),AT(1573,4615),USE(?String17),TRN
                       END
                       FOOTER,AT(479,9677,7260,1323),USE(?Footer)
                         LINE,AT(10,10,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(10,42),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2115,42),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,42),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(479,479,7250,10510),USE(?Form)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CONSTANCIA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CONSTANCIA',ProgressWindow)       ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONSULTORIO, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON2:IDCONSULTORIO)
  ThisReport.AddSortOrder(CON2:PK_CONSULTORIO)
  ThisReport.AddRange(CON2:IDCONSULTORIO,GLO:IDSOLICITUD)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONSULTORIO.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  GLO:DIA_REPORT= 'Domingo'
  GLO:DIA_REPORT= 'Lunes'
  GLO:DIA_REPORT= 'Martes'
  GLO:DIA_REPORT= 'Miercoles'
  GLO:DIA_REPORT= 'Jueves'
  GLO:DIA_REPORT= 'Viernes'
  GLO:DIA_REPORT= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  GLO:MES_REPORT = 'Enero'
  GLO:MES_REPORT = 'Febrero'
  GLO:MES_REPORT = 'Marzo'
  GLO:MES_REPORT = 'Abril'
  GLO:MES_REPORT = 'Mayo'
  GLO:MES_REPORT = 'Junio'
  GLO:MES_REPORT = 'Julio'
  GLO:MES_REPORT = 'Agosto'
  GLO:MES_REPORT = 'Septiembre'
  GLO:MES_REPORT = 'Octubre'
  GLO:MES_REPORT = 'Noviembre'
  GLO:MES_REPORT = 'Diciembre'
  END
  GLO:ANO_REPORT = Year(today())
  
  GLO:FECHA_LARGO = CLIP(GLO:DIA_REPORT) & ' ' & DAY(TODAY()) & ' de ' &CLIP(GLO:MES_REPORT)&' '&Year(today())
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CONSTANCIA',ProgressWindow)    ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagName,'String4')
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagName,'GLO:PER_JUR')
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagName,'CON2:DIRECCION')
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?Group1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?Group1,RepGen:XML,TargetAttr:TagNameFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagName,'String6')
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagName,'CON2:FECHA')
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CONSTANCIA','IMPRIMIR_CONSTANCIA','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
REPORT_CONSULTORIOXEQUIPO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CONSULTORIO_EQUIPO)
                       PROJECT(CON:IDCONSULTORIO)
                       PROJECT(CON:IDTIPOEQUIPO)
                       JOIN(CON2:PK_CONSULTORIO,CON:IDCONSULTORIO)
                         PROJECT(CON2:DIRECCION)
                         PROJECT(CON2:IDLOCALIDAD)
                         PROJECT(CON2:IDSOCIO)
                         JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                           PROJECT(LOC:DESCRIPCION)
                         END
                         JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                           PROJECT(SOC:MATRICULA)
                           PROJECT(SOC:NOMBRE)
                         END
                       END
                       JOIN(TIP5:PK_TIPO_EQUIPO,CON:IDTIPOEQUIPO)
                         PROJECT(TIP5:DESCRIPCION)
                         PROJECT(TIP5:IDTIPOEQUIPO)
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
                       HEADER,AT(1000,1000,6250,1208),USE(?Header)
                         IMAGE('Logo.JPG'),AT(10,31,1854,1125),USE(?Image1)
                         STRING('Equipamiento  por Consultorio'),AT(2313,875),USE(?String1),FONT(,,,FONT:bold+FONT:underline), |
  TRN
                       END
break1                 BREAK(TIP5:IDTIPOEQUIPO),USE(?BREAK1)
                         HEADER,AT(0,0,,469),USE(?GROUPHEADER1)
                           STRING(@n-3),AT(813,10),USE(TIP5:IDTIPOEQUIPO)
                           STRING(@s50),AT(1115,10),USE(TIP5:DESCRIPCION)
                           STRING('LOCALIDAD'),AT(5188,250),USE(?String18),TRN
                           BOX,AT(10,229,6240,240),USE(?Box2),COLOR(COLOR:Black),LINEWIDTH(1)
                           STRING('DIRECCION'),AT(3344,250),USE(?String17),TRN
                           STRING('MAT.'),AT(73,250),USE(?String15),TRN
                           STRING('NOMBRE'),AT(1260,250),USE(?String16),TRN
                           STRING('EQUIPO:'),AT(10,10),USE(?String13),TRN
                         END
detail1                  DETAIL,AT(0,0,,260),USE(?DETAIL1),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                           STRING(@n-7),AT(10,10),USE(SOC:MATRICULA)
                           STRING(@s30),AT(594,10),USE(SOC:NOMBRE)
                           STRING(@s50),AT(2667,10),USE(CON2:DIRECCION)
                           STRING(@s20),AT(4917,10),USE(LOC:DESCRIPCION),TRN
                           LINE,AT(10,229,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,292),USE(?GROUPFOOTER1)
                           STRING('Cant. Reg. '),AT(10,0),USE(?String8),TRN
                           STRING(@n-7),AT(729,10),USE(CON:IDCONSULTORIO,,?CON:IDCONSULTORIO:2),CNT,RESET(break1),TRN
                           BOX,AT(10,219,6813,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         END
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         LINE,AT(0,73,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(10,156),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2115,156),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5615,156),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
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
  GlobalErrors.SetProcedureName('REPORT_CONSULTORIOXEQUIPO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONSULTORIO_EQUIPO.Open                           ! File CONSULTORIO_EQUIPO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('REPORT_CONSULTORIOXEQUIPO',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONSULTORIO_EQUIPO, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON:IDTIPOEQUIPO)
  ThisReport.AddSortOrder(CON:FK_CONSULTORIO_EQUIPO_EQUIP)
  ThisReport.AppendOrder('SOC:NOMBRE')
  ThisReport.SetFilter('SOC:NOMBRE')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONSULTORIO_EQUIPO.SetQuickScan(1,Propagate:OneMany)
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
    Relate:CONSULTORIO_EQUIPO.Close
  END
  IF SELF.Opened
    INIMgr.Update('REPORT_CONSULTORIOXEQUIPO',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?TIP5:IDTIPOEQUIPO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP5:IDTIPOEQUIPO,RepGen:XML,TargetAttr:TagName,'TIP5:IDTIPOEQUIPO')
  SELF.Attribute.Set(?TIP5:IDTIPOEQUIPO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP5:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP5:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP5:DESCRIPCION')
  SELF.Attribute.Set(?TIP5:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagName,'CON2:DIRECCION')
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagName,'CON:IDCONSULTORIO:2')
  SELF.Attribute.Set(?CON:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','REPORT_CONSULTORIOXEQUIPO','REPORT_CONSULTORIOXEQUIPO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONSULTRIO_ADHERENTE
!!! </summary>
Formulario_CONSULTRIO_ADHERENTE PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CON1:Record LIKE(CON1:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CONSULTRIO_ADHERENTE'),AT(,,229,117),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Formulario_CONSULTRIO_ADHERENTE'),SYSTEM
                       ENTRY(@n-14),AT(61,16,64,10),USE(CON1:IDSOCIO),RIGHT(1)
                       BUTTON('...'),AT(127,15,12,12),USE(?CallLookup)
                       ENTRY(@s100),AT(141,16,87,10),USE(SOC:NOMBRE),TRN
                       ENTRY(@n-14),AT(61,29,64,10),USE(CON1:NRO),RIGHT(1),REQ
                       PROMPT('LIBRO:'),AT(0,42),USE(?CON1:LIBRO:Prompt)
                       ENTRY(@n-4),AT(61,42,64,10),USE(CON1:LIBRO),RIGHT(1)
                       ENTRY(@d17),AT(61,68,64,10),USE(CON1:FECHA),RIGHT(1),REQ
                       ENTRY(@n-14),AT(61,55,64,10),USE(CON1:FOLIO),RIGHT(1),REQ
                       BUTTON('&Aceptar'),AT(112,100,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(166,100,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDCONSULTORIO:'),AT(1,3),USE(?CON1:IDCONSULTORIO:Prompt),TRN
                       ENTRY(@n-14),AT(61,3,64,10),USE(CON1:IDCONSULTORIO),RIGHT(1),DISABLE
                       PROMPT('IDSOCIO:'),AT(1,16),USE(?CON1:IDSOCIO:Prompt),TRN
                       PROMPT('NRO:'),AT(1,29),USE(?CON1:NRO:Prompt),TRN
                       PROMPT('FECHA:'),AT(1,68),USE(?CON1:FECHA:Prompt),TRN
                       PROMPT('FOLIO:'),AT(1,55),USE(?CON1:FOLIO:Prompt),TRN
                       PROMPT('TELEFONO:'),AT(2,83),USE(?CON1:TELEFONO:Prompt)
                       ENTRY(@s40),AT(61,83,153,10),USE(CON1:TELEFONO)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('Formulario_CONSULTRIO_ADHERENTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CON1:IDSOCIO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON1:Record,History::CON1:Record)
  SELF.AddHistoryField(?CON1:IDSOCIO,3)
  SELF.AddHistoryField(?CON1:NRO,4)
  SELF.AddHistoryField(?CON1:LIBRO,7)
  SELF.AddHistoryField(?CON1:FECHA,5)
  SELF.AddHistoryField(?CON1:FOLIO,6)
  SELF.AddHistoryField(?CON1:IDCONSULTORIO,2)
  SELF.AddHistoryField(?CON1:TELEFONO,8)
  SELF.AddUpdateFile(Access:CONSULTRIO_ADHERENTE)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONSULTRIO_ADHERENTE
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
    ?CON1:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SOC:NOMBRE{PROP:ReadOnly} = True
    ?CON1:NRO{PROP:ReadOnly} = True
    ?CON1:LIBRO{PROP:ReadOnly} = True
    ?CON1:FECHA{PROP:ReadOnly} = True
    ?CON1:FOLIO{PROP:ReadOnly} = True
    ?CON1:IDCONSULTORIO{PROP:ReadOnly} = True
    ?CON1:TELEFONO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Formulario_CONSULTRIO_ADHERENTE',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_CONSULTRIO_ADHERENTE',QuickWindow) ! Save window data to non-volatile store
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
      SelectCONSULTORIO
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CON1:IDSOCIO
      SOC:IDSOCIO = CON1:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CON1:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?CON1:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTRIO_ADHERENTE.TryValidateField(3)   ! Attempt to validate CON1:IDSOCIO in CONSULTRIO_ADHERENTE
        SELECT(?CON1:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON1:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON1:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = CON1:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CON1:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CON1:IDCONSULTORIO
      CON2:IDCONSULTORIO = CON1:IDCONSULTORIO
      IF Access:CONSULTORIO.TryFetch(CON2:PK_CONSULTORIO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CON1:IDCONSULTORIO = CON2:IDCONSULTORIO
        ELSE
          SELECT(?CON1:IDCONSULTORIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTRIO_ADHERENTE.TryValidateField(2)   ! Attempt to validate CON1:IDCONSULTORIO in CONSULTRIO_ADHERENTE
        SELECT(?CON1:IDCONSULTORIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON1:IDCONSULTORIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON1:IDCONSULTORIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
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
!!! Select a CONSULTORIO Record
!!! </summary>
SelectCONSULTORIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTORIO)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDLOCALIDAD)
                       PROJECT(CON2:IDSOCIO)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:FECHA)
                       PROJECT(CON2:LIBRO)
                       PROJECT(CON2:FOLIO)
                       PROJECT(CON2:ACTA)
                       PROJECT(CON2:IDINSPECTOR)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON2:IDCONSULTORIO     LIKE(CON2:IDCONSULTORIO)       !List box control field - type derived from field
CON2:IDLOCALIDAD       LIKE(CON2:IDLOCALIDAD)         !List box control field - type derived from field
CON2:IDSOCIO           LIKE(CON2:IDSOCIO)             !List box control field - type derived from field
CON2:DIRECCION         LIKE(CON2:DIRECCION)           !List box control field - type derived from field
CON2:FECHA             LIKE(CON2:FECHA)               !List box control field - type derived from field
CON2:LIBRO             LIKE(CON2:LIBRO)               !List box control field - type derived from field
CON2:FOLIO             LIKE(CON2:FOLIO)               !List box control field - type derived from field
CON2:ACTA              LIKE(CON2:ACTA)                !List box control field - type derived from field
CON2:IDINSPECTOR       LIKE(CON2:IDINSPECTOR)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a CONSULTORIO Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectCONSULTORIO'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDCONSULTORIO~C(0)@n-14@' & |
  '64R(2)|M~IDLOCALIDAD~C(0)@n-14@64R(2)|M~IDSOCIO~C(0)@n-14@80L(2)|M~DIRECCION~L(2)@s5' & |
  '0@80R(2)|M~FECHA~C(0)@d17@64R(2)|M~LIBRO~C(0)@n-14@64R(2)|M~FOLIO~C(0)@n-14@80L(2)|M' & |
  '~ACTA~L(2)@s20@64R(2)|M~IDINSPECTOR~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CONSULTORIO')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_CONSULTORIO'),USE(?Tab:2)
                         END
                         TAB('FK_CONSULTORIO_INSPECTOR'),USE(?Tab:3)
                         END
                         TAB('FK_CONSULTORIO_LOCALIDAD'),USE(?Tab:4)
                         END
                         TAB('FK_CONSULTORIO_SOCIOS'),USE(?Tab:5)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('SelectCONSULTORIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON2:IDCONSULTORIO',CON2:IDCONSULTORIO)            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTORIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_INSPECTOR)        ! Add the sort order for CON2:FK_CONSULTORIO_INSPECTOR for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CON2:IDINSPECTOR,,BRW1)        ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_INSPECTOR , CON2:IDINSPECTOR
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_LOCALIDAD)        ! Add the sort order for CON2:FK_CONSULTORIO_LOCALIDAD for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CON2:IDLOCALIDAD,,BRW1)        ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_LOCALIDAD , CON2:IDLOCALIDAD
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_SOCIOS)           ! Add the sort order for CON2:FK_CONSULTORIO_SOCIOS for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CON2:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_SOCIOS , CON2:IDSOCIO
  BRW1.AddSortOrder(,CON2:PK_CONSULTORIO)                  ! Add the sort order for CON2:PK_CONSULTORIO for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,CON2:IDCONSULTORIO,,BRW1)      ! Initialize the browse locator using  using key: CON2:PK_CONSULTORIO , CON2:IDCONSULTORIO
  BRW1.AddField(CON2:IDCONSULTORIO,BRW1.Q.CON2:IDCONSULTORIO) ! Field CON2:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDLOCALIDAD,BRW1.Q.CON2:IDLOCALIDAD)  ! Field CON2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDSOCIO,BRW1.Q.CON2:IDSOCIO)          ! Field CON2:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:DIRECCION,BRW1.Q.CON2:DIRECCION)      ! Field CON2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA,BRW1.Q.CON2:FECHA)              ! Field CON2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:LIBRO,BRW1.Q.CON2:LIBRO)              ! Field CON2:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FOLIO,BRW1.Q.CON2:FOLIO)              ! Field CON2:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTA,BRW1.Q.CON2:ACTA)                ! Field CON2:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDINSPECTOR,BRW1.Q.CON2:IDINSPECTOR)  ! Field CON2:IDINSPECTOR is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectCONSULTORIO',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:CONSULTORIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectCONSULTORIO',QuickWindow)         ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONSULTRIO_ADHERENTE File
!!! </summary>
Cargar_DERENTE PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTRIO_ADHERENTE)
                       PROJECT(CON1:IDCONSULTORIO)
                       PROJECT(CON1:IDSOCIO)
                       PROJECT(CON1:NRO)
                       PROJECT(CON1:FECHA)
                       PROJECT(CON1:FOLIO)
                       PROJECT(CON1:IDCONSUL_ADE)
                       JOIN(SOC:PK_SOCIOS,CON1:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON1:IDCONSULTORIO     LIKE(CON1:IDCONSULTORIO)       !List box control field - type derived from field
CON1:IDSOCIO           LIKE(CON1:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
CON1:NRO               LIKE(CON1:NRO)                 !List box control field - type derived from field
CON1:FECHA             LIKE(CON1:FECHA)               !List box control field - type derived from field
CON1:FOLIO             LIKE(CON1:FOLIO)               !List box control field - type derived from field
CON1:IDCONSUL_ADE      LIKE(CON1:IDCONSUL_ADE)        !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CONSULTRIO_ADHERENTE File'),AT(,,358,198),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Cargar_DERENTE'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('41L(2)|M~ID CONS~C(0)@n-4@[40L(2)' & |
  '|M~IDSOCIO~C(0)@n-5@339L(2)|M~NOMBRE~C(0)@s30@](171)|M~COLEGIADO~26L(2)|M~NRO~C(0)@n' & |
  '-6@49L(2)|M~FECHA~C(0)@d17@64L(2)|M~FOLIO~C(0)@n-3@25L(2)|M~ID~C(0)@n-5@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de CONSULTRIO_ADHERENTE')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('CONSULTRIO ADHERENTE'),USE(?Tab:2)
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
SetAlerts              PROCEDURE(),DERIVED
                     END

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
  GlobalErrors.SetProcedureName('Cargar_DERENTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON1:IDCONSUL_ADE',CON1:IDCONSUL_ADE)              ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTRIO_ADHERENTE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON1:FK_CONSULTRIO_ADHERENTE_CONSUL)  ! Add the sort order for CON1:FK_CONSULTRIO_ADHERENTE_CONSUL for sort order 1
  BRW1.AddRange(CON1:IDCONSULTORIO,Relate:CONSULTRIO_ADHERENTE,Relate:CONSULTORIO) ! Add file relationship range limit for sort order 1
  BRW1.AddField(CON1:IDCONSULTORIO,BRW1.Q.CON1:IDCONSULTORIO) ! Field CON1:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON1:IDSOCIO,BRW1.Q.CON1:IDSOCIO)          ! Field CON1:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CON1:NRO,BRW1.Q.CON1:NRO)                  ! Field CON1:NRO is a hot field or requires assignment from browse
  BRW1.AddField(CON1:FECHA,BRW1.Q.CON1:FECHA)              ! Field CON1:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON1:FOLIO,BRW1.Q.CON1:FOLIO)              ! Field CON1:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON1:IDCONSUL_ADE,BRW1.Q.CON1:IDCONSUL_ADE) ! Field CON1:IDCONSUL_ADE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cargar_DERENTE',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_CONSULTRIO_ADHERENTE
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cargar_DERENTE',QuickWindow)            ! Save window data to non-volatile store
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
    Formulario_CONSULTRIO_ADHERENTE
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a TIPO_EQUIPO Record
!!! </summary>
SelectTIPO_EQUIPO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_EQUIPO)
                       PROJECT(TIP5:IDTIPOEQUIPO)
                       PROJECT(TIP5:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP5:IDTIPOEQUIPO      LIKE(TIP5:IDTIPOEQUIPO)        !List box control field - type derived from field
TIP5:DESCRIPCION       LIKE(TIP5:DESCRIPCION)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Seleccionar Tipo Consultorio '),AT(,,220,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_EQUIPO'),SYSTEM
                       LIST,AT(8,30,197,124),USE(?Browse:1),HVSCROLL,FORMAT('25L(2)|M~IDT~C(0)@n-5@80L(2)|M~DE' & |
  'SCRIPCION~@s50@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de TIPO_EQUIPO')
                       BUTTON('&Elegir'),AT(154,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,213,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:1)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(164,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectTIPO_EQUIPO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP5:IDTIPOEQUIPO',TIP5:IDTIPOEQUIPO)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_EQUIPO.Open                                  ! File TIPO_EQUIPO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_EQUIPO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP5:IDX_TIPO_EQUIPO_DESCRIPCION)     ! Add the sort order for TIP5:IDX_TIPO_EQUIPO_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP5:DESCRIPCION,,BRW1)        ! Initialize the browse locator using  using key: TIP5:IDX_TIPO_EQUIPO_DESCRIPCION , TIP5:DESCRIPCION
  BRW1.AddSortOrder(,TIP5:PK_TIPO_EQUIPO)                  ! Add the sort order for TIP5:PK_TIPO_EQUIPO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP5:IDTIPOEQUIPO,,BRW1)       ! Initialize the browse locator using  using key: TIP5:PK_TIPO_EQUIPO , TIP5:IDTIPOEQUIPO
  BRW1.AddField(TIP5:IDTIPOEQUIPO,BRW1.Q.TIP5:IDTIPOEQUIPO) ! Field TIP5:IDTIPOEQUIPO is a hot field or requires assignment from browse
  BRW1.AddField(TIP5:DESCRIPCION,BRW1.Q.TIP5:DESCRIPCION)  ! Field TIP5:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_EQUIPO',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:TIPO_EQUIPO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_EQUIPO',QuickWindow)         ! Save window data to non-volatile store
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
!!! Actualizacion CONSULTORIO_EQUIPO
!!! </summary>
UpdateCONSULTORIO_EQUIPO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CON:Record  LIKE(CON:RECORD),THREAD
QuickWindow          WINDOW('IDCONSULTORIO:'),AT(,,358,74),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateCONSULTORIO_EQUIPO'),SYSTEM
                       BUTTON('&Aceptar'),AT(233,50,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(289,50,57,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('ID CONSULTORIO:'),AT(15,4),USE(?CON:IDCONSULTORIO:Prompt),TRN
                       ENTRY(@n-14),AT(63,4,64,10),USE(CON:IDCONSULTORIO),DISABLE
                       PROMPT('IDTIPOCONSUL:'),AT(8,17),USE(?CON:IDTIPOEQUIPO:Prompt),TRN
                       ENTRY(@n-14),AT(63,17,64,10),USE(CON:IDTIPOEQUIPO)
                       BUTTON('...'),AT(129,16,12,12),USE(?CallLookup)
                       STRING(@s50),AT(145,17),USE(TIP5:DESCRIPCION)
                       PROMPT('OBSERVACION:'),AT(8,30),USE(?CON:OBSERVACION:Prompt),TRN
                       ENTRY(@s100),AT(63,30,282,10),USE(CON:OBSERVACION)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
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
  GlobalErrors.SetProcedureName('UpdateCONSULTORIO_EQUIPO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON:Record,History::CON:Record)
  SELF.AddHistoryField(?CON:IDCONSULTORIO,1)
  SELF.AddHistoryField(?CON:IDTIPOEQUIPO,2)
  SELF.AddHistoryField(?CON:OBSERVACION,3)
  SELF.AddUpdateFile(Access:CONSULTORIO_EQUIPO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTORIO_EQUIPO.Open                           ! File CONSULTORIO_EQUIPO used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_EQUIPO.Open                                  ! File TIPO_EQUIPO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONSULTORIO_EQUIPO
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
    ?CON:IDCONSULTORIO{PROP:ReadOnly} = True
    ?CON:IDTIPOEQUIPO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CON:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCONSULTORIO_EQUIPO',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTORIO_EQUIPO.Close
    Relate:TIPO_EQUIPO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCONSULTORIO_EQUIPO',QuickWindow)  ! Save window data to non-volatile store
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


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectCONSULTORIO
      SelectTIPO_EQUIPO
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
      CON:FECHA = TODAY()
      CON:HORA = CLOCK()
      CON:IDUSUARIO = GLO:IDUSUARIO
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CON:IDCONSULTORIO
      CON2:IDCONSULTORIO = CON:IDCONSULTORIO
      IF Access:CONSULTORIO.TryFetch(CON2:PK_CONSULTORIO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CON:IDCONSULTORIO = CON2:IDCONSULTORIO
        ELSE
          SELECT(?CON:IDCONSULTORIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO_EQUIPO.TryValidateField(1)     ! Attempt to validate CON:IDCONSULTORIO in CONSULTORIO_EQUIPO
        SELECT(?CON:IDCONSULTORIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON:IDCONSULTORIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON:IDCONSULTORIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CON:IDTIPOEQUIPO
      TIP5:IDTIPOEQUIPO = CON:IDTIPOEQUIPO
      IF Access:TIPO_EQUIPO.TryFetch(TIP5:PK_TIPO_EQUIPO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CON:IDTIPOEQUIPO = TIP5:IDTIPOEQUIPO
        ELSE
          SELECT(?CON:IDTIPOEQUIPO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO_EQUIPO.TryValidateField(2)     ! Attempt to validate CON:IDTIPOEQUIPO in CONSULTORIO_EQUIPO
        SELECT(?CON:IDTIPOEQUIPO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON:IDTIPOEQUIPO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON:IDTIPOEQUIPO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      TIP5:IDTIPOEQUIPO = CON:IDTIPOEQUIPO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CON:IDTIPOEQUIPO = TIP5:IDTIPOEQUIPO
      END
      ThisWindow.Reset(1)
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
!!! Browse the CONSULTORIO_EQUIPO file by CON:FK_CONSULTORIO_EQUIPO_CONS
!!! </summary>
BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTORIO_EQUIPO)
                       PROJECT(CON:IDCONSULTORIO)
                       PROJECT(CON:IDTIPOEQUIPO)
                       PROJECT(CON:OBSERVACION)
                       PROJECT(CON:FECHA)
                       PROJECT(CON:HORA)
                       JOIN(TIP5:PK_TIPO_EQUIPO,CON:IDTIPOEQUIPO)
                         PROJECT(TIP5:DESCRIPCION)
                         PROJECT(TIP5:IDTIPOEQUIPO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON:IDCONSULTORIO      LIKE(CON:IDCONSULTORIO)        !List box control field - type derived from field
CON:IDTIPOEQUIPO       LIKE(CON:IDTIPOEQUIPO)         !List box control field - type derived from field
TIP5:DESCRIPCION       LIKE(TIP5:DESCRIPCION)         !List box control field - type derived from field
CON:OBSERVACION        LIKE(CON:OBSERVACION)          !List box control field - type derived from field
CON:FECHA              LIKE(CON:FECHA)                !List box control field - type derived from field
CON:HORA               LIKE(CON:HORA)                 !List box control field - type derived from field
TIP5:IDTIPOEQUIPO      LIKE(TIP5:IDTIPOEQUIPO)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM CONSULTORIO POR DETALLE'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS'), |
  SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('31L(2)|M~IDCONS~C(0)@n-7@[32L(2)|' & |
  'M~ID~C(0)@n-7@200R(2)|M~DESCRIPCION~C(0)@s50@]|M~DETALLE~110L(2)|M~OBSERVACION~@s100' & |
  '@50L(2)|M~FECHA~C(0)@d17@80L(2)|M~HORA~C(0)@t7@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CONSULTORIO_EQUIPO'),VCR
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(9,159,49,14),USE(?Query),LEFT,ICON('q.ico'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE7                 QueryListClass                        ! QBE List Class. 
QBV7                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

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
  GlobalErrors.SetProcedureName('BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP5:IDTIPOEQUIPO',TIP5:IDTIPOEQUIPO)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTORIO_EQUIPO.Open                           ! File CONSULTORIO_EQUIPO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTORIO_EQUIPO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON:FK_CONSULTORIO_EQUIPO_CONS)       ! Add the sort order for CON:FK_CONSULTORIO_EQUIPO_CONS for sort order 1
  BRW1.AddRange(CON:IDCONSULTORIO,Relate:CONSULTORIO_EQUIPO,Relate:CONSULTORIO) ! Add file relationship range limit for sort order 1
  BRW1.AddField(CON:IDCONSULTORIO,BRW1.Q.CON:IDCONSULTORIO) ! Field CON:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON:IDTIPOEQUIPO,BRW1.Q.CON:IDTIPOEQUIPO)  ! Field CON:IDTIPOEQUIPO is a hot field or requires assignment from browse
  BRW1.AddField(TIP5:DESCRIPCION,BRW1.Q.TIP5:DESCRIPCION)  ! Field TIP5:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON:OBSERVACION,BRW1.Q.CON:OBSERVACION)    ! Field CON:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(CON:FECHA,BRW1.Q.CON:FECHA)                ! Field CON:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON:HORA,BRW1.Q.CON:HORA)                  ! Field CON:HORA is a hot field or requires assignment from browse
  BRW1.AddField(TIP5:IDTIPOEQUIPO,BRW1.Q.TIP5:IDTIPOEQUIPO) ! Field TIP5:IDTIPOEQUIPO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCONSULTORIO_EQUIPO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTORIO_EQUIPO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS',QuickWindow) ! Save window data to non-volatile store
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
    UpdateCONSULTORIO_EQUIPO
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

