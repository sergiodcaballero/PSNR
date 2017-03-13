

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION115.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a OBRA_SOCIAL Record
!!! </summary>
SelectOBRA_SOCIAL PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(OBRA_SOCIAL)
                       PROJECT(OBR:IDOS)
                       PROJECT(OBR:NOMPRE_CORTO)
                       PROJECT(OBR:NOMBRE)
                       PROJECT(OBR:DIRECCION)
                       PROJECT(OBR:PRONTO_PAGO)
                       PROJECT(OBR:FECHA_BAJA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
OBR:IDOS               LIKE(OBR:IDOS)                 !List box control field - type derived from field
OBR:IDOS_Icon          LONG                           !Entry's icon ID
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
OBR:NOMBRE             LIKE(OBR:NOMBRE)               !List box control field - type derived from field
OBR:DIRECCION          LIKE(OBR:DIRECCION)            !List box control field - type derived from field
OBR:PRONTO_PAGO        LIKE(OBR:PRONTO_PAGO)          !List box control field - type derived from field
OBR:FECHA_BAJA         LIKE(OBR:FECHA_BAJA)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Seleccionar una  OBRA SOCIAL '),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectOBRA_SOCIAL'),SYSTEM
                       LIST,AT(8,39,342,114),USE(?Browse:1),HVSCROLL,FORMAT('40L(2)|MI~IDOS~C(0)@n-7@124L(2)|M' & |
  '~NOMPRE CORTO~@s30@209L(2)|M~NOMBRE~@s50@80L(2)|M~DIRECCION~@s50@48L(2)|M~PRONTO PAG' & |
  'O~@s2@40L(2)|M~FECHA BAJA~@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de OBRA_SOCIAL')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('SIGLAS'),USE(?Tab:2)
                           PROMPT('NOMPRE CORTO:'),AT(8,25),USE(?OBR:NOMPRE_CORTO:Prompt)
                           ENTRY(@s30),AT(75,24,180,10),USE(OBR:NOMPRE_CORTO)
                         END
                         TAB('NOMBRE'),USE(?Tab:3)
                           PROMPT('NOMBRE:'),AT(11,23),USE(?OBR:NOMBRE:Prompt)
                           ENTRY(@s100),AT(61,22,180,10),USE(OBR:NOMBRE)
                         END
                         TAB('ID'),USE(?Tab:4)
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
SetQueueRecord         PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('SelectOBRA_SOCIAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('OBR:PRONTO_PAGO',OBR:PRONTO_PAGO)                  ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:OBRA_SOCIAL,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,OBR:IDX_OBRA_SOCIAL_NOMBRE)           ! Add the sort order for OBR:IDX_OBRA_SOCIAL_NOMBRE for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,OBR:NOMBRE,,BRW1)              ! Initialize the browse locator using  using key: OBR:IDX_OBRA_SOCIAL_NOMBRE , OBR:NOMBRE
  BRW1.AddSortOrder(,OBR:PK_OBRA_SOCIAL)                   ! Add the sort order for OBR:PK_OBRA_SOCIAL for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,OBR:IDOS,,BRW1)                ! Initialize the browse locator using  using key: OBR:PK_OBRA_SOCIAL , OBR:IDOS
  BRW1.AddSortOrder(,OBR:IDX_OBRA_SOCIAL_NOM_CORTO)        ! Add the sort order for OBR:IDX_OBRA_SOCIAL_NOM_CORTO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,OBR:NOMPRE_CORTO,,BRW1)        ! Initialize the browse locator using  using key: OBR:IDX_OBRA_SOCIAL_NOM_CORTO , OBR:NOMPRE_CORTO
  ?Browse:1{PROP:IconList,1} = '~cancelar.ico'
  BRW1.AddField(OBR:IDOS,BRW1.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMPRE_CORTO,BRW1.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMBRE,BRW1.Q.OBR:NOMBRE)              ! Field OBR:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(OBR:DIRECCION,BRW1.Q.OBR:DIRECCION)        ! Field OBR:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(OBR:PRONTO_PAGO,BRW1.Q.OBR:PRONTO_PAGO)    ! Field OBR:PRONTO_PAGO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:FECHA_BAJA,BRW1.Q.OBR:FECHA_BAJA)      ! Field OBR:FECHA_BAJA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectOBRA_SOCIAL',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectOBRA_SOCIAL',QuickWindow)         ! Save window data to non-volatile store
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (OBR:FECHA_BAJA <> 0 )
    SELF.Q.OBR:IDOS_Icon = 1                               ! Set icon from icon list
  ELSE
    SELF.Q.OBR:IDOS_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

