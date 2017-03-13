

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION138.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION137.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION141.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION143.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION146.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the OBRA_SOCIAL File
!!! </summary>
ABM_OBRAS_SOCIALES PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(OBRA_SOCIAL)
                       PROJECT(OBR:IDOS)
                       PROJECT(OBR:NOMPRE_CORTO)
                       PROJECT(OBR:NOMBRE)
                       PROJECT(OBR:DIRECCION)
                       PROJECT(OBR:TELEFONO)
                       PROJECT(OBR:CUIT)
                       PROJECT(OBR:EMAIL)
                       PROJECT(OBR:PRONTO_PAGO)
                       PROJECT(OBR:FECHA_BAJA)
                       PROJECT(OBR:OBSERVACION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
OBR:IDOS               LIKE(OBR:IDOS)                 !List box control field - type derived from field
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
OBR:NOMBRE             LIKE(OBR:NOMBRE)               !List box control field - type derived from field
OBR:DIRECCION          LIKE(OBR:DIRECCION)            !List box control field - type derived from field
OBR:TELEFONO           LIKE(OBR:TELEFONO)             !List box control field - type derived from field
OBR:CUIT               LIKE(OBR:CUIT)                 !List box control field - type derived from field
OBR:EMAIL              LIKE(OBR:EMAIL)                !List box control field - type derived from field
OBR:PRONTO_PAGO        LIKE(OBR:PRONTO_PAGO)          !List box control field - type derived from field
OBR:FECHA_BAJA         LIKE(OBR:FECHA_BAJA)           !List box control field - type derived from field
OBR:OBSERVACION        LIKE(OBR:OBSERVACION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Archivo Obras Sociales'),AT(,,522,316),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ABM_OBRAS_SOCIALES'),SYSTEM
                       LIST,AT(7,39,499,202),USE(?Browse:1),HVSCROLL,FORMAT('36L(2)|M~IDOS~C(0)@n-7@80L(2)|M~S' & |
  'IGLAS~@s30@147L(2)|M~NOMBRE~@s50@80L(2)|M~DIRECCION~@s50@80L(2)|M~TELEFONO~@s30@64R(' & |
  '2)|M~CUIT~C(0)@n-14@80L(2)|M~EMAIL~@s50@48L(2)|M~PRONTO PAGO~@s2@40L(2)|M~FECHA BAJA' & |
  '~@d17@404L(2)|M~OBSERVACION~@s101@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de ' & |
  'OBRA_SOCIAL')
                       BUTTON('&Elegir'),AT(249,258,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(301,258,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(355,258,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(407,258,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(461,258,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('Nomenclador por Obra Social'),AT(256,282,124,14),USE(?Button9),LEFT,ICON(ICON:Copy), |
  FLAT
                       SHEET,AT(3,0,514,278),USE(?CurrentTab)
                         TAB('SIGLAS'),USE(?Tab:1)
                           PROMPT('NOMPRE CORTO:'),AT(9,20),USE(?NOMPRE_CORTO:Prompt)
                           ENTRY(@s30),AT(75,20,239,10),USE(OBR:NOMPRE_CORTO)
                         END
                         TAB('NOMBRE OS'),USE(?Tab:2)
                           PROMPT('NOMBRE:'),AT(7,18),USE(?NOMBRE:Prompt)
                           ENTRY(@s50),AT(44,17,239,10),USE(OBR:NOMBRE),UPR
                         END
                         TAB('Nº OS'),USE(?Tab:3)
                           PROMPT('IDOS:'),AT(6,21),USE(?IDOS:Prompt)
                           ENTRY(@n-14),AT(34,20,43,10),USE(OBR:IDOS),REQ
                         END
                       END
                       BUTTON('Planes por Obra Social'),AT(141,282,111,14),USE(?BrowseOS_PLANES),LEFT,ICON(ICON:Application), |
  FLAT,MSG('Ver Hijo'),TIP('Ver Hijio')
                       BUTTON('Socios por Obra Social'),AT(2,282,113,14),USE(?BrowseSOCIOSXOS),LEFT,ICON('SSEC_USR.ICO'), |
  FLAT,MSG('Ver Hijo'),TIP('Ver Hijio')
                       BUTTON('&Salir'),AT(473,297,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('ABM_OBRAS_SOCIALES')
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
  BRW1.AddField(OBR:IDOS,BRW1.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMPRE_CORTO,BRW1.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMBRE,BRW1.Q.OBR:NOMBRE)              ! Field OBR:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(OBR:DIRECCION,BRW1.Q.OBR:DIRECCION)        ! Field OBR:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(OBR:TELEFONO,BRW1.Q.OBR:TELEFONO)          ! Field OBR:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:CUIT,BRW1.Q.OBR:CUIT)                  ! Field OBR:CUIT is a hot field or requires assignment from browse
  BRW1.AddField(OBR:EMAIL,BRW1.Q.OBR:EMAIL)                ! Field OBR:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(OBR:PRONTO_PAGO,BRW1.Q.OBR:PRONTO_PAGO)    ! Field OBR:PRONTO_PAGO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:FECHA_BAJA,BRW1.Q.OBR:FECHA_BAJA)      ! Field OBR:FECHA_BAJA is a hot field or requires assignment from browse
  BRW1.AddField(OBR:OBSERVACION,BRW1.Q.OBR:OBSERVACION)    ! Field OBR:OBSERVACION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_OBRAS_SOCIALES',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateOBRA_SOCIAL
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
    INIMgr.Update('ABM_OBRAS_SOCIALES',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateOBRA_SOCIAL
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
    OF ?Button9
      ThisWindow.Update()
      NomencladorXOS()
      ThisWindow.Reset
    OF ?BrowseOS_PLANES
      ThisWindow.Update()
      BrowseOS_PLANESByOS_:FK_OS_PLANES_OS()
      ThisWindow.Reset
    OF ?BrowseSOCIOSXOS
      ThisWindow.Update()
      BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS()
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
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

