

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION240.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a FACTURA Record
!!! </summary>
SelectFACTURA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(FACTURA)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                       PROJECT(FAC:IDUSUARIO)
                       PROJECT(FAC:MONTOCOBERTURA)
                       PROJECT(FAC:INTERES)
                       PROJECT(FAC:TOTAL)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:PERIODO)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:FECHA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:IDSOCIO            LIKE(FAC:IDSOCIO)              !List box control field - type derived from field
FAC:IDUSUARIO          LIKE(FAC:IDUSUARIO)            !List box control field - type derived from field
FAC:MONTOCOBERTURA     LIKE(FAC:MONTOCOBERTURA)       !List box control field - type derived from field
FAC:INTERES            LIKE(FAC:INTERES)              !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:PERIODO            LIKE(FAC:PERIODO)              !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !Browse key field - type derived from field
FAC:FECHA              LIKE(FAC:FECHA)                !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a FACTURA Record'),AT(,,358,208),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectFACTURA'),SYSTEM
                       LIST,AT(8,40,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDFACTURA~C(0)@n-14@64R(' & |
  '2)|M~IDSOCIO~C(0)@n-14@64R(2)|M~IDUSUARIO~C(0)@n-14@60D(12)|M~MONTOCOBERTURA~C(0)@n-' & |
  '10.2@48D(16)|M~INTERES~C(0)@n-10.2@48D(20)|M~TOTAL~C(0)@n-10.2@64R(2)|M~MES~C(0)@n-1' & |
  '4@64R(2)|M~ANO~C(0)@n-14@48L(2)|M~PERIODO~L(2)@s11@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de FACTURA')
                       BUTTON('&Elegir'),AT(301,168,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,182),USE(?CurrentTab)
                         TAB('PK_FACTURA'),USE(?Tab:2)
                         END
                         TAB('FK_FACTURA_SOCIO'),USE(?Tab:3)
                         END
                         TAB('FK_FACTURA_USUARIO'),USE(?Tab:4)
                         END
                         TAB('IDX_FACTURA_ANO'),USE(?Tab:5)
                         END
                         TAB('IDX_FACTURA_ESTADO'),USE(?Tab:6)
                         END
                         TAB('IDX_FACTURA_FECHA'),USE(?Tab:7)
                         END
                         TAB('IDX_FACTURA_MES'),USE(?Tab:8)
                         END
                         TAB('IDX_FACTURA_PERIODO'),USE(?Tab:9)
                         END
                         TAB('IDX_FACTURA_TOTAL'),USE(?Tab:10)
                         END
                       END
                       BUTTON('&Salir'),AT(305,190,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
BRW1::Sort8:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 9
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
  GlobalErrors.SetProcedureName('SelectFACTURA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FAC:IDFACTURA',FAC:IDFACTURA)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:FACTURA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,FAC:FK_FACTURA_SOCIO)                 ! Add the sort order for FAC:FK_FACTURA_SOCIO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,FAC:IDSOCIO,,BRW1)             ! Initialize the browse locator using  using key: FAC:FK_FACTURA_SOCIO , FAC:IDSOCIO
  BRW1.AddSortOrder(,FAC:FK_FACTURA_USUARIO)               ! Add the sort order for FAC:FK_FACTURA_USUARIO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,FAC:IDUSUARIO,,BRW1)           ! Initialize the browse locator using  using key: FAC:FK_FACTURA_USUARIO , FAC:IDUSUARIO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_ANO)                  ! Add the sort order for FAC:IDX_FACTURA_ANO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,FAC:ANO,,BRW1)                 ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_ANO , FAC:ANO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_ESTADO)               ! Add the sort order for FAC:IDX_FACTURA_ESTADO for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,FAC:ESTADO,,BRW1)              ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_ESTADO , FAC:ESTADO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_FECHA)                ! Add the sort order for FAC:IDX_FACTURA_FECHA for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,FAC:FECHA,,BRW1)               ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_FECHA , FAC:FECHA
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_MES)                  ! Add the sort order for FAC:IDX_FACTURA_MES for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,FAC:MES,,BRW1)                 ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_MES , FAC:MES
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_PERIODO)              ! Add the sort order for FAC:IDX_FACTURA_PERIODO for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,FAC:PERIODO,,BRW1)             ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_PERIODO , FAC:PERIODO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_TOTAL)                ! Add the sort order for FAC:IDX_FACTURA_TOTAL for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,FAC:TOTAL,,BRW1)               ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_TOTAL , FAC:TOTAL
  BRW1.AddSortOrder(,FAC:PK_FACTURA)                       ! Add the sort order for FAC:PK_FACTURA for sort order 9
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort0:Locator.Init(,FAC:IDFACTURA,,BRW1)           ! Initialize the browse locator using  using key: FAC:PK_FACTURA , FAC:IDFACTURA
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDSOCIO,BRW1.Q.FAC:IDSOCIO)            ! Field FAC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDUSUARIO,BRW1.Q.FAC:IDUSUARIO)        ! Field FAC:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MONTOCOBERTURA,BRW1.Q.FAC:MONTOCOBERTURA) ! Field FAC:MONTOCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:INTERES,BRW1.Q.FAC:INTERES)            ! Field FAC:INTERES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:TOTAL,BRW1.Q.FAC:TOTAL)                ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:PERIODO,BRW1.Q.FAC:PERIODO)            ! Field FAC:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ESTADO,BRW1.Q.FAC:ESTADO)              ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:FECHA,BRW1.Q.FAC:FECHA)                ! Field FAC:FECHA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectFACTURA',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectFACTURA',QuickWindow)             ! Save window data to non-volatile store
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
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSE
    RETURN SELF.SetSort(9,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

