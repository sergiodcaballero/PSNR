

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION292.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION025.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION277.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION293.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION294.INC'),ONCE        !Req'd for module callout resolution
                     END


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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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

