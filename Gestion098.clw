

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION098.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION097.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de TRABAJO
!!! </summary>
Trabajos PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TRABAJO)
                       PROJECT(TRA:IDTRABAJO)
                       PROJECT(TRA:DESCRIPCION)
                       PROJECT(TRA:DIRECCION)
                       PROJECT(TRA:TELEFONO)
                       PROJECT(TRA:EMAIL)
                       PROJECT(TRA:OBSERVACION)
                       PROJECT(TRA:IDLOCALIDAD)
                       JOIN(LOC:PK_LOCALIDAD,TRA:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                         PROJECT(LOC:IDLOCALIDAD)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TRA:IDTRABAJO          LIKE(TRA:IDTRABAJO)            !List box control field - type derived from field
TRA:DESCRIPCION        LIKE(TRA:DESCRIPCION)          !List box control field - type derived from field
TRA:DIRECCION          LIKE(TRA:DIRECCION)            !List box control field - type derived from field
TRA:TELEFONO           LIKE(TRA:TELEFONO)             !List box control field - type derived from field
TRA:EMAIL              LIKE(TRA:EMAIL)                !List box control field - type derived from field
TRA:OBSERVACION        LIKE(TRA:OBSERVACION)          !List box control field - type derived from field
TRA:IDLOCALIDAD        LIKE(TRA:IDLOCALIDAD)          !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de TRABAJO'),AT(,,488,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('Trabajos'),SYSTEM
                       LIST,AT(8,30,472,124),USE(?Browse:1),HVSCROLL,FORMAT('47L(2)|M~IDTRABAJO~C(0)@n-7@189L(' & |
  '2)|M~DESCRIPCION~@s50@80L(2)|M~DIRECCION~@s50@80L(2)|M~TELEFONO~@s20@80L(2)|M~EMAIL~' & |
  '@s50@80L(2)|M~OBSERVACION~@s50@[23L(2)|M~IDL~C(0)@n-5@80L(2)|M~DESC LOCALIDAD~C(0)@s' & |
  '20@]|M~LOCALIDAD~'),FROM(Queue:Browse:1),IMM,MSG('Administrador de TRABAJO')
                       BUTTON('&Ver'),AT(260,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(314,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(366,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(420,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(2,4,484,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(431,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('Trabajos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TRA:IDTRABAJO',TRA:IDTRABAJO)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
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
  BRW1.AddSortOrder(,TRA:PK_TRABAJO)                       ! Add the sort order for TRA:PK_TRABAJO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TRA:IDTRABAJO,,BRW1)           ! Initialize the browse locator using  using key: TRA:PK_TRABAJO , TRA:IDTRABAJO
  BRW1.AddField(TRA:IDTRABAJO,BRW1.Q.TRA:IDTRABAJO)        ! Field TRA:IDTRABAJO is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DESCRIPCION,BRW1.Q.TRA:DESCRIPCION)    ! Field TRA:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DIRECCION,BRW1.Q.TRA:DIRECCION)        ! Field TRA:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:TELEFONO,BRW1.Q.TRA:TELEFONO)          ! Field TRA:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(TRA:EMAIL,BRW1.Q.TRA:EMAIL)                ! Field TRA:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(TRA:OBSERVACION,BRW1.Q.TRA:OBSERVACION)    ! Field TRA:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:IDLOCALIDAD,BRW1.Q.TRA:IDLOCALIDAD)    ! Field TRA:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trabajos',QuickWindow)                     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateTRABAJO
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
    INIMgr.Update('Trabajos',QuickWindow)                  ! Save window data to non-volatile store
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
    UpdateTRABAJO
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

