

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
                       INCLUDE('GESTION028.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a CONVENIO Record
!!! </summary>
SelectCONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONVENIO)
                       PROJECT(CON4:IDSOLICITUD)
                       PROJECT(CON4:IDSOCIO)
                       PROJECT(CON4:IDTIPO_CONVENIO)
                       PROJECT(CON4:MONTO_TOTAL)
                       PROJECT(CON4:CANTIDAD_CUOTAS)
                       PROJECT(CON4:MONTO_CUOTA)
                       PROJECT(CON4:MONTO_BONIFICADO)
                       PROJECT(CON4:GASTOS_ADMINISTRATIVOS)
                       PROJECT(CON4:FECHA)
                       PROJECT(CON4:PERIODO)
                       PROJECT(CON4:CANCELADO)
                       PROJECT(CON4:FECHA_CANCELADO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !List box control field - type derived from field
CON4:IDSOCIO           LIKE(CON4:IDSOCIO)             !List box control field - type derived from field
CON4:IDTIPO_CONVENIO   LIKE(CON4:IDTIPO_CONVENIO)     !List box control field - type derived from field
CON4:MONTO_TOTAL       LIKE(CON4:MONTO_TOTAL)         !List box control field - type derived from field
CON4:CANTIDAD_CUOTAS   LIKE(CON4:CANTIDAD_CUOTAS)     !List box control field - type derived from field
CON4:MONTO_CUOTA       LIKE(CON4:MONTO_CUOTA)         !List box control field - type derived from field
CON4:MONTO_BONIFICADO  LIKE(CON4:MONTO_BONIFICADO)    !List box control field - type derived from field
CON4:GASTOS_ADMINISTRATIVOS LIKE(CON4:GASTOS_ADMINISTRATIVOS) !List box control field - type derived from field
CON4:FECHA             LIKE(CON4:FECHA)               !List box control field - type derived from field
CON4:PERIODO           LIKE(CON4:PERIODO)             !Browse key field - type derived from field
CON4:CANCELADO         LIKE(CON4:CANCELADO)           !Browse key field - type derived from field
CON4:FECHA_CANCELADO   LIKE(CON4:FECHA_CANCELADO)     !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a CONVENIO Record'),AT(,,480,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectCONVENIO'),SYSTEM
                       LIST,AT(8,30,449,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSOLICITUD~C(0)@n-14@64' & |
  'R(2)|M~IDSOCIO~C(0)@n-14@64R(2)|M~IDTIPO CONVENIO~C(0)@n-14@48D(12)|M~MONTO TOTAL~C(' & |
  '0)@n-10.2@64R(2)|M~CANTIDAD CUOTAS~C(0)@n-14@48D(12)|M~MONTO CUOTA~C(0)@n-10.2@68D(1' & |
  '2)|M~MONTO BONIFICADO~C(0)@n-10.2@80D(18)|M~GASTOS ADMINISTRATIVOS~C(0)@n-10.2@80R(2' & |
  ')|M~FECHA~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de CONVENIO')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,468,172),USE(?CurrentTab)
                         TAB('CONVENIO'),USE(?Tab:2)
                         END
                         TAB('SOCIOS'),USE(?Tab:3)
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
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
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
  GlobalErrors.SetProcedureName('SelectCONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON4:IDTIPO_CONVENIO',CON4:IDTIPO_CONVENIO)        ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_TOTAL',CON4:MONTO_TOTAL)                ! Added by: BrowseBox(ABC)
  BIND('CON4:CANTIDAD_CUOTAS',CON4:CANTIDAD_CUOTAS)        ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_CUOTA',CON4:MONTO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_BONIFICADO',CON4:MONTO_BONIFICADO)      ! Added by: BrowseBox(ABC)
  BIND('CON4:GASTOS_ADMINISTRATIVOS',CON4:GASTOS_ADMINISTRATIVOS) ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON4:FK_CONVENIO_SOCIOS)              ! Add the sort order for CON4:FK_CONVENIO_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CON4:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON4:FK_CONVENIO_SOCIOS , CON4:IDSOCIO
  BRW1.AddSortOrder(,CON4:FK_CONVENIO_TIPO)                ! Add the sort order for CON4:FK_CONVENIO_TIPO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CON4:IDTIPO_CONVENIO,,BRW1)    ! Initialize the browse locator using  using key: CON4:FK_CONVENIO_TIPO , CON4:IDTIPO_CONVENIO
  BRW1.AddSortOrder(,CON4:IDX_CONVENCIO_PERIODO)           ! Add the sort order for CON4:IDX_CONVENCIO_PERIODO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CON4:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON4:IDX_CONVENCIO_PERIODO , CON4:IDSOCIO
  BRW1.AddSortOrder(,CON4:IDX_CONVENIO_CONTROL)            ! Add the sort order for CON4:IDX_CONVENIO_CONTROL for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,CON4:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON4:IDX_CONVENIO_CONTROL , CON4:IDSOCIO
  BRW1.AddSortOrder(,CON4:FK_CONVENIO_SOCIOS)              ! Add the sort order for CON4:FK_CONVENIO_SOCIOS for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(,CON4:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON4:FK_CONVENIO_SOCIOS , CON4:IDSOCIO
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOCIO,BRW1.Q.CON4:IDSOCIO)          ! Field CON4:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDTIPO_CONVENIO,BRW1.Q.CON4:IDTIPO_CONVENIO) ! Field CON4:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_TOTAL,BRW1.Q.CON4:MONTO_TOTAL)  ! Field CON4:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CON4:CANTIDAD_CUOTAS,BRW1.Q.CON4:CANTIDAD_CUOTAS) ! Field CON4:CANTIDAD_CUOTAS is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_CUOTA,BRW1.Q.CON4:MONTO_CUOTA)  ! Field CON4:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_BONIFICADO,BRW1.Q.CON4:MONTO_BONIFICADO) ! Field CON4:MONTO_BONIFICADO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:GASTOS_ADMINISTRATIVOS,BRW1.Q.CON4:GASTOS_ADMINISTRATIVOS) ! Field CON4:GASTOS_ADMINISTRATIVOS is a hot field or requires assignment from browse
  BRW1.AddField(CON4:FECHA,BRW1.Q.CON4:FECHA)              ! Field CON4:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:PERIODO,BRW1.Q.CON4:PERIODO)          ! Field CON4:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:CANCELADO,BRW1.Q.CON4:CANCELADO)      ! Field CON4:CANCELADO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:FECHA_CANCELADO,BRW1.Q.CON4:FECHA_CANCELADO) ! Field CON4:FECHA_CANCELADO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectCONVENIO',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectCONVENIO',QuickWindow)            ! Save window data to non-volatile store
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
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! CARGAR STRING
!!! </summary>
CARGAR_STRING PROCEDURE 

