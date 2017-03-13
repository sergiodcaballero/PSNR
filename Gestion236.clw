

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION236.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION235.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO_MODULOS file by CUR2:FK_CURSO_MODULOS_CURSO
!!! </summary>
BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CURSO_MODULOS)
                       PROJECT(CUR2:NUMERO_MODULO)
                       PROJECT(CUR2:DESCRIPCION)
                       PROJECT(CUR2:FECHA_INICIO)
                       PROJECT(CUR2:FECHA_FIN)
                       PROJECT(CUR2:CANTIDAD_HORAS)
                       PROJECT(CUR2:EXAMEN)
                       PROJECT(CUR2:MONTO)
                       PROJECT(CUR2:IDCURSO)
                       PROJECT(CUR2:ID_MODULO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CUR2:NUMERO_MODULO     LIKE(CUR2:NUMERO_MODULO)       !List box control field - type derived from field
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CUR2:FECHA_INICIO      LIKE(CUR2:FECHA_INICIO)        !List box control field - type derived from field
CUR2:FECHA_FIN         LIKE(CUR2:FECHA_FIN)           !List box control field - type derived from field
CUR2:CANTIDAD_HORAS    LIKE(CUR2:CANTIDAD_HORAS)      !List box control field - type derived from field
CUR2:EXAMEN            LIKE(CUR2:EXAMEN)              !List box control field - type derived from field
CUR2:MONTO             LIKE(CUR2:MONTO)               !List box control field - type derived from field
CUR2:IDCURSO           LIKE(CUR2:IDCURSO)             !List box control field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Carga Modulo por Curso'),AT(,,423,283),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO'),SYSTEM
                       STRING(@s50),AT(1,2,423,17),USE(CUR:DESCRIPCION),FONT(,14,,FONT:bold),CENTER
                       LIST,AT(5,21,414,202),USE(?Browse:1),HVSCROLL,FORMAT('18L(2)|M~Nº~R@n-3@205L(2)|M~DESCR' & |
  'IPCION~@s50@80R(2)|M~FECHA INICIO~C(0)@d17@52L(2)|M~FECHA FIN~C(0)@d17@37L(2)|M~CANT' & |
  ' HS~C(0)@n-7@28L(2)|M~EXAMEN~@s2@36D(14)|M~MONTO~C(0)@n-7.2@64R(2)|M~IDCURSO~C(0)@n-' & |
  '14@40R(2)|M~MODULO~C(0)@n-7@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de CURSO_MODULOS')
                       BUTTON('&Ver'),AT(207,234,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(261,234,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(313,234,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(367,234,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('&Salir'),AT(374,265,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
                     END

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
  GlobalErrors.SetProcedureName('BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR:DESCRIPCION
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CUR2:NUMERO_MODULO',CUR2:NUMERO_MODULO)            ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_INICIO',CUR2:FECHA_INICIO)              ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_FIN',CUR2:FECHA_FIN)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:CANTIDAD_HORAS',CUR2:CANTIDAD_HORAS)          ! Added by: BrowseBox(ABC)
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_MODULOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CUR2:FK_CURSO_MODULOS_CURSO)          ! Add the sort order for CUR2:FK_CURSO_MODULOS_CURSO for sort order 1
  BRW1.AddRange(CUR2:IDCURSO,Relate:CURSO_MODULOS,Relate:CURSO) ! Add file relationship range limit for sort order 1
  BRW1.AddField(CUR2:NUMERO_MODULO,BRW1.Q.CUR2:NUMERO_MODULO) ! Field CUR2:NUMERO_MODULO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:DESCRIPCION,BRW1.Q.CUR2:DESCRIPCION)  ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_INICIO,BRW1.Q.CUR2:FECHA_INICIO) ! Field CUR2:FECHA_INICIO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_FIN,BRW1.Q.CUR2:FECHA_FIN)      ! Field CUR2:FECHA_FIN is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:CANTIDAD_HORAS,BRW1.Q.CUR2:CANTIDAD_HORAS) ! Field CUR2:CANTIDAD_HORAS is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:EXAMEN,BRW1.Q.CUR2:EXAMEN)            ! Field CUR2:EXAMEN is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:MONTO,BRW1.Q.CUR2:MONTO)              ! Field CUR2:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:IDCURSO,BRW1.Q.CUR2:IDCURSO)          ! Field CUR2:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:ID_MODULO,BRW1.Q.CUR2:ID_MODULO)      ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCURSO_MODULOS
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
    Relate:CURSO_MODULOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCURSO_MODULOSByCUR2:FK_CURSO_MODULOS_CURSO',QuickWindow) ! Save window data to non-volatile store
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
    UpdateCURSO_MODULOS
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

