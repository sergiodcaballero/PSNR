

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION030.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION028.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION029.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the TIPO_CONVENIO file
!!! </summary>
BrowseTIPO_CONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_CONVENIO)
                       PROJECT(TIP:IDTIPO_CONVENIO)
                       PROJECT(TIP:DESCRIPCION)
                       PROJECT(TIP:INTERES)
                       PROJECT(TIP:GASTO_ADMINISTRATIVO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
TIP:INTERES            LIKE(TIP:INTERES)              !List box control field - type derived from field
TIP:GASTO_ADMINISTRATIVO LIKE(TIP:GASTO_ADMINISTRATIVO) !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM TIPO COMBENIO'),AT(,,224,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseTIPO_CONVENIO'),SYSTEM
                       LIST,AT(8,30,208,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDTIPO CONVENIO~C(0)@n-1' & |
  '4@80L(2)|M~DESCRIPCION~@s50@38L(2)|M~INTERES~@n-7.2@28L(2)|M~GASTO ADMINISTRATIVO~@n-7.2@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de TIPO_CONVENIO')
                       BUTTON('&Ver'),AT(8,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(61,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(114,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(167,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,216,172),USE(?CurrentTab)
                         TAB('CONVENIO'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(171,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('BrowseTIPO_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_CONVENIO.Open                                ! File TIPO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP:IDX_TIPO_CONVENIO_DESCRIPCION)    ! Add the sort order for TIP:IDX_TIPO_CONVENIO_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: TIP:IDX_TIPO_CONVENIO_DESCRIPCION , TIP:DESCRIPCION
  BRW1.AddSortOrder(,TIP:PK_T_CONVENIO)                    ! Add the sort order for TIP:PK_T_CONVENIO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP:IDTIPO_CONVENIO,,BRW1)     ! Initialize the browse locator using  using key: TIP:PK_T_CONVENIO , TIP:IDTIPO_CONVENIO
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP:INTERES,BRW1.Q.TIP:INTERES)            ! Field TIP:INTERES is a hot field or requires assignment from browse
  BRW1.AddField(TIP:GASTO_ADMINISTRATIVO,BRW1.Q.TIP:GASTO_ADMINISTRATIVO) ! Field TIP:GASTO_ADMINISTRATIVO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseTIPO_CONVENIO',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateTIPO_CONVENIO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
                                                 
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseTIPO_CONVENIO',QuickWindow)       ! Save window data to non-volatile store
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
    UpdateTIPO_CONVENIO
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
      END
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
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SOCIOS file
!!! </summary>
BrowseSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:TELEFONO)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:FECHA_ALTA)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:FECHA_NACIMIENTO)
                       PROJECT(SOC:OBSERVACION)
                       PROJECT(SOC:SEXO)
                       PROJECT(SOC:FIN_COBERTURA)
                       PROJECT(SOC:BAJA)
                       PROJECT(SOC:FECHA_BAJA)
                       PROJECT(SOC:BAJA_TEMPORARIA)
                       PROJECT(SOC:IDCIRCULO)
                       PROJECT(SOC:ACTA)
                       PROJECT(SOC:PROVISORIO)
                       PROJECT(SOC:IDINSTITUCION)
                       PROJECT(SOC:FECHA_EGRESO)
                       PROJECT(SOC:IDCOBERTURA)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:IDLOCALIDAD)
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                         PROJECT(TIP3:ID_TIPO_DOC)
                       END
                       JOIN(LOC:PK_LOCALIDAD,SOC:IDLOCALIDAD)
                         PROJECT(LOC:IDLOCALIDAD)
                       END
                       JOIN(INS2:PK_INSTITUCION,SOC:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                         PROJECT(INS2:IDINSTITUCION)
                       END
                       JOIN(COB:PK_COBERTURA,SOC:IDCOBERTURA)
                         PROJECT(COB:DESCRIPCION)
                         PROJECT(COB:IDCOBERTURA)
                       END
                       JOIN(CIR:PK_CIRCULO,SOC:IDCIRCULO)
                         PROJECT(CIR:DESCRIPCION)
                         PROJECT(CIR:IDCIRCULO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !List box control field - type derived from field
SOC:IDSOCIO_Icon       LONG                           !Entry's icon ID
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:N_DOCUMENTO        LIKE(SOC:N_DOCUMENTO)          !List box control field - type derived from field
SOC:DIRECCION          LIKE(SOC:DIRECCION)            !List box control field - type derived from field
SOC:TELEFONO           LIKE(SOC:TELEFONO)             !List box control field - type derived from field
SOC:DIRECCION_LABORAL  LIKE(SOC:DIRECCION_LABORAL)    !List box control field - type derived from field
SOC:TELEFONO_LABORAL   LIKE(SOC:TELEFONO_LABORAL)     !List box control field - type derived from field
SOC:FECHA_ALTA         LIKE(SOC:FECHA_ALTA)           !List box control field - type derived from field
SOC:EMAIL              LIKE(SOC:EMAIL)                !List box control field - type derived from field
SOC:FECHA_NACIMIENTO   LIKE(SOC:FECHA_NACIMIENTO)     !List box control field - type derived from field
SOC:OBSERVACION        LIKE(SOC:OBSERVACION)          !List box control field - type derived from field
SOC:SEXO               LIKE(SOC:SEXO)                 !List box control field - type derived from field
SOC:FIN_COBERTURA      LIKE(SOC:FIN_COBERTURA)        !List box control field - type derived from field
SOC:BAJA               LIKE(SOC:BAJA)                 !List box control field - type derived from field
SOC:FECHA_BAJA         LIKE(SOC:FECHA_BAJA)           !List box control field - type derived from field
SOC:BAJA_TEMPORARIA    LIKE(SOC:BAJA_TEMPORARIA)      !List box control field - type derived from field
SOC:IDCIRCULO          LIKE(SOC:IDCIRCULO)            !List box control field - type derived from field
CIR:DESCRIPCION        LIKE(CIR:DESCRIPCION)          !List box control field - type derived from field
SOC:ACTA               LIKE(SOC:ACTA)                 !List box control field - type derived from field
SOC:PROVISORIO         LIKE(SOC:PROVISORIO)           !List box control field - type derived from field
SOC:IDINSTITUCION      LIKE(SOC:IDINSTITUCION)        !List box control field - type derived from field
INS2:NOMBRE            LIKE(INS2:NOMBRE)              !List box control field - type derived from field
SOC:FECHA_EGRESO       LIKE(SOC:FECHA_EGRESO)         !List box control field - type derived from field
SOC:IDCOBERTURA        LIKE(SOC:IDCOBERTURA)          !List box control field - type derived from field
COB:DESCRIPCION        LIKE(COB:DESCRIPCION)          !List box control field - type derived from field
TIP3:ID_TIPO_DOC       LIKE(TIP3:ID_TIPO_DOC)         !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
INS2:IDINSTITUCION     LIKE(INS2:IDINSTITUCION)       !Related join file key field - type derived from field
COB:IDCOBERTURA        LIKE(COB:IDCOBERTURA)          !Related join file key field - type derived from field
CIR:IDCIRCULO          LIKE(CIR:IDCIRCULO)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM Colegiados'),AT(,,475,236),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY,IMM, |
  MDI,HLP('BrowseSOCIOS'),SYSTEM
                       LIST,AT(8,39,465,154),USE(?Browse:1),HVSCROLL,FORMAT('31L(2)|MI~IDSOCIO~C(0)@n-7@28L(2)' & |
  '|M~MAT~C(0)@S7@120L(2)|M~NOMBRE~C(0)@s30@56L(2)|M~N DOCUMENTO~C(0)@S14@400L(2)|M~DIR' & |
  'ECCION~C(0)@s100@120L(2)|M~TELEFONO~C(0)@s30@200L(2)|M~DIRECCION LABORAL~C(0)@s50@12' & |
  '0L(2)|M~TELEFONO LABORAL~C(0)@s30@89C(2)|M~FECHA MATRICULACION~C(0)@d17@200L(2)|M~EM' & |
  'AIL~C(0)@s50@40L(2)|M~FECHA NACIMIENTO~C(0)@d17@400L(2)|M~OBSERVACION~C(0)@s100@4L(2' & |
  ')|M~SEXO~C(0)@s1@60L(2)|M~FIN COBERTURA~C(0)@d17@[27L(2)|M~BAJA~C(0)@s2@67L(2)|M~FEC' & |
  'HA BAJA~C(0)@d17@8L(2)|M~BAJA TEMPORARIA~C(0)@s2@](167)|M~BAJA~[24L(2)|M~IDD~C(0)@n-' & |
  '5@120L(2)|M~DESCRIPCION~C(0)@s30@]|M~DISTRITO~80L(2)|M~NRO RESOLUCION~C(0)@s20@52L(2' & |
  ')|M~PROVISORIO~C(0)@s1@[39L(2)|M~IDINSTIT~C(0)@n-7@200L|M~NOMBRE~C@s50@56L(2)|M~FECH' & |
  'A EGRESO~C(0)@D6@]|M~TITULO~[28L(2)|M~IDCOB~C(0)@n-5@80L(2)|M~DESCRIPCION~C(0)@s20@]' & |
  '|M~COBERTURA~'),FROM(Queue:Browse:1),IMM,MSG('Administrador de SOCIOS')
                       BUTTON('&Ver'),AT(315,196,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(369,196,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(421,196,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(233,196,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('&Filtro'),AT(9,217,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       BUTTON('Imprimir Alta'),AT(147,217,71,14),USE(?Button7),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('Solicitud de Baja Definitiva'),AT(228,218,96,14),USE(?Button9),LEFT,ICON(ICON:Print1), |
  FLAT
                       BUTTON('Imprimir Solicitud'),AT(56,217,85,14),USE(?Button8),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,2,473,212),USE(?CurrentTab)
                         TAB('SOCIOS'),USE(?Tab:1)
                           PROMPT('IDSOCIO:'),AT(115,21),USE(?SOC:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(146,21,60,10),USE(SOC:IDSOCIO),REQ
                         END
                         TAB('DOCUMENTO'),USE(?Tab:2)
                           PROMPT('N DOCUMENTO:'),AT(121,20),USE(?N_DOCUMENTO:Prompt)
                           ENTRY(@n-14),AT(174,19,60,10),USE(SOC:N_DOCUMENTO),REQ
                         END
                         TAB('MATRICULA'),USE(?Tab:3)
                           PROMPT('MATRICULA:'),AT(114,20),USE(?MATRICULA:Prompt)
                           ENTRY(@n-14),AT(164,19,60,10),USE(SOC:MATRICULA),REQ
                         END
                         TAB('NOMBRE'),USE(?Tab:4)
                           PROMPT('NOMBRE:'),AT(115,19),USE(?NOMBRE:Prompt)
                           ENTRY(@s30),AT(165,18,147,10),USE(SOC:NOMBRE),UPR
                         END
                       END
                       BUTTON('&Salir'),AT(423,218,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,20),USE(?SortOrderList:Prompt)
                       LIST,AT(36,20,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE9                 QueryListClass                        ! QBE List Class. 
QBV9                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('BrowseSOCIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('SOC:N_DOCUMENTO',SOC:N_DOCUMENTO)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:DIRECCION_LABORAL',SOC:DIRECCION_LABORAL)      ! Added by: BrowseBox(ABC)
  BIND('SOC:TELEFONO_LABORAL',SOC:TELEFONO_LABORAL)        ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_ALTA',SOC:FECHA_ALTA)                    ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_NACIMIENTO',SOC:FECHA_NACIMIENTO)        ! Added by: BrowseBox(ABC)
  BIND('SOC:FIN_COBERTURA',SOC:FIN_COBERTURA)              ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_BAJA',SOC:FECHA_BAJA)                    ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_EGRESO',SOC:FECHA_EGRESO)                ! Added by: BrowseBox(ABC)
  BIND('TIP3:ID_TIPO_DOC',TIP3:ID_TIPO_DOC)                ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  BIND('INS2:IDINSTITUCION',INS2:IDINSTITUCION)            ! Added by: BrowseBox(ABC)
  BIND('COB:IDCOBERTURA',COB:IDCOBERTURA)                  ! Added by: BrowseBox(ABC)
  BIND('CIR:IDCIRCULO',CIR:IDCIRCULO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:1{PROP:TEXT},1,1)='&',SUB(?Tab:1{PROP:TEXT},2,LEN(?Tab:1{PROP:TEXT})-1),?Tab:1{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  QBE9.Init(QBV9, INIMgr,'BrowseSOCIOS', GlobalErrors)
  QBE9.QkSupport = True
  QBE9.QkMenuIcon = 'QkQBE.ico'
  QBE9.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_DOCUMENTO)             ! Add the sort order for SOC:IDX_SOCIOS_DOCUMENTO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?SOC:N_DOCUMENTO,SOC:N_DOCUMENTO,,BRW1) ! Initialize the browse locator using ?SOC:N_DOCUMENTO using key: SOC:IDX_SOCIOS_DOCUMENTO , SOC:N_DOCUMENTO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MATRICULA)             ! Add the sort order for SOC:IDX_SOCIOS_MATRICULA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?SOC:MATRICULA,SOC:MATRICULA,,BRW1) ! Initialize the browse locator using ?SOC:MATRICULA using key: SOC:IDX_SOCIOS_MATRICULA , SOC:MATRICULA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(?SOC:NOMBRE,SOC:NOMBRE,,BRW1)   ! Initialize the browse locator using ?SOC:NOMBRE using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.AddSortOrder(,SOC:PK_SOCIOS)                        ! Add the sort order for SOC:PK_SOCIOS for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(?SOC:IDSOCIO,SOC:IDSOCIO,,BRW1) ! Initialize the browse locator using ?SOC:IDSOCIO using key: SOC:PK_SOCIOS , SOC:IDSOCIO
  ?Browse:1{PROP:IconList,1} = '~ABDNROW.ICO'
  ?Browse:1{PROP:IconList,2} = '~CANCEL.ICO'
  ?Browse:1{PROP:IconList,3} = '~NEW.ICO'
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:N_DOCUMENTO,BRW1.Q.SOC:N_DOCUMENTO)    ! Field SOC:N_DOCUMENTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:DIRECCION,BRW1.Q.SOC:DIRECCION)        ! Field SOC:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TELEFONO,BRW1.Q.SOC:TELEFONO)          ! Field SOC:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:DIRECCION_LABORAL,BRW1.Q.SOC:DIRECCION_LABORAL) ! Field SOC:DIRECCION_LABORAL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TELEFONO_LABORAL,BRW1.Q.SOC:TELEFONO_LABORAL) ! Field SOC:TELEFONO_LABORAL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_ALTA,BRW1.Q.SOC:FECHA_ALTA)      ! Field SOC:FECHA_ALTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:EMAIL,BRW1.Q.SOC:EMAIL)                ! Field SOC:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_NACIMIENTO,BRW1.Q.SOC:FECHA_NACIMIENTO) ! Field SOC:FECHA_NACIMIENTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:OBSERVACION,BRW1.Q.SOC:OBSERVACION)    ! Field SOC:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:SEXO,BRW1.Q.SOC:SEXO)                  ! Field SOC:SEXO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FIN_COBERTURA,BRW1.Q.SOC:FIN_COBERTURA) ! Field SOC:FIN_COBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA,BRW1.Q.SOC:BAJA)                  ! Field SOC:BAJA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_BAJA,BRW1.Q.SOC:FECHA_BAJA)      ! Field SOC:FECHA_BAJA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA_TEMPORARIA,BRW1.Q.SOC:BAJA_TEMPORARIA) ! Field SOC:BAJA_TEMPORARIA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCIRCULO,BRW1.Q.SOC:IDCIRCULO)        ! Field SOC:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(CIR:DESCRIPCION,BRW1.Q.CIR:DESCRIPCION)    ! Field CIR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ACTA,BRW1.Q.SOC:ACTA)                  ! Field SOC:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:PROVISORIO,BRW1.Q.SOC:PROVISORIO)      ! Field SOC:PROVISORIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDINSTITUCION,BRW1.Q.SOC:IDINSTITUCION) ! Field SOC:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE,BRW1.Q.INS2:NOMBRE)            ! Field INS2:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_EGRESO,BRW1.Q.SOC:FECHA_EGRESO)  ! Field SOC:FECHA_EGRESO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCOBERTURA,BRW1.Q.SOC:IDCOBERTURA)    ! Field SOC:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(COB:DESCRIPCION,BRW1.Q.COB:DESCRIPCION)    ! Field COB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP3:ID_TIPO_DOC,BRW1.Q.TIP3:ID_TIPO_DOC)  ! Field TIP3:ID_TIPO_DOC is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDINSTITUCION,BRW1.Q.INS2:IDINSTITUCION) ! Field INS2:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(COB:IDCOBERTURA,BRW1.Q.COB:IDCOBERTURA)    ! Field COB:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(CIR:IDCIRCULO,BRW1.Q.CIR:IDCIRCULO)        ! Field CIR:IDCIRCULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSOCIOS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE9,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSOCIOS
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
                                                 
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSOCIOS',QuickWindow)              ! Save window data to non-volatile store
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
    UpdateSOCIOS
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
      GLO:IDSOCIO = SOC:IDSOCIO
    OF ?Button8
      GLO:IDSOCIO = SOC:IDSOCIO
      REPORTE_LARGO = 'SOLICITUD DE MATRICULACION'
      CARGA_AUDITORIA()
      IMPRIMIR_SOLICITUD_MATRICULACION()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button7
      ThisWindow.Update()
      IMPRIMIR_CERTIFICADO_ALTA()
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:1)
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
      END
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
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


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
  PARENT.SetQueueRecord
  
  IF (SOC:BAJA = 'SI')
    SELF.Q.SOC:IDSOCIO_Icon = 2                            ! Set icon from icon list
  ELSIF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:IDSOCIO_Icon = 1                            ! Set icon from icon list
  ELSIF (SOC:PROVISORIO = 'S')
    SELF.Q.SOC:IDSOCIO_Icon = 3                            ! Set icon from icon list
  ELSE
    SELF.Q.SOC:IDSOCIO_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_SOLICITUD_MATRICULACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:FECHA_EGRESO)
                       PROJECT(SOC:FECHA_NACIMIENTO)
                       PROJECT(SOC:FECHA_TITULO)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:LUGAR_NACIMIENTO)
                       PROJECT(SOC:LUGAR_TRABAJO)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:OTRAS_MATRICULAS)
                       PROJECT(SOC:TELEFONO)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:IDTIPOTITULO)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:IDINSTITUCION)
                       JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                         PROJECT(TIP6:DESCRIPCION)
                       END
                       JOIN(LOC:PK_LOCALIDAD,SOC:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                       END
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                         PROJECT(TIP3:DESCRIPCION)
                       END
                       JOIN(INS2:PK_INSTITUCION,SOC:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2031,6865,7469),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1083,1000,6781,1031),USE(?Header)
                         IMAGE('Logo.JPG'),AT(10,10,1240,729),USE(?Image1)
                         STRING(@s255),AT(83,740,6177,208),USE(GLO:DIRECCION),CENTER,TRN
                         BOX,AT(10,948,6438,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Detail                 DETAIL,AT(10,10,6729,7167),USE(?Detail)
                         STRING('SOLICITUD DE MATRICULACION'),AT(1958,31),USE(?String26),FONT(,,,FONT:bold+FONT:underline), |
  TRN
                         STRING(@s30),AT(2656,1500,2260,208),USE(SOC:NOMBRE),FONT(,,,FONT:bold)
                         STRING(@s15),AT(31,1729),USE(TIP6:DESCRIPCION),TRN
                         STRING(', tiene el agrado de dirigirse a Ud. y por su intermedio a la comisión Directiva del'), |
  AT(1229,1719),USE(?String55),TRN
                         STRING('Colegio de Psicólogos del Valle Inferior de Rió Negro, para solicitar la inscri' & |
  'pción en la matrícula profesional.'),AT(31,1979,6573,208),USE(?String16),TRN
                         STRING('Declarando bajo juramento que los datos consignados a continuación son verdaderos.'), |
  AT(31,2229),USE(?String18),TRN
                         STRING('Apellido y Nombre: '),AT(31,2479),USE(?String19),TRN
                         STRING(@s30),AT(1219,2479),USE(SOC:NOMBRE,,?SOC:NOMBRE:2),FONT(,,,FONT:bold)
                         STRING(@s50),AT(2292,4229,3677,208),USE(INS2:NOMBRE),FONT(,,,FONT:bold)
                         STRING('Fecha Egreso:'),AT(31,4479),USE(?String23),TRN
                         STRING(@d17),AT(1021,4479),USE(SOC:FECHA_EGRESO),FONT(,,,FONT:bold)
                         STRING(@d17),AT(2781,4479),USE(SOC:FECHA_TITULO),FONT(,,,FONT:bold)
                         STRING('Fecha Titulo:'),AT(1927,4479),USE(?String54),TRN
                         STRING('Otras Matrículas:'),AT(31,4833),USE(?String37),TRN
                         STRING(@s50),AT(1135,4833,3823,208),USE(SOC:OTRAS_MATRICULAS),FONT(,,,FONT:bold)
                         STRING(@s5),AT(1990,2729),USE(TIP3:DESCRIPCION),FONT(,,,FONT:bold)
                         STRING('Fecha de Nacimiento: '),AT(31,2979),USE(?String40),TRN
                         STRING('Domicilio Legal:'),AT(31,3229),USE(?String43),TRN
                         STRING(@s100),AT(1042,3229),USE(SOC:DIRECCION),FONT(,,,FONT:bold)
                         STRING(@s20),AT(5146,3229),USE(LOC:DESCRIPCION),FONT(,,,FONT:bold)
                         STRING('Localidad:'),AT(4490,3229),USE(?String66),TRN
                         STRING('Correo Electrónico:'),AT(31,3479),USE(?String56),TRN
                         STRING(@s50),AT(1250,3479,3500,208),USE(SOC:EMAIL)
                         STRING(@s50),AT(1313,3729,3771,208),USE(SOC:LUGAR_TRABAJO)
                         STRING('Lugar de Trabajo:'),AT(31,3729),USE(?String58),TRN
                         STRING(@s50),AT(1427,3979),USE(SOC:DIRECCION_LABORAL)
                         STRING('Domicilio Profesional: '),AT(31,3979),USE(?String47),TRN
                         STRING(@s10),AT(3990,3979,2646,208),USE(SOC:TELEFONO_LABORAL)
                         STRING('Saluda a Ud. muy atentamente'),AT(1552,5438),USE(?String50),TRN
                         LINE,AT(3917,5823,2125,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Firma y Aclaración'),AT(4469,5865),USE(?String51),TRN
                         STRING('PARA USO EXCLUSIVO DEL COLEGIO '),AT(31,6333),USE(?String52),FONT(,,,FONT:bold),TRN
                         STRING('Informe de la Mesa Directiva:'),AT(31,6521),USE(?String53),TRN
                         LINE,AT(1802,6635,4417,0),USE(?Line2),COLOR(COLOR:Black)
                         LINE,AT(21,6885,6219,0),USE(?Line3),COLOR(COLOR:Black)
                         LINE,AT(10,7125,6229,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING(@s10),AT(3698,3229),USE(SOC:TELEFONO),FONT(,,,FONT:bold)
                         STRING(@d17),AT(1427,2979),USE(SOC:FECHA_NACIMIENTO),FONT(,,,FONT:bold)
                         STRING('Lugar Nacimiento:'),AT(2313,2979),USE(?String57),TRN
                         STRING(@s50),AT(3427,2979,2958,208),USE(SOC:LUGAR_NACIMIENTO),FONT(,,,FONT:bold)
                         STRING('Nro.:'),AT(2469,2729),USE(?String39),TRN
                         STRING('Documento de Identidad    Tipo:'),AT(31,2729),USE(?String38),TRN
                         STRING(@s14),AT(2844,2729),USE(SOC:N_DOCUMENTO),FONT(,,,FONT:bold)
                         STRING('Título expedido por la Universidad: '),AT(31,4229),USE(?String21),TRN
                         STRING('Viedma,'),AT(3490,292),USE(?String25),TRN
                         STRING(@s50),AT(4219,292),USE(GLO:FECHA_LARGO)
                         STRING('Sr/a. Presidente'),AT(63,792),USE(?String27),TRN
                         STRING('Colegio Psicólogos del Valle Inferior de Rio Negro'),AT(63,958),USE(?String28),TRN
                         STRING('S.{26}/.{25}D:'),AT(63,1146),USE(?String29),TRN
                         STRING('en su caracter de '),AT(5031,1490),USE(?String31),TRN
                         STRING('El/la que suscribe,'),AT(1344,1500),USE(?String30),TRN
                       END
                       FOOTER,AT(1000,9510,6865,1958),USE(?Footer)
                         STRING('.{163}'),AT(10,-94),USE(?String65),FONT(,,,FONT:bold),TRN
                         STRING('CONTANCIA DE SOLICITUD DE INSCRIPCION a  la MATRICULA'),AT(1323,229),USE(?String60), |
  FONT(,,,FONT:bold),TRN
                         STRING('Nombre:'),AT(63,479),USE(?String61),TRN
                         STRING(@s30),AT(635,479),USE(SOC:NOMBRE,,?SOC:NOMBRE:3)
                         STRING('Lugar y Fecha:'),AT(31,750),USE(?String62),TRN
                         STRING(@s50),AT(1563,750),USE(GLO:FECHA_LARGO,,?GLO:FECHA_LARGO:2),LEFT,TRN
                         LINE,AT(5021,802,1573,0),USE(?Line6),COLOR(COLOR:Black)
                         STRING('Firma del Receptor'),AT(5250,865),USE(?String64),TRN
                         STRING('VIEDMA, '),AT(969,750),USE(?String63),TRN
                       END
                       FORM,AT(990,1000,6875,10479),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_SOLICITUD_MATRICULACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_SOLICITUD_MATRICULACION',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisReport.AddSortOrder(SOC:PK_SOCIOS)
  ThisReport.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  Dia"= 'Domingo'
  Dia"= 'Lunes'
  Dia"= 'Martes'
  Dia"= 'Miercoles'
  Dia"= 'Jueves'
  Dia"= 'Viernes'
  Dia"= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  Mes" = 'Enero'
  Mes" = 'Febrero'
  Mes" = 'Marzo'
  Mes" = 'Abril'
  Mes" = 'Mayo'
  Mes" = 'Junio'
  Mes" = 'Julio'
  Mes" = 'Agosto'
  Mes" = 'Septiembre'
  Mes" = 'Octubre'
  Mes" = 'Noviembre'
  Mes" = 'Diciembre'
  END
  GLO:FECHA_LARGO = CLIP(Dia") & ' ' & DAY(TODAY()) & ' de ' &CLIP(Mes")&' '&Year(today())
  
  
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_SOLICITUD_MATRICULACION',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP6:DESCRIPCION')
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagName,'String55')
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagName,'INS2:NOMBRE')
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_EGRESO')
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_TITULO')
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagName,'String54')
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:OTRAS_MATRICULAS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:OTRAS_MATRICULAS,RepGen:XML,TargetAttr:TagName,'SOC:OTRAS_MATRICULAS')
  SELF.Attribute.Set(?SOC:OTRAS_MATRICULAS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP3:DESCRIPCION')
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagName,'String43')
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagName,'String66')
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String56,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String56,RepGen:XML,TargetAttr:TagName,'String56')
  SELF.Attribute.Set(?String56,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagName,'SOC:EMAIL')
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:LUGAR_TRABAJO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:LUGAR_TRABAJO,RepGen:XML,TargetAttr:TagName,'SOC:LUGAR_TRABAJO')
  SELF.Attribute.Set(?SOC:LUGAR_TRABAJO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagName,'String58')
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION_LABORAL')
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagName,'String47')
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO_LABORAL')
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagName,'String50')
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagName,'String51')
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagName,'String52')
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagName,'String53')
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO')
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_NACIMIENTO')
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagName,'String57')
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:LUGAR_NACIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:LUGAR_NACIMIENTO,RepGen:XML,TargetAttr:TagName,'SOC:LUGAR_NACIMIENTO')
  SELF.Attribute.Set(?SOC:LUGAR_NACIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'SOC:N_DOCUMENTO')
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagName,'String65')
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagName,'String60')
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagName,'String61')
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:3')
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagName,'String62')
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO:2,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO:2')
  SELF.Attribute.Set(?GLO:FECHA_LARGO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagName,'String64')
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagName,'String63')
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  FECHA_HASTA = TODAY() + 180
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HABILITACION','IMPRIMIR_CERTIFICADO_HABILITACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CERTIFICADO_ALTA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:ACTA)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:FECHA_ALTA)
                       PROJECT(SOC:FECHA_EGRESO)
                       PROJECT(SOC:FECHA_NACIMIENTO)
                       PROJECT(SOC:FECHA_TITULO)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:LIBRO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:TELEFONO)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:IDINSTITUCION)
                       PROJECT(SOC:IDCIRCULO)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:IDCOBERTURA)
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                         PROJECT(TIP3:DESCRIPCION)
                       END
                       JOIN(INS2:PK_INSTITUCION,SOC:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                       END
                       JOIN(CIR:PK_CIRCULO,SOC:IDCIRCULO)
                       END
                       JOIN(LOC:PK_LOCALIDAD,SOC:IDLOCALIDAD)
                         PROJECT(LOC:CP)
                         PROJECT(LOC:DESCRIPCION)
                       END
                       JOIN(COB:PK_COBERTURA,SOC:IDCOBERTURA)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2375,6250,7313),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:bold,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1396),USE(?Header)
                         IMAGE('logo.jpg'),AT(31,31,1521,1052),USE(?Image1)
                         BOX,AT(5146,42,1042,1042),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('CERTIFICADO DE MATRICULACION'),AT(2073,1156),USE(?String1),FONT(,12,,FONT:bold+FONT:underline), |
  TRN
                         LINE,AT(52,1104,6188,0),USE(?Line9),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,3677),USE(?Detail)
                         STRING(@s20),AT(4021,2260),USE(SOC:ACTA,,?SOC:ACTA:2)
                         LINE,AT(10,2458,6229,0),USE(?Line8),COLOR(COLOR:Black)
                         STRING('Aclaración del Colegiado:.{51}'),AT(83,3323),USE(?String49),TRN
                         STRING('Firma del Colegiado:.{52}'),AT(3396,3354),USE(?String48),TRN
                         STRING(@n-14),AT(417,2260),USE(SOC:LIBRO)
                         STRING(@d17),AT(979,2031),USE(SOC:FECHA_TITULO)
                         STRING(@s30),AT(3698,42,2365,198),USE(SOC:NOMBRE),FONT(,10)
                         LINE,AT(0,260,6240,0),USE(?Line7),COLOR(COLOR:Black)
                         STRING(@d17),AT(1135,760),USE(SOC:FECHA_NACIMIENTO)
                         STRING('Fecha Nacimiento:'),AT(10,760),USE(?String33),TRN
                         STRING(@s20),AT(1740,542),USE(LOC:DESCRIPCION)
                         STRING(@n-5),AT(365,542),USE(LOC:CP)
                         STRING('Tipo y Nº de Documento:'),AT(10,333),USE(?String28),TRN
                         STRING(@s7),AT(2708,42),USE(SOC:MATRICULA),FONT(,10)
                         STRING('Matrícula:'),AT(1917,42),USE(?String27),FONT(,10),TRN
                         STRING(@s14),AT(1823,333),USE(SOC:N_DOCUMENTO)
                         STRING(@s5),AT(1458,333),USE(TIP3:DESCRIPCION)
                         STRING('Dirección:'),AT(2854,333),USE(?String29),TRN
                         STRING(@s30),AT(4313,542),USE(SOC:TELEFONO)
                         STRING('Teléfono Particular:'),AT(3146,542),USE(?String32),TRN
                         STRING(@d17),AT(885,1490),USE(SOC:FECHA_ALTA)
                         STRING(@s100),AT(3479,333),USE(SOC:DIRECCION)
                         STRING('CP:'),AT(10,542),USE(?String30),TRN
                         STRING('Localidad:'),AT(1021,542),USE(?String31),TRN
                         STRING(@s50),AT(1104,1000),USE(SOC:DIRECCION_LABORAL)
                         STRING(@s30),AT(4313,1000),USE(SOC:TELEFONO_LABORAL)
                         STRING(@d17),AT(5615,1802),USE(SOC:FECHA_EGRESO),FONT('Arial',8,,FONT:bold,CHARSET:ANSI)
                         STRING('Fecha de Titulo:'),AT(31,2021),USE(?String39),TRN
                         LINE,AT(10,2229,6229,0),USE(?Line5),COLOR(COLOR:Black)
                         STRING('Libro:'),AT(10,2260),USE(?String41),TRN
                         STRING('Resolución:'),AT(3240,2260),USE(?String46),TRN
                         LINE,AT(10,1427,6229,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('Fecha de  Alta:'),AT(10,1490),USE(?String38),TRN
                         LINE,AT(42,1719,6208,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('Fecha de Egreso: '),AT(4573,1802),USE(?String44),TRN
                         STRING(@s50),AT(1406,1792,3146,198),USE(INS2:NOMBRE)
                         STRING('Título Expendido por :'),AT(10,1802),USE(?String45),TRN
                         STRING(@s50),AT(2344,760,2958,177),USE(SOC:EMAIL)
                         LINE,AT(10,948,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Dirección Laboral:'),AT(10,1000),USE(?String35),TRN
                         STRING('Teléfono Laboral:'),AT(3302,1000),USE(?String36),TRN
                         STRING('e-mail:'),AT(1875,760),USE(?String34),TRN
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         LINE,AT(10,0,7271,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,83),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,83),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,83),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_ALTA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_ALTA',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisReport.AddSortOrder(SOC:PK_SOCIOS)
  ThisReport.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CERTIFICADO_ALTA',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:ACTA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:ACTA:2,RepGen:XML,TargetAttr:TagName,'SOC:ACTA:2')
  SELF.Attribute.Set(?SOC:ACTA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagName,'String49')
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagName,'String48')
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagName,'SOC:LIBRO')
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_TITULO')
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_NACIMIENTO')
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagName,'String33')
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagName,'LOC:CP')
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'SOC:N_DOCUMENTO')
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP3:DESCRIPCION')
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO')
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_ALTA')
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION_LABORAL')
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO_LABORAL')
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_EGRESO')
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String41,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String41,RepGen:XML,TargetAttr:TagName,'String41')
  SELF.Attribute.Set(?String41,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagName,'String46')
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagName,'String44')
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagName,'INS2:NOMBRE')
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagName,'SOC:EMAIL')
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_ALTA','IMPRIMIR_CERTIFICADO_ALTA','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion SERVICIOXSOCIO
!!! </summary>
UpdateSERVICIOXSOCIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SER2:Record LIKE(SER2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SERVICIOXSOCIO'),AT(,,373,51),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateSERVICIOXSOCIO'),SYSTEM
                       PROMPT('IDSOCIO:'),AT(7,7),USE(?SER2:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(60,7,64,10),USE(SER2:IDSOCIO)
                       BUTTON('...'),AT(127,6,12,12),USE(?CallLookup)
                       STRING(@s30),AT(143,7),USE(SOC:NOMBRE)
                       PROMPT('MATRICULA:'),AT(274,7),USE(?Prompt3)
                       STRING(@n-14),AT(322,7),USE(SOC:MATRICULA)
                       BUTTON('...'),AT(127,18,12,12),USE(?CallLookup:2)
                       PROMPT('IDSERVICIOS:'),AT(7,22),USE(?SER2:IDSERVICIOS:Prompt),TRN
                       ENTRY(@n-14),AT(60,21,64,10),USE(SER2:IDSERVICIOS)
                       STRING(@s50),AT(143,20),USE(SER:DESCRIPCION)
                       BUTTON('&Aceptar'),AT(270,33,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(323,33,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

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
  GlobalErrors.SetProcedureName('UpdateSERVICIOXSOCIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SER2:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SER2:Record,History::SER2:Record)
  SELF.AddHistoryField(?SER2:IDSOCIO,1)
  SELF.AddHistoryField(?SER2:IDSERVICIOS,2)
  SELF.AddUpdateFile(Access:SERVICIOXSOCIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:SERVICIOS.Open                                    ! File SERVICIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SERVICIOXSOCIO.Open                               ! File SERVICIOXSOCIO used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SERVICIOXSOCIO
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
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?SER2:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    DISABLE(?CallLookup:2)
    ?SER2:IDSERVICIOS{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSERVICIOXSOCIO',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SERVICIOS.Close
    Relate:SERVICIOXSOCIO.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSERVICIOXSOCIO',QuickWindow)      ! Save window data to non-volatile store
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
      SelectSERVICIOS
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
      IF INSERTRECORD THEN
          SER2:FECHA = TODAY()
          SER2:HORA = CLOCK()
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SER2:IDSOCIO
      SOC:IDSOCIO = SER2:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          SER2:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?SER2:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SERVICIOXSOCIO.TryValidateField(1)         ! Attempt to validate SER2:IDSOCIO in SERVICIOXSOCIO
        SELECT(?SER2:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SER2:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SER2:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = SER2:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SER2:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:2
      ThisWindow.Update()
      SER:IDSERVICIOS = SER2:IDSERVICIOS
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        SER2:IDSERVICIOS = SER:IDSERVICIOS
      END
      ThisWindow.Reset(1)
    OF ?SER2:IDSERVICIOS
      SER:IDSERVICIOS = SER2:IDSERVICIOS
      IF Access:SERVICIOS.TryFetch(SER:PK_SERVICIOS)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SER2:IDSERVICIOS = SER:IDSERVICIOS
        ELSE
          SELECT(?SER2:IDSERVICIOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SERVICIOXSOCIO.TryValidateField(2)         ! Attempt to validate SER2:IDSERVICIOS in SERVICIOXSOCIO
        SELECT(?SER2:IDSERVICIOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SER2:IDSERVICIOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SER2:IDSERVICIOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a SERVICIOS Record
!!! </summary>
SelectSERVICIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SERVICIOS)
                       PROJECT(SER:IDSERVICIOS)
                       PROJECT(SER:DESCRIPCION)
                       PROJECT(SER:MONTO)
                       PROJECT(SER:DESCUENTO)
                       PROJECT(SER:INTERES)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SER:IDSERVICIOS        LIKE(SER:IDSERVICIOS)          !List box control field - type derived from field
SER:DESCRIPCION        LIKE(SER:DESCRIPCION)          !List box control field - type derived from field
SER:MONTO              LIKE(SER:MONTO)                !List box control field - type derived from field
SER:DESCUENTO          LIKE(SER:DESCUENTO)            !List box control field - type derived from field
SER:INTERES            LIKE(SER:INTERES)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a SERVICIOS Record'),AT(,,288,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectSERVICIOS'),SYSTEM
                       LIST,AT(8,30,272,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSERVICIOS~C(0)@n-14@80' & |
  'L(2)|M~DESCRIPCION~L(2)@s50@36D(14)|M~MONTO~C(0)@n-7.2@64R(2)|M~DESCUENTO~C(0)@n-14@' & |
  '36D(10)|M~INTERES~C(0)@n-7.2@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de SERVICIOS')
                       BUTTON('&Elegir'),AT(231,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,280,172),USE(?CurrentTab)
                         TAB('SERVICIOS'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(235,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectSERVICIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SER:IDSERVICIOS',SER:IDSERVICIOS)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SERVICIOS.Open                                    ! File SERVICIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SERVICIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SER:IDX_SERVICIOS_DESCRIPCION)        ! Add the sort order for SER:IDX_SERVICIOS_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SER:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: SER:IDX_SERVICIOS_DESCRIPCION , SER:DESCRIPCION
  BRW1.AddSortOrder(,SER:PK_SERVICIOS)                     ! Add the sort order for SER:PK_SERVICIOS for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,SER:IDSERVICIOS,,BRW1)         ! Initialize the browse locator using  using key: SER:PK_SERVICIOS , SER:IDSERVICIOS
  BRW1.AddField(SER:IDSERVICIOS,BRW1.Q.SER:IDSERVICIOS)    ! Field SER:IDSERVICIOS is a hot field or requires assignment from browse
  BRW1.AddField(SER:DESCRIPCION,BRW1.Q.SER:DESCRIPCION)    ! Field SER:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SER:MONTO,BRW1.Q.SER:MONTO)                ! Field SER:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(SER:DESCUENTO,BRW1.Q.SER:DESCUENTO)        ! Field SER:DESCUENTO is a hot field or requires assignment from browse
  BRW1.AddField(SER:INTERES,BRW1.Q.SER:INTERES)            ! Field SER:INTERES is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSERVICIOS',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:SERVICIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectSERVICIOS',QuickWindow)           ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
      END
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SERVICIOXSOCIO file
!!! </summary>
BrowseSERVICIOXSOCIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SERVICIOXSOCIO)
                       PROJECT(SER2:IDSOCIO)
                       PROJECT(SER2:IDSERVICIOS)
                       JOIN(SER:PK_SERVICIOS,SER2:IDSERVICIOS)
                         PROJECT(SER:DESCRIPCION)
                         PROJECT(SER:MONTO)
                         PROJECT(SER:IDSERVICIOS)
                       END
                       JOIN(SOC:PK_SOCIOS,SER2:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SER2:IDSOCIO           LIKE(SER2:IDSOCIO)             !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SER2:IDSERVICIOS       LIKE(SER2:IDSERVICIOS)         !List box control field - type derived from field
SER:DESCRIPCION        LIKE(SER:DESCRIPCION)          !List box control field - type derived from field
SER:MONTO              LIKE(SER:MONTO)                !List box control field - type derived from field
SER:IDSERVICIOS        LIKE(SER:IDSERVICIOS)          !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM SERVICIO X SOCIO '),AT(,,441,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseSERVICIOXSOCIO'),SYSTEM
                       LIST,AT(8,30,426,124),USE(?Browse:1),HVSCROLL,FORMAT('[33L(2)|M~IDSOCIO~L(0)@n-7@45L(2)' & |
  '|M~MATRICULA~L(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@](202)|M~COLEGIADOS~[22L(2)|M~IDS~C(' & |
  '0)@n-5@124L(2)|M~DESCRIPCION~C(0)@s30@28L(2)|M~MONTO~C(0)@n-10.2@]|M~SERVICIOS~'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de SERVICIOXSOCIO')
                       BUTTON('&Ver'),AT(227,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(280,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(333,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(386,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,436,172),USE(?CurrentTab)
                         TAB('NRO'),USE(?Tab:2)
                         END
                         TAB('SERVICIOS'),USE(?Tab:3)
                           BUTTON('Select SERVICIOS'),AT(8,158,118,14),USE(?SelectSERVICIOS),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('SOCIOS'),USE(?Tab:4)
                           BUTTON('Select SOCIOS'),AT(8,158,118,14),USE(?SelectSOCIOS),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                       END
                       BUTTON('&Salir'),AT(387,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('BrowseSERVICIOXSOCIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SER:IDSERVICIOS',SER:IDSERVICIOS)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SERVICIOXSOCIO.Open                               ! File SERVICIOXSOCIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SERVICIOXSOCIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SER2:FK_SERVICIOXSOCIO_SERVICIOS)     ! Add the sort order for SER2:FK_SERVICIOXSOCIO_SERVICIOS for sort order 1
  BRW1.AddRange(SER2:IDSERVICIOS,Relate:SERVICIOXSOCIO,Relate:SERVICIOS) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,SER2:FK_SERVICIOXSOCIO_SOCIOS)        ! Add the sort order for SER2:FK_SERVICIOXSOCIO_SOCIOS for sort order 2
  BRW1.AddRange(SER2:IDSOCIO,Relate:SERVICIOXSOCIO,Relate:SOCIOS) ! Add file relationship range limit for sort order 2
  BRW1.AddSortOrder(,SER2:PK_SOCIOS_SERVICIOS)             ! Add the sort order for SER2:PK_SOCIOS_SERVICIOS for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,SER2:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: SER2:PK_SOCIOS_SERVICIOS , SER2:IDSOCIO
  BRW1.AddField(SER2:IDSOCIO,BRW1.Q.SER2:IDSOCIO)          ! Field SER2:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SER2:IDSERVICIOS,BRW1.Q.SER2:IDSERVICIOS)  ! Field SER2:IDSERVICIOS is a hot field or requires assignment from browse
  BRW1.AddField(SER:DESCRIPCION,BRW1.Q.SER:DESCRIPCION)    ! Field SER:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SER:MONTO,BRW1.Q.SER:MONTO)                ! Field SER:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(SER:IDSERVICIOS,BRW1.Q.SER:IDSERVICIOS)    ! Field SER:IDSERVICIOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSERVICIOXSOCIO',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSERVICIOXSOCIO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
                                                 
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SERVICIOXSOCIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSERVICIOXSOCIO',QuickWindow)      ! Save window data to non-volatile store
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
    UpdateSERVICIOXSOCIO
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SelectSERVICIOS
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectSERVICIOS()
      ThisWindow.Reset
    OF ?SelectSOCIOS
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectSOCIOS()
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
      END
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
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion SERVICIOS
!!! </summary>
UpdateSERVICIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SER:Record  LIKE(SER:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SERVICIOS'),AT(,,273,96),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateSERVICIOS'),SYSTEM
                       BUTTON('&Aceptar'),AT(168,73,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(221,73,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('DESCRIPCION:'),AT(7,9),USE(?SER:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(61,9,204,10),USE(SER:DESCRIPCION),UPR
                       PROMPT('MONTO:'),AT(7,22),USE(?SER:MONTO:Prompt),TRN
                       ENTRY(@n-10.2),AT(61,22,40,10),USE(SER:MONTO)
                       PROMPT('DESCUENTO:'),AT(7,35),USE(?SER:DESCUENTO:Prompt)
                       ENTRY(@n-7.2),AT(61,35,40,10),USE(SER:DESCUENTO),DECIMAL(12)
                       PROMPT('INTERES:'),AT(7,48),USE(?SER:INTERES:Prompt),TRN
                       ENTRY(@n-7.2),AT(61,48,40,10),USE(SER:INTERES)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

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
  GlobalErrors.SetProcedureName('UpdateSERVICIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SER:Record,History::SER:Record)
  SELF.AddHistoryField(?SER:DESCRIPCION,2)
  SELF.AddHistoryField(?SER:MONTO,3)
  SELF.AddHistoryField(?SER:DESCUENTO,4)
  SELF.AddHistoryField(?SER:INTERES,5)
  SELF.AddUpdateFile(Access:SERVICIOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:SERVICIOS.Open                                    ! File SERVICIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SERVICIOS
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
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?SER:DESCRIPCION{PROP:ReadOnly} = True
    ?SER:MONTO{PROP:ReadOnly} = True
    ?SER:DESCUENTO{PROP:ReadOnly} = True
    ?SER:INTERES{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSERVICIOS',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SERVICIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSERVICIOS',QuickWindow)           ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SERVICIOS file
!!! </summary>
BrowseSERVICIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SERVICIOS)
                       PROJECT(SER:IDSERVICIOS)
                       PROJECT(SER:DESCRIPCION)
                       PROJECT(SER:MONTO)
                       PROJECT(SER:DESCUENTO)
                       PROJECT(SER:INTERES)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SER:IDSERVICIOS        LIKE(SER:IDSERVICIOS)          !List box control field - type derived from field
SER:DESCRIPCION        LIKE(SER:DESCRIPCION)          !List box control field - type derived from field
SER:MONTO              LIKE(SER:MONTO)                !List box control field - type derived from field
SER:DESCUENTO          LIKE(SER:DESCUENTO)            !List box control field - type derived from field
SER:INTERES            LIKE(SER:INTERES)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM SERVICIOS'),AT(,,288,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseSERVICIOS'),SYSTEM
                       LIST,AT(8,30,272,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSERVICIOS~C(0)@n-14@80' & |
  'L(2)|M~DESCRIPCION~@s50@47D(14)|M~MONTO~C(0)@n-10.2@64R(2)|M~DESCUENTO~C(0)@n-14@36D' & |
  '(10)|M~INTERES~C(0)@n-7.2@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de SERVICIOS')
                       BUTTON('&Ver'),AT(72,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(125,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(178,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(231,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,280,172),USE(?CurrentTab)
                         TAB('SERVICIOS'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(235,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('BrowseSERVICIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SER:IDSERVICIOS',SER:IDSERVICIOS)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SERVICIOS.Open                                    ! File SERVICIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SERVICIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SER:IDX_SERVICIOS_DESCRIPCION)        ! Add the sort order for SER:IDX_SERVICIOS_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SER:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: SER:IDX_SERVICIOS_DESCRIPCION , SER:DESCRIPCION
  BRW1.AddSortOrder(,SER:PK_SERVICIOS)                     ! Add the sort order for SER:PK_SERVICIOS for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,SER:IDSERVICIOS,,BRW1)         ! Initialize the browse locator using  using key: SER:PK_SERVICIOS , SER:IDSERVICIOS
  BRW1.AddField(SER:IDSERVICIOS,BRW1.Q.SER:IDSERVICIOS)    ! Field SER:IDSERVICIOS is a hot field or requires assignment from browse
  BRW1.AddField(SER:DESCRIPCION,BRW1.Q.SER:DESCRIPCION)    ! Field SER:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SER:MONTO,BRW1.Q.SER:MONTO)                ! Field SER:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(SER:DESCUENTO,BRW1.Q.SER:DESCUENTO)        ! Field SER:DESCUENTO is a hot field or requires assignment from browse
  BRW1.AddField(SER:INTERES,BRW1.Q.SER:INTERES)            ! Field SER:INTERES is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSERVICIOS',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSERVICIOS
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
                                                 
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SERVICIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSERVICIOS',QuickWindow)           ! Save window data to non-volatile store
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
    UpdateSERVICIOS
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
      END
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
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion RENUNCIA
!!! </summary>
UpdateRENUNCIA PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
CONSERVA_DEUDA       STRING('''O'' {17}')                  ! 
History::REN:Record  LIKE(REN:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion RENUNCIA'),AT(,,248,132),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateRENUNCIA'),SYSTEM
                       BUTTON('...'),AT(103,7,12,12),USE(?CallLookup)
                       STRING(@s30),AT(118,8),USE(SOC:NOMBRE)
                       PROMPT('IDSOCIO:'),AT(3,8),USE(?REN:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(37,8,64,10),USE(REN:IDSOCIO)
                       PROMPT('LIBRO:'),AT(3,22),USE(?REN:LIBRO:Prompt),TRN
                       ENTRY(@s50),AT(37,22,65,10),USE(REN:LIBRO)
                       PROMPT('FOLIO:'),AT(3,36),USE(?REN:FOLIO:Prompt),TRN
                       ENTRY(@n-14),AT(37,36,64,10),USE(REN:FOLIO)
                       PROMPT('ACTA:'),AT(3,50),USE(?REN:ACTA:Prompt),TRN
                       ENTRY(@s50),AT(37,50,204,10),USE(REN:ACTA)
                       PROMPT('FECHA BAJA:'),AT(2,65),USE(?REN:FECHA:Prompt)
                       ENTRY(@d17),AT(53,64,64,10),USE(REN:FECHA),REQ
                       OPTION('CONSERVA DEUDA'),AT(2,78,81,26),USE(CONSERVA_DEUDA),BOXED
                         RADIO('NO'),AT(11,89),USE(?CONSERVA_DEUDA:Radio1)
                         RADIO('SI'),AT(38,89),USE(?CONSERVA_DEUDA:Radio2)
                       END
                       BUTTON('&Aceptar'),AT(144,116,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(197,116,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

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
  GlobalErrors.SetProcedureName('UpdateRENUNCIA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CallLookup
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(REN:Record,History::REN:Record)
  SELF.AddHistoryField(?REN:IDSOCIO,2)
  SELF.AddHistoryField(?REN:LIBRO,4)
  SELF.AddHistoryField(?REN:FOLIO,5)
  SELF.AddHistoryField(?REN:ACTA,6)
  SELF.AddHistoryField(?REN:FECHA,7)
  SELF.AddUpdateFile(Access:RENUNCIA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:RENUNCIA.Open                                     ! File RENUNCIA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:RENUNCIA
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
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?CallLookup)
    ?REN:IDSOCIO{PROP:ReadOnly} = True
    ?REN:LIBRO{PROP:ReadOnly} = True
    ?REN:FOLIO{PROP:ReadOnly} = True
    ?REN:ACTA{PROP:ReadOnly} = True
    ?REN:FECHA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateRENUNCIA',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
    Relate:RENUNCIA.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateRENUNCIA',QuickWindow)            ! Save window data to non-volatile store
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
    SelectSOCIOS
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
      IF InsertRecord THEN
          !REN:FECHA = TODAY()
          REN:HORA = CLOCK()
          REN:IDUSUARIO = GLO:IDUSUARIO
          if REN:FECHA  <> 0 then
              
              SOC:IDSOCIO = REN:IDSOCIO
              ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
              SOC:BAJA        = 'SI'
              SOC:FECHA_BAJA  =  REN:FECHA 
              SOC:OBSERVACION =   REN:ACTA
              IF CONSERVA_DEUDA = 'NO' THEN
                  SOC:CANTIDAD = 0
              
                  !!! ANULA CUOTAS ADEUDADAS
                  FAC:IDSOCIO = REN:IDSOCIO
                  SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
                  LOOP
                      IF ACCESS:FACTURA.NEXT() THEN BREAK.
                      IF FAC:IDSOCIO <> REN:IDSOCIO  THEN BREAK.
                      IF FAC:ESTADO = '' THEN
                          FAC:ESTADO = 'ANULADO BAJA'
                          ACCESS:FACTURA.UPDATE()
                      END
                  END
              END
              ACCESS:SOCIOS.UPDATE()
          END
      END
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = REN:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        REN:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?REN:IDSOCIO
      SOC:IDSOCIO = REN:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          REN:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?REN:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:RENUNCIA.TryValidateField(2)               ! Attempt to validate REN:IDSOCIO in RENUNCIA
        SELECT(?REN:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?REN:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?REN:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
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

