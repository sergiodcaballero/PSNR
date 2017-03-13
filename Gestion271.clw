

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION271.INC'),ONCE        !Local module procedure declarations
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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