Window               WINDOW('CARGAR OBSERVACIÓN'),AT(,,394,47),FONT('MS Sans Serif',8,,FONT:regular),GRAY
                       PROMPT('PARA PRESENTAR A  :'),AT(3,4),USE(?REPORTE_LARGO:Prompt)
                       ENTRY(@s100),AT(84,4,303,10),USE(GLO:CARGA_sTRING),MSG('UTILIZACION GENERAL'),TIP('UTILIZACION GENERAL')
                       BUTTON('&OK'),AT(167,25,53,17),USE(?OkButton),LEFT,ICON(ICON:Tick),DEFAULT,FLAT
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
  GlobalErrors.SetProcedureName('CARGAR_STRING')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?REPORTE_LARGO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CARGAR_STRING',Window)                     ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('CARGAR_STRING',Window)                  ! Save window data to non-volatile store
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
!!! Browse the SOCIOS file
!!! </summary>
CERTIFICADO_MATRICULA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:CANTIDAD)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:FECHA_NACIMIENTO)
                       PROJECT(SOC:SEXO)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:TELEFONO)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:FECHA_ALTA)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:OBSERVACION)
                       PROJECT(SOC:FIN_COBERTURA)
                       PROJECT(SOC:BAJA)
                       PROJECT(SOC:IDCIRCULO)
                       PROJECT(SOC:LIBRO)
                       PROJECT(SOC:FOLIO)
                       PROJECT(SOC:ACTA)
                       PROJECT(SOC:PROVISORIO)
                       PROJECT(SOC:IDINSTITUCION)
                       PROJECT(SOC:FECHA_EGRESO)
                       PROJECT(SOC:IDCOBERTURA)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:IDZONA)
                       PROJECT(SOC:ID_TIPO_DOC)
                       JOIN(ZON:PK_ZONA_VIVIENDA,SOC:IDZONA)
                         PROJECT(ZON:IDZONA)
                       END
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                         PROJECT(TIP3:ID_TIPO_DOC)
                       END
                       JOIN(LOC:PK_LOCALIDAD,SOC:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                         PROJECT(LOC:IDLOCALIDAD)
                       END
                       JOIN(INS2:PK_INSTITUCION,SOC:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                         PROJECT(INS2:IDINSTITUCION)
                       END
                       JOIN(COB:PK_COBERTURA,SOC:IDCOBERTURA)
                         PROJECT(COB:DESCRIPCION)
                         PROJECT(COB:IDCOBERTURA)
                       END
                       JOIN(CIR:PK_CIRCULO,SOC:IDCIRCULO)
                         PROJECT(CIR:DESCRIPCION)
                         PROJECT(CIR:IDCIRCULO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !List box control field - type derived from field
SOC:IDSOCIO_Icon       LONG                           !Entry's icon ID
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:CANTIDAD           LIKE(SOC:CANTIDAD)             !List box control field - type derived from field
SOC:N_DOCUMENTO        LIKE(SOC:N_DOCUMENTO)          !List box control field - type derived from field
SOC:FECHA_NACIMIENTO   LIKE(SOC:FECHA_NACIMIENTO)     !List box control field - type derived from field
SOC:SEXO               LIKE(SOC:SEXO)                 !List box control field - type derived from field
SOC:DIRECCION          LIKE(SOC:DIRECCION)            !List box control field - type derived from field
SOC:TELEFONO           LIKE(SOC:TELEFONO)             !List box control field - type derived from field
SOC:DIRECCION_LABORAL  LIKE(SOC:DIRECCION_LABORAL)    !List box control field - type derived from field
SOC:TELEFONO_LABORAL   LIKE(SOC:TELEFONO_LABORAL)     !List box control field - type derived from field
SOC:FECHA_ALTA         LIKE(SOC:FECHA_ALTA)           !List box control field - type derived from field
SOC:EMAIL              LIKE(SOC:EMAIL)                !List box control field - type derived from field
SOC:OBSERVACION        LIKE(SOC:OBSERVACION)          !List box control field - type derived from field
SOC:FIN_COBERTURA      LIKE(SOC:FIN_COBERTURA)        !List box control field - type derived from field
SOC:BAJA               LIKE(SOC:BAJA)                 !List box control field - type derived from field
SOC:IDCIRCULO          LIKE(SOC:IDCIRCULO)            !List box control field - type derived from field
CIR:DESCRIPCION        LIKE(CIR:DESCRIPCION)          !List box control field - type derived from field
SOC:LIBRO              LIKE(SOC:LIBRO)                !List box control field - type derived from field
SOC:FOLIO              LIKE(SOC:FOLIO)                !List box control field - type derived from field
SOC:ACTA               LIKE(SOC:ACTA)                 !List box control field - type derived from field
SOC:PROVISORIO         LIKE(SOC:PROVISORIO)           !List box control field - type derived from field
SOC:IDINSTITUCION      LIKE(SOC:IDINSTITUCION)        !List box control field - type derived from field
INS2:NOMBRE            LIKE(INS2:NOMBRE)              !List box control field - type derived from field
SOC:FECHA_EGRESO       LIKE(SOC:FECHA_EGRESO)         !List box control field - type derived from field
SOC:IDCOBERTURA        LIKE(SOC:IDCOBERTURA)          !List box control field - type derived from field
COB:DESCRIPCION        LIKE(COB:DESCRIPCION)          !List box control field - type derived from field
SOC:IDLOCALIDAD        LIKE(SOC:IDLOCALIDAD)          !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
ZON:IDZONA             LIKE(ZON:IDZONA)               !Related join file key field - type derived from field
TIP3:ID_TIPO_DOC       LIKE(TIP3:ID_TIPO_DOC)         !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
INS2:IDINSTITUCION     LIKE(INS2:IDINSTITUCION)       !Related join file key field - type derived from field
COB:IDCOBERTURA        LIKE(COB:IDCOBERTURA)          !Related join file key field - type derived from field
CIR:IDCIRCULO          LIKE(CIR:IDCIRCULO)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Padrón de Colegiados'),AT(,,541,240),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('BrowseSOCIOS'),SYSTEM
                       LIST,AT(8,35,514,158),USE(?Browse:1),HVSCROLL,FORMAT('39L(2)|MI~IDSOCIO~C(0)@n-7@33L(2)' & |
  '|M~MAT~C(0)@S7@120L(2)|M~NOMBRE~C(0)@s30@43L(2)|M~CANTIDAD~C(0)@n-7@56L(2)|M~N DOCUM' & |
  'ENTO~C(0)@n-14@75L(2)|M~FECHA NACIMIENTO~C(0)@d17@29L(2)|M~SEXO~C(0)@s1@400L(2)|M~DI' & |
  'RECCION~C(0)@s50@120L(2)|M~TELEFONO~C(0)@s30@200L(2)|M~DIRECCION LABORAL~C(0)@s50@12' & |
  '0L(2)|M~TELEFONO LABORAL~C(0)@s30@59L(2)|M~FECHA ALTA~C(0)@d17@200L(2)|M~EMAIL~C(0)@' & |
  's50@400L(2)|M~OBSERVACION~C(0)@s100@40L(2)|M~FIN COBERTURA~C(0)@d17@27L(2)|M~BAJA~C(' & |
  '0)@s2@[24L(2)|M~IDC~C(0)@n-5@120L(2)|M~DESCRIP DISTRITO~C(0)@s30@]|M~DISTRITO~56L(2)' & |
  '|M~LIBRO~C(0)@n-14@56L(2)|M~FOLIO~C(0)@n-14@80L(2)|M~ACTA~C(0)@s20@58L(2)|M~TEMPORAR' & |
  'IO~@s1@[35L(2)|M~IDINST~C(0)@n-7@200L(2)|M~DESCRIP INSTITUCION~C(0)@s50@56L(2)|M~FEC' & |
  'HA EGRESO~C(0)@D6@]|M~TITULO~[28L(2)|M~IDCOB~C(0)@n-5@80L(2)|M~DESC COBERTURA~@s20@]' & |
  '|M~COBERTURA~[36L(2)|M~IDLOC~C(0)@n-7@80L(2)|M~LOCALIDAD~C(0)@s20@]|M~LOCALIDAD~'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de SOCIOS'),VCR
                       BUTTON('&Filtros'),AT(5,219,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       SHEET,AT(4,2,524,212),USE(?CurrentTab)
                         TAB('SOCIOS'),USE(?Tab:1)
                           PROMPT('IDSOCIO:'),AT(129,21),USE(?SOC:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(162,21,60,10),USE(SOC:IDSOCIO),REQ
                         END
                         TAB('DOCUMENTO'),USE(?Tab:2)
                           PROMPT('N DOCUMENTO:'),AT(125,21),USE(?N_DOCUMENTO:Prompt)
                           ENTRY(@n-14),AT(185,20,60,10),USE(SOC:N_DOCUMENTO),REQ
                         END
                         TAB('MATRICULA'),USE(?Tab:3)
                           PROMPT('MATRICULA:'),AT(127,20),USE(?MATRICULA:Prompt)
                           ENTRY(@n-14),AT(177,21,60,10),USE(SOC:MATRICULA),REQ
                         END
                         TAB('NOMBRE'),USE(?Tab:4)
                           PROMPT('NOMBRE:'),AT(128,21),USE(?NOMBRE:Prompt)
                           ENTRY(@s30),AT(178,20,208,10),USE(SOC:NOMBRE),UPR
                         END
                         TAB('SUSP. TEMPORARIA'),USE(?Tab5)
                           BUTTON('Certificado de suspención temporaria de Matricula'),AT(13,197,147,14),USE(?Button5), |
  LEFT,ICON(ICON:Print1),FLAT
                         END
                         TAB('MATRICULA PROVISORIA'),USE(?Tab6)
                           BUTTON('Certificado de  Matricula Provisoria'),AT(10,197,145,14),USE(?Button6),LEFT,ICON(ICON:Print1), |
  FLAT
                         END
                       END
                       BUTTON('&Salir'),AT(477,217,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('Imprimir Certificado '),AT(53,220,74,14),USE(?Button4),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&Borrar'),AT(314,219,49,14),USE(?Delete:3),LEFT,CURSOR('mano.cur'),DISABLE,HIDE,MSG('Borra Registro'), |
  TIP('Borra Registro')
                       PROMPT('&Orden:'),AT(8,20),USE(?SortOrderList:Prompt)
                       LIST,AT(48,20,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
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
  GlobalErrors.SetProcedureName('CERTIFICADO_MATRICULA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('SOC:N_DOCUMENTO',SOC:N_DOCUMENTO)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_NACIMIENTO',SOC:FECHA_NACIMIENTO)        ! Added by: BrowseBox(ABC)
  BIND('SOC:DIRECCION_LABORAL',SOC:DIRECCION_LABORAL)      ! Added by: BrowseBox(ABC)
  BIND('SOC:TELEFONO_LABORAL',SOC:TELEFONO_LABORAL)        ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_ALTA',SOC:FECHA_ALTA)                    ! Added by: BrowseBox(ABC)
  BIND('SOC:FIN_COBERTURA',SOC:FIN_COBERTURA)              ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_EGRESO',SOC:FECHA_EGRESO)                ! Added by: BrowseBox(ABC)
  BIND('ZON:IDZONA',ZON:IDZONA)                            ! Added by: BrowseBox(ABC)
  BIND('TIP3:ID_TIPO_DOC',TIP3:ID_TIPO_DOC)                ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  BIND('INS2:IDINSTITUCION',INS2:IDINSTITUCION)            ! Added by: BrowseBox(ABC)
  BIND('COB:IDCOBERTURA',COB:IDCOBERTURA)                  ! Added by: BrowseBox(ABC)
  BIND('CIR:IDCIRCULO',CIR:IDCIRCULO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:1{PROP:TEXT},1,1)='&',SUB(?Tab:1{PROP:TEXT},2,LEN(?Tab:1{PROP:TEXT})-1),?Tab:1{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab5{PROP:TEXT},1,1)='&',SUB(?Tab5{PROP:TEXT},2,LEN(?Tab5{PROP:TEXT})-1),?Tab5{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab6{PROP:TEXT},1,1)='&',SUB(?Tab6{PROP:TEXT},2,LEN(?Tab6{PROP:TEXT})-1),?Tab6{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  QBE2.Init(QBV2, INIMgr,'VER_SOCIOS', GlobalErrors)
  QBE2.QkSupport = True
  QBE2.QkMenuIcon = 'QkQBE.ico'
  QBE2.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_DOCUMENTO)             ! Add the sort order for SOC:IDX_SOCIOS_DOCUMENTO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?SOC:N_DOCUMENTO,SOC:N_DOCUMENTO,,BRW1) ! Initialize the browse locator using ?SOC:N_DOCUMENTO using key: SOC:IDX_SOCIOS_DOCUMENTO , SOC:N_DOCUMENTO
  BRW1.SetFilter('(SOC:BAJA<<> ''SI'' AND SOC:BAJA_TEMPORARIA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MATRICULA)             ! Add the sort order for SOC:IDX_SOCIOS_MATRICULA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?SOC:MATRICULA,SOC:MATRICULA,,BRW1) ! Initialize the browse locator using ?SOC:MATRICULA using key: SOC:IDX_SOCIOS_MATRICULA , SOC:MATRICULA
  BRW1.SetFilter('(SOC:BAJA<<> ''SI'' AND SOC:BAJA_TEMPORARIA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(?SOC:NOMBRE,SOC:NOMBRE,,BRW1)   ! Initialize the browse locator using ?SOC:NOMBRE using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.SetFilter('(SOC:BAJA<<> ''SI'' AND SOC:BAJA_TEMPORARIA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,SOC:NOMBRE,,BRW1)              ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.SetFilter('(SOC:BAJA<<> ''SI'' AND SOC:BAJA_TEMPORARIA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,SOC:NOMBRE,,BRW1)              ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.SetFilter('(SOC:BAJA<<> ''SI'' AND SOC:BAJA_TEMPORARIA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:PK_SOCIOS)                        ! Add the sort order for SOC:PK_SOCIOS for sort order 6
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort0:Locator.Init(?SOC:IDSOCIO,SOC:IDSOCIO,,BRW1) ! Initialize the browse locator using ?SOC:IDSOCIO using key: SOC:PK_SOCIOS , SOC:IDSOCIO
  BRW1.SetFilter('(SOC:BAJA<<> ''SI'' AND SOC:BAJA_TEMPORARIA <<> ''SI'')') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~CANCEL.ICO'
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:CANTIDAD,BRW1.Q.SOC:CANTIDAD)          ! Field SOC:CANTIDAD is a hot field or requires assignment from browse
  BRW1.AddField(SOC:N_DOCUMENTO,BRW1.Q.SOC:N_DOCUMENTO)    ! Field SOC:N_DOCUMENTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_NACIMIENTO,BRW1.Q.SOC:FECHA_NACIMIENTO) ! Field SOC:FECHA_NACIMIENTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:SEXO,BRW1.Q.SOC:SEXO)                  ! Field SOC:SEXO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:DIRECCION,BRW1.Q.SOC:DIRECCION)        ! Field SOC:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TELEFONO,BRW1.Q.SOC:TELEFONO)          ! Field SOC:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:DIRECCION_LABORAL,BRW1.Q.SOC:DIRECCION_LABORAL) ! Field SOC:DIRECCION_LABORAL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TELEFONO_LABORAL,BRW1.Q.SOC:TELEFONO_LABORAL) ! Field SOC:TELEFONO_LABORAL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_ALTA,BRW1.Q.SOC:FECHA_ALTA)      ! Field SOC:FECHA_ALTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:EMAIL,BRW1.Q.SOC:EMAIL)                ! Field SOC:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:OBSERVACION,BRW1.Q.SOC:OBSERVACION)    ! Field SOC:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FIN_COBERTURA,BRW1.Q.SOC:FIN_COBERTURA) ! Field SOC:FIN_COBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA,BRW1.Q.SOC:BAJA)                  ! Field SOC:BAJA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCIRCULO,BRW1.Q.SOC:IDCIRCULO)        ! Field SOC:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(CIR:DESCRIPCION,BRW1.Q.CIR:DESCRIPCION)    ! Field CIR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:LIBRO,BRW1.Q.SOC:LIBRO)                ! Field SOC:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FOLIO,BRW1.Q.SOC:FOLIO)                ! Field SOC:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ACTA,BRW1.Q.SOC:ACTA)                  ! Field SOC:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:PROVISORIO,BRW1.Q.SOC:PROVISORIO)      ! Field SOC:PROVISORIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDINSTITUCION,BRW1.Q.SOC:IDINSTITUCION) ! Field SOC:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE,BRW1.Q.INS2:NOMBRE)            ! Field INS2:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_EGRESO,BRW1.Q.SOC:FECHA_EGRESO)  ! Field SOC:FECHA_EGRESO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCOBERTURA,BRW1.Q.SOC:IDCOBERTURA)    ! Field SOC:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(COB:DESCRIPCION,BRW1.Q.COB:DESCRIPCION)    ! Field COB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDLOCALIDAD,BRW1.Q.SOC:IDLOCALIDAD)    ! Field SOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(ZON:IDZONA,BRW1.Q.ZON:IDZONA)              ! Field ZON:IDZONA is a hot field or requires assignment from browse
  BRW1.AddField(TIP3:ID_TIPO_DOC,BRW1.Q.TIP3:ID_TIPO_DOC)  ! Field TIP3:ID_TIPO_DOC is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDINSTITUCION,BRW1.Q.INS2:IDINSTITUCION) ! Field INS2:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(COB:IDCOBERTURA,BRW1.Q.COB:IDCOBERTURA)    ! Field COB:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(CIR:IDCIRCULO,BRW1.Q.CIR:IDCIRCULO)        ! Field CIR:IDCIRCULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CERTIFICADO_MATRICULA',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE2,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('CERTIFICADO_MATRICULA',QuickWindow)     ! Save window data to non-volatile store
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
    OF ?Button5
      GLO:IDSOCIO = SOC:IDSOCIO
      
      CARGAR_STRING
      
      REPORTE_LARGO = 'CERTIFICADO DE MATRICULA CON SUSPENCION TEMPORARIA'
      CARGA_AUDITORIA()
      IMPRIMIR_CERTIFICADO_MATRICULACION_BAJTEMP()
    OF ?Button6
      GLO:IDSOCIO = SOC:IDSOCIO
      
      CARGAR_STRING
      
      REPORTE_LARGO = 'CERTIFICADO DE MATRICULA PROVISORIA'
      CARGA_AUDITORIA()
      IMPRIMIR_CERTIFICADO_MATRICULACION_PROVISORIA()
    OF ?Button4
      GLO:IDSOCIO = SOC:IDSOCIO
      !!! DISPARA SQL
      MES# = MONTH(TODAY())
      PERIODO" = clip(YEAR(TODAY())&FORMAT(MES#,@N02))
      RAN:C1 = ''
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      RANKING{PROP:SQL} = 'SELECT COUNT(FACTURA.IDSOCIO)FROM FACTURA WHERE FACTURA.estado = ''''  AND FACTURA.PERIODO < '''&PERIODO"&'''  AND FACTURA.idsocio = '''&GLO:IDSOCIO&''' GROUP BY FACTURA.IDSOCIO'
      NEXT(RANKING)
      CANTIDAD# = RAN:C1
      
      
      !! SACA SI DEBE ALGUNA COUTA DE CONVENIO VENCIDO
      !MES# = MONTH(TODAY())
      !ANO# = YEAR(TODAY())
      !PERIODO# =  FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
      !RAN:C1 = ''
      !RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      !RANKING{PROP:SQL} = 'select  count(convenio_detalle.idsolicitud)  from convenio_detalle  where convenio_detalle.cancelado = '''' and convenio_detalle.periodo < '''&PERIODO#&'''   and convenio_detalle.idsocio = '''&SOC:IDSOCIO&'''  group by convenio_detalle.idsolicitud'
      !NEXT(RANKING)
      !CANTIDAD_CONVENIO# = RAN:C1
      
      !!!!!
      CONTROL# = 3
      IF CANTIDAD# > CONTROL#  THEN
          MESSAGE ('EL SOCIO NO POSEE SUS CUOTAS AL DÍA| EL SOCIO ADEUDA--> '&CANTIDAD#&' DE CUOTAS ','...No se puede generar el Certificado',icon:exclamation)
          select(?Close)
          Cycle
      else
          CARGAR_STRING
      End
      CARGA_AUDITORIA()
      IMPRIMIR_CERTIFICADO_MATRICULACION()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:1)
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab5)
       SELECT(?Tab6)
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSE
    RETURN SELF.SetSort(6,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (SOC:BAJA = 'SI')
    SELF.Q.SOC:IDSOCIO_Icon = 1                            ! Set icon from icon list
  ELSE
    SELF.Q.SOC:IDSOCIO_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CERTIFICADO_MATRICULACION_PROVISORIA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:IDTIPOTITULO)
                       JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                         PROJECT(TIP6:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2125,6719,7552),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6740,1271),USE(?Header)
                         IMAGE('Logo.JPG'),AT(31,31,1604,917),USE(?Image1)
                         STRING(@s40),AT(2000,625),USE(GLO:LEY),FONT(,8)
                         STRING('Ley:'),AT(1698,625,219,188),USE(?String16),FONT(,8),TRN
                         STRING(@s20),AT(2698,812),USE(GLO:PER_JUR),FONT(,8)
                         STRING('Personería Jurídica:'),AT(1698,812),USE(?String18),FONT(,8),TRN
                         STRING(@s255),AT(10,1010,6760,208),USE(GLO:DIRECCION),FONT(,9),CENTER
                         BOX,AT(-10,1198,6750,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Detail                 DETAIL,AT(0,0,,2771),USE(?Detail)
                         STRING('Por medio de la presente  dejamos constancia que el/la:'),AT(63,42),USE(?String7), |
  TRN
                         STRING(@s30),AT(1479,385),USE(TIP6:DESCRIPCION)
                         STRING(@s30),AT(3875,385,2260,208),USE(SOC:NOMBRE),LEFT(2)
                         STRING('D.N.I.:'),AT(63,729),USE(?String20),TRN
                         STRING(@N-14.),AT(531,729),USE(SOC:N_DOCUMENTO),TRN
                         STRING('a comenzado los trámites de su  matriculación provincial en el Colegio '),AT(1656, |
  729),USE(?String22),TRN
                         STRING('La presente certificación es válida hasta el'),AT(63,1417),USE(?String21),TRN
                         STRING(@D6),AT(2750,1417),USE(FECHA_HASTA),RIGHT(1)
                         STRING('Provincia de Río Negro, a pedido del interesado y para ser presentada ante: '),AT(63, |
  1760),USE(?String24),TRN
                         STRING(@s100),AT(63,2104,3688,208),USE(GLO:CARGA_sTRING)
                         STRING('VIEDMA,'),AT(63,2458),USE(?String25),TRN
                         STRING(@s50),AT(865,2448),USE(GLO:FECHA_LARGO)
                         STRING('y se expide en  Viedma, Capital de la  '),AT(3615,1417),USE(?String23),TRN
                         STRING('de Psicólogos del Valle inferior de Río Negro según Ley'),AT(63,1073),USE(?String26), |
  TRN
                         STRING(@s40),AT(3604,1073),USE(GLO:LEY,,?GLO:LEY:2)
                       END
                       FOOTER,AT(1000,9688,6719,1000),USE(?Footer)
                       END
                       FORM,AT(1000,1000,6740,9688),USE(?Form)
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
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_MATRICULACION_PROVISORIA')
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
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_MATRICULACION_PROVISORIA',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisReport.AddSortOrder(SOC:PK_SOCIOS)
  ThisReport.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  Dia"= 'Domingo'
  Dia"= 'Lunes'
  Dia"= 'Martes'
  Dia"= 'Miercoles'
  Dia"= 'Jueves'
  Dia"= 'Viernes'
  Dia"= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  Mes" = 'Enero'
  Mes" = 'Febrero'
  Mes" = 'Marzo'
  Mes" = 'Abril'
  Mes" = 'Mayo'
  Mes" = 'Junio'
  Mes" = 'Julio'
  Mes" = 'Agosto'
  Mes" = 'Septiembre'
  Mes" = 'Octubre'
  Mes" = 'Noviembre'
  Mes" = 'Diciembre'
  END
  GLO:FECHA_LARGO = CLIP(Dia") & ' ' & DAY(TODAY()) & ' de ' &CLIP(Mes")&' '&Year(today())
  
  
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
    INIMgr.Update('IMPRIMIR_CERTIFICADO_MATRICULACION_PROVISORIA',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagName,'GLO:PER_JUR')
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP6:DESCRIPCION')
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'SOC:N_DOCUMENTO')
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagName,'FECHA_HASTA')
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagName,'GLO:CARGA_sTRING')
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:LEY:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY:2,RepGen:XML,TargetAttr:TagName,'GLO:LEY:2')
  SELF.Attribute.Set(?GLO:LEY:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  FECHA_HASTA = TODAY() + 90
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
           LocE::Subject   = 'CERTIFICADO DE MATRICULA'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Direccion = SOC:EMAIL
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
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE MATRICULA'
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE MATRICULA'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CERTIFICADO DE MATRICULA'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Direccion = SOC:EMAIL
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HABILITACION','IMPRIMIR_CERTIFICADO_HABILITACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CERTIFICADO_MATRICULACION_BAJTEMP PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:LIBRO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:IDTIPOTITULO)
                       JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                         PROJECT(TIP6:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(990,2281,7000,7427),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6979,1292),USE(?Header)
                         IMAGE('logo.JPG'),AT(62,42,1698,1042),USE(?Image1)
                         STRING('Ley:'),AT(1823,625),USE(?String14),FONT(,8),TRN
                         STRING(@s40),AT(2073,625),USE(GLO:LEY),FONT(,8)
                         STRING('Personaría Jurídica:'),AT(1823,812),USE(?String15),FONT(,8),TRN
                         STRING(@s20),AT(2844,812),USE(GLO:PER_JUR),FONT(,8)
                         STRING(@s255),AT(31,1010,6958,208),USE(GLO:DIRECCION),FONT(,9),CENTER
                         BOX,AT(10,1219,6979,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Detail                 DETAIL,AT(10,0,6969,2104),USE(?Detail)
                         STRING('CERTIFICAMOS que  el profesional '),AT(219,63),USE(?String7),TRN
                         STRING(@s30),AT(4198,63,2771,208),USE(SOC:NOMBRE),FONT(,,,FONT:bold),LEFT(2)
                         STRING(@s20),AT(2510,63),USE(TIP6:DESCRIPCION)
                         STRING('se encuentra SUSPENDIDO.'),AT(219,417,5865,208),USE(?String26),TRN
                         STRING('El mismo se encuentra matriculado en este Colegio,  bajo el Nro.'),AT(198,771),USE(?String11), |
  TRN
                         STRING('Nro. Resolución:'),AT(4948,771),USE(?String13),TRN
                         STRING(@n-7),AT(219,1125),USE(SOC:LIBRO),FONT(,,,FONT:bold)
                         STRING('VIEDMA,'),AT(156,1833),USE(?String25),TRN
                         STRING(@s50),AT(885,1823),USE(GLO:FECHA_LARGO)
                         STRING('Este certificado se expide en  Viedma , Capital de la Provincia de Río Negro'),AT(229, |
  1479),USE(?String23),TRN
                         STRING(', No pudiendo ejercer la profesión.'),AT(760,1125),USE(?String17),TRN
                         STRING(@s7),AT(4229,771),USE(SOC:MATRICULA),FONT(,,,FONT:bold)
                       END
                       FOOTER,AT(1010,9688,6958,1000),USE(?Footer)
                       END
                       FORM,AT(1000,1000,6990,9688),USE(?Form)
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
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_MATRICULACION_BAJTEMP')
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
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_MATRICULACION_BAJTEMP',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisReport.AddSortOrder(SOC:PK_SOCIOS)
  ThisReport.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  Dia"= 'Domingo'
  Dia"= 'Lunes'
  Dia"= 'Martes'
  Dia"= 'Miercoles'
  Dia"= 'Jueves'
  Dia"= 'Viernes'
  Dia"= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  Mes" = 'Enero'
  Mes" = 'Febrero'
  Mes" = 'Marzo'
  Mes" = 'Abril'
  Mes" = 'Mayo'
  Mes" = 'Junio'
  Mes" = 'Julio'
  Mes" = 'Agosto'
  Mes" = 'Septiembre'
  Mes" = 'Octubre'
  Mes" = 'Noviembre'
  Mes" = 'Diciembre'
  END
  GLO:FECHA_LARGO = CLIP(Dia") & ' ' & DAY(TODAY()) & ' de ' &CLIP(Mes")&' '&Year(today())
  
  
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
    INIMgr.Update('IMPRIMIR_CERTIFICADO_MATRICULACION_BAJTEMP',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagName,'GLO:PER_JUR')
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP6:DESCRIPCION')
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagName,'SOC:LIBRO')
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  FECHA_HASTA = TODAY() + 30
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
           LocE::Subject   = 'CERTIFICADO DE MATRICULA'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Direccion = SOC:EMAIL
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
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE MATRICULA'
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE MATRICULA'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CERTIFICADO DE MATRICULA'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Direccion = SOC:EMAIL
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HABILITACION','IMPRIMIR_CERTIFICADO_HABILITACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CERTIFICADO_MATRICULACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:FECHA_VAL        LONG                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:IDTIPOTITULO)
                       JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                         PROJECT(TIP6:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(12,59,188,183),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',12,,FONT:regular,CHARSET:ANSI), |
  MM
                       HEADER,AT(12,25,187,34),USE(?Header)
                         IMAGE('logo.jpg'),AT(0,0,53,27),USE(?Image1)
                         STRING(@s40),AT(112,22,17),USE(GLO:LEY),FONT(,8)
                         STRING('Ley:'),AT(106,22),USE(?String26),FONT(,8),TRN
                         STRING(@s20),AT(83,22,17),USE(GLO:PER_JUR),FONT(,8)
                         STRING('Personería Jurídica:'),AT(58,22),USE(?String29),FONT(,8),TRN
                         STRING(@s255),AT(0,27,187,6),USE(GLO:DIRECCION),FONT(,9),CENTER,TRN
                         BOX,AT(0,32,187,1),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Detail                 DETAIL,AT(0,0,187,142),USE(?Detail)
                         STRING('Por medio de la presente dejamos constancia que : El/la'),AT(13,2),USE(?String7),FONT(, |
  ,,FONT:italic),TRN
                         STRING(@s15),AT(25,11),USE(TIP6:DESCRIPCION),FONT(,12,,FONT:italic),RIGHT,TRN
                         STRING(':'),AT(71,10),USE(?String27),TRN
                         STRING(@s100),AT(67,11,114,5),USE(SOC:NOMBRE),FONT(,12,,FONT:bold+FONT:italic),LEFT(2)
                         STRING('D.N.I:'),AT(2,20),USE(?String16),FONT(,,,FONT:italic),TRN
                         STRING(', pertenece al Colegio de Psicólogos del Valle inferior de Río Negro'),AT(45,19),USE(?String18), |
  FONT(,,,FONT:italic),TRN
                         STRING(@N-12.B),AT(14,19),USE(SOC:N_DOCUMENTO),FONT(,,,FONT:bold+FONT:italic),TRN
                         STRING('con la Matrícula  Nº'),AT(2,28,38,6),USE(?String11),FONT(,,,FONT:italic),TRN
                         STRING('La presente certificación es válida hasta el'),AT(2,62,81,6),USE(?String21),FONT(, |
  ,,FONT:italic),TRN
                         STRING(@D6),AT(88,62),USE(LOC:FECHA_VAL),FONT(,,,FONT:bold),RIGHT(1)
                         STRING('de la Provincia de Río Negro, a pedido del interesado y para ser presentada:'),AT(2, |
  71),USE(?String24),FONT(,,,FONT:italic),TRN
                         IMAGE,AT(117,117,61,23),USE(?Image2)
                         STRING(@s100),AT(2,80,92,5),USE(GLO:CARGA_sTRING),FONT(,,,FONT:bold+FONT:italic)
                         STRING('VIEDMA,'),AT(2,90),USE(?String25),FONT(,,,FONT:italic),TRN
                         STRING(@s50),AT(25,90),USE(GLO:FECHA_LARGO),FONT(,,,FONT:italic)
                         STRING('y se expide en  Viedma, Capital'),AT(118,62),USE(?String23),FONT(,,,FONT:italic),TRN
                         STRING(@s7),AT(43,28),USE(SOC:MATRICULA),FONT(,,,FONT:bold+FONT:italic)
                         STRING('Asimismo certificamos que el/la  colegiado/a se encuentra en regla con la Tesorería y no'), |
  AT(2,37,170),USE(?String28),FONT(,,,FONT:italic),TRN
                         STRING('presentando al día de la fecha denuncias ni procesos administrativos en curso p' & |
  'or violación al '),AT(2,46),USE(?String30),FONT(,,,FONT:italic),TRN
                         STRING(@s15),AT(149,29),USE(GLO:LEY,,?GLO:LEY:2),FONT(,,,FONT:italic),TRN
                         STRING('que habilita a ejercer la profesión según Ley'),AT(63,28),USE(?String22),FONT(,,,FONT:italic), |
  TRN
                         STRING('código de ética.'),AT(3,54),USE(?STRING1),FONT('Arial',12,,FONT:regular+FONT:italic, |
  CHARSET:DEFAULT)
                       END
                       FOOTER,AT(13,241,187,26),USE(?Footer)
                       END
                       FORM,AT(12,25,187,242),USE(?Form)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_MATRICULACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_MATRICULACION',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisReport.AddSortOrder(SOC:PK_SOCIOS)
  ThisReport.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  Dia"= 'Domingo'
  Dia"= 'Lunes'
  Dia"= 'Martes'
  Dia"= 'Miercoles'
  Dia"= 'Jueves'
  Dia"= 'Viernes'
  Dia"= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  Mes" = 'Enero'
  Mes" = 'Febrero'
  Mes" = 'Marzo'
  Mes" = 'Abril'
  Mes" = 'Mayo'
  Mes" = 'Junio'
  Mes" = 'Julio'
  Mes" = 'Agosto'
  Mes" = 'Septiembre'
  Mes" = 'Octubre'
  Mes" = 'Noviembre'
  Mes" = 'Diciembre'
  END
  GLO:FECHA_LARGO = CLIP(Dia") & ' ' & DAY(TODAY()) & ' de ' &CLIP(Mes")&' '&Year(today())
  
  LOC:FECHA_VAL = TODAY() + 90
  
    
  
  
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONF_EMP.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CERTIFICADO_MATRICULACION',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagName,'GLO:PER_JUR')
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP6:DESCRIPCION')
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'SOC:N_DOCUMENTO')
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VAL,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VAL')
  SELF.Attribute.Set(?LOC:FECHA_VAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagName,'GLO:CARGA_sTRING')
  SELF.Attribute.Set(?GLO:CARGA_sTRING,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:LEY:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY:2,RepGen:XML,TargetAttr:TagName,'GLO:LEY:2')
  SELF.Attribute.Set(?GLO:LEY:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagName,'STRING1')
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  COF:RAZON_SOCIAL = 'Colegio de Psicólogos del Valle Inferior de Rió Negro'
  ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
  Report$?Image2{PROP:NoWidth} = TRUE
  Report$?Image2{PROP:NoHeight} = TRUE
  Report$?Image2{PROP:ImageBlob} = COF:LOGO{PROP:Handle}
  Report$?Image2{PROP:Height} = 40
  Report$?Image2{PROP:Width} = 60
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
           LocE::Subject   = 'CERTIFICADO DE MATRICULA'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Direccion = SOC:EMAIL
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
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE MATRICULA'
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
                 LocE::Titulo     = 'CERTIFICADO DE MATRICULA'
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
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE MATRICULA'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CERTIFICADO DE MATRICULA'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Direccion = SOC:EMAIL
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HABILITACION','IMPRIMIR_CERTIFICADO_HABILITACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Source
!!! CARGA AUDITORIA
!!! </summary>
CARGA_AUDITORIA      PROCEDURE                             ! Declare Procedure

  CODE
    OPEN(AUDITORIA)
    AUD:ACCION  = REPORTE_LARGO
    AUD:IDSOCIO = GLO:IDSOCIO
    AUD:FECHA   = TODAY()
    AUD:HORA    = CLOCK()
    AUD:IDUSUARIO = GLO:IDUSUARIO
    ADD(AUDITORIA)
    !IF ERRORCODE() THEN MESSAGE(ERROR()).
    CLOSE(AUDITORIA)
