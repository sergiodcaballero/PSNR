

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION265.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION264.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONVENIO
!!! </summary>
UpdateCONVENIO1 PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
BRW10::View:Browse   VIEW(CONVENIO_DETALLE)
                       PROJECT(CON5:NRO_CUOTA)
                       PROJECT(CON5:MES)
                       PROJECT(CON5:ANO)
                       PROJECT(CON5:MONTO_CUOTA)
                       PROJECT(CON5:DEUDA_INICIAL)
                       PROJECT(CON5:CANCELADO)
                       PROJECT(CON5:IDSOLICITUD)
                       PROJECT(CON5:PERIODO)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
CON5:NRO_CUOTA         LIKE(CON5:NRO_CUOTA)           !List box control field - type derived from field
CON5:NRO_CUOTA_Icon    LONG                           !Entry's icon ID
CON5:MES               LIKE(CON5:MES)                 !List box control field - type derived from field
CON5:ANO               LIKE(CON5:ANO)                 !List box control field - type derived from field
CON5:MONTO_CUOTA       LIKE(CON5:MONTO_CUOTA)         !List box control field - type derived from field
CON5:DEUDA_INICIAL     LIKE(CON5:DEUDA_INICIAL)       !List box control field - type derived from field
CON5:CANCELADO         LIKE(CON5:CANCELADO)           !List box control field - type derived from field
CON5:IDSOLICITUD       LIKE(CON5:IDSOLICITUD)         !List box control field - type derived from field
CON5:PERIODO           LIKE(CON5:PERIODO)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::CON4:Record LIKE(CON4:RECORD),THREAD
QuickWindow          WINDOW('Cancelar  CONVENIO'),AT(,,356,265),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('UpdateCONVENIO'),SYSTEM
                       PROMPT('IDSOLICITUD:'),AT(3,5),USE(?CON4:IDSOLICITUD:Prompt)
                       ENTRY(@n-14),AT(53,4,43,10),USE(CON4:IDSOLICITUD),DISABLE,REQ
                       GROUP('Aprobación'),AT(1,67,353,21),USE(?Group1),BOXED
                         PROMPT('OBSERVACION:'),AT(4,75),USE(?CON4:OBSERVACION:Prompt),TRN
                         ENTRY(@s100),AT(70,75,246,10),USE(CON4:OBSERVACION),DISABLE
                       END
                       GROUP('Montos '),AT(2,88,353,45),USE(?Group4),BOXED
                         PROMPT('MONTO TOTAL:'),AT(4,100),USE(?CON4:MONTO_TOTAL:Prompt)
                         ENTRY(@n-10.2),AT(63,100,43,10),USE(CON4:MONTO_TOTAL),DISABLE
                         PROMPT('CANTIDAD CUOTAS:'),AT(114,100),USE(?CON4:CANTIDAD_CUOTAS:Prompt)
                         ENTRY(@n-14),AT(189,100,43,10),USE(CON4:CANTIDAD_CUOTAS),DISABLE
                         PROMPT('MONTO CUOTA:'),AT(240,100),USE(?CON4:MONTO_CUOTA:Prompt)
                         ENTRY(@n-10.2),AT(301,100,43,10),USE(CON4:MONTO_CUOTA),DISABLE
                         PROMPT('GASTOS ADMINISTRATIVOS:'),AT(5,116),USE(?CON4:GASTOS_ADMINISTRATIVOS:Prompt)
                         ENTRY(@n-10.2),AT(105,116,43,10),USE(CON4:GASTOS_ADMINISTRATIVOS),DISABLE
                       END
                       GROUP('Detalle del Convenio'),AT(1,136,353,107),USE(?Group5),BOXED
                         LIST,AT(8,148,343,74),USE(?List),HVSCROLL,FORMAT('49L(2)|MI~NRO CUOTA~@n-7@21L(2)|M~MES' & |
  '~@s2@24L(2)|M~ANO~@s4@61L(2)|M~MONTO CUOTA~@n-10.2@59L(2)|M~DEUDA INICIAL~@n-10.2@49' & |
  'L(2)|M~CANCELADO~@s2@56L(2)|M~IDSOLICITUD~@n-7@56L(2)|M~PERIODO~@n-14@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records'),VCR
                         STRING(@n$-10.2),AT(67,226),USE(CON4:MONTO_BONIFICADO)
                         PROMPT('Saldo Adeudado:'),AT(7,226),USE(?Prompt14)
                       END
                       BUTTON('&Cancelar Convenio'),AT(3,245,95,18),USE(?OK),LEFT,ICON('b.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(299,250,55,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       GROUP('Convenio'),AT(1,17,355,49),USE(?Group3),BOXED
                         PROMPT('IDSOCIO:'),AT(3,25),USE(?CON4:IDSOCIO:Prompt),TRN
                         ENTRY(@n-14),AT(72,25,43,10),USE(CON4:IDSOCIO),DISABLE
                         STRING(@s30),AT(119,25),USE(SOC:NOMBRE)
                         PROMPT('MATRICULA:'),AT(260,25),USE(?Prompt10)
                         STRING(@n-7),AT(303,25),USE(SOC:MATRICULA)
                         STRING(@s50),AT(120,45),USE(TIP:DESCRIPCION)
                         PROMPT('IDTIPO CONVENIO:'),AT(3,45),USE(?CON4:IDTIPO_CONVENIO:Prompt),TRN
                         ENTRY(@n-14),AT(71,45,43,10),USE(CON4:IDTIPO_CONVENIO),DISABLE
                       END
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateCONVENIO1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CON4:IDSOLICITUD:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON5:NRO_CUOTA',CON5:NRO_CUOTA)                    ! Added by: BrowseBox(ABC)
  BIND('CON5:MONTO_CUOTA',CON5:MONTO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('CON5:DEUDA_INICIAL',CON5:DEUDA_INICIAL)            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON4:Record,History::CON4:Record)
  SELF.AddHistoryField(?CON4:IDSOLICITUD,1)
  SELF.AddHistoryField(?CON4:OBSERVACION,22)
  SELF.AddHistoryField(?CON4:MONTO_TOTAL,4)
  SELF.AddHistoryField(?CON4:CANTIDAD_CUOTAS,5)
  SELF.AddHistoryField(?CON4:MONTO_CUOTA,6)
  SELF.AddHistoryField(?CON4:GASTOS_ADMINISTRATIVOS,9)
  SELF.AddHistoryField(?CON4:MONTO_BONIFICADO,7)
  SELF.AddHistoryField(?CON4:IDSOCIO,2)
  SELF.AddHistoryField(?CON4:IDTIPO_CONVENIO,3)
  SELF.AddUpdateFile(Access:CONVENIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_CONVENIO.Open                                ! File TIPO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONVENIO
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:CONVENIO_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?CON4:IDSOLICITUD{PROP:ReadOnly} = True
    ?CON4:OBSERVACION{PROP:ReadOnly} = True
    ?CON4:MONTO_TOTAL{PROP:ReadOnly} = True
    ?CON4:CANTIDAD_CUOTAS{PROP:ReadOnly} = True
    ?CON4:MONTO_CUOTA{PROP:ReadOnly} = True
    ?CON4:GASTOS_ADMINISTRATIVOS{PROP:ReadOnly} = True
    ?CON4:IDSOCIO{PROP:ReadOnly} = True
    ?CON4:IDTIPO_CONVENIO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW10.Q &= Queue:Browse
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,CON5:FK_CONVENIO_DETALLE)            ! Add the sort order for CON5:FK_CONVENIO_DETALLE for sort order 1
  BRW10.AddRange(CON5:IDSOLICITUD,Relate:CONVENIO_DETALLE,Relate:CONVENIO) ! Add file relationship range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,CON5:IDSOLICITUD,,BRW10)      ! Initialize the browse locator using  using key: CON5:FK_CONVENIO_DETALLE , CON5:IDSOLICITUD
  BRW10.AppendOrder('CON5:PERIODO')                        ! Append an additional sort order
  BRW10.SetFilter('(CON5:CANCELADO = '''')')               ! Apply filter expression to browse
  ?List{PROP:IconList,1} = '~CANCEL.ICO'
  BRW10.AddField(CON5:NRO_CUOTA,BRW10.Q.CON5:NRO_CUOTA)    ! Field CON5:NRO_CUOTA is a hot field or requires assignment from browse
  BRW10.AddField(CON5:MES,BRW10.Q.CON5:MES)                ! Field CON5:MES is a hot field or requires assignment from browse
  BRW10.AddField(CON5:ANO,BRW10.Q.CON5:ANO)                ! Field CON5:ANO is a hot field or requires assignment from browse
  BRW10.AddField(CON5:MONTO_CUOTA,BRW10.Q.CON5:MONTO_CUOTA) ! Field CON5:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW10.AddField(CON5:DEUDA_INICIAL,BRW10.Q.CON5:DEUDA_INICIAL) ! Field CON5:DEUDA_INICIAL is a hot field or requires assignment from browse
  BRW10.AddField(CON5:CANCELADO,BRW10.Q.CON5:CANCELADO)    ! Field CON5:CANCELADO is a hot field or requires assignment from browse
  BRW10.AddField(CON5:IDSOLICITUD,BRW10.Q.CON5:IDSOLICITUD) ! Field CON5:IDSOLICITUD is a hot field or requires assignment from browse
  BRW10.AddField(CON5:PERIODO,BRW10.Q.CON5:PERIODO)        ! Field CON5:PERIODO is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateCONVENIO1',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
    Relate:CONVENIO_DETALLE.Close
    Relate:SOCIOS.Close
    Relate:TIPO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCONVENIO1',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO               ! Assign linking field value
  Access:TIPO_CONVENIO.Fetch(TIP:PK_T_CONVENIO)
  SOC:IDSOCIO = CON4:IDSOCIO                               ! Assign linking field value
  Access:SOCIOS.Fetch(SOC:PK_SOCIOS)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    CASE ACCEPTED()
    OF ?OK
      CON4:CANCELADO = 'SI'
      CON4:FECHA_CANCELADO = TODAY()
      
      !!! LOOP CONVENIO DETALLE
      CON5:IDSOLICITUD = CON4:IDSOLICITUD
      Set(CON5:FK_CONVENIO_DETALLE,CON5:FK_CONVENIO_DETALLE)
      LOOP
          IF ACCESS:CONVENIO_DETALLE.NEXT() THEN BREAK.
          IF CON5:IDSOLICITUD <> CON4:IDSOLICITUD THEN BREAK.
          IF CON5:CANCELADO = '' THEN
              CON5:CANCELADO = 'SI'
              CON5:OBSERVACION = 'CANCELACION ANTICIADA'
              PUT(CONVENIO_DETALLE)
          END
      END !LOOP
      
       
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CON4:IDSOCIO
      IF Access:CONVENIO.TryValidateField(2)               ! Attempt to validate CON4:IDSOCIO in CONVENIO
        SELECT(?CON4:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON4:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON4:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CON4:IDTIPO_CONVENIO
      IF Access:CONVENIO.TryValidateField(3)               ! Attempt to validate CON4:IDTIPO_CONVENIO in CONVENIO
        SELECT(?CON4:IDTIPO_CONVENIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON4:IDTIPO_CONVENIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON4:IDTIPO_CONVENIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
  !! IMPRIMO RECIBO
  GLO:IDSOLICITUD = CON4:IDSOLICITUD
  IMPRIMIR_RECIBO_CANCELACION
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW10.ResetFromView PROCEDURE

CON4:MONTO_BONIFICADO:Sum REAL                             ! Sum variable for browse totals
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
    CON4:MONTO_BONIFICADO:Sum += CON5:MONTO_CUOTA
  END
  SELF.View{PROP:IPRequestCount} = 0
  CON4:MONTO_BONIFICADO = CON4:MONTO_BONIFICADO:Sum
  PARENT.ResetFromView
  Relate:CONVENIO_DETALLE.SetQuickScan(0)
  SETCURSOR()


BRW10.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (CON5:CANCELADO = 'SI')
    SELF.Q.CON5:NRO_CUOTA_Icon = 1                         ! Set icon from icon list
  ELSE
    SELF.Q.CON5:NRO_CUOTA_Icon = 0
  END

