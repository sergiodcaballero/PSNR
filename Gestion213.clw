

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION213.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION212.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION216.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION217.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION219.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO_INSCRIPCION File
!!! </summary>
CURSOS_PAGOS PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::13:TAGFLAG         BYTE(0)
DASBRW::13:TAGMOUSE        BYTE(0)
DASBRW::13:TAGDISPSTATUS   BYTE(0)
DASBRW::13:QUEUE          QUEUE
PUNTERO                       LIKE(PUNTERO)
PUNTERO2                      LIKE(PUNTERO2)
PUNTERO3                      LIKE(PUNTERO3)
PUNTERO4                      LIKE(PUNTERO4)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD         LONG                                  ! 
T                    STRING(1)                             ! 
LOC:AFECTADA         CSTRING(3)                            ! 
BRW1::View:Browse    VIEW(CURSO_INSCRIPCION)
                       PROJECT(CURI:IDINSCRIPCION)
                       PROJECT(CURI:MONTO_TOTAL)
                       PROJECT(CURI:PAGADO_TOTAL)
                       PROJECT(CURI:FECHA)
                       PROJECT(CURI:TERMINADO)
                       PROJECT(CURI:DESCUENTO)
                       PROJECT(CURI:ID_PROVEEDOR)
                       PROJECT(CURI:IDCURSO)
                       JOIN(CUR:PK_CURSO,CURI:IDCURSO)
                         PROJECT(CUR:DESCRIPCION)
                         PROJECT(CUR:IDCURSO)
                       END
                       JOIN(PRO2:PK_PROVEEDOR,CURI:ID_PROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:IDPROVEEDOR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CURI:IDINSCRIPCION     LIKE(CURI:IDINSCRIPCION)       !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
CUR:DESCRIPCION        LIKE(CUR:DESCRIPCION)          !List box control field - type derived from field
CURI:MONTO_TOTAL       LIKE(CURI:MONTO_TOTAL)         !List box control field - type derived from field
CURI:PAGADO_TOTAL      LIKE(CURI:PAGADO_TOTAL)        !List box control field - type derived from field
CURI:FECHA             LIKE(CURI:FECHA)               !List box control field - type derived from field
CURI:TERMINADO         LIKE(CURI:TERMINADO)           !List box control field - type derived from field
CURI:DESCUENTO         LIKE(CURI:DESCUENTO)           !List box control field - type derived from field
CURI:ID_PROVEEDOR      LIKE(CURI:ID_PROVEEDOR)        !List box control field - type derived from field
CUR:IDCURSO            LIKE(CUR:IDCURSO)              !Related join file key field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(CURSO_INSCRIPCION_DETALLE)
                       PROJECT(CURD:PAGADO)
                       PROJECT(CURD:IDINSCRIPCION)
                       PROJECT(CURD:IDCURSO)
                       PROJECT(CURD:ID_MODULO)
                       JOIN(CUR2:PK_CURSO_MODULOS,CURD:ID_MODULO)
                         PROJECT(CUR2:NUMERO_MODULO)
                         PROJECT(CUR2:DESCRIPCION)
                         PROJECT(CUR2:FECHA_FIN)
                         PROJECT(CUR2:ID_MODULO)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
CUR2:NUMERO_MODULO     LIKE(CUR2:NUMERO_MODULO)       !List box control field - type derived from field
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CURD:PAGADO            LIKE(CURD:PAGADO)              !List box control field - type derived from field
CUR2:FECHA_FIN         LIKE(CUR2:FECHA_FIN)           !List box control field - type derived from field
CURD:IDINSCRIPCION     LIKE(CURD:IDINSCRIPCION)       !List box control field - type derived from field
CURD:IDCURSO           LIKE(CURD:IDCURSO)             !List box control field - type derived from field
CURD:ID_MODULO         LIKE(CURD:ID_MODULO)           !List box control field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW12::View:Browse   VIEW(CURSO_CUOTA)
                       PROJECT(CUR1:IDCUOTA)
                       PROJECT(CUR1:MONTO)
                       PROJECT(CUR1:PAGADO)
                       PROJECT(CUR1:IDINSCRIPCION)
                       PROJECT(CUR1:IDCURSO)
                       PROJECT(CUR1:IDMODULO)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
T                      LIKE(T)                        !List box control field - type derived from local data
CUR1:IDCUOTA           LIKE(CUR1:IDCUOTA)             !List box control field - type derived from field
CUR1:MONTO             LIKE(CUR1:MONTO)               !List box control field - type derived from field
CUR1:PAGADO            LIKE(CUR1:PAGADO)              !List box control field - type derived from field
CUR1:IDINSCRIPCION     LIKE(CUR1:IDINSCRIPCION)       !List box control field - type derived from field
CUR1:IDCURSO           LIKE(CUR1:IDCURSO)             !List box control field - type derived from field
CUR1:IDMODULO          LIKE(CUR1:IDMODULO)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Inscripción a Curso'),AT(,,527,336),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Curso_Incripcion'),SYSTEM
                       LIST,AT(8,35,503,50),USE(?Browse:1),HSCROLL,FORMAT('34L(2)|M~Nº INSC~@n-7@200L(2)|M~INS' & |
  'CRIPTO~C(0)@s50@200L(2)|M~CURSO~C(0)@s50@66L(1)|M~MONTO_TOTAL~C(0)@n$-10.2@71L(1)|M~' & |
  'PAGADO_TOTAL~C(0)@s2@80L(2)|M~FECHA~C(0)@d17@49L(2)|M~TERMINADO~@s2@40D(12)|M~DESCUE' & |
  'NTO~C(0)@n-7.2@56L(2)|M~ID_PROVEEDOR~@n-7@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CURSO_INSCRIPCION')
                       BUTTON('&Ver'),AT(462,93,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Cambiar'),AT(412,93,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       GROUP('Módulos Adeudados'),AT(0,113,322,92),USE(?Group1),BOXED
                         LIST,AT(4,124,313,76),USE(?List),HVSCROLL,FORMAT('37L|M~Nº~L(2)@n-5@197L|M~MODULO~@s50@' & |
  '38L|M~PAGADO~L(2)@s2@40L|M~FECHA FIN~L(2)@d17@56L|M~IDINSCRIPCION~L(2)@n-14@56L|M~ID' & |
  'CURSO~L(2)@n-14@56L|M~ID MODULO~L(2)@n-14@'),FROM(Queue:Browse),IMM,MSG('Browsing Records')
                       END
                       GROUP,AT(326,116,196,185),USE(?Group2),BOXED
                         BUTTON('Calcular Monto'),AT(378,133,82,22),USE(?Button7),LEFT,ICON('calculator.ico'),FLAT
                         PROMPT(' Monto a Pagar:'),AT(333,168),USE(?Prompt3),FONT(,14)
                         STRING(@n$-10.2),AT(424,168),USE(GLO:MONTO),FONT(,14)
                         BUTTON('...'),AT(420,195,12,12),USE(?CallLookup:2)
                         PROMPT('Forma Pago:'),AT(338,196),USE(?GLO:IDSUBCUENTA_CURSO:Prompt)
                         ENTRY(@n-5),AT(384,196,33,10),USE(GLO:IDSUBCUENTA_CURSO),LEFT(1)
                         STRING(@s20),AT(435,196),USE(SUB:DESCRIPCION)
                         CHECK('AFECTADA'),AT(425,217),USE(LOC:AFECTADA),VALUE('SI','NO')
                         PROMPT('% DESCUENTO:'),AT(330,218),USE(?GLO:INTERES:Prompt)
                         ENTRY(@n-10.2),AT(386,218,33,10),USE(GLO:INTERES),DECIMAL(12)
                         LINE,AT(328,235,189,0),USE(?Line1),COLOR(COLOR:Black)
                         PROMPT('SUCURSAL:'),AT(332,243),USE(?GLO:SUCURSAL:Prompt)
                         ENTRY(@n-14),AT(382,242,33,10),USE(GLO:SUCURSAL),REQ
                         PROMPT('RECIBO:'),AT(418,242),USE(?GLO:IDRECIBO:Prompt)
                         ENTRY(@n-14),AT(450,242,66,10),USE(GLO:IDRECIBO),REQ
                         LINE,AT(329,263,191,0),USE(?Line2),COLOR(COLOR:Black)
                         BUTTON('PAGAR'),AT(386,270,67,26),USE(?Button13),LEFT,ICON('currency_dollar.ico'),DISABLE, |
  FLAT,HIDE
                       END
                       GROUP('Pagos'),AT(0,207,321,92),USE(?Group3),BOXED
                         LIST,AT(5,217,308,75),USE(?List:2),FORMAT('17L|M~T~L(2)@s1@38L|M~CUOTA~L(2)@n-3@40L|M~M' & |
  'ONTO~L(2)@n$-10.2@37L|M~PAGADO~L(2)@s2@56L|M~IDINSCRIPCION~L(2)@n-7@56L|M~IDCURSO~L(' & |
  '2)@n-7@56L|M~IDMODULO~L(2)@n-7@'),FROM(Queue:Browse:2),IMM,MSG('Browsing Records')
                       END
                       BUTTON('&Tag'),AT(4,306,32,13),USE(?DASTAG)
                       BUTTON('tag &All'),AT(43,306,45,13),USE(?DASTAGAll)
                       BUTTON('&Untag all'),AT(94,307,50,13),USE(?DASUNTAGALL)
                       BUTTON('&Rev tags'),AT(147,307,50,13),USE(?DASREVTAG)
                       BUTTON('sho&W tags'),AT(205,308,70,13),USE(?DASSHOWTAG)
                       SHEET,AT(0,1,520,110),USE(?CurrentTab)
                         TAB('ID INSCRIPTO'),USE(?Tab:1)
                           PROMPT('ID INSCRIPTO:'),AT(10,20),USE(?CURI:ID_PROVEEDOR:Prompt)
                           ENTRY(@n-14),AT(62,20,60,10),USE(CURI:ID_PROVEEDOR),RIGHT(1)
                           BUTTON('...'),AT(123,19,12,12),USE(?CallLookup)
                         END
                       END
                       BUTTON('&Salir'),AT(479,316,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
BRW12                CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW12::Sort0:Locator StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::13:DASTAGONOFF Routine
  GET(Queue:Browse:2,CHOICE(?List:2))
  BRW12.UpdateBuffer
   TAGS.PUNTERO = CUR1:IDINSCRIPCION
   TAGS.PUNTERO2 = CUR1:IDCURSO
   TAGS.PUNTERO3 = CUR1:IDMODULO
   TAGS.PUNTERO4 = CUR1:IDCUOTA
   GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
  IF ERRORCODE()
     TAGS.PUNTERO = CUR1:IDINSCRIPCION
     TAGS.PUNTERO2 = CUR1:IDCURSO
     TAGS.PUNTERO3 = CUR1:IDMODULO
     TAGS.PUNTERO4 = CUR1:IDCUOTA
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:2.T = T
  PUT(Queue:Browse:2)
  SELECT(?List:2,CHOICE(?List:2))
  IF DASBRW::13:TAGMOUSE = 1 THEN
    DASBRW::13:TAGMOUSE = 0
  ELSE
  DASBRW::13:TAGFLAG = 1
  POST(EVENT:ScrollDown,?List:2)
  END
DASBRW::13:DASTAGALL Routine
  ?List:2{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW12.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW12::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = CUR1:IDINSCRIPCION
     TAGS.PUNTERO2 = CUR1:IDCURSO
     TAGS.PUNTERO3 = CUR1:IDMODULO
     TAGS.PUNTERO4 = CUR1:IDCUOTA
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
  END
  SETCURSOR
  BRW12.ResetSort(1)
  SELECT(?List:2,CHOICE(?List:2))
DASBRW::13:DASUNTAGALL Routine
  ?List:2{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW12.Reset
  SETCURSOR
  BRW12.ResetSort(1)
  SELECT(?List:2,CHOICE(?List:2))
DASBRW::13:DASREVTAGALL Routine
  ?List:2{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::13:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::13:QUEUE = TAGS
    ADD(DASBRW::13:QUEUE)
  END
  FREE(TAGS)
  BRW12.Reset
  LOOP
    NEXT(BRW12::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::13:QUEUE.PUNTERO = CUR1:IDINSCRIPCION
     DASBRW::13:QUEUE.PUNTERO2 = CUR1:IDCURSO
     DASBRW::13:QUEUE.PUNTERO3 = CUR1:IDMODULO
     DASBRW::13:QUEUE.PUNTERO4 = CUR1:IDCUOTA
     GET(DASBRW::13:QUEUE,DASBRW::13:QUEUE.PUNTERO,DASBRW::13:QUEUE.PUNTERO2,DASBRW::13:QUEUE.PUNTERO3,DASBRW::13:QUEUE.PUNTERO4)
    IF ERRORCODE()
       TAGS.PUNTERO = CUR1:IDINSCRIPCION
       TAGS.PUNTERO2 = CUR1:IDCURSO
       TAGS.PUNTERO3 = CUR1:IDMODULO
       TAGS.PUNTERO4 = CUR1:IDCUOTA
       ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
    END
  END
  SETCURSOR
  BRW12.ResetSort(1)
  SELECT(?List:2,CHOICE(?List:2))
DASBRW::13:DASSHOWTAG Routine
   CASE DASBRW::13:TAGDISPSTATUS
   OF 0
      DASBRW::13:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::13:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::13:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW12.ResetSort(1)
   SELECT(?List:2,CHOICE(?List:2))
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CURSOS_PAGOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CURI:MONTO_TOTAL',CURI:MONTO_TOTAL)                ! Added by: BrowseBox(ABC)
  BIND('CURI:PAGADO_TOTAL',CURI:PAGADO_TOTAL)              ! Added by: BrowseBox(ABC)
  BIND('CURI:ID_PROVEEDOR',CURI:ID_PROVEEDOR)              ! Added by: BrowseBox(ABC)
  BIND('CUR:IDCURSO',CUR:IDCURSO)                          ! Added by: BrowseBox(ABC)
  BIND('CUR2:NUMERO_MODULO',CUR2:NUMERO_MODULO)            ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_FIN',CUR2:FECHA_FIN)                    ! Added by: BrowseBox(ABC)
  BIND('CURD:ID_MODULO',CURD:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_CUOTA.SetOpenRelated()
  Relate:CURSO_CUOTA.Open                                  ! File CURSO_CUOTA used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_INSCRIPCION,SELF) ! Initialize the browse manager
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:CURSO_INSCRIPCION_DETALLE,SELF) ! Initialize the browse manager
  BRW12.Init(?List:2,Queue:Browse:2.ViewPosition,BRW12::View:Browse,Queue:Browse:2,Relate:CURSO_CUOTA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CURI:FK_CURSO_INSCRIPCION_PROVEEDOR)  ! Add the sort order for CURI:FK_CURSO_INSCRIPCION_PROVEEDOR for sort order 1
  BRW1.AddRange(CURI:ID_PROVEEDOR,Relate:CURSO_INSCRIPCION,Relate:PROVEEDORES) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CURI:ID_PROVEEDOR,,BRW1)       ! Initialize the browse locator using  using key: CURI:FK_CURSO_INSCRIPCION_PROVEEDOR , CURI:ID_PROVEEDOR
  BRW1.SetFilter('(CUR:FECHA_FIN >= TODAY())')             ! Apply filter expression to browse
  BRW1.AddField(CURI:IDINSCRIPCION,BRW1.Q.CURI:IDINSCRIPCION) ! Field CURI:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:DESCRIPCION,BRW1.Q.CUR:DESCRIPCION)    ! Field CUR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CURI:MONTO_TOTAL,BRW1.Q.CURI:MONTO_TOTAL)  ! Field CURI:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CURI:PAGADO_TOTAL,BRW1.Q.CURI:PAGADO_TOTAL) ! Field CURI:PAGADO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CURI:FECHA,BRW1.Q.CURI:FECHA)              ! Field CURI:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CURI:TERMINADO,BRW1.Q.CURI:TERMINADO)      ! Field CURI:TERMINADO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:DESCUENTO,BRW1.Q.CURI:DESCUENTO)      ! Field CURI:DESCUENTO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:ID_PROVEEDOR,BRW1.Q.CURI:ID_PROVEEDOR) ! Field CURI:ID_PROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(CUR:IDCURSO,BRW1.Q.CUR:IDCURSO)            ! Field CUR:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,CURD:PK_CURSO_INSCRIPCION_DETALLE)   ! Add the sort order for CURD:PK_CURSO_INSCRIPCION_DETALLE for sort order 1
  BRW10.AddRange(CURD:IDINSCRIPCION,Relate:CURSO_INSCRIPCION_DETALLE,Relate:CURSO_INSCRIPCION) ! Add file relationship range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,CURD:IDCURSO,,BRW10)          ! Initialize the browse locator using  using key: CURD:PK_CURSO_INSCRIPCION_DETALLE , CURD:IDCURSO
  BRW10.SetFilter('(CURD:PAGADO = '''')')                  ! Apply filter expression to browse
  BRW10.AddField(CUR2:NUMERO_MODULO,BRW10.Q.CUR2:NUMERO_MODULO) ! Field CUR2:NUMERO_MODULO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:DESCRIPCION,BRW10.Q.CUR2:DESCRIPCION) ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:PAGADO,BRW10.Q.CURD:PAGADO)          ! Field CURD:PAGADO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:FECHA_FIN,BRW10.Q.CUR2:FECHA_FIN)    ! Field CUR2:FECHA_FIN is a hot field or requires assignment from browse
  BRW10.AddField(CURD:IDINSCRIPCION,BRW10.Q.CURD:IDINSCRIPCION) ! Field CURD:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:IDCURSO,BRW10.Q.CURD:IDCURSO)        ! Field CURD:IDCURSO is a hot field or requires assignment from browse
  BRW10.AddField(CURD:ID_MODULO,BRW10.Q.CURD:ID_MODULO)    ! Field CURD:ID_MODULO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:ID_MODULO,BRW10.Q.CUR2:ID_MODULO)    ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  BRW12.Q &= Queue:Browse:2
  BRW12.RetainRow = 0
  BRW12.AddSortOrder(,CUR1:PK_CURSO_CUOTA)                 ! Add the sort order for CUR1:PK_CURSO_CUOTA for sort order 1
  BRW12.AddRange(CUR1:IDINSCRIPCION,CURD:IDINSCRIPCION)    ! Add single value range limit for sort order 1
  BRW12.AddLocator(BRW12::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW12::Sort0:Locator.Init(,CUR1:IDCURSO,,BRW12)          ! Initialize the browse locator using  using key: CUR1:PK_CURSO_CUOTA , CUR1:IDCURSO
  BRW12.SetFilter('(CUR1:PAGADO = '''')')                  ! Apply filter expression to browse
  BRW12.AddField(T,BRW12.Q.T)                              ! Field T is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:IDCUOTA,BRW12.Q.CUR1:IDCUOTA)        ! Field CUR1:IDCUOTA is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:MONTO,BRW12.Q.CUR1:MONTO)            ! Field CUR1:MONTO is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:PAGADO,BRW12.Q.CUR1:PAGADO)          ! Field CUR1:PAGADO is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:IDINSCRIPCION,BRW12.Q.CUR1:IDINSCRIPCION) ! Field CUR1:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:IDCURSO,BRW12.Q.CUR1:IDCURSO)        ! Field CUR1:IDCURSO is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:IDMODULO,BRW12.Q.CUR1:IDMODULO)      ! Field CUR1:IDMODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CURSOS_PAGOS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 3                                    ! Will call: UpdateCURSO_INSCRIPCION
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW12.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
  ?List:2{Prop:Alrt,239} = SpaceKey
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
    Relate:CURSO_CUOTA.Close
    Relate:CURSO_INSCRIPCION.Close
    Relate:FONDOS.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CURSOS_PAGOS',QuickWindow)              ! Save window data to non-volatile store
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
    EXECUTE Number
      SelectSUBCUENTAS_INGRESOS_SIN_FILTRO
      SelectPROVEEDORES
      UpdateCURSO_INSCRIPCION
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
    OF ?Button7
      GLO:MONTO = 0
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CUR1:IDINSCRIPCION = tags:Puntero
          CUR1:IDCURSO       = tags:PUNTERO2
          CUR1:IDMODULO      = tags:PUNTERO3
          CUR1:IDCUOTA       = tags:PUNTERO4
          ACCESS:CURSO_CUOTA.TRYFETCH(CUR1:PK_CURSO_CUOTA)
          GLO:MONTO = GLO:MONTO + CUR1:MONTO
          GLO:IDSOLICITUD = CUR1:IDINSCRIPCION
      end
      IF CURI:DESCUENTO <> 0 THEN
          GLO:MONTO = GLO:MONTO - (GLO:MONTO*(CURI:DESCUENTO/100))
          DISABLE(?GLO:INTERES)
      END
      UNHIDE(?Button13)
      ENABLE(?Button13)
      disable(?Group1)
      disable(?Button7)
      THISWINDOW.RESET(1)
    OF ?Button13
      !!!! PAGA EL MODULO...
      GLO:DETALLE_RECIBO = ''
      CONTADOR# = 0
      CUENTA# = 0
      REPORTE_LARGO = ''
      P1# = 0
      P2# = 0
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CUR1:IDINSCRIPCION = tags:Puntero
          CUR1:IDCURSO      = tags:Puntero2
          CUR1:IDMODULO     = tags:Puntero3
          CUR1:IDCUOTA       = tags:Puntero4
          cur# = CUR1:IDCURSO
          mod# = CUR1:IDMODULO
          GET(CURSO_CUOTA,CUR1:PK_CURSO_CUOTA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO MODULO')
          ELSE
             cuota" = clip(cuota")&','&clip(CUR1:IDCUOTA)
             CUR1:PAGADO = 'SI'
             CUR1:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
             CUR1:FECHA   =  TODAY()
             CUR1:HORA    =  CLOCK()
             CUR1:IDUSUARIO =  GLO:IDUSUARIO
             !CURD:DESCUENTO    = GLO:INTERES
             CUR1:SUCURSAL    = GLO:SUCURSAL
             CUR1:IDRECIBO     = GLO:IDRECIBO
             CUR1:AFECTADA    = LOC:AFECTADA
             ACCESS:CURSO_CUOTA.UPDATE()
             CUR2:IDCURSO   = cur#
             CUR2:ID_MODULO = mod#
             ACCESS:CURSO_MODULOS.TRYFETCH(CUR2:IDX_CONTROL)
             GLO:DETALLE_RECIBO = clip(GLO:DETALLE_RECIBO)&CLIP(CUR2:NUMERO_MODULO)&', Cuota:'&clip(CUR1:IDCUOTA)
             !!! CONTROL PAGO DEL MODULO
             CURD:IDINSCRIPCION = tags:Puntero
             CURD:IDCURSO    = tags:Puntero2
             CURD:ID_MODULO     = tags:Puntero3
             get(CURSO_INSCRIPCION_DETALLE,CURD:PK_CURSO_INSCRIPCION_DETALLE)
             IF ERRORCODE() = 35 THEN
                  MESSAGE('NO ECONTRO PUNTERO EN INSCRIP DETALLE')
             ELSE
      
                 CURD:SALDO_CUOTAS = CURD:SALDO_CUOTAS - 1
                 IF CURD:SALDO_CUOTAS  = 0 THEN
                      CURD:PAGADO = 'SI'
                      CURD:FECHA_PAGO    =   TODAY()
                      CURD:HORA_PAGO     =   CLOCK()
                      CURD:USUARIO_PAGO  =   GLO:IDUSUARIO
                      CURD:IDSUBCUENTA   =   GLO:IDSUBCUENTA_CURSO
                      CURD:DESCUENTO     =   GLO:INTERES
                      CURD:SUCURSAL      =   GLO:SUCURSAL
                      CURD:IDRECIBO      =   GLO:IDRECIBO
                      
                      
                 END
                 ACCESS:CURSO_INSCRIPCION_DETALLE.UPDATE()
            END
      
             
         end
      end
      REPORTE_LARGO  = 'PAGO DE CUOTAS :'&clip(cuota")&', DE CURSO:'&CUR:DESCRIPCION ! 'PAGA CUOTA '&CLIP(HASTA")
      GLO:MONTO = GLO:MONTO - (GLO:MONTO*(GLO:INTERES/100))
      IF LOC:AFECTADA <> 'SI' THEN
          !! BUSCO EL ID PROVEEDOR
          CURI:IDINSCRIPCION = CURD:IDINSCRIPCION
          ACCESS:CURSO_INSCRIPCION.TRYFETCH(CURI:PK_CURSO_INSCRIPCION)
          PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
          ACCESS:PROVEEDORES.TRYFETCH(PRO2:PK_PROVEEDOR)
          IDPROVEEDOR# = PRO2:IDPROVEEDOR
      
          !! CARGO INGRESO
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   GLO:IDUSUARIO
          ING:IDSUBCUENTA      =   GLO:IDSUBCUENTA_CURSO
          ING:OBSERVACION      =   REPORTE_LARGO
          ING:MONTO            =   GLO:MONTO
          ING:FECHA            =   CUR1:FECHA
          ING:HORA             =   CUR1:HORA
          ING:MES              =   MONTH(TODAY())
          ING:ANO              =   YEAR(TODAY())
          ING:PERIODO          =   ING:ANO&(FORMAT(ING:MES,@N02))
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   CUR1:SUCURSAL
          ING:IDRECIBO         =   CUR1:IDRECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          GLO:IDINSCRIPCION = ING:IDINGRESO
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
      
      
      
          !!! CARGO EN LA CAJA
          SUB:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          IF SUB:CAJA = 'SI' THEN
              !!! CARGO CAJA
              CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
              CAJ:IDUSUARIO = GLO:IDUSUARIO
              CAJ:DEBE =  GLO:MONTO
              CAJ:OBSERVACION = REPORTE_LARGO
              CAJ:FECHA = TODAY()
              CAJ:MES       =  MONTH(TODAY())
              CAJ:ANO       =  YEAR(TODAY())
              CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
              CAJ:SUCURSAL  =  CUR1:SUCURSAL
              CAJ:RECIBO  =  CUR1:IDRECIBO
              CAJ:TIPO    =   'INGRESO'
              CAJ:IDTRANSACCION = GLO:IDINSCRIPCION 
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              CAJ:MONTO = FON:MONTO + GLO:MONTO
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
              NEXT(RANKING)
              CAJ:IDCAJA = RAN:C1
              ACCESS:CAJA.INSERT()
              RAN:C1 = 0
          END
          !!! MODIFICA EL FLUJO DE FONDOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO + GLO:MONTO
          FON:FECHA = TODAY()
          FON:HORA = CLOCK()
          ACCESS:FONDOS.UPDATE()
      
          CUE:IDCUENTA = SUB:IDCUENTA
          ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
          IF CUE:TIPO = 'INGRESO' THEN
              LIB:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
              LIB:DEBE = GLO:MONTO
              LIB:OBSERVACION = REPORTE_LARGO
              LIB:FECHA = TODAY()
              LIB:HORA = CLOCK()
              LIB:MES       =  MONTH(TODAY())
              LIB:ANO       =  YEAR(TODAY())
              LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
              LIB:TIPO = CUE:TIPO
              LIB:IDTRANSACCION =  GLO:IDINSCRIPCION
              LIB:SUCURSAL     =   CUR1:SUCURSAL
              LIB:RECIBO       =   CUR1:IDRECIBO
              LIB:IDPROVEEDOR =   IDPROVEEDOR#
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              LIB:FONDO = FON:MONTO + GLO:MONTO
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
              NEXT(RANKING)
              LIB:IDLIBDIARIO = RAN:C1
              !!!!!!!!!!!
              ACCESS:LIBDIARIO.INSERT()
          END
      
          !! TERMINA
          IMPRIMIR_PAGO_CURSO
      END
      GLO:IDSOLICITUD = 0
      GLO:MONTO     = 0
      GLO:SUCURSAL  =  0
      GLO:IDRECIBO =  0
      LOC:AFECTADA = ''
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDSUBCUENTA_CURSO = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?GLO:IDSUBCUENTA_CURSO
      IF GLO:IDSUBCUENTA_CURSO OR ?GLO:IDSUBCUENTA_CURSO{PROP:Req}
        SUB:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
        IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDSUBCUENTA_CURSO = SUB:IDSUBCUENTA
          ELSE
            SELECT(?GLO:IDSUBCUENTA_CURSO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?Button13
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?CURI:ID_PROVEEDOR
      PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
      IF Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CURI:ID_PROVEEDOR = PRO2:IDPROVEEDOR
        ELSE
          SELECT(?CURI:ID_PROVEEDOR)
          CYCLE
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CURI:ID_PROVEEDOR = PRO2:IDPROVEEDOR
      END
      ThisWindow.Reset(1)
    END
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
  OF ?Browse:1
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
  OF ?List:2
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
    OF ?List:2
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?List:2{PROPLIST:MouseDownRow} > 0) AND (DASBRW::13:TAGFLAG = 0)
        CASE ?List:2{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::13:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?List:2{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::13:TAGFLAG = 0
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
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.ChangeControl=?Change:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


BRW1.ResetFromView PROCEDURE

LOC:CANTIDAD:Cnt     LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:CURSO_INSCRIPCION.SetQuickScan(1)
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
    LOC:CANTIDAD:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD = LOC:CANTIDAD:Cnt
  PARENT.ResetFromView
  Relate:CURSO_INSCRIPCION.SetQuickScan(0)
  SETCURSOR()


BRW12.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CUR1:IDINSCRIPCION
     TAGS.PUNTERO2 = CUR1:IDCURSO
     TAGS.PUNTERO3 = CUR1:IDMODULO
     TAGS.PUNTERO4 = CUR1:IDCUOTA
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
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


BRW12.TakeKey PROCEDURE

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


BRW12.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW12::RecordStatus  BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW12::RecordStatus=ReturnValue
  IF BRW12::RecordStatus NOT=Record:OK THEN RETURN BRW12::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CUR1:IDINSCRIPCION
     TAGS.PUNTERO2 = CUR1:IDCURSO
     TAGS.PUNTERO3 = CUR1:IDMODULO
     TAGS.PUNTERO4 = CUR1:IDCUOTA
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
    EXECUTE DASBRW::13:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW12::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW12::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW12::RecordStatus
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

