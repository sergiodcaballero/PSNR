

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION096.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION095.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the BANCO_COD_REG File
!!! </summary>
ABM_BANCO_COG_REGISTRO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(BANCO_COD_REG)
                       PROJECT(BAN3:ID_REGISTRO)
                       PROJECT(BAN3:DESCRIPCION)
                       PROJECT(BAN3:COD_REGISTRO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
BAN3:ID_REGISTRO       LIKE(BAN3:ID_REGISTRO)         !List box control field - type derived from field
BAN3:DESCRIPCION       LIKE(BAN3:DESCRIPCION)         !List box control field - type derived from field
BAN3:COD_REGISTRO      LIKE(BAN3:COD_REGISTRO)        !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the BANCO_COD_REG File'),AT(,,224,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ZZ'),SYSTEM
                       LIST,AT(8,30,208,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~ID REGISTRO~C(0)@n-14@80' & |
  'L(2)|M~DESCRIPCION~L(2)@s50@64R(2)|M~COD REGISTRO~C(0)@n-14@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de BANCO_COD_REG')
                       BUTTON('&Ver'),AT(8,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(61,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(114,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(167,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,216,172),USE(?CurrentTab)
                         TAB('PK_BANCO_COD_REG'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(171,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('ABM_BANCO_COG_REGISTRO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('BAN3:ID_REGISTRO',BAN3:ID_REGISTRO)                ! Added by: BrowseBox(ABC)
  BIND('BAN3:COD_REGISTRO',BAN3:COD_REGISTRO)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:BANCO_COD_REG.Open                                ! File BANCO_COD_REG used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:BANCO_COD_REG,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,BAN3:PK_BANCO_COD_REG)                ! Add the sort order for BAN3:PK_BANCO_COD_REG for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,BAN3:ID_REGISTRO,,BRW1)        ! Initialize the browse locator using  using key: BAN3:PK_BANCO_COD_REG , BAN3:ID_REGISTRO
  BRW1.AddField(BAN3:ID_REGISTRO,BRW1.Q.BAN3:ID_REGISTRO)  ! Field BAN3:ID_REGISTRO is a hot field or requires assignment from browse
  BRW1.AddField(BAN3:DESCRIPCION,BRW1.Q.BAN3:DESCRIPCION)  ! Field BAN3:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(BAN3:COD_REGISTRO,BRW1.Q.BAN3:COD_REGISTRO) ! Field BAN3:COD_REGISTRO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_BANCO_COG_REGISTRO',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateBANCO_COD_REG
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO_COD_REG.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_BANCO_COG_REGISTRO',QuickWindow)    ! Save window data to non-volatile store
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
    UpdateBANCO_COD_REG
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

