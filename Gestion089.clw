

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION089.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION088.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de TIPO_TITULO
!!! </summary>
ABM_TITULO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_TITULO)
                       PROJECT(TIP6:IDTIPOTITULO)
                       PROJECT(TIP6:DESCRIPCION)
                       PROJECT(TIP6:CORTO)
                       PROJECT(TIP6:IDNIVELFORMACION)
                       JOIN(NIV:PK_NIVEL_FORMACION,TIP6:IDNIVELFORMACION)
                         PROJECT(NIV:DESCRIPCION)
                         PROJECT(NIV:IDNIVELFOMACION)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP6:IDTIPOTITULO      LIKE(TIP6:IDTIPOTITULO)        !List box control field - type derived from field
TIP6:DESCRIPCION       LIKE(TIP6:DESCRIPCION)         !List box control field - type derived from field
TIP6:CORTO             LIKE(TIP6:CORTO)               !List box control field - type derived from field
TIP6:IDNIVELFORMACION  LIKE(TIP6:IDNIVELFORMACION)    !List box control field - type derived from field
NIV:DESCRIPCION        LIKE(NIV:DESCRIPCION)          !List box control field - type derived from field
NIV:IDNIVELFOMACION    LIKE(NIV:IDNIVELFOMACION)      !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de TIPO_TITULO'),AT(,,277,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ABM_TITULO'),SYSTEM
                       LIST,AT(8,30,261,124),USE(?Browse:1),HVSCROLL,FORMAT('64L(2)|M~IDTIPOTITULO~C(0)@n-5@19' & |
  '9L(2)|M~DESCRIPCION~@s50@44L(2)|M~CORTO~@s10@[68L(2)|M~ID~C(0)@n-3@200L(2)|M~DESCRIP' & |
  'CION~C(0)@s50@]|M~NIVEL DE FORMACION~'),FROM(Queue:Browse:1),IMM,MSG('Administrador ' & |
  'de TIPO_TITULO')
                       BUTTON('&Elegir'),AT(8,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(61,158,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(114,158,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(167,158,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(220,158,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,269,172),USE(?CurrentTab)
                         TAB('TITULO'),USE(?Tab:2)
                         END
                         TAB('NIVEL FORMACION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(224,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('ABM_TITULO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP6:IDTIPOTITULO',TIP6:IDTIPOTITULO)              ! Added by: BrowseBox(ABC)
  BIND('NIV:IDNIVELFOMACION',NIV:IDNIVELFOMACION)          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_TITULO.Open                                  ! File TIPO_TITULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_TITULO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP6:FK_TIPO_TITULO_NIVEL_FORMACION)  ! Add the sort order for TIP6:FK_TIPO_TITULO_NIVEL_FORMACION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP6:IDNIVELFORMACION,,BRW1)   ! Initialize the browse locator using  using key: TIP6:FK_TIPO_TITULO_NIVEL_FORMACION , TIP6:IDNIVELFORMACION
  BRW1.AddSortOrder(,TIP6:PK_TIPO_TITULO)                  ! Add the sort order for TIP6:PK_TIPO_TITULO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP6:IDTIPOTITULO,,BRW1)       ! Initialize the browse locator using  using key: TIP6:PK_TIPO_TITULO , TIP6:IDTIPOTITULO
  BRW1.AddField(TIP6:IDTIPOTITULO,BRW1.Q.TIP6:IDTIPOTITULO) ! Field TIP6:IDTIPOTITULO is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:DESCRIPCION,BRW1.Q.TIP6:DESCRIPCION)  ! Field TIP6:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:CORTO,BRW1.Q.TIP6:CORTO)              ! Field TIP6:CORTO is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:IDNIVELFORMACION,BRW1.Q.TIP6:IDNIVELFORMACION) ! Field TIP6:IDNIVELFORMACION is a hot field or requires assignment from browse
  BRW1.AddField(NIV:DESCRIPCION,BRW1.Q.NIV:DESCRIPCION)    ! Field NIV:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(NIV:IDNIVELFOMACION,BRW1.Q.NIV:IDNIVELFOMACION) ! Field NIV:IDNIVELFOMACION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_TITULO',QuickWindow)                   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateTIPO_TITULO
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_TITULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_TITULO',QuickWindow)                ! Save window data to non-volatile store
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
    UpdateTIPO_TITULO
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