!!! <summary>
!!! Generated from procedure template - Window
!!! IMPRIMIR CV 
!!! </summary>
CERTIFICADO_CV PROCEDURE 

Window               WINDOW('IMPRIMIR CURRICULUM VITAE'),AT(,,324,66),FONT('Arial',8,,FONT:regular),GRAY,IMM,MDI, |
  SYSTEM
                       PROMPT('IDSOCIO:'),AT(9,15),USE(?GLO:IDSOCIO:Prompt)
                       ENTRY(@n-14),AT(42,14,60,10),USE(GLO:IDSOCIO),REQ
                       BUTTON('...'),AT(103,13,12,12),USE(?CallLookup)
                       STRING(@s30),AT(124,14),USE(SOC:NOMBRE)
                       PROMPT('Matric.'),AT(248,14),USE(?Prompt2)
                       STRING(@n-14),AT(270,15),USE(SOC:MATRICULA)
                       BUTTON('&Listar'),AT(66,43,63,14),USE(?OkButton),LEFT,ICON(ICON:Print1),DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(183,43,59,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
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
  GlobalErrors.SetProcedureName('CERTIFICADO_CV')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CERTIFICADO_CV',Window)                    ! Restore window settings from non-volatile store
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
    INIMgr.Update('CERTIFICADO_CV',Window)                 ! Save window data to non-volatile store
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
    SelectSOCIOS_CERT
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
      REPORTE_LARGO = 'CURRICULUM VITAE'
      CARGA_AUDITORIA()
    OF ?CancelButton
       POST(EVENT:CloseWindow)
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
      START(IMPRIMIR_CV2, 25000)
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a SOCIOS Record
!!! </summary>
SelectSOCIOS_CERT PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:BAJA_TEMPORARIA)
                       PROJECT(SOC:CANTIDAD)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !List box control field - type derived from field
