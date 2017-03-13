

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION218.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a CURSO Record
!!! </summary>
SelectCURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CURSO)
                       PROJECT(CUR:IDCURSO)
                       PROJECT(CUR:DESCRIPCION)
                       PROJECT(CUR:PRESENCIAL)
                       PROJECT(CUR:CANTIDAD_HORAS)
                       PROJECT(CUR:MONTO_TOTAL)
                       PROJECT(CUR:OBSERVACION)
                       PROJECT(CUR:ID_TIPO_CURSO)
                       PROJECT(CUR:CANTIDAD)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CUR:IDCURSO            LIKE(CUR:IDCURSO)              !List box control field - type derived from field
CUR:DESCRIPCION        LIKE(CUR:DESCRIPCION)          !List box control field - type derived from field
CUR:PRESENCIAL         LIKE(CUR:PRESENCIAL)           !List box control field - type derived from field
CUR:CANTIDAD_HORAS     LIKE(CUR:CANTIDAD_HORAS)       !List box control field - type derived from field
CUR:MONTO_TOTAL        LIKE(CUR:MONTO_TOTAL)          !List box control field - type derived from field
CUR:OBSERVACION        LIKE(CUR:OBSERVACION)          !List box control field - type derived from field
CUR:ID_TIPO_CURSO      LIKE(CUR:ID_TIPO_CURSO)        !List box control field - type derived from field
CUR:CANTIDAD           LIKE(CUR:CANTIDAD)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a CURSO Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectCURSO'),SYSTEM
                       LIST,AT(8,39,342,115),USE(?Browse:1),HVSCROLL,FORMAT('43L(2)|M~Nº~C(0)@n-7@206L(2)|M~DE' & |
  'SCRIPCION~@s50@52L(2)|M~PRESENCIAL~@s2@81L(12)|M~CANTIDAD HORAS~C(0)@n-7.2@69L(1)|M~' & |
  'MONTO TOTAL~C(0)@n$-10.2@153L(2)|M~OBSERVACION~@s100@64R(2)|M~ID TIPO CURSO~C(0)@n-1' & |
  '4@64L(2)|M~CANTIDAD~C(0)@n-5@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de CURSO')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('Id Curso'),USE(?Tab:1)
                         END
                         TAB('Descripción'),USE(?Tab:2)
                           PROMPT('DESCRIPCION:'),AT(8,25),USE(?CUR:DESCRIPCION:Prompt)
                           ENTRY(@s50),AT(60,25,148,10),USE(CUR:DESCRIPCION)
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
BRW1::Sort1:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectCURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CUR:IDCURSO',CUR:IDCURSO)                          ! Added by: BrowseBox(ABC)
  BIND('CUR:CANTIDAD_HORAS',CUR:CANTIDAD_HORAS)            ! Added by: BrowseBox(ABC)
  BIND('CUR:MONTO_TOTAL',CUR:MONTO_TOTAL)                  ! Added by: BrowseBox(ABC)
  BIND('CUR:ID_TIPO_CURSO',CUR:ID_TIPO_CURSO)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CUR:IDX_CURSO_DESCRIPCION)            ! Add the sort order for CUR:IDX_CURSO_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?CUR:DESCRIPCION,CUR:DESCRIPCION,,BRW1) ! Initialize the browse locator using ?CUR:DESCRIPCION using key: CUR:IDX_CURSO_DESCRIPCION , CUR:DESCRIPCION
  BRW1.AddSortOrder(,CUR:PK_CURSO)                         ! Add the sort order for CUR:PK_CURSO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,CUR:IDCURSO,,BRW1)             ! Initialize the browse locator using  using key: CUR:PK_CURSO , CUR:IDCURSO
  BRW1.AddField(CUR:IDCURSO,BRW1.Q.CUR:IDCURSO)            ! Field CUR:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CUR:DESCRIPCION,BRW1.Q.CUR:DESCRIPCION)    ! Field CUR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:PRESENCIAL,BRW1.Q.CUR:PRESENCIAL)      ! Field CUR:PRESENCIAL is a hot field or requires assignment from browse
  BRW1.AddField(CUR:CANTIDAD_HORAS,BRW1.Q.CUR:CANTIDAD_HORAS) ! Field CUR:CANTIDAD_HORAS is a hot field or requires assignment from browse
  BRW1.AddField(CUR:MONTO_TOTAL,BRW1.Q.CUR:MONTO_TOTAL)    ! Field CUR:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CUR:OBSERVACION,BRW1.Q.CUR:OBSERVACION)    ! Field CUR:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:ID_TIPO_CURSO,BRW1.Q.CUR:ID_TIPO_CURSO) ! Field CUR:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(CUR:CANTIDAD,BRW1.Q.CUR:CANTIDAD)          ! Field CUR:CANTIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectCURSO',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectCURSO',QuickWindow)               ! Save window data to non-volatile store
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

