

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION099.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a FONDOS Record
!!! </summary>
SelectFONDOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(FONDOS)
                       PROJECT(FON:IDFONDO)
                       PROJECT(FON:NOMBRE_FONDO)
                       PROJECT(FON:MONTO)
                       PROJECT(FON:FECHA)
                       PROJECT(FON:HORA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
FON:IDFONDO            LIKE(FON:IDFONDO)              !List box control field - type derived from field
FON:NOMBRE_FONDO       LIKE(FON:NOMBRE_FONDO)         !List box control field - type derived from field
FON:MONTO              LIKE(FON:MONTO)                !List box control field - type derived from field
FON:FECHA              LIKE(FON:FECHA)                !List box control field - type derived from field
FON:HORA               LIKE(FON:HORA)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a FONDOS Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectFONDOS'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDFONDO~C(0)@n-14@80L(2)' & |
  '|M~NOMBRE_FONDO~L(2)@s30@68D(30)|M~MONTO~C(0)@n-15.2@80R(2)|M~FECHA~C(0)@d17@80R(2)|' & |
  'M~HORA~C(0)@t7@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de FONDOS')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_FONDOS'),USE(?Tab:2)
                         END
                         TAB('IDX_FONDOS_NOMBRE'),USE(?Tab:3)
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
  GlobalErrors.SetProcedureName('SelectFONDOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FON:IDFONDO',FON:IDFONDO)                          ! Added by: BrowseBox(ABC)
  BIND('FON:NOMBRE_FONDO',FON:NOMBRE_FONDO)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:FONDOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,FON:IDX_FONDOS_NOMBRE)                ! Add the sort order for FON:IDX_FONDOS_NOMBRE for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,FON:NOMBRE_FONDO,,BRW1)        ! Initialize the browse locator using  using key: FON:IDX_FONDOS_NOMBRE , FON:NOMBRE_FONDO
  BRW1.AddSortOrder(,FON:PK_FONDOS)                        ! Add the sort order for FON:PK_FONDOS for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,FON:IDFONDO,,BRW1)             ! Initialize the browse locator using  using key: FON:PK_FONDOS , FON:IDFONDO
  BRW1.AddField(FON:IDFONDO,BRW1.Q.FON:IDFONDO)            ! Field FON:IDFONDO is a hot field or requires assignment from browse
  BRW1.AddField(FON:NOMBRE_FONDO,BRW1.Q.FON:NOMBRE_FONDO)  ! Field FON:NOMBRE_FONDO is a hot field or requires assignment from browse
  BRW1.AddField(FON:MONTO,BRW1.Q.FON:MONTO)                ! Field FON:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(FON:FECHA,BRW1.Q.FON:FECHA)                ! Field FON:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(FON:HORA,BRW1.Q.FON:HORA)                  ! Field FON:HORA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectFONDOS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FONDOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectFONDOS',QuickWindow)              ! Save window data to non-volatile store
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