SOC:IDSOCIO_NormalFG   LONG                           !Normal forground color
SOC:IDSOCIO_NormalBG   LONG                           !Normal background color
SOC:IDSOCIO_SelectedFG LONG                           !Selected forground color
SOC:IDSOCIO_SelectedBG LONG                           !Selected background color
SOC:IDSOCIO_Icon       LONG                           !Entry's icon ID
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:MATRICULA_NormalFG LONG                           !Normal forground color
SOC:MATRICULA_NormalBG LONG                           !Normal background color
SOC:MATRICULA_SelectedFG LONG                         !Selected forground color
SOC:MATRICULA_SelectedBG LONG                         !Selected background color
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:NOMBRE_NormalFG    LONG                           !Normal forground color
SOC:NOMBRE_NormalBG    LONG                           !Normal background color
SOC:NOMBRE_SelectedFG  LONG                           !Selected forground color
SOC:NOMBRE_SelectedBG  LONG                           !Selected background color
SOC:BAJA_TEMPORARIA    LIKE(SOC:BAJA_TEMPORARIA)      !List box control field - type derived from field
SOC:BAJA_TEMPORARIA_NormalFG LONG                     !Normal forground color
SOC:BAJA_TEMPORARIA_NormalBG LONG                     !Normal background color
SOC:BAJA_TEMPORARIA_SelectedFG LONG                   !Selected forground color
SOC:BAJA_TEMPORARIA_SelectedBG LONG                   !Selected background color
SOC:CANTIDAD           LIKE(SOC:CANTIDAD)             !List box control field - type derived from field
SOC:CANTIDAD_NormalFG  LONG                           !Normal forground color
SOC:CANTIDAD_NormalBG  LONG                           !Normal background color
SOC:CANTIDAD_SelectedFG LONG                          !Selected forground color
SOC:CANTIDAD_SelectedBG LONG                          !Selected background color
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Selecionar SOCIOS '),AT(,,307,238),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('SelectSOCIOS'),SYSTEM
                       LIST,AT(8,38,281,156),USE(?Browse:1),HVSCROLL,FORMAT('42L(2)|M*I~IDSOCIO~L(0)@n-7@33L(2' & |
  ')|M*~MATRIC~L(0)@n-7@149L(2)|M*~NOMBRE~@s30@47L(2)|M*~BAJA TEMP~@s2@56L(2)|M*~CANTIDAD~@n-14@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de SOCIOS')
                       BUTTON('&Elegir'),AT(247,198,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(3,3,291,212),USE(?CurrentTab)
                         TAB('NOMBRE '),USE(?Tab:1)
                           PROMPT('NOMBRE:'),AT(127,23),USE(?NOMBRE:Prompt)
                           ENTRY(@s30),AT(165,23,121,10),USE(SOC:NOMBRE),UPR
                         END
                         TAB('MATRICULA'),USE(?Tab:4)
                         END
                         TAB('SOCIO'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(253,218,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(9,20),USE(?SortOrderList:Prompt)
                       LIST,AT(49,20,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('SelectSOCIOS_CERT')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:1{PROP:TEXT},1,1)='&',SUB(?Tab:1{PROP:TEXT},2,LEN(?Tab:1{PROP:TEXT})-1),?Tab:1{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MATRICULA)             ! Add the sort order for SOC:IDX_SOCIOS_MATRICULA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SOC:MATRICULA,,BRW1)           ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_MATRICULA , SOC:MATRICULA
  BRW1.SetFilter('(SOC:BAJA <<> ''SI'' AND  SOC:CANTIDAD <<= 4)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:PK_SOCIOS)                        ! Add the sort order for SOC:PK_SOCIOS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,SOC:IDSOCIO,,BRW1)             ! Initialize the browse locator using  using key: SOC:PK_SOCIOS , SOC:IDSOCIO
  BRW1.SetFilter('(SOC:BAJA <<> ''SI''  AND  SOC:CANTIDAD <<= 4)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?SOC:NOMBRE,SOC:NOMBRE,,BRW1)   ! Initialize the browse locator using ?SOC:NOMBRE using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.SetFilter('(SOC:BAJA <<> ''SI''  AND  SOC:CANTIDAD <<= 4)') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~CANCEL.ICO'
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA_TEMPORARIA,BRW1.Q.SOC:BAJA_TEMPORARIA) ! Field SOC:BAJA_TEMPORARIA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:CANTIDAD,BRW1.Q.SOC:CANTIDAD)          ! Field SOC:CANTIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSOCIOS_CERT',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectSOCIOS_CERT',QuickWindow)         ! Save window data to non-volatile store
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
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:1)
       SELECT(?Tab:4)
       SELECT(?Tab:3)
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
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:IDSOCIO_NormalFG = 255                      ! Set conditional color values for SOC:IDSOCIO
    SELF.Q.SOC:IDSOCIO_NormalBG = 65535
    SELF.Q.SOC:IDSOCIO_SelectedFG = 65535
    SELF.Q.SOC:IDSOCIO_SelectedBG = 255
  ELSE
    SELF.Q.SOC:IDSOCIO_NormalFG = -1                       ! Set color values for SOC:IDSOCIO
    SELF.Q.SOC:IDSOCIO_NormalBG = -1
    SELF.Q.SOC:IDSOCIO_SelectedFG = -1
    SELF.Q.SOC:IDSOCIO_SelectedBG = -1
  END
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:IDSOCIO_Icon = 1                            ! Set icon from icon list
  ELSE
    SELF.Q.SOC:IDSOCIO_Icon = 0
  END
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:MATRICULA_NormalFG = 255                    ! Set conditional color values for SOC:MATRICULA
    SELF.Q.SOC:MATRICULA_NormalBG = 65535
    SELF.Q.SOC:MATRICULA_SelectedFG = 65535
    SELF.Q.SOC:MATRICULA_SelectedBG = -1556868257
  ELSE
    SELF.Q.SOC:MATRICULA_NormalFG = -1                     ! Set color values for SOC:MATRICULA
    SELF.Q.SOC:MATRICULA_NormalBG = -1
    SELF.Q.SOC:MATRICULA_SelectedFG = -1
    SELF.Q.SOC:MATRICULA_SelectedBG = -1
  END
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:NOMBRE_NormalFG = 255                       ! Set conditional color values for SOC:NOMBRE
    SELF.Q.SOC:NOMBRE_NormalBG = 65535
    SELF.Q.SOC:NOMBRE_SelectedFG = 65535
    SELF.Q.SOC:NOMBRE_SelectedBG = -1556868257
  ELSE
    SELF.Q.SOC:NOMBRE_NormalFG = -1                        ! Set color values for SOC:NOMBRE
    SELF.Q.SOC:NOMBRE_NormalBG = -1
    SELF.Q.SOC:NOMBRE_SelectedFG = -1
    SELF.Q.SOC:NOMBRE_SelectedBG = -1
  END
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:BAJA_TEMPORARIA_NormalFG = 255              ! Set conditional color values for SOC:BAJA_TEMPORARIA
    SELF.Q.SOC:BAJA_TEMPORARIA_NormalBG = 65535
    SELF.Q.SOC:BAJA_TEMPORARIA_SelectedFG = 65535
    SELF.Q.SOC:BAJA_TEMPORARIA_SelectedBG = 255
  ELSE
    SELF.Q.SOC:BAJA_TEMPORARIA_NormalFG = -1               ! Set color values for SOC:BAJA_TEMPORARIA
    SELF.Q.SOC:BAJA_TEMPORARIA_NormalBG = -1
    SELF.Q.SOC:BAJA_TEMPORARIA_SelectedFG = -1
    SELF.Q.SOC:BAJA_TEMPORARIA_SelectedBG = -1
  END
  SELF.Q.SOC:CANTIDAD_NormalFG = -1                        ! Set color values for SOC:CANTIDAD
  SELF.Q.SOC:CANTIDAD_NormalBG = -1
  SELF.Q.SOC:CANTIDAD_SelectedFG = -1
  SELF.Q.SOC:CANTIDAD_SelectedBG = -1


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CV2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:TELEFONO)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:ID_TIPO_DOC)
                       JOIN(PAD:FK_PADRONXESPECIALIDAD_SOCI,SOC:IDSOCIO)
                         PROJECT(PAD:IDESPECIALIDAD)
                         JOIN(ESP:PK_ESPECIALIDAD,PAD:IDESPECIALIDAD)
                         END
                       END
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                         PROJECT(TIP3:DESCRIPCION)
                       END
                       JOIN(CV:FK_CV_SOCIOS,SOC:IDSOCIO)
                         PROJECT(CV:ANO_EGRESO)
                         PROJECT(CV:CANTIDAD_HORAS)
                         PROJECT(CV:DESCRIPCION)
                         PROJECT(CV:OBSERVACION)
                         PROJECT(CV:ID_TIPO_CURSO)
                         PROJECT(CV:IDINSTITUCION)
                         JOIN(TIP2:PK_T_CURSO,CV:ID_TIPO_CURSO)
                           PROJECT(TIP2:DESCRIPCION)
                         END
                         JOIN(INS2:PK_INSTITUCION,CV:IDINSTITUCION)
                           PROJECT(INS2:NOMBRE)
                           PROJECT(INS2:IDTIPO_INSTITUCION)
                           PROJECT(INS2:IDLOCALIDAD)
                           JOIN(TIP4:PK_T_INSTITUCION,INS2:IDTIPO_INSTITUCION)
                           END
                           JOIN(LOC:PK_LOCALIDAD,INS2:IDLOCALIDAD)
                             PROJECT(LOC:DESCRIPCION)
                             PROJECT(LOC:IDPAIS)
                             JOIN(PAI:PK_PAIS,LOC:IDPAIS)
                               PROJECT(PAI:DESCRIPCION)
                             END
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

