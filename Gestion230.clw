

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION230.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION228.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO_INSCRIPCION_DETALLE File
!!! </summary>
CERTIFICADOXALUMNO PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::6:TAGFLAG          BYTE(0)
DASBRW::6:TAGMOUSE         BYTE(0)
DASBRW::6:TAGDISPSTATUS    BYTE(0)
DASBRW::6:QUEUE           QUEUE
PUNTERO                       LIKE(PUNTERO)
PUNTERO2                      LIKE(PUNTERO2)
PUNTERO3                      LIKE(PUNTERO3)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
T                    STRING(1)                             ! 
LOC:NOMBRE           CSTRING(51)                           ! 
BRW1::View:Browse    VIEW(CURSO_INSCRIPCION_DETALLE)
                       PROJECT(CURD:PRESENTE)
                       PROJECT(CURD:NOTA)
                       PROJECT(CURD:PAGADO)
                       PROJECT(CURD:IDINSCRIPCION)
                       PROJECT(CURD:IDCURSO)
                       PROJECT(CURD:ID_MODULO)
                       JOIN(CURI:PK_CURSO_INSCRIPCION,CURD:IDINSCRIPCION)
                         PROJECT(CURI:IDINSCRIPCION)
                         PROJECT(CURI:ID_PROVEEDOR)
                         JOIN(PRO2:PK_PROVEEDOR,CURI:ID_PROVEEDOR)
                           PROJECT(PRO2:DESCRIPCION)
                           PROJECT(PRO2:IDPROVEEDOR)
                         END
                       END
                       JOIN(CUR2:PK_CURSO_MODULOS,CURD:ID_MODULO)
                         PROJECT(CUR2:DESCRIPCION)
                         PROJECT(CUR2:FECHA_FIN)
                         PROJECT(CUR2:ID_MODULO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
CUR2:FECHA_FIN         LIKE(CUR2:FECHA_FIN)           !List box control field - type derived from field
CURD:PRESENTE          LIKE(CURD:PRESENTE)            !List box control field - type derived from field
CURD:NOTA              LIKE(CURD:NOTA)                !List box control field - type derived from field
CURD:PAGADO            LIKE(CURD:PAGADO)              !List box control field - type derived from field
CURD:IDINSCRIPCION     LIKE(CURD:IDINSCRIPCION)       !List box control field - type derived from field
CURD:IDCURSO           LIKE(CURD:IDCURSO)             !List box control field - type derived from field
CURD:ID_MODULO         LIKE(CURD:ID_MODULO)           !List box control field - type derived from field
CURI:IDINSCRIPCION     LIKE(CURI:IDINSCRIPCION)       !Related join file key field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Certificado de Módulos por Alumno'),AT(,,453,312),FONT('Arial',8,,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('Imprimir_Certificados_Modulos_Curso'),SYSTEM
                       STRING(@s50),AT(0,1,390,14),USE(CUR2:DESCRIPCION),FONT('Arial',12,,FONT:bold),CENTER
                       BUTTON('&Filtro'),AT(7,262,56,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('&Marcar'),AT(55,265,82,13),USE(?DASTAG),FLAT
                       BUTTON('Marcar &Todo'),AT(143,265,82,13),USE(?DASTAGAll),FLAT
                       BUTTON('&Demarcar Todo'),AT(55,280,82,13),USE(?DASUNTAGALL),FLAT
                       BUTTON('&Revertir'),AT(142,280,82,13),USE(?DASREVTAG),FLAT
                       BUTTON('Mostrar solo Marcados'),AT(228,265,82,13),USE(?DASSHOWTAG),FLAT
                       BUTTON('Imprimir Certificado'),AT(314,264,82,21),USE(?Button8),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,17,446,242),USE(?CurrentTab)
                         TAB('Modulo de Inscriptos Pagado'),USE(?Tab:2)
                           PROMPT('NOMBRE ALUMNO:'),AT(8,37),USE(?LOC:NOMBRE:Prompt)
                           ENTRY(@s50),AT(71,37,159,10),USE(LOC:NOMBRE),UPR
                           BUTTON('Filtrar Nombre que Comience con ....'),AT(232,33,91,17),USE(?Button9),LEFT,ICON(ICON:Zoom), |
  FLAT
                           LIST,AT(7,52,440,201),USE(?Browse:1),HVSCROLL,FORMAT('14L(2)|M@s1@123L(2)|M~MODULO~@s50' & |
  '@200L(2)|M~INSCRIPTO~@s50@52L(2)|M~FECHA FIN~@d17@51L(2)|M~PRESENTE~@s2@36D(16)|M~NO' & |
  'TA~C(0)@n-7.2@28L(2)|M~PAGADO~@s2@64R(2)|M~IDINSCRIPCION~C(0)@n-14@64R(2)|M~IDCURSO~' & |
  'C(0)@n-14@64R(2)|M~ID_MODULO~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrado' & |
  'r de CURSO_INSCRIPCION_DETALLE'),VCR
                         END
                       END
                       BUTTON('&Salir'),AT(401,281,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE5                 QueryListClass                        ! QBE List Class. 
QBV5                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::6:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = CURD:IDINSCRIPCION
   TAGS.PUNTERO2 = CURD:IDCURSO
   TAGS.PUNTERO3 = CURD:ID_MODULO
   GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
  IF ERRORCODE()
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::6:TAGMOUSE = 1 THEN
    DASBRW::6:TAGMOUSE = 0
  ELSE
  DASBRW::6:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::6:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::6:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::6:QUEUE = TAGS
    ADD(DASBRW::6:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::6:QUEUE.PUNTERO = CURD:IDINSCRIPCION
     DASBRW::6:QUEUE.PUNTERO2 = CURD:IDCURSO
     DASBRW::6:QUEUE.PUNTERO3 = CURD:ID_MODULO
     GET(DASBRW::6:QUEUE,DASBRW::6:QUEUE.PUNTERO,DASBRW::6:QUEUE.PUNTERO2,DASBRW::6:QUEUE.PUNTERO3)
    IF ERRORCODE()
       TAGS.PUNTERO = CURD:IDINSCRIPCION
       TAGS.PUNTERO2 = CURD:IDCURSO
       TAGS.PUNTERO3 = CURD:ID_MODULO
       ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASSHOWTAG Routine
   CASE DASBRW::6:TAGDISPSTATUS
   OF 0
      DASBRW::6:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::6:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::6:TAGDISPSTATUS = 0    ! display all
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CERTIFICADOXALUMNO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR2:DESCRIPCION
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_FIN',CUR2:FECHA_FIN)                    ! Added by: BrowseBox(ABC)
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
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_INSCRIPCION_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE5.Init(QBV5, INIMgr,'Imprimir_Certificados_Modulos_Curso', GlobalErrors)
  QBE5.QkSupport = True
  QBE5.QkMenuIcon = 'QkQBE.ico'
  QBE5.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CURD:PK_CURSO_INSCRIPCION_DETALLE)    ! Add the sort order for CURD:PK_CURSO_INSCRIPCION_DETALLE for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CURD:IDINSCRIPCION,,BRW1)      ! Initialize the browse locator using  using key: CURD:PK_CURSO_INSCRIPCION_DETALLE , CURD:IDINSCRIPCION
  BRW1.SetFilter('(CURD:PAGADO = ''SI'')')                 ! Apply filter expression to browse
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:DESCRIPCION,BRW1.Q.CUR2:DESCRIPCION)  ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_FIN,BRW1.Q.CUR2:FECHA_FIN)      ! Field CUR2:FECHA_FIN is a hot field or requires assignment from browse
  BRW1.AddField(CURD:PRESENTE,BRW1.Q.CURD:PRESENTE)        ! Field CURD:PRESENTE is a hot field or requires assignment from browse
  BRW1.AddField(CURD:NOTA,BRW1.Q.CURD:NOTA)                ! Field CURD:NOTA is a hot field or requires assignment from browse
  BRW1.AddField(CURD:PAGADO,BRW1.Q.CURD:PAGADO)            ! Field CURD:PAGADO is a hot field or requires assignment from browse
  BRW1.AddField(CURD:IDINSCRIPCION,BRW1.Q.CURD:IDINSCRIPCION) ! Field CURD:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CURD:IDCURSO,BRW1.Q.CURD:IDCURSO)          ! Field CURD:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CURD:ID_MODULO,BRW1.Q.CURD:ID_MODULO)      ! Field CURD:ID_MODULO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:IDINSCRIPCION,BRW1.Q.CURI:IDINSCRIPCION) ! Field CURI:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:ID_MODULO,BRW1.Q.CUR2:ID_MODULO)      ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CERTIFICADOXALUMNO',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE5,1)
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
    Relate:CURSO.Close
    Relate:CURSO_INSCRIPCION_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('CERTIFICADOXALUMNO',QuickWindow)        ! Save window data to non-volatile store
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
    OF ?Button8
      FREE(CARNET)
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CURD:IDINSCRIPCION = tags:Puntero
          CURD:IDCURSO       = tags:PUNTERO2
          CURD:ID_MODULO     = tags:PUNTERO3
          ACCESS:CURSO_INSCRIPCION_DETALLE.TRYFETCH(CURD:PK_CURSO_INSCRIPCION_DETALLE)
          MODULO# =  CURD:ID_MODULO
          CURSO# = CURD:IDCURSO
          !!! BUSCAR PROVEEDOR
          CURI:IDINSCRIPCION = CURD:IDINSCRIPCION
          ACCESS:CURSO_INSCRIPCION.TRYFETCH(CURI:PK_CURSO_INSCRIPCION)
          PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
          ACCESS:PROVEEDORES.TRYFETCH(PRO2:PK_PROVEEDOR)
          NOMBRE     =    PRO2:DESCRIPCION
          N_DOCUMENTO = PRO2:CUIT
          !! BUSCAR MODULO DE CURSO
          CUR2:ID_MODULO = MODULO#
          ACCESS:CURSO_MODULOS.TRYFETCH(CUR2:PK_CURSO_MODULOS)
          MATRICULA  =    CUR2:NUMERO_MODULO
          DIRECCION  =    CUR2:DESCRIPCION
          FECHA_ALTA =    CUR2:FECHA_INICIO
          FOLIO      =    CUR2:FECHA_FIN
          CP         =    CUR2:CANTIDAD_HORAS
          CUR:IDCURSO =   CURSO#
          ACCESS:CURSO.TRYFETCH(CUR:PK_CURSO)
          LOCALI = CUR:DESCRIPCION
          ADD(CARNET)
      end
    OF ?Button9
      IF Loc:Nombre <> '' THEN
          BRW1.VIEW{PROP:SQLFILTER}= 'C.DESCRIPCION LIKE'''&CLIP(Loc:Nombre)&'%'' AND A.PAGADO = ''SI'''
          
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
        DO DASBRW::6:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?Button8
      ThisWindow.Update()
      START(Imprimir_Certificado_Curso, 25000)
      ThisWindow.Reset
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
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::6:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::6:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::6:TAGFLAG = 0
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
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
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    EXECUTE DASBRW::6:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW1::RecordStatus
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

