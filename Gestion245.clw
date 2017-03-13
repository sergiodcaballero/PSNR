

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION245.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION244.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION246.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PAGOS
!!! </summary>
UpdatePAGOS1 PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::11:TAGFLAG         BYTE(0)
DASBRW::11:TAGMOUSE        BYTE(0)
DASBRW::11:TAGDISPSTATUS   BYTE(0)
DASBRW::11:QUEUE          QUEUE
PUNTERO                       LIKE(PUNTERO)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
T                    STRING(1)                             ! 
BRW10::View:Browse   VIEW(FACTURA)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:TOTAL)
                       PROJECT(FAC:DESCUENTOCOBERTURA)
                       PROJECT(FAC:INTERES)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
T                      LIKE(T)                        !List box control field - type derived from local data
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FAC:DESCUENTOCOBERTURA LIKE(FAC:DESCUENTOCOBERTURA)   !List box control field - type derived from field
FAC:INTERES            LIKE(FAC:INTERES)              !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !List box control field - type derived from field
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:IDSOCIO            LIKE(FAC:IDSOCIO)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::PAG:Record  LIKE(PAG:RECORD),THREAD
QuickWindow          WINDOW('Cargar Pagos'),AT(,,273,274),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY,IMM, |
  MDI,HLP('UpdatePAGOS'),SYSTEM
                       PROMPT('IDSOCIO:'),AT(1,3),USE(?PAG:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(35,3,43,10),USE(PAG:IDSOCIO)
                       BUTTON('...'),AT(81,2,12,12),USE(?CallLookup)
                       STRING(@s30),AT(96,3),USE(SOC:NOMBRE)
                       PROMPT('Matri.:'),AT(221,3),USE(?Prompt5)
                       STRING(@n-7),AT(243,3),USE(SOC:MATRICULA)
                       ENTRY(@n-14),AT(35,16,26,10),USE(PAG:SUCURSAL)
                       PROMPT('IDRECIBO:'),AT(1,17),USE(?PAG:IDRECIBO:Prompt),TRN
                       ENTRY(@n-14),AT(67,16,43,10),USE(PAG:IDRECIBO),REQ
                       CHECK('AFECTADA'),AT(118,17),USE(PAG:AFECTADA),VALUE('SI','NO')
                       BUTTON('Habilitar Selección'),AT(66,36,141,13),USE(?Button11)
                       GROUP('Elegir Cuotas Pagadas'),AT(1,52,265,135),USE(?Group1),BOXED,DISABLE
                         LIST,AT(7,60,255,100),USE(?List),HVSCROLL,FORMAT('17R|M~T~L(2)@s1@22L|M~MES~L(2)@n-3@22' & |
  'L|M~ANO~L(2)@n-5@40L|M~TOTAL~L(2)@n$-10.2@53L(1)|M~DESCUENTO~L(2)@n$-10.2@40L|M~INTE' & |
  'RES~L(2)@n$-10.2@84L|M~ESTADO~L(2)@s21@56L|M~IDFACTURA~L(2)@n-14@56L|M~IDSOCIO~L(2)@n-14@'), |
  FROM(Queue:Browse),IMM,MSG('Browsing Records'),VCR
                         BUTTON('&Marcar'),AT(7,164,32,13),USE(?DASTAG)
                         BUTTON('Todo'),AT(59,164,45,13),USE(?DASTAGAll)
                         BUTTON('Desm Todo'),AT(124,164,50,13),USE(?DASUNTAGALL)
                         BUTTON('&Rev tags'),AT(27,178,50,13),USE(?DASREVTAG),DISABLE,HIDE
                         BUTTON('Solo Marcado'),AT(194,164,70,13),USE(?DASSHOWTAG)
                       END
                       LINE,AT(1,205,270,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('Monto a Afectar: '),AT(43,211),USE(?Prompt4),FONT(,11,,FONT:bold)
                       STRING(@n$-10.2),AT(128,211),USE(GLO:MONTO),FONT('Arial',11,COLOR:Red,FONT:bold,CHARSET:ANSI)
                       PROMPT('Forma Pago:'),AT(13,229),USE(?PAG:IDSUBCUENTA:Prompt)
                       ENTRY(@n-14),AT(55,229,43,10),USE(PAG:IDSUBCUENTA)
                       BUTTON('...'),AT(103,228,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(119,229),USE(SUB:DESCRIPCION)
                       LINE,AT(1,249,267,0),USE(?Line2),COLOR(COLOR:Black)
                       BUTTON('Calculo Monto'),AT(81,189,115,13),USE(?Button12),DISABLE
                       BUTTON('&Aceptar'),AT(68,255,53,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,HIDE,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza' & |
  ' el Formulario')
                       BUTTON('&Cancelar'),AT(141,255,62,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::11:DASTAGONOFF Routine
  GET(Queue:Browse,CHOICE(?List))
  BRW10.UpdateBuffer
   TAGS.PUNTERO = FAC:IDFACTURA
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = FAC:IDFACTURA
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse.T = T
  PUT(Queue:Browse)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
  IF DASBRW::11:TAGMOUSE = 1 THEN
    DASBRW::11:TAGMOUSE = 0
  ELSE
  DASBRW::11:TAGFLAG = 1
  POST(EVENT:ScrollDown,?List)
  END
DASBRW::11:DASTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW10.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW10::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = FAC:IDFACTURA
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW10.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::11:DASUNTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW10.Reset
  SETCURSOR
  BRW10.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::11:DASREVTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::11:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::11:QUEUE = TAGS
    ADD(DASBRW::11:QUEUE)
  END
  FREE(TAGS)
  BRW10.Reset
  LOOP
    NEXT(BRW10::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::11:QUEUE.PUNTERO = FAC:IDFACTURA
     GET(DASBRW::11:QUEUE,DASBRW::11:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = FAC:IDFACTURA
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW10.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::11:DASSHOWTAG Routine
   CASE DASBRW::11:TAGDISPSTATUS
   OF 0
      DASBRW::11:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::11:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::11:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW10.ResetSort(1)
   SELECT(?List,CHOICE(?List))
   EXIT
!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
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
  GlobalErrors.SetProcedureName('UpdatePAGOS1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAG:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('FAC:IDFACTURA',FAC:IDFACTURA)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAG:Record,History::PAG:Record)
  SELF.AddHistoryField(?PAG:IDSOCIO,2)
  SELF.AddHistoryField(?PAG:SUCURSAL,3)
  SELF.AddHistoryField(?PAG:IDRECIBO,12)
  SELF.AddHistoryField(?PAG:AFECTADA,16)
  SELF.AddHistoryField(?PAG:IDSUBCUENTA,15)
  SELF.AddUpdateFile(Access:PAGOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_FACTURA.Open                              ! File DETALLE_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INFORME.Open                                      ! File INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGOS
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
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:FACTURA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PAG:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?PAG:SUCURSAL{PROP:ReadOnly} = True
    ?PAG:IDRECIBO{PROP:ReadOnly} = True
    DISABLE(?Button11)
    DISABLE(?DASTAG)
    DISABLE(?DASTAGAll)
    DISABLE(?DASUNTAGALL)
    DISABLE(?DASREVTAG)
    DISABLE(?DASSHOWTAG)
    ?PAG:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    DISABLE(?Button12)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW10.Q &= Queue:Browse
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,FAC:FK_FACTURA_SOCIO)                ! Add the sort order for FAC:FK_FACTURA_SOCIO for sort order 1
  BRW10.AddRange(FAC:IDSOCIO,GLO:IDSOCIO)                  ! Add single value range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,FAC:IDSOCIO,,BRW10)           ! Initialize the browse locator using  using key: FAC:FK_FACTURA_SOCIO , FAC:IDSOCIO
  BRW10.AppendOrder('FAC:PERIODO')                         ! Append an additional sort order
  BRW10.SetFilter('(fac:estado = '''')')                   ! Apply filter expression to browse
  BRW10.AddField(T,BRW10.Q.T)                              ! Field T is a hot field or requires assignment from browse
  BRW10.AddField(FAC:MES,BRW10.Q.FAC:MES)                  ! Field FAC:MES is a hot field or requires assignment from browse
  BRW10.AddField(FAC:ANO,BRW10.Q.FAC:ANO)                  ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW10.AddField(FAC:TOTAL,BRW10.Q.FAC:TOTAL)              ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW10.AddField(FAC:DESCUENTOCOBERTURA,BRW10.Q.FAC:DESCUENTOCOBERTURA) ! Field FAC:DESCUENTOCOBERTURA is a hot field or requires assignment from browse
  BRW10.AddField(FAC:INTERES,BRW10.Q.FAC:INTERES)          ! Field FAC:INTERES is a hot field or requires assignment from browse
  BRW10.AddField(FAC:ESTADO,BRW10.Q.FAC:ESTADO)            ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW10.AddField(FAC:IDFACTURA,BRW10.Q.FAC:IDFACTURA)      ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW10.AddField(FAC:IDSOCIO,BRW10.Q.FAC:IDSOCIO)          ! Field FAC:IDSOCIO is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdatePAGOS1',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  FREE(TAGS)
  ?DASSHOWTAG{PROP:Text} = 'Show All'
  ?DASSHOWTAG{PROP:Msg}  = 'Show All'
  ?DASSHOWTAG{PROP:Tip}  = 'Show All'
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  ?List{Prop:Alrt,239} = SpaceKey
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
  FREE(TAGS)
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
    Relate:CAJA.Close
    Relate:CUENTAS.Close
    Relate:DETALLE_FACTURA.Close
    Relate:FACTURA.Close
    Relate:FONDOS.Close
    Relate:INFORME.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PAGOS.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePAGOS1',QuickWindow)              ! Save window data to non-volatile store
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
      SelectSUBCUENTAS_cuotas
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
    OF ?Button11
      GLO:IDSOCIO = SOC:IDSOCIO
      ENABLE(?Group1)
      ENABLE(?Button12)
      THISWINDOW.RESET(1)
    OF ?Button12
      !FREE(CARNET)
      GLO:MONTO = 0
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          FAC:IDFACTURA = tags:Puntero
          GET(FACTURA,FAC:PK_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO FACTURA')
          ELSE
              !!! BUSCA POR PERIODO Y CALCULA INTERESES
              !!! SACO PERIODO MENOS PARA CARGAR INTERES
              MES# = MONTH (TODAY())
              ANO# = YEAR(TODAY())
              PERIODO$  = FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
              IF FAC:PERIODO >= PERIODO$ THEN
                  GLO:MONTO = GLO:MONTO + (FAC:TOTAL - FAC:DESCUENTOCOBERTURA)
              ELSE
                  GLO:MONTO = GLO:MONTO + FAC:TOTAL
              END
              GLO:IDSOLICITUD = FAC:IDFACTURA
            
          end
      end
      UNHIDE(?OK)
      ENABLE(?OK)
      disable(?Group1)
      disable(?Button11)
      THISWINDOW.RESET(1)
    OF ?OK
      GLO:DETALLE_RECIBO = ''
      PAG:MONTO     =  GLO:MONTO
      PAG:FECHA     =  today()
      PAG:HORA      =  clock()
      PAG:MES       =  MONTH(TODAY())
      PAG:ANO       =  YEAR(TODAY())
      PAG:PERIODO   =  PAG:ANO&(FORMAT(PAG:MES,@N02))
      PAG:IDUSUARIO =  GLO:IDUSUARIO
      PAG:MONTO_FACTURA  =  GLO:TOTAL
      PAG:INTERES_FACTURA = GLO:INTERES
      PAG:IDFACTURA = GLO:IDSOLICITUD
      
      If  Self.Request=ChangeRecord Then
          FAC:IDFACTURA = FACTURA#
          GET (FACTURA,FAC:PK_FACTURA)
          IF ERRORCODE() = 35 THEN
              HALT(0,'OCURRIO UN ERROR COMUNIQUESE CON EL ADMINISTRADOR DEL SISTEMA ')
          ELSE
              FAC:ESTADO = ''
              PUT(FACTURA)
              
          End
      END
      
      !! CONTROLO SI SE CARGO LA AFECTACION DEL PAGO
      IF PAG:AFECTADA = 'SI' THEN
          ING:SUCURSAL = PAG:SUCURSAL
          ING:IDRECIBO = PAG:IDRECIBO
          GET(INGRESOS,ING:IDX_INGRESOS_UNIQUE)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO SE AFECTO EL RECIBO A NINGUN INGRESO','...No Corresponde la afectación',ICON:EXCLAMATION)
              SELECT(?PAG:SUCURSAL)
              CYCLE
          ELSE
              IF ING:MONTO <> PAG:MONTO THEN
                  MESSAGE('EL MONTO DEL RECIBO EMITIDO NO ES IGUAL AL MONTO TOTAL QUE SE QUIERE EFECTAR',ICON:EXCLAMATION)
                  !HIDE(?OK)
                  !DISABLE(?OK)
                  !ENABLE(?Group1)
                  !ENABLE(?Button11)
                  !SELECT(?Cancel)
                  !CYCLE
                  
              END
          END
      else
          PAG:AFECTADA = 'NO' 
          !!! BUSCA SI EXISTE EL RECIBO
          ING:SUCURSAL = PAG:SUCURSAL
          ING:IDRECIBO = PAG:IDRECIBO
          GET(INGRESOS,ING:IDX_INGRESOS_UNIQUE)
          IF ERRORCODE() <> 35 THEN
              IF (ING:SUCURSAL = PAG:SUCURSAL) AND (ING:IDRECIBO = PAG:IDRECIBO) THEN
                  MESSAGE('EL NRO. DE RECIBO YA SE EMITIO','...No Corresponde la Recibo',ICON:EXCLAMATION)
                  SELECT(?PAG:SUCURSAL)
                  CYCLE
              END
          end
      END
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAG:IDSOCIO
      SOC:IDSOCIO = PAG:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAG:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGOS.TryValidateField(2)                  ! Attempt to validate PAG:IDSOCIO in PAGOS
        SELECT(?PAG:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAG:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAG:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAG:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAG:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?PAG:IDSUBCUENTA
      SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
      IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PAG:IDSUBCUENTA = SUB:IDSUBCUENTA
        ELSE
          SELECT(?PAG:IDSUBCUENTA)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:PAGOS.TryValidateField(15)                 ! Attempt to validate PAG:IDSUBCUENTA in PAGOS
        SELECT(?PAG:IDSUBCUENTA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAG:IDSUBCUENTA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAG:IDSUBCUENTA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAG:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      !!!! MODIFICA EL ESTADO DE LA FACTURA ...
      !GLO:DETALLE_RECIBO  = ''
      CONTADOR# = 0
      CUENTA# = 0
      REPORTE_LARGO = ''
      P1# = 0
      P2# = 0
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          FAC:IDFACTURA = tags:Puntero
          GET(FACTURA,FAC:PK_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO FACTURA')
          ELSE
             FAC:ESTADO = 'PAGADO'
             PUT(FACTURA)
             IF  GLO:DETALLE_RECIBO  = '' OR  CUENTA# = 1  THEN
                 !! BUSCA EN EL DETALLE SI ES UNA CUOTA O POSEE ADEMAS UN CONVENIO
                 DET:IDFACTURA = FAC:IDFACTURA
                 SET(DET:FK_DETALLE_FACTURA,DET:FK_DETALLE_FACTURA)
                 LOOP
                  IF ACCESS:DETALLE_FACTURA.NEXT() THEN BREAK.
                  IF DET:IDFACTURA <> FAC:IDFACTURA THEN BREAK.
                  IF clip(DET:CONCEPTO) = 'CUOTA' THEN
                      CUOTA" = 'C'!&CUOTA"
                  ELSE
                      CUOTA" = 'C/C'!&clip(DET:CONCEPTO)
                  END
                  END !! LOOP
                 
                 GLO:DETALLE_RECIBO = clip(GLO:DETALLE_RECIBO)&''&CLIP(CUOTA")&''&FAC:MES&'-'&FAC:ANO&','
                 CUENTA# = 1
             END
             CONTADOR# = CONTADOR# + 1
             GLO:CUENTA = CONTADOR#
             VL# = FAC:PERIODO
             !!!!!!!!! ORDENA
             IF CONTADOR# = 1 THEN
                  P1# = FAC:PERIODO
                  P2# = FAC:PERIODO
                  DESDE" = FAC:MES&'/'&FAC:ANO
                  HASTA" = FAC:MES&'/'&FAC:ANO
             ELSE
                  IF VL# > P1# THEN
                      IF VL# > P2# THEN
                          P2# = VL#
                          HASTA" = FAC:MES&'/'&FAC:ANO
                      END
                  ELSE
                      IF VL# < P1# THEN
                          P1# = VL#
                          DESDE" = FAC:MES&'/'&FAC:ANO
                      END
                 END
      
      
             END
             CUOTA" = ''
            
         end
      end
      IF GLO:CUENTA  > 0 THEN
            REPORTE_LARGO = CLIP(GLO:DETALLE_RECIBO) ! 'DESDE:'&CLIP(DESDE")&'-HASTA: '&CLIP(HASTA")
      
      ELSE
          REPORTE_LARGO  = CLIP(GLO:DETALLE_RECIBO)  ! 'PAGA CUOTA '&CLIP(HASTA")
      END
      
      !!! DESCUENTA EN SOCIOS
      SOC:IDSOCIO = FAC:IDSOCIO
      GET (SOCIOS,SOC:PK_SOCIOS)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO SOCIO')
      ELSE
          SOC:CANTIDAD = SOC:CANTIDAD - CONTADOR#
          PUT(SOCIOS)
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
      IF PAG:AFECTADA = 'NO' THEN !!! NO SE ASIENTA EN FINANZAS
                !!! CARGO EN LA CAJA
          SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          !!! MODIFICA EL FLUJO DE FONDOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO + GLO:MONTO
          FON:FECHA = TODAY()
          FON:HORA = CLOCK()
          ACCESS:FONDOS.UPDATE()
  
          !! BUSCO EL ID PROVEEDOR
          SOC:IDSOCIO = PAG:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          IDPROVEEDOR# = SOC:IDPROVEEDOR
          !! CARGO INGRESO
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   PAG:IDUSUARIO
          ING:IDSUBCUENTA      =   PAG:IDSUBCUENTA
          ING:OBSERVACION      =   'PAGO CUOTA MAT:'&SOC:MATRICULA&', CUOTA: '&FAC:MES&' AÑO: '&FAC:ANO
          ING:MONTO            =   GLO:MONTO
          ING:FECHA            =   PAG:FECHA
          ING:HORA             =   PAG:HORA
          ING:MES              =   PAG:MES
          ING:ANO              =   PAG:ANO
          ING:PERIODO          =   PAG:PERIODO
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   PAG:SUCURSAL
          ING:IDRECIBO         =   PAG:IDRECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
  
          !!!!   CARGA EN CAJA SI SE DE CAJA
          IF SUB:CAJA = 'SI' THEN
              !!! CARGO CAJA
              CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
              CAJ:IDUSUARIO = GLO:IDUSUARIO
              CAJ:DEBE =  GLO:MONTO
              CAJ:HABER = 0
              CAJ:OBSERVACION = 'PAGO CUOTA SOCIO '&PAG:IDSOCIO
              CAJ:FECHA = TODAY()
              CAJ:MES       =  MONTH(TODAY())
              CAJ:ANO       =  YEAR(TODAY())
              CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
              CAJ:SUCURSAL  =   ING:SUCURSAL
              CAJ:RECIBO    =   ING:IDRECIBO
              CAJ:TIPO      =   'INGRESO'
              CAJ:IDTRANSACCION = ING:IDINGRESO
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              CAJ:MONTO = FON:MONTO 
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
              NEXT(RANKING)
              CAJ:IDCAJA = RAN:C1
              ACCESS:CAJA.INSERT()
              RAN:C1 = 0
          END
          CUE:IDCUENTA = SUB:IDCUENTA
          ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
          IF CUE:TIPO = 'INGRESO' THEN
              LIB:IDSUBCUENTA = PAG:IDSUBCUENTA
              LIB:DEBE = GLO:MONTO
              LIB:HABER = 0
              LIB:OBSERVACION = 'PAGO CUOTA SOCIO '&PAG:IDSOCIO
              LIB:FECHA = TODAY()
              LIB:HORA = CLOCK()
              LIB:MES       =  MONTH(TODAY())
              LIB:ANO       =  YEAR(TODAY())
              LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
              LIB:SUCURSAL   =    ING:SUCURSAL
              LIB:RECIBO       =  ING:IDRECIBO
              LIB:IDPROVEEDOR  =  IDPROVEEDOR#
              LIB:TIPO         =  'INGRESO'
              LIB:IDTRANSACCION =  ING:IDINGRESO
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              LIB:FONDO = FON:MONTO 
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
              NEXT(RANKING)
              LIB:IDLIBDIARIO = RAN:C1
              !!!!!!!!!!!
              ACCESS:LIBDIARIO.INSERT()
          END
          !!! PARA CERRAR
          PAG:IDFACTURA = GLO:IDSOLICITUD
          GET(PAGOS,PAG:FK_PAGOS_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO PAGO')
          ELSE
              GLO:PAGO = PAG:IDPAGOS
              IMPRIMIR_PAGO
          END
  
  
          GLO:IDSOLICITUD = 0
          GLO:MONTO     = 0
      ELSE
           !!! BUSCO EN INFORMES
          INF:SUCURSAL  = PAG:SUCURSAL
          INF:IDRECIBO  = PAG:IDRECIBO
          ACCESS:INFORME.TRYFETCH(INF:IDX_INFORME_RECIBO)
          INF:TERMINADO = 'SI'
          ACCESS:INFORME.UPDATE
  
      END
  END
  
  !!!LIBERO MEMORIA
  FREE(TAGS)
  
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  CASE FIELD()
  OF ?List
    CASE EVENT()
    OF EVENT:PreAlertKey
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF Keycode() = SpaceKey
         POST(EVENT:Accepted,?DASTAG)
         CYCLE
      END
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?List
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?List{PROPLIST:MouseDownRow} > 0) AND (DASBRW::11:TAGFLAG = 0)
        CASE ?List{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::11:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?List{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::11:TAGFLAG = 0
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


BRW10.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = FAC:IDFACTURA
     GET(TAGS,TAGS.PUNTERO)
    IF ERRORCODE()
      T = ''
    ELSE
      T = '*'
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  PARENT.SetQueueRecord()      !FIX FOR CFW 4 (DASTAG)
  PARENT.SetQueueRecord


BRW10.TakeKey PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  IF Keycode() = SpaceKey
    RETURN ReturnValue
  END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue = PARENT.TakeKey()
  RETURN ReturnValue


BRW10.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW10::RecordStatus  BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW10::RecordStatus=ReturnValue
  IF BRW10::RecordStatus NOT=Record:OK THEN RETURN BRW10::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = FAC:IDFACTURA
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::11:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW10::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW10::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW10::RecordStatus
  RETURN ReturnValue