Report               REPORT,AT(1010,3323,6250,7625),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,229,6250,3083),USE(?Header)
                         STRING('CURRICULUM VITAE'),AT(2458,927),USE(?String1),FONT(,,,FONT:bold+FONT:underline),TRN
                         IMAGE('Logo.JPG'),AT(0,125,1573,1083),USE(?Image1)
                         GROUP,AT(1167,1125,4135,1906),USE(?Group1),BOXED
                           STRING('Nombre:'),AT(1344,1271),USE(?String2),TRN
                           STRING('Tipo y Nº de Documento: :'),AT(1333,1531),USE(?String3),TRN
                           STRING(@s5),AT(2948,1531),USE(TIP3:DESCRIPCION)
                           STRING(@n-14),AT(3396,1531),USE(SOC:N_DOCUMENTO)
                           STRING(@s30),AT(1917,1281,3094,208),USE(SOC:NOMBRE)
                         END
                         STRING('Domicilio Particular'),AT(1333,1792),USE(?String5),TRN
                         STRING(@s100),AT(2594,1792),USE(SOC:DIRECCION)
                         STRING('Telefono Particular:'),AT(1333,2021),USE(?String6),TRN
                         STRING(@s30),AT(2604,2021),USE(SOC:TELEFONO)
                         STRING('Telefono Laboral:'),AT(1333,2542),USE(?String8),TRN
                         STRING(@s30),AT(2448,2542),USE(SOC:TELEFONO_LABORAL)
                         STRING('e-mail:'),AT(1333,2792),USE(?String16),TRN
                         LINE,AT(10,3052,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@s50),AT(2458,2792),USE(SOC:EMAIL)
                         STRING('Domicilio Laboral:'),AT(1333,2260),USE(?String7),TRN
                         STRING(@s50),AT(2438,2260),USE(SOC:DIRECCION_LABORAL)
                       END
