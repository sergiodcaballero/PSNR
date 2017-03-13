

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION052.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a TRABAJO Record
!!! </summary>
SelectTRABAJO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TRABAJO)
                       PROJECT(TRA:IDTRABAJO)
                       PROJECT(TRA:DESCRIPCION)
                       PROJECT(TRA:DIRECCION)
                       PROJECT(TRA:IDLOCALIDAD)
                       PROJECT(TRA:TELEFONO)
                       PROJECT(TRA:EMAIL)
                       PROJECT(TRA:OBSERVACION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TRA:IDTRABAJO          LIKE(TRA:IDTRABAJO)            !List box control field - type derived from field
TRA:DESCRIPCION        LIKE(TRA:DESCRIPCION)          !List box control field - type derived from field
TRA:DIRECCION          LIKE(TRA:DIRECCION)            !List box control field - type derived from field
TRA:IDLOCALIDAD        LIKE(TRA:IDLOCALIDAD)          !List box control field - type derived from field
TRA:TELEFONO           LIKE(TRA:TELEFONO)             !List box control field - type derived from field
TRA:EMAIL              LIKE(TRA:EMAIL)                !List box control field - type derived from field
TRA:OBSERVACION        LIKE(TRA:OBSERVACION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a TRABAJO Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectTRABAJO'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('40R(2)|M~IDTRABAJO~C(0)@n-7@80L(2' & |
  ')|M~DESCRIPCION~L(2)@s50@80L(2)|M~DIRECCION~L(2)@s50@64R(2)|M~IDLOCALIDAD~C(0)@n-14@' & |
  '80L(2)|M~TELEFONO~L(2)@s20@80L(2)|M~EMAIL~L(2)@s50@80L(2)|M~OBSERVACION~L(2)@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de TRABAJO')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_TRABAJO'),USE(?Tab:2)
                         END
                         TAB('IDX_TRABAJO_DESCRIPCION'),USE(?Tab:3)
                         END
                         TAB('FK_TRABAJO_LOCALIDAD'),USE(?Tab:4)
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
  GlobalErrors.SetProcedureName('SelectTRABAJO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TRA:IDTRABAJO',TRA:IDTRABAJO)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TRABAJO.Open                                      ! File TRABAJO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TRABAJO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TRA:IDX_TRABAJO_DESCRIPCION)          ! Add the sort order for TRA:IDX_TRABAJO_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TRA:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: TRA:IDX_TRABAJO_DESCRIPCION , TRA:DESCRIPCION
  BRW1.AddSortOrder(,TRA:FK_TRABAJO_LOCALIDAD)             ! Add the sort order for TRA:FK_TRABAJO_LOCALIDAD for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,TRA:IDLOCALIDAD,,BRW1)         ! Initialize the browse locator using  using key: TRA:FK_TRABAJO_LOCALIDAD , TRA:IDLOCALIDAD
  BRW1.AddSortOrder(,TRA:PK_TRABAJO)                       ! Add the sort order for TRA:PK_TRABAJO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,TRA:IDTRABAJO,,BRW1)           ! Initialize the browse locator using  using key: TRA:PK_TRABAJO , TRA:IDTRABAJO
  BRW1.AddField(TRA:IDTRABAJO,BRW1.Q.TRA:IDTRABAJO)        ! Field TRA:IDTRABAJO is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DESCRIPCION,BRW1.Q.TRA:DESCRIPCION)    ! Field TRA:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DIRECCION,BRW1.Q.TRA:DIRECCION)        ! Field TRA:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:IDLOCALIDAD,BRW1.Q.TRA:IDLOCALIDAD)    ! Field TRA:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(TRA:TELEFONO,BRW1.Q.TRA:TELEFONO)          ! Field TRA:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(TRA:EMAIL,BRW1.Q.TRA:EMAIL)                ! Field TRA:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(TRA:OBSERVACION,BRW1.Q.TRA:OBSERVACION)    ! Field TRA:OBSERVACION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTRABAJO',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TRABAJO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTRABAJO',QuickWindow)             ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

