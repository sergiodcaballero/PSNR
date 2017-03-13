

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION091.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION090.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de CONTROL_CUOTA
!!! </summary>
ABM_CUOTA_ANUAL PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONTROL_CUOTA)
                       PROJECT(CONC:GENERADO)
                       PROJECT(CONC:ANO)
                       PROJECT(CONC:CANT_CUOTAS_MAX)
                       PROJECT(CONC:FECHA_TOPE_PAGO)
                       PROJECT(CONC:DESCUENTO_CUOTA)
                       PROJECT(CONC:IDCONTROL)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CONC:GENERADO          LIKE(CONC:GENERADO)            !List box control field - type derived from field
CONC:ANO               LIKE(CONC:ANO)                 !List box control field - type derived from field
CONC:CANT_CUOTAS_MAX   LIKE(CONC:CANT_CUOTAS_MAX)     !List box control field - type derived from field
CONC:FECHA_TOPE_PAGO   LIKE(CONC:FECHA_TOPE_PAGO)     !List box control field - type derived from field
CONC:DESCUENTO_CUOTA   LIKE(CONC:DESCUENTO_CUOTA)     !List box control field - type derived from field
CONC:IDCONTROL         LIKE(CONC:IDCONTROL)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de CONTROL_CUOTA'),AT(,,344,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Generar_couta_Anual'),SYSTEM
                       LIST,AT(8,30,328,124),USE(?Browse:1),HVSCROLL,FORMAT('47L(12)|M~GENERADO~C(0)@s2@37L(2)' & |
  '|M~ANO~C(0)@n-7@79L(2)|M~CANT CUOTAS MAX~C(0)@n-7@80L(2)|M~FECHA_TOPE_PAGO~C(0)@d17@' & |
  '64L(12)|M~DESCUENTO CUOTA~C(0)@n-7.2@30L(2)|M~ID~C(0)@n-5@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CONTROL_CUOTA')
                       BUTTON('&Ver'),AT(128,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(181,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(234,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(287,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,336,172),USE(?CurrentTab)
                         TAB('CONTROL CUOTA'),USE(?Tab:2)
                         END
                         TAB('CONTROL_CUOTA_ANO'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(291,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('ABM_CUOTA_ANUAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CONC:CANT_CUOTAS_MAX',CONC:CANT_CUOTAS_MAX)        ! Added by: BrowseBox(ABC)
  BIND('CONC:FECHA_TOPE_PAGO',CONC:FECHA_TOPE_PAGO)        ! Added by: BrowseBox(ABC)
  BIND('CONC:DESCUENTO_CUOTA',CONC:DESCUENTO_CUOTA)        ! Added by: BrowseBox(ABC)
  BIND('CONC:IDCONTROL',CONC:IDCONTROL)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONTROL_CUOTA.Open                                ! File CONTROL_CUOTA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONTROL_CUOTA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CONC:CONTROL_CUOTA_ANO)               ! Add the sort order for CONC:CONTROL_CUOTA_ANO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CONC:ANO,,BRW1)                ! Initialize the browse locator using  using key: CONC:CONTROL_CUOTA_ANO , CONC:ANO
  BRW1.AddSortOrder(,CONC:PK_CONTROL_CUOTA)                ! Add the sort order for CONC:PK_CONTROL_CUOTA for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,CONC:IDCONTROL,,BRW1)          ! Initialize the browse locator using  using key: CONC:PK_CONTROL_CUOTA , CONC:IDCONTROL
  BRW1.AddField(CONC:GENERADO,BRW1.Q.CONC:GENERADO)        ! Field CONC:GENERADO is a hot field or requires assignment from browse
  BRW1.AddField(CONC:ANO,BRW1.Q.CONC:ANO)                  ! Field CONC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(CONC:CANT_CUOTAS_MAX,BRW1.Q.CONC:CANT_CUOTAS_MAX) ! Field CONC:CANT_CUOTAS_MAX is a hot field or requires assignment from browse
  BRW1.AddField(CONC:FECHA_TOPE_PAGO,BRW1.Q.CONC:FECHA_TOPE_PAGO) ! Field CONC:FECHA_TOPE_PAGO is a hot field or requires assignment from browse
  BRW1.AddField(CONC:DESCUENTO_CUOTA,BRW1.Q.CONC:DESCUENTO_CUOTA) ! Field CONC:DESCUENTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CONC:IDCONTROL,BRW1.Q.CONC:IDCONTROL)      ! Field CONC:IDCONTROL is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_CUOTA_ANUAL',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCONTROL_CUOTA
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
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
    Relate:CONTROL_CUOTA.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_CUOTA_ANUAL',QuickWindow)           ! Save window data to non-volatile store
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
    UpdateCONTROL_CUOTA
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

