

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION269.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONVENIO_DETALLE File
!!! </summary>
SelectCoutaConvenio PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD_CUOTAS  BYTE                                  ! 
BRW1::View:Browse    VIEW(CONVENIO_DETALLE)
                       PROJECT(CON5:NRO_CUOTA)
                       PROJECT(CON5:MONTO_CUOTA)
                       PROJECT(CON5:MES)
                       PROJECT(CON5:ANO)
                       PROJECT(CON5:IDSOLICITUD)
                       PROJECT(CON5:IDSOCIO)
                       PROJECT(CON5:CANCELADO)
                       PROJECT(CON5:PERIODO)
                       PROJECT(CON5:OBSERVACION)
                       JOIN(CON4:PK_CONVENIO,CON5:IDSOLICITUD)
                         PROJECT(CON4:IDSOLICITUD)
                         PROJECT(CON4:IDTIPO_CONVENIO)
                         JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                           PROJECT(TIP:DESCRIPCION)
                           PROJECT(TIP:IDTIPO_CONVENIO)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON5:NRO_CUOTA         LIKE(CON5:NRO_CUOTA)           !List box control field - type derived from field
CON5:MONTO_CUOTA       LIKE(CON5:MONTO_CUOTA)         !List box control field - type derived from field
CON5:MES               LIKE(CON5:MES)                 !List box control field - type derived from field
CON5:ANO               LIKE(CON5:ANO)                 !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
CON5:IDSOLICITUD       LIKE(CON5:IDSOLICITUD)         !List box control field - type derived from field
CON5:IDSOCIO           LIKE(CON5:IDSOCIO)             !List box control field - type derived from field
CON5:CANCELADO         LIKE(CON5:CANCELADO)           !List box control field - type derived from field
CON5:PERIODO           LIKE(CON5:PERIODO)             !List box control field - type derived from field
CON5:OBSERVACION       LIKE(CON5:OBSERVACION)         !List box control field - type derived from field
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !Related join file key field - type derived from field
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CONVENIO_DETALLE File'),AT(,,307,232),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectCoutaConvenio'),SYSTEM
                       LIST,AT(8,28,291,145),USE(?Browse:1),HVSCROLL,FORMAT('51L(2)|M~NRO CUOTA~C(0)@n-7@68L(1' & |
  ')|M~MONTO CUOTA~C(0)@n-10.2@23L(2)|M~MES~@s2@20L(2)|M~ANO~@s4@[200L(2)|M~TIPO CONVEN' & |
  'IO~C(0)@s50@47L(2)|M~IDSOLICITUD~C(0)@n-7@]|M~CONVENIO~64L(2)|M~IDSOCIO~C(0)@n-7@50L' & |
  '(2)|M~CANCELADO~C(0)@s2@56L(2)|M~PERIODO~C(0)@n-14@200L(2)|M~OBSERVACION~C(0)@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de CONVENIO_DETALLE')
                       BUTTON('Elegir'),AT(7,209,54,16),USE(?Button2),LEFT,ICON('e.ico'),FLAT
                       SHEET,AT(4,4,300,202),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                           PROMPT('Cantidad de Cuotas Adeudadas:'),AT(12,183),USE(?Prompt1)
                           STRING(@n3),AT(115,183),USE(LOC:CANTIDAD_CUOTAS)
                         END
                       END
                       BUTTON('&Salir'),AT(145,209,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Salir'),TIP('Salir')
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
  GlobalErrors.SetProcedureName('SelectCoutaConvenio')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON5:NRO_CUOTA',CON5:NRO_CUOTA)                    ! Added by: BrowseBox(ABC)
  BIND('CON5:MONTO_CUOTA',CON5:MONTO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONVENIO_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON5:IDX_CONVENIO_DETALLE_SOCIO)      ! Add the sort order for CON5:IDX_CONVENIO_DETALLE_SOCIO for sort order 1
  BRW1.AddRange(CON5:IDSOCIO,GLO:IDSOCIO)                  ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CON5:PERIODO,,BRW1)            ! Initialize the browse locator using  using key: CON5:IDX_CONVENIO_DETALLE_SOCIO , CON5:PERIODO
  BRW1.AppendOrder('CON5:PERIODO')                         ! Append an additional sort order
  BRW1.SetFilter('( CON5:CANCELADO <<> ''SI'')')           ! Apply filter expression to browse
  BRW1.AddField(CON5:NRO_CUOTA,BRW1.Q.CON5:NRO_CUOTA)      ! Field CON5:NRO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CON5:MONTO_CUOTA,BRW1.Q.CON5:MONTO_CUOTA)  ! Field CON5:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CON5:MES,BRW1.Q.CON5:MES)                  ! Field CON5:MES is a hot field or requires assignment from browse
  BRW1.AddField(CON5:ANO,BRW1.Q.CON5:ANO)                  ! Field CON5:ANO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON5:IDSOLICITUD,BRW1.Q.CON5:IDSOLICITUD)  ! Field CON5:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(CON5:IDSOCIO,BRW1.Q.CON5:IDSOCIO)          ! Field CON5:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CON5:CANCELADO,BRW1.Q.CON5:CANCELADO)      ! Field CON5:CANCELADO is a hot field or requires assignment from browse
  BRW1.AddField(CON5:PERIODO,BRW1.Q.CON5:PERIODO)          ! Field CON5:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(CON5:OBSERVACION,BRW1.Q.CON5:OBSERVACION)  ! Field CON5:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectCoutaConvenio',QuickWindow)          ! Restore window settings from non-volatile store
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
    Relate:CONVENIO_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectCoutaConvenio',QuickWindow)       ! Save window data to non-volatile store
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
    OF ?Button2
      GLO:NRO_CUOTA    = CON5:NRO_CUOTA
      GLO:IDSOLICITUD  = CON5:IDSOLICITUD
      GLO:MONTO        = CON5:MONTO_CUOTA
      GLO:FECHA_LARGO  = CON5:OBSERVACION
      
      
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
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


BRW1.ResetFromView PROCEDURE

LOC:CANTIDAD_CUOTAS:Cnt LONG                               ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:CONVENIO_DETALLE.SetQuickScan(1)
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
    LOC:CANTIDAD_CUOTAS:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD_CUOTAS = LOC:CANTIDAD_CUOTAS:Cnt
  PARENT.ResetFromView
  Relate:CONVENIO_DETALLE.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

