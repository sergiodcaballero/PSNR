

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION120.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION119.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION121.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION122.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION123.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION124.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION125.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PAGOS_LIQUIDACION
!!! </summary>
Formulario_PAGOS_LIQUIDACION PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::9:TAGFLAG          BYTE(0)
DASBRW::9:TAGMOUSE         BYTE(0)
DASBRW::9:TAGDISPSTATUS    BYTE(0)
DASBRW::9:QUEUE           QUEUE
PUNTERO                       LIKE(PUNTERO)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
LOC:CUOTA            STRING(255)                           ! 
ActionMessage        CSTRING(40)                           ! 
T                    STRING(1)                             ! 
LOC:MONTO_LIC        REAL                                  ! 
LOC:MONTO_DEBITO     REAL                                  ! 
LOC:GASTO_ADM        REAL                                  ! 
LOC:IMP_CHEQUE       REAL                                  ! 
LOC:GASTOS_BANCARIOS REAL                                  ! 
BRW8::View:Browse    VIEW(LIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:MONTO)
                       PROJECT(LIQ:DEBITO)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:COBRADO)
                       PROJECT(LIQ:PERIODO)
                       PROJECT(LIQ:IDSOCIO)
                       PROJECT(LIQ:IDOS)
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMPRE_CORTO)
                         PROJECT(OBR:IDOS)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
