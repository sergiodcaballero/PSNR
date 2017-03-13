

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION220.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION217.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION221.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO_INSCRIPCION File
!!! </summary>
CURSOS_INSCRIPCION PROCEDURE 

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
LOC:CANTIDAD         LONG                                  ! 
T                    STRING(1)                             ! 
LOC:NOMBRE           CSTRING(51)                           ! 
BRW1::View:Browse    VIEW(CURSO_INSCRIPCION)
                       PROJECT(CURI:IDINSCRIPCION)
                       PROJECT(CURI:MONTO_TOTAL)
                       PROJECT(CURI:PAGADO_TOTAL)
                       PROJECT(CURI:FECHA)
                       PROJECT(CURI:TERMINADO)
                       PROJECT(CURI:DESCUENTO)
                       PROJECT(CURI:IDCURSO)
                       PROJECT(CURI:ID_PROVEEDOR)
                       JOIN(CUR:PK_CURSO,CURI:IDCURSO)
                         PROJECT(CUR:DESCRIPCION)
                         PROJECT(CUR:FECHA_FIN)
                         PROJECT(CUR:IDCURSO)
                       END
                       JOIN(PRO2:PK_PROVEEDOR,CURI:ID_PROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:IDPROVEEDOR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
CURI:IDINSCRIPCION     LIKE(CURI:IDINSCRIPCION)       !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
CUR:DESCRIPCION        LIKE(CUR:DESCRIPCION)          !List box control field - type derived from field
CURI:MONTO_TOTAL       LIKE(CURI:MONTO_TOTAL)         !List box control field - type derived from field
CURI:PAGADO_TOTAL      LIKE(CURI:PAGADO_TOTAL)        !List box control field - type derived from field
CURI:FECHA             LIKE(CURI:FECHA)               !List box control field - type derived from field
CURI:TERMINADO         LIKE(CURI:TERMINADO)           !List box control field - type derived from field
CURI:DESCUENTO         LIKE(CURI:DESCUENTO)           !List box control field - type derived from field
CUR:FECHA_FIN          LIKE(CUR:FECHA_FIN)            !List box control field - type derived from field
CURI:IDCURSO           LIKE(CURI:IDCURSO)             !Browse key field - type derived from field
CURI:ID_PROVEEDOR      LIKE(CURI:ID_PROVEEDOR)        !Browse key field - type derived from field
CUR:IDCURSO            LIKE(CUR:IDCURSO)              !Related join file key field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(CURSO_INSCRIPCION_DETALLE)
                       PROJECT(CURD:PRESENTE)
                       PROJECT(CURD:PAGADO)
                       PROJECT(CURD:FECHA_INSCRIPCION)
                       PROJECT(CURD:NOTA)
                       PROJECT(CURD:FECHA_PAGO)
                       PROJECT(CURD:IDINSCRIPCION)
                       PROJECT(CURD:IDCURSO)
                       PROJECT(CURD:ID_MODULO)
                       JOIN(CUR2:PK_CURSO_MODULOS,CURD:ID_MODULO)
                         PROJECT(CUR2:NUMERO_MODULO)
                         PROJECT(CUR2:DESCRIPCION)
                         PROJECT(CUR2:ID_MODULO)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
CUR2:NUMERO_MODULO     LIKE(CUR2:NUMERO_MODULO)       !List box control field - type derived from field
CUR2:NUMERO_MODULO_Icon LONG                          !Entry's icon ID
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CURD:PRESENTE          LIKE(CURD:PRESENTE)            !List box control field - type derived from field
CURD:PAGADO            LIKE(CURD:PAGADO)              !List box control field - type derived from field
CURD:FECHA_INSCRIPCION LIKE(CURD:FECHA_INSCRIPCION)   !List box control field - type derived from field
CURD:NOTA              LIKE(CURD:NOTA)                !List box control field - type derived from field
CURD:FECHA_PAGO        LIKE(CURD:FECHA_PAGO)          !List box control field - type derived from field
CURD:IDINSCRIPCION     LIKE(CURD:IDINSCRIPCION)       !List box control field - type derived from field
CURD:IDCURSO           LIKE(CURD:IDCURSO)             !Primary key field - type derived from field
CURD:ID_MODULO         LIKE(CURD:ID_MODULO)           !Primary key field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Inscripción a Curso'),AT(,,527,336),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Curso_Incripcion'),SYSTEM
                       LIST,AT(8,38,503,131),USE(?Browse:1),HVSCROLL,FORMAT('13L(2)|M@s1@34L(2)|M~Nº INSC~@n-7' & |
  '@200L(2)|M~INSCRIPTO~C(0)@s50@200L(2)|M~CURSO~C(0)@s50@66L(1)|M~MONTO_TOTAL~C(0)@n$-' & |
  '10.2@71L(1)|M~PAGADO_TOTAL~C(0)@s2@80L(2)|M~FECHA~C(0)@d17@49L(2)|M~TERMINADO~@s2@40' & |
  'D(12)|M~DESCUENTO~C(0)@n-7.2@40L(1)|M~FECHA FIN~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CURSO_INSCRIPCION')
                       BUTTON('&Elegir'),AT(254,173,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(306,173,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(360,173,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(412,173,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(466,173,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       GROUP('Módulos Inscriptos'),AT(1,194,519,111),USE(?Group1),BOXED
                         LIST,AT(5,205,510,94),USE(?List),FORMAT('37L|MI~Nº~L(2)@n-5@197L|M~MODULO~@s50@46L|M~PR' & |
  'ESENTE~L(2)@s2@38L|M~PAGADO~L(2)@s2@77L|M~FECHA INSCRIPCION~L(2)@d17@43L|M~NOTA~L(2)' & |
  '@n-7.2@40R|M~FECHA_PAGO~L(2)@d17@56R|M~IDINSCRIPCION~L(2)@n-14@'),FROM(Queue:Browse),IMM, |
  MSG('Browsing Records')
                       END
                       BUTTON('&Marcar'),AT(3,307,68,14),USE(?DASTAG)
                       BUTTON('Todo'),AT(71,307,68,14),USE(?DASTAGAll)
                       BUTTON('Identificación'),AT(391,312,82,22),USE(?Button7),LEFT,ICON('id_card.ico'),FLAT
                       BUTTON('Desmarcar Todo'),AT(139,307,68,14),USE(?DASUNTAGALL)
                       BUTTON('&Rev tags'),AT(83,323,50,13),USE(?DASREVTAG),DISABLE,HIDE
                       BUTTON('Ver Marcados'),AT(207,307,68,14),USE(?DASSHOWTAG)
                       BUTTON('E&xportar'),AT(53,173,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(3,173,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       PROMPT('Cantidad:'),AT(181,176),USE(?Prompt1)
                       STRING(@n-5),AT(213,176),USE(LOC:CANTIDAD)
                       SHEET,AT(0,2,520,190),USE(?CurrentTab)
                         TAB('ID INSCRIPCION'),USE(?Tab:1)
                           PROMPT('NOMBRE:'),AT(4,22),USE(?LOC:NOMBRE:Prompt)
                           ENTRY(@s50),AT(47,22,173,10),USE(LOC:NOMBRE),UPR
                           BUTTON('Buscar Nombre que comience con...'),AT(225,21,146,14),USE(?Button16),LEFT,ICON(ICON:Zoom), |
  FLAT
                         END
                         TAB('CURSO'),USE(?Tab:2)
                         END
                         TAB('INSCRIPTO'),USE(?Tab:3)
                         END
                         TAB('CERTIFICADO TOTAL CURSO'),USE(?Tab:4)
                           BUTTON('Imprimir Certificado'),AT(109,173,67,17),USE(?Button15),LEFT,ICON(ICON:Print1),FLAT
                         END
                       END
                       BUTTON('&Salir'),AT(479,316,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist9 QUEUE,PRE(QHL9)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar9 QUEUE,PRE(Q9)
FieldPar                 CSTRING(800)
                         END
QPar29 QUEUE,PRE(Qp29)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado9          STRING(100)
Loc::Titulo9          STRING(100)
SavPath9          STRING(2000)
Evo::Group9  GROUP,PRE()
Evo::Procedure9          STRING(100)
Evo::App9          STRING(100)
Evo::NroPage          LONG
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
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_9  SHORT
Gol_woI_9 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_9),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_9),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_9),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_9),TRN
       END
     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::11:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = CURI:IDINSCRIPCION
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = CURI:IDINSCRIPCION
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::11:TAGMOUSE = 1 THEN
    DASBRW::11:TAGMOUSE = 0
  ELSE
  DASBRW::11:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::11:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = CURI:IDINSCRIPCION
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::11:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::11:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::11:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::11:QUEUE = TAGS
    ADD(DASBRW::11:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::11:QUEUE.PUNTERO = CURI:IDINSCRIPCION
     GET(DASBRW::11:QUEUE,DASBRW::11:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = CURI:IDINSCRIPCION
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
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
   BRW1.ResetSort(1)
   SELECT(?Browse:1,CHOICE(?Browse:1))
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
PrintExBrowse9 ROUTINE

 OPEN(Gol_woI_9)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_9 = BRW1.FileLoaded
 IF Not  EC::LoadI_9
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_9)
 SETCURSOR()
  Evo::App9          = 'Gestion'
  Evo::Procedure9          = GlobalErrors.GetProcedureName()& 9
 
  FREE(QPar9)
  Q9:FieldPar  = '1,2,3,4,5,6,7,8,9,10,'
  ADD(QPar9)  !!1
  Q9:FieldPar  = ';'
  ADD(QPar9)  !!2
  Q9:FieldPar  = 'Spanish'
  ADD(QPar9)  !!3
  Q9:FieldPar  = ''
  ADD(QPar9)  !!4
  Q9:FieldPar  = true
  ADD(QPar9)  !!5
  Q9:FieldPar  = ''
  ADD(QPar9)  !!6
  Q9:FieldPar  = true
  ADD(QPar9)  !!7
 !!!! Exportaciones
  Q9:FieldPar  = 'HTML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'EXCEL|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'WORD|'
  Q9:FieldPar  = CLIP( Q9:FieldPar)&'ASCII|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'XML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'PRT|'
  ADD(QPar9)  !!8
  Q9:FieldPar  = 'All'
  ADD(QPar9)   !.9.
  Q9:FieldPar  = ' 0'
  ADD(QPar9)   !.10
  Q9:FieldPar  = 0
  ADD(QPar9)   !.11
  Q9:FieldPar  = '1'
  ADD(QPar9)   !.12
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.13
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.14
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.15
 
   Q9:FieldPar  = '16'
  ADD(QPar9)   !.16
 
   Q9:FieldPar  = 1
  ADD(QPar9)   !.17
   Q9:FieldPar  = 2
  ADD(QPar9)   !.18
   Q9:FieldPar  = '2'
  ADD(QPar9)   !.19
   Q9:FieldPar  = 12
  ADD(QPar9)   !.20
 
   Q9:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar9)   !.21
 
   Q9:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar9)   !.22
 
   CLEAR(Q9:FieldPar)
  ADD(QPar9)   ! 23 Caracteres Encoding para xml
 
  Q9:FieldPar  = '0'
  ADD(QPar9)   ! 24 Use Open Office
 
   Q9:FieldPar  = 'golmedo'
  ADD(QPar9) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q9:FieldPar  = ' BrowseExport'
  ADD(QPar9)   ! 26  BrowseExport
  Q9:FieldPar  = ' '
  ADD(QPar9)   ! 27  
  Q9:FieldPar  = ' ' 
  ADD(QPar9)   ! 28  
  Q9:FieldPar  = 'BEXPORT' 
  ADD(QPar9)   ! 29 Gestion220.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = ''
  Qp29:F2P  = '@s1'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'Nº INSC'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'INSCRIPTO'
  Qp29:F2P  = '@s50'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CURSO'
  Qp29:F2P  = '@s50'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO_TOTAL'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'PAGADO_TOTAL'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'TERMINADO'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DESCUENTO'
  Qp29:F2P  = '@n-7.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA FIN'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
  SysRec# = false
  FREE(Loc::QHlist9)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar29,SysRec#)
         QHL9:Id      = SysRec#
         QHL9:Nombre  = Qp29:F2N
         QHL9:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL9:Pict    = Qp29:F2P
         QHL9:Tot    = Qp29:F2T
         ADD(Loc::QHlist9)
      Else
        break
     END
  END
  Loc::Titulo9 ='Administrator the CURSO_INSCRIPCION'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,0,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CURSOS_INSCRIPCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('CURI:MONTO_TOTAL',CURI:MONTO_TOTAL)                ! Added by: BrowseBox(ABC)
  BIND('CURI:PAGADO_TOTAL',CURI:PAGADO_TOTAL)              ! Added by: BrowseBox(ABC)
  BIND('CUR:FECHA_FIN',CUR:FECHA_FIN)                      ! Added by: BrowseBox(ABC)
  BIND('CURI:ID_PROVEEDOR',CURI:ID_PROVEEDOR)              ! Added by: BrowseBox(ABC)
  BIND('CUR:IDCURSO',CUR:IDCURSO)                          ! Added by: BrowseBox(ABC)
  BIND('CUR2:NUMERO_MODULO',CUR2:NUMERO_MODULO)            ! Added by: BrowseBox(ABC)
  BIND('CURD:FECHA_INSCRIPCION',CURD:FECHA_INSCRIPCION)    ! Added by: BrowseBox(ABC)
  BIND('CURD:FECHA_PAGO',CURD:FECHA_PAGO)                  ! Added by: BrowseBox(ABC)
  BIND('CURD:ID_MODULO',CURD:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_INSCRIPCION,SELF) ! Initialize the browse manager
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:CURSO_INSCRIPCION_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'CURSOS_INSCRIPCION', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CURI:FK_CURSO_INSCRIPCION_CURSO)      ! Add the sort order for CURI:FK_CURSO_INSCRIPCION_CURSO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CURI:IDCURSO,,BRW1)            ! Initialize the browse locator using  using key: CURI:FK_CURSO_INSCRIPCION_CURSO , CURI:IDCURSO
  BRW1.SetFilter('(CUR:FECHA_FIN >= TODAY())')             ! Apply filter expression to browse
  BRW1.AddSortOrder(,CURI:FK_CURSO_INSCRIPCION_PROVEEDOR)  ! Add the sort order for CURI:FK_CURSO_INSCRIPCION_PROVEEDOR for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CURI:ID_PROVEEDOR,,BRW1)       ! Initialize the browse locator using  using key: CURI:FK_CURSO_INSCRIPCION_PROVEEDOR , CURI:ID_PROVEEDOR
  BRW1.SetFilter('(CUR:FECHA_FIN >= TODAY())')             ! Apply filter expression to browse
  BRW1.AddSortOrder(,CURI:FK_CURSO_INSCRIPCION_CURSO)      ! Add the sort order for CURI:FK_CURSO_INSCRIPCION_CURSO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CURI:IDCURSO,,BRW1)            ! Initialize the browse locator using  using key: CURI:FK_CURSO_INSCRIPCION_CURSO , CURI:IDCURSO
  BRW1.SetFilter('(CUR:FECHA_FIN << TODAY())')             ! Apply filter expression to browse
  BRW1.AddSortOrder(,CURI:PK_CURSO_INSCRIPCION)            ! Add the sort order for CURI:PK_CURSO_INSCRIPCION for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,CURI:IDINSCRIPCION,,BRW1)      ! Initialize the browse locator using  using key: CURI:PK_CURSO_INSCRIPCION , CURI:IDINSCRIPCION
  BRW1.SetFilter('(CUR:FECHA_FIN >= TODAY())')             ! Apply filter expression to browse
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(CURI:IDINSCRIPCION,BRW1.Q.CURI:IDINSCRIPCION) ! Field CURI:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:DESCRIPCION,BRW1.Q.CUR:DESCRIPCION)    ! Field CUR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CURI:MONTO_TOTAL,BRW1.Q.CURI:MONTO_TOTAL)  ! Field CURI:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CURI:PAGADO_TOTAL,BRW1.Q.CURI:PAGADO_TOTAL) ! Field CURI:PAGADO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CURI:FECHA,BRW1.Q.CURI:FECHA)              ! Field CURI:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CURI:TERMINADO,BRW1.Q.CURI:TERMINADO)      ! Field CURI:TERMINADO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:DESCUENTO,BRW1.Q.CURI:DESCUENTO)      ! Field CURI:DESCUENTO is a hot field or requires assignment from browse
  BRW1.AddField(CUR:FECHA_FIN,BRW1.Q.CUR:FECHA_FIN)        ! Field CUR:FECHA_FIN is a hot field or requires assignment from browse
  BRW1.AddField(CURI:IDCURSO,BRW1.Q.CURI:IDCURSO)          ! Field CURI:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:ID_PROVEEDOR,BRW1.Q.CURI:ID_PROVEEDOR) ! Field CURI:ID_PROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(CUR:IDCURSO,BRW1.Q.CUR:IDCURSO)            ! Field CUR:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,CURD:PK_CURSO_INSCRIPCION_DETALLE)   ! Add the sort order for CURD:PK_CURSO_INSCRIPCION_DETALLE for sort order 1
  BRW10.AddRange(CURD:IDINSCRIPCION,Relate:CURSO_INSCRIPCION_DETALLE,Relate:CURSO_INSCRIPCION) ! Add file relationship range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,CURD:IDCURSO,,BRW10)          ! Initialize the browse locator using  using key: CURD:PK_CURSO_INSCRIPCION_DETALLE , CURD:IDCURSO
  ?List{PROP:IconList,1} = '~aceptar.ico'
  ?List{PROP:IconList,2} = '~cancelar.ico'
  BRW10.AddField(CUR2:NUMERO_MODULO,BRW10.Q.CUR2:NUMERO_MODULO) ! Field CUR2:NUMERO_MODULO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:DESCRIPCION,BRW10.Q.CUR2:DESCRIPCION) ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:PRESENTE,BRW10.Q.CURD:PRESENTE)      ! Field CURD:PRESENTE is a hot field or requires assignment from browse
  BRW10.AddField(CURD:PAGADO,BRW10.Q.CURD:PAGADO)          ! Field CURD:PAGADO is a hot field or requires assignment from browse
  BRW10.AddField(CURD:FECHA_INSCRIPCION,BRW10.Q.CURD:FECHA_INSCRIPCION) ! Field CURD:FECHA_INSCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:NOTA,BRW10.Q.CURD:NOTA)              ! Field CURD:NOTA is a hot field or requires assignment from browse
  BRW10.AddField(CURD:FECHA_PAGO,BRW10.Q.CURD:FECHA_PAGO)  ! Field CURD:FECHA_PAGO is a hot field or requires assignment from browse
  BRW10.AddField(CURD:IDINSCRIPCION,BRW10.Q.CURD:IDINSCRIPCION) ! Field CURD:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:IDCURSO,BRW10.Q.CURD:IDCURSO)        ! Field CURD:IDCURSO is a hot field or requires assignment from browse
  BRW10.AddField(CURD:ID_MODULO,BRW10.Q.CURD:ID_MODULO)    ! Field CURD:ID_MODULO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:ID_MODULO,BRW10.Q.CUR2:ID_MODULO)    ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CURSOS_INSCRIPCION',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCURSO_INSCRIPCION
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
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
  ?Browse:1{Prop:Alrt,239} = SpaceKey
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
    Relate:CURSO_INSCRIPCION.Close
    Relate:CURSO_INSCRIPCION_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('CURSOS_INSCRIPCION',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateCURSO_INSCRIPCION
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
      FREE(CARNET)
      
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CURI:IDINSCRIPCION = tags:Puntero
          LOCALI       = CUR:DESCRIPCION
          ACCESS:CURSO_INSCRIPCION.TRYFETCH(CURI:PK_CURSO_INSCRIPCION)
          PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
          If NOT Access:PROVEEDORES.Fetch(PRO2:PK_PROVEEDOR)
                  NOMBRE       = PRO2:DESCRIPCION
                  DIRECCION    = PRO2:DIRECCION
                  
                  Add(carnet)
          end
      end
      
      
    OF ?Button16
      IF Loc:Nombre <> '' THEN
          BRW1.VIEW{PROP:SQLFILTER}= 'C.DESCRIPCION LIKE'''&CLIP(Loc:Nombre)&'%'''
          
      ELSE
          BRW1.VIEW{PROP:SQLFILTER}= ''
      END
      THISWINDOW.RESET(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
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
    OF ?Button7
      ThisWindow.Update()
      START(IDENTIFICACION_TAGS, 25000)
      ThisWindow.Reset
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
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
    OF ?Browse:1
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::11:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::11:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURI:IDINSCRIPCION
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


BRW1.TakeKey PROCEDURE

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


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  IF BRW1::RecordStatus NOT=Record:OK THEN RETURN BRW1::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURI:IDINSCRIPCION
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::11:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW1::RecordStatus
  RETURN ReturnValue


BRW10.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (CURD:PAGADO = 'SI')
    SELF.Q.CUR2:NUMERO_MODULO_Icon = 1                     ! Set icon from icon list
  ELSIF (CURD:PAGADO = '')
    SELF.Q.CUR2:NUMERO_MODULO_Icon = 2                     ! Set icon from icon list
  ELSE
    SELF.Q.CUR2:NUMERO_MODULO_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