detail1                DETAIL,AT(0,0,,1625),USE(?DETAIL1)
                         STRING(@s4),AT(365,31),USE(CV:ANO_EGRESO),FONT(,,,FONT:bold+FONT:italic)
                         STRING(@s50),AT(1302,31,3719,208),USE(CV:DESCRIPCION),FONT(,,,FONT:bold)
                         STRING(@s20),AT(2292,813),USE(CV:CANTIDAD_HORAS)
                         LINE,AT(1146,1573,0,-1562),USE(?Line3),COLOR(COLOR:Black)
                         STRING(@s100),AT(1302,1354,4906,208),USE(CV:OBSERVACION)
                         STRING('Cantidad Horas:'),AT(1302,813),USE(?String23),TRN
                         STRING('Año:'),AT(10,31),USE(?String22),FONT(,,,FONT:bold+FONT:italic+FONT:underline),TRN
                         STRING(@s50),AT(1979,292,3563,208),USE(INS2:NOMBRE)
                         STRING(@s20),AT(1938,552,1521,208),USE(LOC:DESCRIPCION)
                         STRING(@s20),AT(3708,552),USE(PAI:DESCRIPCION),TRN
                         STRING('Localidad:'),AT(1302,552),USE(?String27),TRN
                         LINE,AT(10,21,6219,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('Institución:'),AT(1302,292),USE(?String24),TRN
                         STRING(@s50),AT(2323,1073),USE(TIP2:DESCRIPCION)
                         STRING('En caracter de:'),AT(1302,1073),USE(?String28),TRN
                         LINE,AT(21,1573,6229,0),USE(?Line2),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(1000,10969,6250,510),USE(?Footer)
                         LINE,AT(10,10,7271,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,94),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,94),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5292,42),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1010,229,6240,11240),USE(?Form)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CV2')
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
  INIMgr.Fetch('IMPRIMIR_CV2',ProgressWindow)              ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisReport.AddSortOrder(SOC:PK_SOCIOS)
  ThisReport.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
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
    INIMgr.Update('IMPRIMIR_CV2',ProgressWindow)           ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?Group1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?Group1,RepGen:XML,TargetAttr:TagName,'Group1')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagName,'String2')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP3:DESCRIPCION')
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'SOC:N_DOCUMENTO')
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagName,'String5')
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagName,'String6')
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO')
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO_LABORAL')
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagName,'SOC:EMAIL')
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION_LABORAL')
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CV:ANO_EGRESO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CV:ANO_EGRESO,RepGen:XML,TargetAttr:TagName,'CV:ANO_EGRESO')
  SELF.Attribute.Set(?CV:ANO_EGRESO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CV:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CV:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'CV:DESCRIPCION')
  SELF.Attribute.Set(?CV:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CV:CANTIDAD_HORAS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CV:CANTIDAD_HORAS,RepGen:XML,TargetAttr:TagName,'CV:CANTIDAD_HORAS')
  SELF.Attribute.Set(?CV:CANTIDAD_HORAS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CV:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CV:OBSERVACION,RepGen:XML,TargetAttr:TagName,'CV:OBSERVACION')
  SELF.Attribute.Set(?CV:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagName,'INS2:NOMBRE')
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAI:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAI:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'PAI:DESCRIPCION')
  SELF.Attribute.Set(?PAI:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP2:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP2:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP2:DESCRIPCION')
  SELF.Attribute.Set(?TIP2:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CV2','IMPRIMIR_CV2','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