T                      LIKE(T)                        !List box control field - type derived from local data
LIQ:MES                LIKE(LIQ:MES)                  !List box control field - type derived from field
LIQ:ANO                LIKE(LIQ:ANO)                  !List box control field - type derived from field
LIQ:MONTO              LIKE(LIQ:MONTO)                !List box control field - type derived from field
LIQ:DEBITO             LIKE(LIQ:DEBITO)               !List box control field - type derived from field
LIQ:IDLIQUIDACION      LIKE(LIQ:IDLIQUIDACION)        !List box control field - type derived from field
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
LIQ:COBRADO            LIKE(LIQ:COBRADO)              !List box control field - type derived from field
LIQ:PERIODO            LIKE(LIQ:PERIODO)              !List box control field - type derived from field
LIQ:IDSOCIO            LIKE(LIQ:IDSOCIO)              !Browse key field - type derived from field
OBR:IDOS               LIKE(OBR:IDOS)                 !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::PAGL:Record LIKE(PAGL:RECORD),THREAD
QuickWindow          WINDOW('&Liquidar'),AT(,,430,269),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('Formulario_PAGOS_LIQUIDACION'),SYSTEM
                       ENTRY(@n-14),AT(34,5,64,10),USE(PAGL:IDSOCIO),RIGHT(1)
                       ENTRY(@n-14),AT(34,26,22,10),USE(PAGL:SUCURSAL),RIGHT(1)
                       ENTRY(@n-14),AT(59,26,64,10),USE(PAGL:IDRECIBO),RIGHT(1)
                       BUTTON('Verificar Liquidaciones'),AT(6,43,121,14),USE(?Button5),LEFT,ICON(ICON:Zoom),FLAT
                       GROUP('Liquidaciones Pendientes'),AT(4,58,217,146),USE(?Group1),BOXED,DISABLE
                         LIST,AT(7,69,205,114),USE(?List),HVSCROLL,FORMAT('13L(2)|M~T~@s1@23L(2)|M~MES~@n-3@28L(' & |
  '2)|M~ANO~@n-5@48L(2)|M~MONTO~@N(12.`2)@40D(2)|M~DEBITO~L@n10.2@61L(2)|M~IDLIQUIDACIO' & |
  'N~@n-7@120L(2)|M~NOMPRE CORTO~@s30@60D(2)|M~PRESENTADO~L@s2@45D(2)|M~PERIODO~L@s6@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records'),VCR
                         BUTTON('&Marcar'),AT(10,187,51,13),USE(?DASTAG)
                         BUTTON('Marcar Todos'),AT(85,187,51,13),USE(?DASTAGAll)
                         BUTTON('&Decamarcar'),AT(160,187,51,13),USE(?DASUNTAGALL)
                         BUTTON('&Rev tags'),AT(169,252,50,13),USE(?DASREVTAG),DISABLE,HIDE
                         BUTTON('sho&W tags'),AT(94,250,70,13),USE(?DASSHOWTAG),DISABLE,HIDE
                       END
                       GROUP('Total Liquidaciones'),AT(225,59,199,187),USE(?Group2),BOXED,DISABLE
                         PROMPT('Monto Total Liquidación:'),AT(229,74),USE(?Prompt4)
                         STRING(@N$-12.`2),AT(334,74),USE(LOC:MONTO_LIC)
                         PROMPT('Total por Seguro Prof. adeud:'),AT(229,126),USE(?Prompt5)
                         STRING(@N$-10.`2),AT(334,126),USE(PAGL:SEGURO)
                         PROMPT('Cant:'),AT(382,126),USE(?Prompt11)
                         STRING(@n-3),AT(402,126),USE(PAGL:CANT_CUOTA_S)
                         STRING('Imp. Deb/Cred.:'),AT(229,139),USE(?String11)
                         STRING(@N$-10.`2),AT(334,139),USE(PAGL:MONTO_IMP_TOTAL)
                         STRING('Crédito:'),AT(229,153),USE(?String13)
                         STRING(@N$-10.`2),AT(334,152),USE(PAGL:CREDITO,,?PAGL:CREDITO:2)
                         STRING(@N$-10.`2),AT(334,164),USE(LOC:GASTOS_BANCARIOS)
                         PROMPT('Gastos Bancarios: '),AT(229,165),USE(?Prompt14)
                         LINE,AT(228,177,193,0),USE(?Line1),COLOR(COLOR:Black)
                         PROMPT('Total Cuota Solidaria:'),AT(229,87),USE(?Prompt6)
                         STRING(@N$-12.`2),AT(334,87),USE(LOC:GASTO_ADM)
                         PROMPT('Monto Total a Pagar:'),AT(232,180),USE(?Prompt9),FONT(,14)
                         STRING(@N$-13.`2),AT(346,180,73,14),USE(PAGL:MONTO),FONT(,14)
                         PROMPT('Forma Pago:'),AT(228,208),USE(?PAGL:IDSUBCUENTA:Prompt)
                         ENTRY(@n-14),AT(270,207,37,10),USE(PAGL:IDSUBCUENTA),RIGHT(1)
                         BUTTON('...'),AT(309,206,12,12),USE(?CallLookup:2)
                         STRING(@s50),AT(324,207,93,10),USE(SUB:DESCRIPCION)
                         PROMPT('Total Débitos:'),AT(229,100),USE(?Prompt7)
                         STRING(@N$-10.`2),AT(334,100),USE(LOC:MONTO_DEBITO)
                         PROMPT('Total por Cuotas Sociales adeud:'),AT(229,113),USE(?Prompt8)
                         STRING(@N$-10.`2),AT(334,113),USE(PAGL:CUOTA)
                         PROMPT('Cant:'),AT(382,113),USE(?Prompt10)
                         STRING(@n-3),AT(402,113),USE(PAGL:CANT_CUOTA)
                         BUTTON('&Liquidar'),AT(280,222,92,24),USE(?OK),FONT('Arial',14,,FONT:bold),LEFT,ICON('currency_dollar.ico'), |
  CURSOR('mano.cur'),DEFAULT,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y' & |
  ' Actualiza el Formulario')
                       END
                       GROUP('Extras'),AT(6,204,199,38),USE(?Group3),BOXED
                         PROMPT('MONTO IMP DEBITO:'),AT(11,213),USE(?PAGL:MONTO_IMP_DEBITO:Prompt)
                         ENTRY(@n$-10.2),AT(79,213,31,10),USE(PAGL:MONTO_IMP_DEBITO)
                         PROMPT('CREDITO:'),AT(11,226),USE(?PAGL:CREDITO:Prompt)
                         ENTRY(@n$-10.2),AT(78,227,32,10),USE(PAGL:CREDITO)
                       END
                       BUTTON('&Cancelar'),AT(380,256,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDSOCIO:'),AT(3,5),USE(?PAGL:IDSOCIO:Prompt),TRN
                       BUTTON('...'),AT(99,4,12,12),USE(?CallLookup)
                       STRING(@s30),AT(115,6),USE(SOC:NOMBRE)
                       BUTTON('Calcular Liquidación'),AT(10,246,84,18),USE(?Button4),LEFT,ICON(ICON:NextPage),DISABLE, |
  FLAT
                       PROMPT('IDRECIBO:'),AT(1,26),USE(?PAGL:IDRECIBO:Prompt),TRN
                       CHECK('AFECTADA'),AT(128,27),USE(PAGL:AFECTADA),VALUE('SI','NO')
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW8                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
DASBRW::9:DASTAGONOFF Routine
  GET(Queue:Browse,CHOICE(?List))
  BRW8.UpdateBuffer
   TAGS.PUNTERO = LIQ:IDLIQUIDACION
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = LIQ:IDLIQUIDACION
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
  IF DASBRW::9:TAGMOUSE = 1 THEN
    DASBRW::9:TAGMOUSE = 0
  ELSE
  DASBRW::9:TAGFLAG = 1
  POST(EVENT:ScrollDown,?List)
  END
DASBRW::9:DASTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW8.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW8::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = LIQ:IDLIQUIDACION
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW8.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::9:DASUNTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW8.Reset
  SETCURSOR
  BRW8.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::9:DASREVTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::9:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::9:QUEUE = TAGS
    ADD(DASBRW::9:QUEUE)
  END
  FREE(TAGS)
  BRW8.Reset
  LOOP
    NEXT(BRW8::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::9:QUEUE.PUNTERO = LIQ:IDLIQUIDACION
     GET(DASBRW::9:QUEUE,DASBRW::9:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = LIQ:IDLIQUIDACION
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW8.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::9:DASSHOWTAG Routine
   CASE DASBRW::9:TAGDISPSTATUS
   OF 0
      DASBRW::9:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::9:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::9:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW8.ResetSort(1)
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
  GlobalErrors.SetProcedureName('Formulario_PAGOS_LIQUIDACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAGL:IDSOCIO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAGL:Record,History::PAGL:Record)
  SELF.AddHistoryField(?PAGL:IDSOCIO,2)
  SELF.AddHistoryField(?PAGL:SUCURSAL,3)
  SELF.AddHistoryField(?PAGL:IDRECIBO,12)
  SELF.AddHistoryField(?PAGL:SEGURO,20)
  SELF.AddHistoryField(?PAGL:CANT_CUOTA_S,21)
  SELF.AddHistoryField(?PAGL:MONTO_IMP_TOTAL,26)
  SELF.AddHistoryField(?PAGL:CREDITO:2,27)
  SELF.AddHistoryField(?PAGL:MONTO,5)
  SELF.AddHistoryField(?PAGL:IDSUBCUENTA,15)
  SELF.AddHistoryField(?PAGL:CUOTA,18)
  SELF.AddHistoryField(?PAGL:CANT_CUOTA,19)
  SELF.AddHistoryField(?PAGL:MONTO_IMP_DEBITO,25)
  SELF.AddHistoryField(?PAGL:CREDITO,27)
  SELF.AddHistoryField(?PAGL:AFECTADA,16)
  SELF.AddUpdateFile(Access:PAGOS_LIQUIDACION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_LIQUIDACION.Open                          ! File CONTROL_LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACIONAlias.Open                             ! File LIQUIDACIONAlias used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS_LIQUIDACION.Open                            ! File PAGOS_LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS_LIQUIDACIONAlias.Open                       ! File PAGOS_LIQUIDACIONAlias used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SEGURO.Open                                       ! File SEGURO used by this procedure, so make sure it's RelationManager is open
  Relate:SEGURO_FACTURA.Open                               ! File SEGURO_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGOS_LIQUIDACION
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
  BRW8.Init(?List,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:LIQUIDACION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PAGL:IDSOCIO{PROP:ReadOnly} = True
    ?PAGL:SUCURSAL{PROP:ReadOnly} = True
    ?PAGL:IDRECIBO{PROP:ReadOnly} = True
    DISABLE(?Button5)
    DISABLE(?DASTAG)
    DISABLE(?DASTAGAll)
    DISABLE(?DASUNTAGALL)
    DISABLE(?DASREVTAG)
    DISABLE(?DASSHOWTAG)
    ?PAGL:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?PAGL:MONTO_IMP_DEBITO{PROP:ReadOnly} = True
    ?PAGL:CREDITO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    DISABLE(?Button4)
    ?PAGL:AFECTADA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW8.Q &= Queue:Browse
  BRW8.RetainRow = 0
  BRW8.AddSortOrder(,LIQ:FK_LIQUIDACION_SOCIO)             ! Add the sort order for LIQ:FK_LIQUIDACION_SOCIO for sort order 1
  BRW8.AddRange(LIQ:IDSOCIO,GLO:IDSOCIO)                   ! Add single value range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,LIQ:IDSOCIO,,BRW8)             ! Initialize the browse locator using  using key: LIQ:FK_LIQUIDACION_SOCIO , LIQ:IDSOCIO
  BRW8.AppendOrder('LIQ:IDLIQUIDACION')                    ! Append an additional sort order
  BRW8.SetFilter('(LIQ:COBRADO = ''SI''  AND LIQ:PAGADO = ''NO'')') ! Apply filter expression to browse
  BRW8.AddField(T,BRW8.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:MES,BRW8.Q.LIQ:MES)                    ! Field LIQ:MES is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:ANO,BRW8.Q.LIQ:ANO)                    ! Field LIQ:ANO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:MONTO,BRW8.Q.LIQ:MONTO)                ! Field LIQ:MONTO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:DEBITO,BRW8.Q.LIQ:DEBITO)              ! Field LIQ:DEBITO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:IDLIQUIDACION,BRW8.Q.LIQ:IDLIQUIDACION) ! Field LIQ:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW8.AddField(OBR:NOMPRE_CORTO,BRW8.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:COBRADO,BRW8.Q.LIQ:COBRADO)            ! Field LIQ:COBRADO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:PERIODO,BRW8.Q.LIQ:PERIODO)            ! Field LIQ:PERIODO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:IDSOCIO,BRW8.Q.LIQ:IDSOCIO)            ! Field LIQ:IDSOCIO is a hot field or requires assignment from browse
  BRW8.AddField(OBR:IDOS,BRW8.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  INIMgr.Fetch('Formulario_PAGOS_LIQUIDACION',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:CONF_EMP.Close
    Relate:CONTROL_LIQUIDACION.Close
    Relate:FACTURA.Close
    Relate:GASTOS.Close
    Relate:INGRESOS.Close
    Relate:LIQUIDACION.Close
    Relate:LIQUIDACIONAlias.Close
    Relate:PAGOS_LIQUIDACION.Close
    Relate:PAGOS_LIQUIDACIONAlias.Close
    Relate:RANKING.Close
    Relate:SEGURO.Close
    Relate:SEGURO_FACTURA.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_PAGOS_LIQUIDACION',QuickWindow) ! Save window data to non-volatile store
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
      SelectSUBCUENTAS
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
    OF ?Button5
      GLO:IDSOCIO = PAGL:IDSOCIO
      ENABLE(?Group1)
      ENABLE(?Button4)
      THISWINDOW.RESET(1)
      !!!!
      !!! BUSCO % DEL GASTO ADMINISTRATIVO
      COF:RAZON_SOCIAL = GLO:RAZON_SOCIAL
      ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
      CHEQUE$ = COF:IMP_CHEQUE
      IMP_CHEQUE$ = CHEQUE$ / 100
      NU# = 0 
      PAGL1:IDSOCIO = PAGL:IDSOCIO
      SET(PAGL1:FK_PAGOS_LIQUIDACION_SOCIOS,PAGL1:FK_PAGOS_LIQUIDACION_SOCIOS)
      LOOP
          IF ACCESS:PAGOS_LIQUIDACIONAlias.NEXT() THEN BREAK.
          IF PAGL1:IDSOCIO <> PAGL:IDSOCIO THEN BREAK.
          IF  NU# =  0 THEN 
              NU# = PAGL1:IDPAGOS
              PAGL:MONTO_IMP_DEBITO = PAGL1:MONTO * IMP_CHEQUE$
              !MESSAGE('ENTRO')
          ELSE 
              IF PAGL1:IDPAGOS > NU# THEN 
                  NU# = PAGL1:IDPAGOS
                  PAGL:MONTO_IMP_DEBITO = PAGL1:MONTO * IMP_CHEQUE$ 
                  !MESSAGE('ENTRO2')
              END 
               
          END 
      END !! LOOP  
      
      ENABLE(?Group1)
      ENABLE(?Button4)
      THISWINDOW.RESET(1)
    OF ?OK
      IF PAGL:SUCURSAL <> '' AND PAGL:IDRECIBO <> '' AND PAGL:IDSUBCUENTA <> 0 AND PAGL:MONTO > 0  THEN
          PAGL:MONTO_FACTURA  =  LOC:MONTO_LIC
          PAGL:FECHA          =  today()
          PAGL:HORA           =  clock()
          PAGL:MES            =  MONTH(TODAY())
          PAGL:ANO            =  YEAR(TODAY())
          PAGL:PERIODO        =  PAGL:ANO&(FORMAT(PAGL:MES,@N02))
          PAGL:IDUSUARIO      =  GLO:IDUSUARIO
          PAGL:DEBITO         =  LOC:MONTO_DEBITO
          PAGL:GASTOS_ADM     =  LOC:GASTO_ADM
          PAGL:GASTOS_BANCARIOS = LOC:GASTOS_BANCARIOS
          GLO:MONTO = PAGL:MONTO
          PAGL:IDLIQUIDACION = GLO:IDSOLICITUD
          !!! CONTROL_LIQUIDACION
          CON31:IDSOCIO = PAGL:IDSOCIO
          GET(CONTROL_LIQUIDACION,CON31:FK_CONTROL_LIQUIDACION)
          IF ERRORCODE() = 35 THEN
              CON31:IDSOCIO = PAGL:IDSOCIO
              CON31:MES    = MONTH(TODAY())
              CON31:ANO    = YEAR(TODAY())
              CON31:PERIODO = CON31:ANO&(FORMAT(CON31:MES,@N02))
              CON31:NUMERO = 1
              NUMERO# = 1
              ACCESS:CONTROL_LIQUIDACION.INSERT()
              
         ELSE
              CON31:MES    = MONTH(TODAY())
              CON31:ANO    = YEAR(TODAY())
              CON31:PERIODO = CON31:ANO&(FORMAT(CON31:MES,@N02))
              CON31:NUMERO = CON31:NUMERO + 1
              NUMERO# = CON31:NUMERO
              ACCESS:CONTROL_LIQUIDACION.UPDATE()
              
         END
         PAGL:SOCIOS_LIQUIDACION =  NUMERO#
      ELSE
          MESSAGE('No se cargaron Datos esenciales para efectuar la Liquidación')
          cycle
      end
      
      
    OF ?Button4
      GLO:IDSOCIO = PAGL:IDSOCIO
      GLO:MONTO = 0
      LOC:MONTO_LIC =  0
      LOC:MONTO_DEBITO = 0
      !!! BUSCO % DEL GASTO ADMINISTRATIVO
      COF:RAZON_SOCIAL = GLO:RAZON_SOCIAL
      ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
      COMISION$ = COF:PORCENTAJE_LIQUIDACION
      COMISION_GTO$ = COMISION$ / 100
      CHEQUE$ = COF:IMP_CHEQUE
      IMP_CHEQUE$ = CHEQUE$ / 100
      CHEQUERA$ = COF:CHEQUERA
      
      
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          LIQ:IDLIQUIDACION = tags:Puntero
          GET(LIQUIDACION,LIQ:PK_LIQUIDACION)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO FACTURA')
          ELSE
              GLO:MONTO = GLO:MONTO + LIQ:MONTO
              LOC:MONTO_LIC    = LOC:MONTO_LIC    +  LIQ:MONTO
              LOC:MONTO_DEBITO = LOC:MONTO_DEBITO +  LIQ:DEBITO
              LOC:GASTO_ADM = LOC:GASTO_ADM  + (LIQ:MONTO * COMISION_GTO$)
              GLO:IDSOLICITUD = LIQ:IDLIQUIDACION
            
          end
      end
      LOC:GASTOS_BANCARIOS = CHEQUERA$ !! nuevo 24 07 2014 se paramos de tos adm  SUMA EL VALOR DE LA CHEQUERA AL GSTO ADM.
      !! BUSCO TOTAL CUOTAS
      GLO:MONTO = 0
      GLO:INTERES = 0 
      MONTO_PARCIAL$ =  LOC:MONTO_LIC - (LOC:MONTO_DEBITO  + LOC:GASTO_ADM)
      FAC:IDSOCIO = GLO:IDSOCIO
      SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
      LOOP
          IF ACCESS:FACTURA.NEXT() THEN BREAK.
          IF FAC:IDSOCIO <> GLO:IDSOCIO THEN BREAK.
          IF FAC:ESTADO = '' THEN
              !! CALCULA SI SUMANDO EL MONTO DE LA FACTURA QUEDA RESTO PARA PAGAR
              MONTO_PARCIAL$ = MONTO_PARCIAL$ -  FAC:TOTAL
              IF  MONTO_PARCIAL$ > 0 THEN
                  PAGL:CANT_CUOTA  = PAGL:CANT_CUOTA +1
                  !!! CALCULA INTERES
                  !!! SACO PERIODO MENOS PARA CARGAR INTERES
                  MES# = MONTH (TODAY())
                  ANO# = YEAR(TODAY())
                  PERIODO$  = FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
                  IF FAC:PERIODO >=  PERIODO$ THEN
                      GLO:MONTO =FAC:TOTAL - FAC:DESCUENTOCOBERTURA
                      !!! SUMA LOS INTERESES PARA LUEGO IMPRIMIR PAGO A CUENTA
                      GLO:INTERES = GLO:INTERES + FAC:DESCUENTOCOBERTURA 
                  ELSE
                      GLO:MONTO = FAC:TOTAL
                  END
      
                  PAGL:CUOTA = PAGL:CUOTA + GLO:MONTO
              END
          END
      END
      
      !! BUSCO TOTAL CUOTAS SEGURO
      SEG5:IDSOCIO =  GLO:IDSOCIO
      SET(SEG5:FK_SEGURO_FACTURA_SOCIO,SEG5:FK_SEGURO_FACTURA_SOCIO)
      LOOP
          IF ACCESS:SEGURO_FACTURA.NEXT() THEN BREAK.
          IF SEG5:IDSOCIO <> GLO:IDSOCIO THEN BREAK.
          IF SEG5:ESTADO = '' THEN
              !! CALCULA SI SUMANDO EL MONTO DE LA FACTURA QUEDA RESTO PARA PAGAR
              MONTO_PARCIAL$ = MONTO_PARCIAL$ -  SEG5:TOTAL
              IF  MONTO_PARCIAL$ > 0 THEN
                  PAGL:CANT_CUOTA_S  = PAGL:CANT_CUOTA_S +1
                  PAGL:SEGURO = PAGL:SEGURO + SEG5:TOTAL
              END
          END
      END
      !! SACA EL % DEL IMPUESTO AL CHEQUE Y LO DESCUENTA DEL MONTO
      PAGL:IMP_CHEQUE =  IMP_CHEQUE$
      SACA_MONTO$ =  LOC:MONTO_LIC - LOC:MONTO_DEBITO
      PAGL:MONTO_IMP_CHEQUE = (SACA_MONTO$ * IMP_CHEQUE$)
      PAGL:MONTO_IMP_TOTAL = PAGL:MONTO_IMP_CHEQUE + PAGL:MONTO_IMP_DEBITO !! SUMO LOS 2 IMPUESTOS
      !!!!!!!!!!!!!!!!!!
      
      PAGL:MONTO =  LOC:MONTO_LIC - (LOC:MONTO_DEBITO  + LOC:GASTO_ADM + PAGL:CUOTA + PAGL:SEGURO + PAGL:MONTO_IMP_TOTAL + LOC:GASTOS_BANCARIOS )
      PAGL:MONTO = PAGL:MONTO + PAGL:CREDITO
      
      ENABLE(?Group2)
      disable(?Group1)
      disable(?Button4)
      THISWINDOW.RESET(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAGL:IDSOCIO
      SOC:IDSOCIO = PAGL:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAGL:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAGL:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGOS_LIQUIDACION.TryValidateField(2)      ! Attempt to validate PAGL:IDSOCIO in PAGOS_LIQUIDACION
        SELECT(?PAGL:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAGL:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAGL:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?PAGL:IDSUBCUENTA
      IF PAGL:IDSUBCUENTA OR ?PAGL:IDSUBCUENTA{PROP:Req}
        SUB:IDSUBCUENTA = PAGL:IDSUBCUENTA
        IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            PAGL:IDSUBCUENTA = SUB:IDSUBCUENTA
          ELSE
            SELECT(?PAGL:IDSUBCUENTA)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = PAGL:IDSUBCUENTA
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAGL:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAGL:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAGL:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
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
          PAGL:IDLIQUIDACION = GLO:IDSOLICITUD
          ACCESS:PAGOS_LIQUIDACION.TRYFETCH(PAGL:IDX_PAGOS_LIQUIDACION_PAGO)
          GLO:PAGO = PAGL:IDPAGOS
          GLO:GTO_ADM = 'Pago Cuota Solidaria, Liquidación Nº'&PAGL:IDPAGOS
      IF PAGL:AFECTADA = '' THEN !!! NO SE ASIENTA EN FINANZAS
          !! SACO DE LA CAJA
          SUB:IDSUBCUENTA = PAGL:IDSUBCUENTA
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          !!! MODIFICA EL FLUJO DE FONDOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO - PAGL:MONTO
          FON:FECHA = TODAY()
          FON:HORA = CLOCK()
          ACCESS:FONDOS.UPDATE()
          GLO:SUCURSAL = 0
          GLO:RECIBO = 0
          !! BUSCO EL ID PROVEEDOR
          SOC:IDSOCIO = PAGL:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          IDPROVEEDOR# = SOC:IDPROVEEDOR
  
          !!!!   CARGA EN CAJA SI SE DE CAJA
          IF SUB:CAJA = 'SI' THEN
              !!! CARGO CAJA
              CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
              CAJ:IDUSUARIO = PAGL:IDUSUARIO
              CAJ:DEBE =  0
              CAJ:HABER = PAGL:MONTO
              CAJ:OBSERVACION = 'COBRO GTO ADM AUTOM. LIQUIDACION : '&GLO:PAGO
              CAJ:FECHA = TODAY()
              CAJ:MES       =  MONTH(TODAY())
              CAJ:ANO       =  YEAR(TODAY())
              CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
              CAJ:SUCURSAL  =   PAGL:SUCURSAL
              CAJ:RECIBO    =   PAGL:IDRECIBO
              CAJ:TIPO      =   'EGRESO'
              CAJ:IDTRANSACCION =  PAGL:IDRECIBO
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
          
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          !! CARGA DE Nº DE RECIBO CON O SIN CUOTA
           Cargar_Recibo
          !! CARGO INGRESO  GASTO ADMINISTRATIVO
          !!!!!!
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   PAGL:IDUSUARIO
          ING:IDSUBCUENTA      =   14 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
          ING:OBSERVACION      =   'COBRO GTO ADM AUTOM. LIQUIDACION : '&GLO:PAGO
          ING:MONTO            =   PAGL:GASTOS_ADM
          ING:FECHA            =   PAGL:FECHA
          ING:HORA             =   PAGL:HORA
          ING:MES              =   PAGL:MES
          ING:ANO              =   PAGL:ANO
          ING:PERIODO          =   PAGL:PERIODO
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   GLO:SUCURSAL
          ING:IDRECIBO         =   GLO:RECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
          !!! NO MODIFICA EL FLUJO DE FONDOS POR QUE SOLO SALE LO QUE SE PAGA LO DEMAS VA CON FONDO = 0
          ! LIBRO DIARIO
              CUE:IDCUENTA = 11 !! PAGOS POR LIQUIDACION
              ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
              IF CUE:TIPO = 'INGRESO' THEN
                  LIB:IDSUBCUENTA =  14
                  LIB:DEBE =  PAGL:GASTOS_ADM
                  LIB:HABER = 0
                  LIB:OBSERVACION = 'COBRO GTO. ADM EN LA  LIQUIDACION '&GLO:PAGO
                  LIB:FECHA = TODAY()
                  LIB:HORA = CLOCK()
                  LIB:MES       =  MONTH(TODAY())
                  LIB:ANO       =  YEAR(TODAY())
                  LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
                  LIB:SUCURSAL  =  PAGL:SUCURSAL
                  LIB:RECIBO       = PAGL:IDRECIBO
                  LIB:IDPROVEEDOR  =  IDPROVEEDOR#
                  LIB:TIPO         =  'INGRESO'
                  LIB:IDTRANSACCION =  ING:IDINGRESO
                  LIB:FONDO = 0
                  !!! DISPARA STORE PROCEDURE
                  RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
                  NEXT(RANKING)
                  LIB:IDLIBDIARIO = RAN:C1
                  !!!!!!!!!!!
                  ACCESS:LIBDIARIO.INSERT()
               END
               
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
          !! CARGO INGRESO  IMPUESTO AL CHEQUE
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   PAGL:IDUSUARIO
          ING:IDSUBCUENTA      =   52 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
          ING:OBSERVACION      =   'IMP. AL DEB/CRED. LIQUIDACION: '&GLO:PAGO
          ING:MONTO            =   PAGL:MONTO_IMP_TOTAL
          ING:FECHA            =   PAGL:FECHA
          ING:HORA             =   PAGL:HORA
          ING:MES              =   PAGL:MES
          ING:ANO              =   PAGL:ANO
          ING:PERIODO          =   PAGL:PERIODO
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   PAGL:SUCURSAL
          ING:IDRECIBO         =   PAGL:IDRECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
          ! LIBRO DIARIO
          CUE:IDCUENTA = 11 !! PAGOS POR LIQUIDACION
          ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
          IF CUE:TIPO = 'INGRESO' THEN
                  LIB:IDSUBCUENTA =  52
                  LIB:DEBE =  PAGL:MONTO_IMP_TOTAL
                  LIB:HABER = 0
                  LIB:OBSERVACION = 'IMP. AL DEB/CRED. LIQUIDACION: '&GLO:PAGO
                  LIB:FECHA = TODAY()
                  LIB:HORA = CLOCK()
                  LIB:MES       =  MONTH(TODAY())
                  LIB:ANO       =  YEAR(TODAY())
                  LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
                  LIB:SUCURSAL  =  PAGL:SUCURSAL
                  LIB:RECIBO       = PAGL:IDRECIBO
                  LIB:IDPROVEEDOR  =  IDPROVEEDOR#
                  LIB:TIPO         =  'INGRESO'
                  LIB:IDTRANSACCION =  ING:IDINGRESO
                  LIB:FONDO = 0
                  !!! DISPARA STORE PROCEDURE
                  RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
                  NEXT(RANKING)
                  LIB:IDLIBDIARIO = RAN:C1
                  !!!!!!!!!!!
                  ACCESS:LIBDIARIO.INSERT()
               END
           
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          IF PAGL:CUOTA > 0 THEN !! SE LE COBRO ALGO EN LA CUOTA
              !!!!!!
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              ING:IDUSUARIO        =   PAGL:IDUSUARIO
              ING:IDSUBCUENTA      =   13 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
              ING:OBSERVACION      =   'COBRO AUTOM. LIQUICACION : '&GLO:PAGO
              ING:MONTO            =   PAGL:CUOTA
              ING:FECHA            =   PAGL:FECHA
              ING:HORA             =   PAGL:HORA
              ING:MES              =   PAGL:MES
              ING:ANO              =   PAGL:ANO
              ING:PERIODO          =   PAGL:PERIODO
              ING:IDPROVEEDOR      =   IDPROVEEDOR#
              ING:SUCURSAL         =   GLO:SUCURSAL
              ING:IDRECIBO         =   GLO:RECIBO
              !!! CARGA
              RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
              NEXT(RANKING)
              ING:IDINGRESO = RAN:C1
              !MESSAGE(ING:IDINGRESO)
              ACCESS:INGRESOS.INSERT()
  
              ! LIBRO DIARIO COBRO CUOTA
              ! LIBRO DIARIO DEL PAGO DE LA LIQUIDACION
              CUE:IDCUENTA = 1!! PAGOS POR LIQUIDACION
              ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
              IF CUE:TIPO = 'INGRESO' THEN
                  LIB:IDSUBCUENTA = 13
                  LIB:DEBE =  PAGL:CUOTA
                  LIB:HABER = 0
                  LIB:OBSERVACION = 'COBRO DE CUOTA EN LA  LIQUIDACION '&GLO:PAGO
                  LIB:FECHA = TODAY()
                  LIB:HORA = CLOCK()
                  LIB:MES       =  MONTH(TODAY())
                  LIB:ANO       =  YEAR(TODAY())
                  LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
                  LIB:SUCURSAL  =  GLO:SUCURSAL
                  LIB:RECIBO       = GLO:RECIBO
                  LIB:IDPROVEEDOR  =  IDPROVEEDOR#
                  LIB:TIPO         =  'INGRESO'
                  LIB:IDTRANSACCION =  ING:IDINGRESO
                  LIB:FONDO = 0
                  !!! DISPARA STORE PROCEDURE
                  RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
                  NEXT(RANKING)
                  LIB:IDLIBDIARIO = RAN:C1
                  !!!!!!!!!!!
                  ACCESS:LIBDIARIO.INSERT()
              END
          END !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! CARGA INTERESES A CUENTA
        !  IF Glo:INTERES > 0 THEN 
        !      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
        !      ING:IDUSUARIO        =   PAGL:IDUSUARIO
        !      ING:IDSUBCUENTA      =   13 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
       !       ING:OBSERVACION      =   'NOTA DE XXXXXXXXXXXXXXXXXXXX: '&GLO:PAGO
      !        ING:MONTO            =   PAGL:CUOTA
     !         ING:FECHA            =   PAGL:FECHA
     !         ING:HORA             =   PAGL:HORA
     !         ING:MES              =   PAGL:MES
     !         ING:ANO              =   PAGL:ANO
     !         ING:PERIODO          =   PAGL:PERIODO
     !         ING:IDPROVEEDOR      =   IDPROVEEDOR#
     !         ING:SUCURSAL         =   GLO:SUCURSAL
     !          ING:IDRECIBO         =   GLO:RECIBO
    !          !!! CARGA
    !           RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
  !            NEXT(RANKING)
  !            ING:IDINGRESO = RAN:C1
            !  ACCESS:INGRESOS.INSERT()    
              
  !        END     
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          IF PAGL:SEGURO > 0 THEN
              !! CARGO INGRESO  COMISION POR SEGURO
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              ING:IDUSUARIO        =   PAGL:IDUSUARIO
              ING:IDSUBCUENTA      =   15 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
              ING:OBSERVACION      =   'COBRO SEGURO AUTOM. LIQUICACION : '&GLO:PAGO
              ING:MONTO            =   PAGL:SEGURO
              ING:FECHA            =   PAGL:FECHA
              ING:HORA             =   PAGL:HORA
              ING:MES              =   PAGL:MES
              ING:ANO              =   PAGL:ANO
              ING:PERIODO          =   PAGL:PERIODO
              ING:IDPROVEEDOR      =   IDPROVEEDOR#
              ING:SUCURSAL         =   IDPROVEEDOR#!! en ingresos
              ING:IDRECIBO         =   PAGL:IDRECIBO
              !!! CARGA
              RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
              NEXT(RANKING)
              ING:IDINGRESO = RAN:C1
              !MESSAGE(ING:IDINGRESO)
              ACCESS:INGRESOS.INSERT()
  
              ! LIBRO DIARIO DEL COBRO SE SEGURO
              CUE:IDCUENTA = 11 !! PAGOS POR LIQUIDACION
              ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
              IF CUE:TIPO = 'INGRESO' THEN
                  LIB:IDSUBCUENTA = 15
                  LIB:DEBE =  PAGL:SEGURO
                  LIB:HABER = 0
                  LIB:OBSERVACION = 'COBRO SE SEGURO EN LA  LIQUIDACION '&GLO:PAGO
                  LIB:FECHA = TODAY()
                  LIB:HORA = CLOCK()
                  LIB:MES       =  MONTH(TODAY())
                  LIB:ANO       =  YEAR(TODAY())
                  LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
                  LIB:SUCURSAL  =  IDPROVEEDOR#!! en ingresos
                  LIB:RECIBO       = PAGL:IDRECIBO
                  LIB:IDPROVEEDOR  =  IDPROVEEDOR#
                  LIB:TIPO         =  'INGRESO'
                  LIB:IDTRANSACCION =  ING:IDINGRESO
                  LIB:FONDO = 0
                  !!! DISPARA STORE PROCEDURE
                  RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
                  NEXT(RANKING)
                  LIB:IDLIBDIARIO = RAN:C1
                  !!!!!!!!!!!
                  ACCESS:LIBDIARIO.INSERT()
               END
          END !!!
  
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
          !! CARGO EGRESO POR PAGO LIQDUIACION
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          GAS:IDUSUARIO        =  PAGL:IDUSUARIO
          GAS:IDSUBCUENTA      =  11 !! SUBCUENTA DE PAGO  POR LIQUIDACION
          GAS:OBSERVACION      =  'PAGO DE LIQUICACION : '&GLO:PAGO
          GAS:MONTO           =   PAGL:MONTO
          GAS:FECHA           =   PAGL:FECHA
          GAS:HORA           =    PAGL:HORA
          GAS:MES             =   PAGL:MES
          GAS:ANO            =    PAGL:ANO
          GAS:PERIODO          =  PAGL:PERIODO
          GAS:IDPROVEEDOR      =  IDPROVEEDOR#
          GAS:SUCURSAL         =  PAGL:SUCURSAL
          GAS:IDRECIBO        =   PAGL:IDRECIBO
          GAS:IDTIPO_COMPROBANTE = 1
          GAS:LETRA = 'X'
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_GASTOS_ID'
          NEXT(RANKING)
          GAS:IDGASTOS = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          add(GASTOS)
          if errorcode() then message(error()).
  
          ! LIBRO DIARIO DEL PAGO DE LA LIQUIDACION
          CUE:IDCUENTA = 10 !! PAGOS POR LIQUIDACION
          ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
          IF CUE:TIPO = 'EGRESO' THEN
              LIB:IDSUBCUENTA = 11
              LIB:DEBE = 0
              LIB:HABER = PAGL:MONTO
              LIB:OBSERVACION = 'PAGO AL SOCIO POR LIQUIDACION: '&GLO:PAGO
              LIB:FECHA = TODAY()
              LIB:HORA = CLOCK()
              LIB:MES       =  MONTH(TODAY())
              LIB:ANO       =  YEAR(TODAY())
              LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
              LIB:SUCURSAL  =  PAGL:SUCURSAL
              LIB:RECIBO       = PAGL:IDRECIBO
              LIB:IDPROVEEDOR  =  IDPROVEEDOR#
              LIB:TIPO         =  'EGRESO'
              LIB:IDTRANSACCION =  GAS:IDGASTOS
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
  
  
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! CANCELO FACTURAS
  !!! CANCELO TODO.. POR QUE TEORICAMENTE COBRO TODA LA DEUDA CON LA LIQUIDACION
          IF PAGL:CUOTA > 0 THEN
              GLO:DETALLE_RECIBO = ''
              XX" = ''
              cuenta# = PAGL:CANT_CUOTA
              FAC:IDSOCIO = PAGL:IDSOCIO
              SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
              LOOP
                  IF ACCESS:FACTURA.NEXT() THEN BREAK.
                  IF FAC:IDSOCIO <> PAGL:IDSOCIO THEN BREAK.
                  IF FAC:ESTADO = ''AND CUENTA# > 0  THEN
                      FAC:ESTADO = 'PAGADO'
                      FAC:IDPAGO_LIQ = GLO:PAGO
                      MES" = FORMAT(FAC:MES,@N02)
                      ANO" = FORMAT(FAC:ANO,@N04)
                      LOC:CUOTA =  CLIP(MES")&'-'&CLIP(ANO")&','&LOC:CUOTA
                      PUT(FACTURA)
                      !MESSAGE(GLO:DETALLE_RECIBO)
                      !! DESCUENTA 1 A LA CANTIDAD DE CUOTAS EN PADRON
                      SOC:IDSOCIO = FAC:IDSOCIO
                      ACCESS:SOCIOS.TRyFETCH(SOC:PK_SOCIOS)
                      SOC:CANTIDAD = SOC:CANTIDAD - 1
                      PUT(SOCIOS)
                      CUENTA# = CUENTA# - 1
                      
                  END
              END
              !!! CARGA DESCRIPCION DE RECIBO PARA IMPRIMIR
              GLO:DETALLE_RECIBO = 'Pago de Cuota de Mat. : '&CLIP(LOC:CUOTA)&'| y'&CLIP(GLO:GTO_ADM)
              
          END
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! CANCELO FACTURA SEGURO
  !!!! CANCELO TODA LAS CUOTAS ADEUDADAS.
          IF PAGL:SEGURO > 0 THEN
              CUENTA# = PAGL:CANT_CUOTA_S
              SEG5:IDSOCIO = PAGL:IDSOCIO
              SET(SEG5:FK_SEGURO_FACTURA_SOCIO,SEG5:FK_SEGURO_FACTURA_SOCIO)
              LOOP
                  IF ACCESS:SEGURO_FACTURA.NEXT() THEN BREAK.
                  IF  SEG5:IDSOCIO <> PAGL:IDSOCIO THEN BREAK.
                  IF SEG5:ESTADO = '' AND CUENTA# > 0 THEN
                      SEG5:ESTADO = 'PAGADO'
                      SEG5:IDPAGO_LIQ = PAGL:IDPAGOS
                      MES" = FORMAT(SEG5:MES,@N02)
                      ANO" = FORMAT(SEG5:ANO,@N04)
                      SEGURO" =  CLIP(MES")&'-'&CLIP(ANO")&','&SEGURO"
                      PUT(SEGURO_FACTURA)
                      !! DESCUENTA 1 A LA CANTIDAD DE CUOTAS ADEUDADAS
                      SEG:IDSOCIO = SEG5:IDSOCIO
                      ACCESS:SEGURO.TRYFETCH(SEG:FK_SEGURO_SOCIOS)
                      SEG:CANTIDAD = SEG:CANTIDAD - 1
                      PUT(SEGURO)
                      CUENTA# = CUENTA# - 1
                  END
              END
             !!! CARGA DESCRIPCION DE RECIBO PARA IMPRIMIR
             GLO:CARGA_sTRING = 'Pago de seguro. : '&SEGURO"
           END
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !! CANCELO LAS LIQUIDACIONES
           Loop i# = 1 to records(Tags)
              get(Tags,i#)
              LIQ:IDLIQUIDACION = tags:Puntero
              GET(LIQUIDACION,LIQ:PK_LIQUIDACION)
              IF ERRORCODE() = 35 THEN
                  MESSAGE('NO ENCONTRO FACTURA')
              ELSE
                  LIQ:PAGADO = 'SI'
                  LIQ:IDPAGO_LIQUIDACION = GLO:PAGO
                  PUT(LIQUIDACION)
                
              end
          end
  
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         !!! PARA CERRAR
  
          PAGL:IDLIQUIDACION = GLO:IDSOLICITUD
          ACCESS:PAGOS_LIQUIDACION.TRYFETCH(PAGL:IDX_PAGOS_LIQUIDACION_PAGO)
          GLO:PAGO = PAGL:IDPAGOS
          NUMERO# = PAGL:SOCIOS_LIQUIDACION
          !!! CARGO EN LA LIQUIDACION EL Nº DE PAGO
          Loop i# = 1 to records(Tags)
              get(Tags,i#)
              LIQ:IDLIQUIDACION = tags:Puntero
              GET(LIQUIDACION,LIQ:PK_LIQUIDACION)
              IF ERRORCODE() = 35 THEN
                  MESSAGE('NO ENCONTRO FACTURA')
              ELSE
                  LIQ:IDPAGO_LIQUIDACION =  GLO:PAGO
                  LIQ:SOCIOS_LIQUIDACION = NUMERO#
                  PUT(LIQUIDACION)
              end
          end
          imprime" = 'SI'
          IF PAGL:CUOTA > 0 THEN
              Message('Inserte en la impresora un Recibo Legal','Descuento de Cuota por Liquidación',ICON:EXCLAMATION)
              IMPRIMIR_COBRO_CUOTA_LIQ
              imprime" = 'NO'
  
          end
          if imprime" = 'SI' then
              Message('Inserte en la impresora un Recibo Legal','Descuento de Cuota por Liquidación',ICON:EXCLAMATION)
              IMPRIMIR_COBRO_GTO_ADM
          end
          !!! SI HUBIERA DESCUENTO EN CUOTAS 
       !  IF GLO:INTERES > 0 THEN 
       !      Message('Inserte en la impresora un Recibo Legal','Descuento de Cuota por Liquidación',ICON:EXCLAMATION)
       !       IMPRIMIR_INTERES
       !   END 
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          IF PAGL:CANT_CUOTA_S > 0 THEN
              Message('Inserte en la impresora una Hoja en Blanco','Descuento de Cuota por Liquidación',ICON:EXCLAMATION)
              IMPRIMIR_COBRO_SEGURO_LIQ
          end
         
          Message('Inserte en la impresora una Hoja en Blanco','Descueto de Cuota por Liquidación',ICON:EXCLAMATION)
          imPRIMIR_PAGO_LIQUIDACION
          
          GLO:IDSOLICITUD = 0
          GLO:MONTO     = 0
          GLO:DETALLE_RECIBO = ''
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
      IF KEYCODE() = MouseLeft AND (?List{PROPLIST:MouseDownRow} > 0) AND (DASBRW::9:TAGFLAG = 0)
        CASE ?List{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::9:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?List{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::9:TAGFLAG = 0
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


BRW8.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = LIQ:IDLIQUIDACION
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


BRW8.TakeKey PROCEDURE

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


BRW8.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW8::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW8::RecordStatus=ReturnValue
  IF BRW8::RecordStatus NOT=Record:OK THEN RETURN BRW8::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = LIQ:IDLIQUIDACION
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::9:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW8::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW8::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW8::RecordStatus
  RETURN ReturnValue

