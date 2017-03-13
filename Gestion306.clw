

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION306.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Carga la factura en el pago 
!!! </summary>
CARGAR_FACTURA_PAGO PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD_RECORD  LONG                                  ! 
BRW1::View:Browse    VIEW(FACTURA)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:TOTAL)
                       PROJECT(FAC:INTERES)
                       PROJECT(FAC:DESCUENTOCOBERTURA)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:PERIODO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FAC:INTERES            LIKE(FAC:INTERES)              !List box control field - type derived from field
FAC:DESCUENTOCOBERTURA LIKE(FAC:DESCUENTOCOBERTURA)   !List box control field - type derived from field
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:IDSOCIO            LIKE(FAC:IDSOCIO)              !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !List box control field - type derived from field
FAC:PERIODO            LIKE(FAC:PERIODO)              !List box control field - type derived from field
GLO:IDSOCIO            LIKE(GLO:IDSOCIO)              !Browse hot field - type derived from global data
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the FACTURA File'),AT(,,218,198),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('CARGAR_FACTURA_PAGO'),SYSTEM
                       LIST,AT(8,30,193,119),USE(?Browse:1),HVSCROLL,FORMAT('23L(2)|M~MES~C(0)@n-3@25L(2)|M~AÑ' & |
  'O~C(0)@n-5@48D(20)|M~TOTAL~C(0)@n$-10.2@40L(1)|M~INTERES~C(0)@n$-10.2@40L(1)|M~DES. ' & |
  'COB.~C(0)@n$-10.2@39L(2)|M~IDFACT~C(0)@n-7@64L(2)|M~IDSOCIO~C(0)@n-7@84L(2)|M~ESTADO' & |
  '~@s21@44L(2)|M~PERIODO~@s11@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de FACTURA')
                       BUTTON('&Elegir'),AT(97,184,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Elegir Factura'),AT(5,177,65,20),USE(?Button3),LEFT,ICON('e.ico'),FLAT
                       SHEET,AT(4,4,205,172),USE(?CurrentTab)
                         TAB('FACTURA'),USE(?Tab:2)
                           PROMPT('Cantidad de Facturas Impagas:'),AT(11,157),USE(?Prompt2),FONT('Arial',10,,,CHARSET:ANSI)
                           PROMPT(''),AT(27,155),USE(?Prompt1)
                           STRING(@n-14),AT(135,157),USE(LOC:CANTIDAD_RECORD),FONT('Arial',10,COLOR:Red,,CHARSET:ANSI)
                         END
                       END
                       BUTTON('&Salir'),AT(161,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('CARGAR_FACTURA_PAGO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:IDSOCIO',GLO:IDSOCIO)                          ! Added by: BrowseBox(ABC)
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
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_PERIODO)              ! Add the sort order for FAC:IDX_FACTURA_PERIODO for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,FAC:PERIODO,,BRW1)             ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_PERIODO , FAC:PERIODO
  BRW1.SetFilter('(FAC:IDSOCIO = GLO:IDSOCIO AND FAC:ESTADO = '''')') ! Apply filter expression to browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:TOTAL,BRW1.Q.FAC:TOTAL)                ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(FAC:INTERES,BRW1.Q.FAC:INTERES)            ! Field FAC:INTERES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:DESCUENTOCOBERTURA,BRW1.Q.FAC:DESCUENTOCOBERTURA) ! Field FAC:DESCUENTOCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDSOCIO,BRW1.Q.FAC:IDSOCIO)            ! Field FAC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ESTADO,BRW1.Q.FAC:ESTADO)              ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:PERIODO,BRW1.Q.FAC:PERIODO)            ! Field FAC:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(GLO:IDSOCIO,BRW1.Q.GLO:IDSOCIO)            ! Field GLO:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CARGAR_FACTURA_PAGO',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    INIMgr.Update('CARGAR_FACTURA_PAGO',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    CASE ACCEPTED()
    OF ?Button3
      GLO:IDSOLICITUD = FAC:IDFACTURA
      GLO:TOTAL = 0
      
      !!! SACO PERIODO MENOS PARA CARGAR INTERES
      MES# = MONTH (TODAY())
      ANO# = YEAR(TODAY())
      PERIODO$  = FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
      !MESSAGE('PERIODO FACTURA: '&FAC:PERIODO&'  PERIODO CONTROL:  '&PERIODO$)
      
      
      
      IF FAC:PERIODO >= PERIODO$ THEN
          GLO:MONTO = FAC:TOTAL  - FAC:DESCUENTOCOBERTURA
          GLO:TOTAL = FAC:TOTAL
          !GLO:INTERES = FAC:INTERES
      ELSE
          GLO:MONTO =  FAC:TOTAL
          GLO:TOTAL = FAC:TOTAL
          GLO:INTERES = 0
      END
      
      
      
      
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button3
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
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


BRW1.ResetFromView PROCEDURE

LOC:CANTIDAD_RECORD:Cnt LONG                               ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:FACTURA.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC:CANTIDAD_RECORD:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD_RECORD = LOC:CANTIDAD_RECORD:Cnt
  PARENT.ResetFromView
  Relate:FACTURA.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

