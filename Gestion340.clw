

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION340.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION339.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONSULTORIO_EQUIPO file by CON:FK_CONSULTORIO_EQUIPO_CONS
!!! </summary>
BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTORIO_EQUIPO)
                       PROJECT(CON:IDCONSULTORIO)
                       PROJECT(CON:IDTIPOEQUIPO)
                       PROJECT(CON:OBSERVACION)
                       PROJECT(CON:FECHA)
                       PROJECT(CON:HORA)
                       JOIN(TIP5:PK_TIPO_EQUIPO,CON:IDTIPOEQUIPO)
                         PROJECT(TIP5:DESCRIPCION)
                         PROJECT(TIP5:IDTIPOEQUIPO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON:IDCONSULTORIO      LIKE(CON:IDCONSULTORIO)        !List box control field - type derived from field
CON:IDTIPOEQUIPO       LIKE(CON:IDTIPOEQUIPO)         !List box control field - type derived from field
TIP5:DESCRIPCION       LIKE(TIP5:DESCRIPCION)         !List box control field - type derived from field
CON:OBSERVACION        LIKE(CON:OBSERVACION)          !List box control field - type derived from field
CON:FECHA              LIKE(CON:FECHA)                !List box control field - type derived from field
CON:HORA               LIKE(CON:HORA)                 !List box control field - type derived from field
TIP5:IDTIPOEQUIPO      LIKE(TIP5:IDTIPOEQUIPO)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM CONSULTORIO POR DETALLE'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS'), |
  SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('31L(2)|M~IDCONS~C(0)@n-7@[32L(2)|' & |
  'M~ID~C(0)@n-7@200R(2)|M~DESCRIPCION~C(0)@s50@]|M~DETALLE~110L(2)|M~OBSERVACION~@s100' & |
  '@50L(2)|M~FECHA~C(0)@d17@80L(2)|M~HORA~C(0)@t7@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CONSULTORIO_EQUIPO'),VCR
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(9,159,49,14),USE(?Query),LEFT,ICON('q.ico'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE7                 QueryListClass                        ! QBE List Class. 
QBV7                 QueryListVisual                       ! QBE Visual Class
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
  GlobalErrors.SetProcedureName('BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP5:IDTIPOEQUIPO',TIP5:IDTIPOEQUIPO)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTORIO_EQUIPO.Open                           ! File CONSULTORIO_EQUIPO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTORIO_EQUIPO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON:FK_CONSULTORIO_EQUIPO_CONS)       ! Add the sort order for CON:FK_CONSULTORIO_EQUIPO_CONS for sort order 1
  BRW1.AddRange(CON:IDCONSULTORIO,Relate:CONSULTORIO_EQUIPO,Relate:CONSULTORIO) ! Add file relationship range limit for sort order 1
  BRW1.AddField(CON:IDCONSULTORIO,BRW1.Q.CON:IDCONSULTORIO) ! Field CON:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON:IDTIPOEQUIPO,BRW1.Q.CON:IDTIPOEQUIPO)  ! Field CON:IDTIPOEQUIPO is a hot field or requires assignment from browse
  BRW1.AddField(TIP5:DESCRIPCION,BRW1.Q.TIP5:DESCRIPCION)  ! Field TIP5:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON:OBSERVACION,BRW1.Q.CON:OBSERVACION)    ! Field CON:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(CON:FECHA,BRW1.Q.CON:FECHA)                ! Field CON:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON:HORA,BRW1.Q.CON:HORA)                  ! Field CON:HORA is a hot field or requires assignment from browse
  BRW1.AddField(TIP5:IDTIPOEQUIPO,BRW1.Q.TIP5:IDTIPOEQUIPO) ! Field TIP5:IDTIPOEQUIPO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCONSULTORIO_EQUIPO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTORIO_EQUIPO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS',QuickWindow) ! Save window data to non-volatile store
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
    UpdateCONSULTORIO_EQUIPO
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

