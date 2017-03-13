

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION150.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION115.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION149.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION152.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion LIQUIDACION
!!! </summary>
UpdateLIQUIDACION PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
BRW11::View:Browse   VIEW(LIQUIDACION_CODIGO)
                       PROJECT(LIQC:VALOR)
                       PROJECT(LIQC:CANTIDAD)
                       PROJECT(LIQC:TOTAL)
                       PROJECT(LIQC:IDLIQUIDACION)
                       PROJECT(LIQC:IDNOMENCLADOR)
                       PROJECT(LIQC:IDOS)
                       JOIN(NOM2:PK_NOMENCLADORXOS,LIQC:IDOS,LIQC:IDNOMENCLADOR)
                         PROJECT(NOM2:IDOS)
                         PROJECT(NOM2:IDNOMENCLADOR)
                         JOIN(NOM:PK_NOMENCLADOR,NOM2:IDNOMENCLADOR)
                           PROJECT(NOM:CODIGO)
                           PROJECT(NOM:DESCRIPCION)
                           PROJECT(NOM:IDNOMENCLADOR)
                         END
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
NOM:CODIGO             LIKE(NOM:CODIGO)               !List box control field - type derived from field
NOM:DESCRIPCION        LIKE(NOM:DESCRIPCION)          !List box control field - type derived from field
LIQC:VALOR             LIKE(LIQC:VALOR)               !List box control field - type derived from field
LIQC:CANTIDAD          LIKE(LIQC:CANTIDAD)            !List box control field - type derived from field
LIQC:TOTAL             LIKE(LIQC:TOTAL)               !List box control field - type derived from field
LIQC:IDLIQUIDACION     LIKE(LIQC:IDLIQUIDACION)       !List box control field - type derived from field
LIQC:IDNOMENCLADOR     LIKE(LIQC:IDNOMENCLADOR)       !List box control field - type derived from field
LIQC:IDOS              LIKE(LIQC:IDOS)                !List box control field - type derived from field
NOM2:IDOS              LIKE(NOM2:IDOS)                !Related join file key field - type derived from field
NOM2:IDNOMENCLADOR     LIKE(NOM2:IDNOMENCLADOR)       !Related join file key field - type derived from field
NOM:IDNOMENCLADOR      LIKE(NOM:IDNOMENCLADOR)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::LIQ:Record  LIKE(LIQ:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion LIQUIDACION'),AT(,,274,226),FONT('Arial',8,,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateLIQUIDACION'),SYSTEM
                       PROMPT('ID LIQUIDACION:'),AT(1,2),USE(?Prompt8)
                       STRING(@n-7),AT(52,2),USE(LIQ:IDLIQUIDACION)
                       PROMPT('IDSOCIO:'),AT(0,15),USE(?LIQ:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(41,15,64,10),USE(LIQ:IDSOCIO)
                       BUTTON('...'),AT(109,14,12,12),USE(?CallLookup)
                       STRING(@s30),AT(125,15),USE(SOC:NOMBRE)
                       PROMPT('IDOS:'),AT(0,29),USE(?LIQ:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(41,29,64,10),USE(LIQ:IDOS)
                       BUTTON('...'),AT(109,29,12,12),USE(?CallLookup:2)
                       STRING(@s30),AT(124,30),USE(OBR:NOMPRE_CORTO)
                       PROMPT('MES:'),AT(0,47),USE(?LIQ:MES:Prompt)
                       SPIN(@n-14),AT(26,47,23,10),USE(LIQ:MES),RANGE(1,12)
                       PROMPT('ANO:'),AT(57,47),USE(?LIQ:ANO:Prompt)
                       SPIN(@n-14),AT(87,47,46,10),USE(LIQ:ANO),RANGE(2009,2999)
                       GROUP('Codigos a Liquidar'),AT(1,61,269,77),USE(?Group1),BOXED
                         LIST,AT(7,69,259,49),USE(?List),FORMAT('56D|M~CODIGO~L(2)@n-14@123L|M~DESCRIPCION~L(2)@' & |
  's100@45L(1)|M~VALOR~L(2)@n$-10.2@26L(1)|M~CANT~L(2)@n-3@40L(1)|M~TOTAL~L(2)@n$-10.2@' & |
  '56L|M~IDLIQUIDACION~L(2)@n-7@56L|M~IDNOMENCLADOR~L(2)@n-7@56L|M~IDOS~L(2)@n-7@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records')
                         BUTTON('&Agregar'),AT(9,121,54,15),USE(?Insert),LEFT,ICON('a.ico'),FLAT
                         BUTTON('&Modificar'),AT(66,121,54,15),USE(?Change),LEFT,ICON('c.ico'),FLAT
                         BUTTON('&Borrar'),AT(123,121,54,15),USE(?Delete),LEFT,ICON('b.ico'),FLAT
                       END
                       PROMPT('CANTIDAD:'),AT(5,142),USE(?LIQ:CANTIDAD:Prompt)
                       ENTRY(@n-14),AT(46,141,41,10),USE(LIQ:CANTIDAD),RIGHT(1),REQ
                       OPTION('TIPO PERIODO'),AT(3,153,205,26),USE(LIQ:TIPO_PERIODO,,?LIQ:TIPO_PERIODO:2),BOXED
                         RADIO('MENSUAL'),AT(9,163),USE(?LIQ:TIPO_PERIODO:Radio1)
                         RADIO(' 1º QUINCENA'),AT(61,163),USE(?LIQ:TIPO_PERIODO:Radio2)
                         RADIO(' 2º QUINCENA'),AT(131,163),USE(?LIQ:TIPO_PERIODO:Radio3)
                       END
                       PROMPT('MONTO:'),AT(95,142),USE(?LIQ:MONTO:Prompt),TRN
                       ENTRY(@n$-12.2),AT(132,142,56,10),USE(LIQ:MONTO)
                       PROMPT('FECHA PRESENTACION:'),AT(3,185),USE(?LIQ:FECHA_PRESENTACION:Prompt),TRN
                       ENTRY(@d17),AT(89,186,77,10),USE(LIQ:FECHA_PRESENTACION)
                       BUTTON('...'),AT(170,184,12,12),USE(?Calendar)
                       LINE,AT(3,205,271,0),USE(?Line1),COLOR(COLOR:Black)
                       BUTTON('&Aceptar'),AT(171,209,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(223,209,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
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

Calendar10           CalendarClass
BRW11                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
                     END

BRW11::Sort0:Locator StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('UpdateLIQUIDACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt8
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('NOM:IDNOMENCLADOR',NOM:IDNOMENCLADOR)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(LIQ:Record,History::LIQ:Record)
  SELF.AddHistoryField(?LIQ:IDLIQUIDACION,1)
  SELF.AddHistoryField(?LIQ:IDSOCIO,2)
  SELF.AddHistoryField(?LIQ:IDOS,3)
  SELF.AddHistoryField(?LIQ:MES,4)
  SELF.AddHistoryField(?LIQ:ANO,5)
  SELF.AddHistoryField(?LIQ:CANTIDAD,17)
  SELF.AddHistoryField(?LIQ:TIPO_PERIODO:2,7)
  SELF.AddHistoryField(?LIQ:MONTO,8)
  SELF.AddHistoryField(?LIQ:FECHA_PRESENTACION,10)
  SELF.AddUpdateFile(Access:LIQUIDACION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:FORMA_PAGO.Open                                   ! File FORMA_PAGO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:LIQUIDACION
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
  BRW11.Init(?List,Queue:Browse.ViewPosition,BRW11::View:Browse,Queue:Browse,Relate:LIQUIDACION_CODIGO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?LIQ:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?LIQ:IDOS{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?LIQ:MES{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
    ?LIQ:CANTIDAD{PROP:ReadOnly} = True
    ?LIQ:MONTO{PROP:ReadOnly} = True
    ?LIQ:FECHA_PRESENTACION{PROP:ReadOnly} = True
    DISABLE(?Calendar)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW11.Q &= Queue:Browse
  BRW11.RetainRow = 0
  BRW11.AddSortOrder(,LIQC:PK_LIQUIDACION_CODIGO)          ! Add the sort order for LIQC:PK_LIQUIDACION_CODIGO for sort order 1
  BRW11.AddRange(LIQC:IDLIQUIDACION,Relate:LIQUIDACION_CODIGO,Relate:LIQUIDACION) ! Add file relationship range limit for sort order 1
  BRW11.AddLocator(BRW11::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW11::Sort0:Locator.Init(,LIQC:IDNOMENCLADOR,,BRW11)    ! Initialize the browse locator using  using key: LIQC:PK_LIQUIDACION_CODIGO , LIQC:IDNOMENCLADOR
  BRW11.AppendOrder('LIQC:IDOS, LIQC:IDNOMENCLADOR')       ! Append an additional sort order
  BRW11.AddField(NOM:CODIGO,BRW11.Q.NOM:CODIGO)            ! Field NOM:CODIGO is a hot field or requires assignment from browse
  BRW11.AddField(NOM:DESCRIPCION,BRW11.Q.NOM:DESCRIPCION)  ! Field NOM:DESCRIPCION is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:VALOR,BRW11.Q.LIQC:VALOR)            ! Field LIQC:VALOR is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:CANTIDAD,BRW11.Q.LIQC:CANTIDAD)      ! Field LIQC:CANTIDAD is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:TOTAL,BRW11.Q.LIQC:TOTAL)            ! Field LIQC:TOTAL is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:IDLIQUIDACION,BRW11.Q.LIQC:IDLIQUIDACION) ! Field LIQC:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:IDNOMENCLADOR,BRW11.Q.LIQC:IDNOMENCLADOR) ! Field LIQC:IDNOMENCLADOR is a hot field or requires assignment from browse
  BRW11.AddField(LIQC:IDOS,BRW11.Q.LIQC:IDOS)              ! Field LIQC:IDOS is a hot field or requires assignment from browse
  BRW11.AddField(NOM2:IDOS,BRW11.Q.NOM2:IDOS)              ! Field NOM2:IDOS is a hot field or requires assignment from browse
  BRW11.AddField(NOM2:IDNOMENCLADOR,BRW11.Q.NOM2:IDNOMENCLADOR) ! Field NOM2:IDNOMENCLADOR is a hot field or requires assignment from browse
  BRW11.AddField(NOM:IDNOMENCLADOR,BRW11.Q.NOM:IDNOMENCLADOR) ! Field NOM:IDNOMENCLADOR is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateLIQUIDACION',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  BRW11.AskProcedure = 3                                   ! Will call: ABM_LIQUIDACION_CODIGO((LIQ:IDOS))
  BRW11.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FORMA_PAGO.Close
    Relate:LIQUIDACION.Close
    Relate:OBRA_SOCIAL.Close
    Relate:SOCIOS.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateLIQUIDACION',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectSOCIOS
      SelectOBRA_SOCIAL
      ABM_LIQUIDACION_CODIGO((LIQ:IDOS))
    END
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
    CASE ACCEPTED()
    OF ?OK
      SOC3:IDSOCIOS  =   LIQ:IDSOCIO
      SOC3:IDOS      =   LIQ:IDOS
      GET(SOCIOSXOS,SOC3:PK_SOCIOSXOS)
      IF ERRORCODE() = 35 THEN
          MESSAGE('EL COLEGIADO NO ESTA INSCRIPTO COMO PRESTADOR DE LA OBRA SOCIAL CARGADA')
          SELECT(?LIQ:IDOS)
          CYCLE
      END
      IF SELF.REQUEST = INSERTRECORD THEN
          LIQ:FECHA_CARGA = TODAY()
          LIQ:IDFORMA_PAGO = 2
          LIQ:PERIODO   =  LIQ:ANO&(FORMAT(LIQ:MES,@N02))
          LIQ:PRESENTADO  =  'NO'
          LIQ:COBRADO     =  'NO'
          LIQ:PAGADO      =  'NO'
          LIQ:IDUSUARIO = GLO:IDUSUARIO
          LIQ:MONTO_PAGADO  = 0
          LIQ:DEBITO        = 0
          LIQ:COMISION      =  0
          LIQ:DEBITO_COMISION =  0
          LIQ:DEBITO_PAGO_CUOTAS = 0
          LIQ:MONTO_TOTAL  = 0
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LIQ:IDSOCIO
      SOC:IDSOCIO = LIQ:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          LIQ:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?LIQ:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION.TryValidateField(2)            ! Attempt to validate LIQ:IDSOCIO in LIQUIDACION
        SELECT(?LIQ:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = LIQ:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        LIQ:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?LIQ:IDOS
      OBR:IDOS = LIQ:IDOS
      IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          LIQ:IDOS = OBR:IDOS
        ELSE
          SELECT(?LIQ:IDOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION.TryValidateField(3)            ! Attempt to validate LIQ:IDOS in LIQUIDACION
        SELECT(?LIQ:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      OBR:IDOS = LIQ:IDOS
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        LIQ:IDOS = OBR:IDOS
      END
      ThisWindow.Reset(1)
    OF ?LIQ:MES
      IF Access:LIQUIDACION.TryValidateField(4)            ! Attempt to validate LIQ:MES in LIQUIDACION
        SELECT(?LIQ:MES)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:MES
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:MES{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:ANO
      IF Access:LIQUIDACION.TryValidateField(5)            ! Attempt to validate LIQ:ANO in LIQUIDACION
        SELECT(?LIQ:ANO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:ANO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:ANO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?Calendar
      ThisWindow.Update()
      Calendar10.SelectOnClose = True
      Calendar10.Ask('Select a Date',LIQ:FECHA_PRESENTACION)
      IF Calendar10.Response = RequestCompleted THEN
      LIQ:FECHA_PRESENTACION=Calendar10.SelectedDate
      DISPLAY(?LIQ:FECHA_PRESENTACION)
      END
      ThisWindow.Reset(True)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
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
  If  Self.Request=insertRecord AND SELF.RESPONSE = RequestCompleted Then
      !! Imprimir Entrega
      clear(LIQ:record,1)
      SET(LIQ:PK_LIQUIDACION,LIQ:PK_LIQUIDACION)
      PREVIOUS(LIQUIDACION)
      IF ERRORCODE() THEN
          MESSAGE('NO ENCONTRO ID LIQUIDACION')
      ELSE
          GLO:IDSOLICITUD = LIQ:IDLIQUIDACION 
      END
      clear(LIQ:record)
      RECIBO_LIQUIDACION
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW11.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW11.ResetFromView PROCEDURE

LIQ:CANTIDAD:Sum     REAL                                  ! Sum variable for browse totals
LIQ:MONTO:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:LIQUIDACION_CODIGO.SetQuickScan(1)
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
    LIQ:CANTIDAD:Sum += LIQC:CANTIDAD
    LIQ:MONTO:Sum += LIQC:TOTAL
  END
  SELF.View{PROP:IPRequestCount} = 0
  LIQ:CANTIDAD = LIQ:CANTIDAD:Sum
  LIQ:MONTO = LIQ:MONTO:Sum
  PARENT.ResetFromView
  Relate:LIQUIDACION_CODIGO.SetQuickScan(0)
  SETCURSOR()

