

   MEMBER('Padron.clw')                                    ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('PADRON002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('PADRON015.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SOCIOS File
!!! </summary>
BrowseSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:IDZONA)
                       PROJECT(SOC:IDCOBERTURA)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:IDUSUARIO)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:IDCIRCULO)
                       PROJECT(SOC:IDINSTITUCION)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:ACTA)
                       PROJECT(SOC:BAJA)
                       PROJECT(SOC:LIBRO)
                       PROJECT(SOC:NRO_VIEJO)
                       PROJECT(SOC:PROVISORIO)
                       PROJECT(SOC:INGRESO)
                       PROJECT(SOC:IDTIPOTITULO)
                       PROJECT(SOC:IDMINISTERIO)
                       PROJECT(SOC:IDCS)
                       PROJECT(SOC:IDPROVEEDOR)
                       PROJECT(SOC:TIPOIVA)
                       PROJECT(SOC:IDBANCO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:IDZONA             LIKE(SOC:IDZONA)               !List box control field - type derived from field
SOC:IDCOBERTURA        LIKE(SOC:IDCOBERTURA)          !List box control field - type derived from field
SOC:IDLOCALIDAD        LIKE(SOC:IDLOCALIDAD)          !List box control field - type derived from field
SOC:IDUSUARIO          LIKE(SOC:IDUSUARIO)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:N_DOCUMENTO        LIKE(SOC:N_DOCUMENTO)          !List box control field - type derived from field
SOC:DIRECCION          LIKE(SOC:DIRECCION)            !List box control field - type derived from field
SOC:IDCIRCULO          LIKE(SOC:IDCIRCULO)            !Browse key field - type derived from field
SOC:IDINSTITUCION      LIKE(SOC:IDINSTITUCION)        !Browse key field - type derived from field
SOC:ID_TIPO_DOC        LIKE(SOC:ID_TIPO_DOC)          !Browse key field - type derived from field
SOC:ACTA               LIKE(SOC:ACTA)                 !Browse key field - type derived from field
SOC:BAJA               LIKE(SOC:BAJA)                 !Browse key field - type derived from field
SOC:LIBRO              LIKE(SOC:LIBRO)                !Browse key field - type derived from field
SOC:NRO_VIEJO          LIKE(SOC:NRO_VIEJO)            !Browse key field - type derived from field
SOC:PROVISORIO         LIKE(SOC:PROVISORIO)           !Browse key field - type derived from field
SOC:INGRESO            LIKE(SOC:INGRESO)              !Browse key field - type derived from field
SOC:IDTIPOTITULO       LIKE(SOC:IDTIPOTITULO)         !Browse key field - type derived from field
SOC:IDMINISTERIO       LIKE(SOC:IDMINISTERIO)         !Browse key field - type derived from field
SOC:IDCS               LIKE(SOC:IDCS)                 !Browse key field - type derived from field
SOC:IDPROVEEDOR        LIKE(SOC:IDPROVEEDOR)          !Browse key field - type derived from field
SOC:TIPOIVA            LIKE(SOC:TIPOIVA)              !Browse key field - type derived from field
SOC:IDBANCO            LIKE(SOC:IDBANCO)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the SOCIOS File'),AT(,,358,258),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseSOCIOS'),SYSTEM
                       LIST,AT(8,90,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSOCIO~C(0)@n-14@40R(2)' & |
  '|M~MATRICULA~C(0)@n-5@64R(2)|M~IDZONA~C(0)@n-14@64R(2)|M~IDCOBERTURA~C(0)@n-14@64R(2' & |
  ')|M~IDLOCALIDAD~C(0)@n-14@64R(2)|M~IDUSUARIO~C(0)@n-14@80L(2)|M~NOMBRE~L(2)@s30@64R(' & |
  '2)|M~N DOCUMENTO~C(0)@n-14@80L(2)|M~DIRECCION~L(2)@s100@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de SOCIOS')
                       BUTTON('&Ver'),AT(142,218,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,218,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,218,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,218,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,232),USE(?CurrentTab)
                         TAB('PK_SOCIOS'),USE(?Tab:2)
                         END
                         TAB('IDX_SOCIOS_DOCUMENTO'),USE(?Tab:3)
                         END
                         TAB('IDX_SOCIOS_MATRICULA'),USE(?Tab:4)
                         END
                         TAB('FK_SOCIOS_CIRCULO'),USE(?Tab:5)
                         END
                         TAB('FK_SOCIOS_COBERTURA'),USE(?Tab:6)
                         END
                         TAB('FK_SOCIOS_INSTITUCION'),USE(?Tab:7)
                         END
                         TAB('FK_SOCIOS_LOCALIDAD'),USE(?Tab:8)
                         END
                         TAB('FK_SOCIOS_TIPO_DOC'),USE(?Tab:9)
                         END
                         TAB('FK_SOCIOS_USUARIO'),USE(?Tab:10)
                         END
                         TAB('FK_SOCIOS_ZONA_VIVENDA'),USE(?Tab:11)
                         END
                         TAB('IDX_SOCIOS_ACTA'),USE(?Tab:12)
                         END
                         TAB('IDX_SOCIOS_BAJA'),USE(?Tab:13)
                         END
                         TAB('IDX_SOCIOS_LIBRO'),USE(?Tab:14)
                         END
                         TAB('IDX_SOCIOS_NOMBRE'),USE(?Tab:15)
                         END
                         TAB('IDX_SOCIOS_N_VIEJO'),USE(?Tab:16)
                         END
                         TAB('IDX_SOCIOS_PROVISORIO'),USE(?Tab:17)
                         END
                         TAB('IDX_SOCIO_INGRESO'),USE(?Tab:18)
                         END
                         TAB('FK_SOCIOS_TIPO_TITULO'),USE(?Tab:19)
                         END
                         TAB('IDX_SOCIOS_MINISTERIO'),USE(?Tab:20)
                         END
                         TAB('SOCIOS_CENTRO_SALUD'),USE(?Tab:21)
                         END
                         TAB('IDX_SOCIOS_PROVEEDOR'),USE(?Tab:22)
                         END
                         TAB('FK_SOCIOS_TIPO_IVA'),USE(?Tab:23)
                         END
                         TAB('FK_SOCIOS_BANCO'),USE(?Tab:24)
                         END
                       END
                       BUTTON('&Salir'),AT(305,240,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
BRW1::Sort8:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 9
BRW1::Sort9:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 10
BRW1::Sort10:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 11
BRW1::Sort11:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 12
BRW1::Sort12:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 13
BRW1::Sort13:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 14
BRW1::Sort14:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 15
BRW1::Sort15:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 16
BRW1::Sort16:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 17
BRW1::Sort17:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 18
BRW1::Sort18:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 19
BRW1::Sort19:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 20
BRW1::Sort20:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 21
BRW1::Sort21:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 22
BRW1::Sort22:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 23
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
  BIND('SOC:ID_TIPO_DOC',SOC:ID_TIPO_DOC)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:NRO_VIEJO',SOC:NRO_VIEJO)                      ! Added by: BrowseBox(ABC)
  BIND('SOC:IDBANCO',SOC:IDBANCO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_DOCUMENTO)             ! Add the sort order for SOC:IDX_SOCIOS_DOCUMENTO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SOC:N_DOCUMENTO,,BRW1)         ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_DOCUMENTO , SOC:N_DOCUMENTO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MATRICULA)             ! Add the sort order for SOC:IDX_SOCIOS_MATRICULA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,SOC:MATRICULA,,BRW1)           ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_MATRICULA , SOC:MATRICULA
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_CIRCULO)                ! Add the sort order for SOC:FK_SOCIOS_CIRCULO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,SOC:IDCIRCULO,,BRW1)           ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_CIRCULO , SOC:IDCIRCULO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_COBERTURA)              ! Add the sort order for SOC:FK_SOCIOS_COBERTURA for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,SOC:IDCOBERTURA,,BRW1)         ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_COBERTURA , SOC:IDCOBERTURA
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_INSTITUCION)            ! Add the sort order for SOC:FK_SOCIOS_INSTITUCION for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,SOC:IDINSTITUCION,,BRW1)       ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_INSTITUCION , SOC:IDINSTITUCION
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_LOCALIDAD)              ! Add the sort order for SOC:FK_SOCIOS_LOCALIDAD for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,SOC:IDLOCALIDAD,,BRW1)         ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_LOCALIDAD , SOC:IDLOCALIDAD
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_TIPO_DOC)               ! Add the sort order for SOC:FK_SOCIOS_TIPO_DOC for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,SOC:ID_TIPO_DOC,,BRW1)         ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_TIPO_DOC , SOC:ID_TIPO_DOC
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_USUARIO)                ! Add the sort order for SOC:FK_SOCIOS_USUARIO for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,SOC:IDUSUARIO,,BRW1)           ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_USUARIO , SOC:IDUSUARIO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_ZONA_VIVENDA)           ! Add the sort order for SOC:FK_SOCIOS_ZONA_VIVENDA for sort order 9
  BRW1.AddLocator(BRW1::Sort9:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort9:Locator.Init(,SOC:IDZONA,,BRW1)              ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_ZONA_VIVENDA , SOC:IDZONA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_ACTA)                  ! Add the sort order for SOC:IDX_SOCIOS_ACTA for sort order 10
  BRW1.AddLocator(BRW1::Sort10:Locator)                    ! Browse has a locator for sort order 10
  BRW1::Sort10:Locator.Init(,SOC:ACTA,,BRW1)               ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_ACTA , SOC:ACTA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_BAJA)                  ! Add the sort order for SOC:IDX_SOCIOS_BAJA for sort order 11
  BRW1.AddLocator(BRW1::Sort11:Locator)                    ! Browse has a locator for sort order 11
  BRW1::Sort11:Locator.Init(,SOC:BAJA,,BRW1)               ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_BAJA , SOC:BAJA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_LIBRO)                 ! Add the sort order for SOC:IDX_SOCIOS_LIBRO for sort order 12
  BRW1.AddLocator(BRW1::Sort12:Locator)                    ! Browse has a locator for sort order 12
  BRW1::Sort12:Locator.Init(,SOC:LIBRO,,BRW1)              ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_LIBRO , SOC:LIBRO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 13
  BRW1.AddLocator(BRW1::Sort13:Locator)                    ! Browse has a locator for sort order 13
  BRW1::Sort13:Locator.Init(,SOC:NOMBRE,,BRW1)             ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_N_VIEJO)               ! Add the sort order for SOC:IDX_SOCIOS_N_VIEJO for sort order 14
  BRW1.AddLocator(BRW1::Sort14:Locator)                    ! Browse has a locator for sort order 14
  BRW1::Sort14:Locator.Init(,SOC:NRO_VIEJO,,BRW1)          ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_N_VIEJO , SOC:NRO_VIEJO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_PROVISORIO)            ! Add the sort order for SOC:IDX_SOCIOS_PROVISORIO for sort order 15
  BRW1.AddLocator(BRW1::Sort15:Locator)                    ! Browse has a locator for sort order 15
  BRW1::Sort15:Locator.Init(,SOC:PROVISORIO,,BRW1)         ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_PROVISORIO , SOC:PROVISORIO
  BRW1.AddSortOrder(,SOC:IDX_SOCIO_INGRESO)                ! Add the sort order for SOC:IDX_SOCIO_INGRESO for sort order 16
  BRW1.AddLocator(BRW1::Sort16:Locator)                    ! Browse has a locator for sort order 16
  BRW1::Sort16:Locator.Init(,SOC:INGRESO,,BRW1)            ! Initialize the browse locator using  using key: SOC:IDX_SOCIO_INGRESO , SOC:INGRESO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_TIPO_TITULO)            ! Add the sort order for SOC:FK_SOCIOS_TIPO_TITULO for sort order 17
  BRW1.AddLocator(BRW1::Sort17:Locator)                    ! Browse has a locator for sort order 17
  BRW1::Sort17:Locator.Init(,SOC:IDTIPOTITULO,,BRW1)       ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_TIPO_TITULO , SOC:IDTIPOTITULO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MINISTERIO)            ! Add the sort order for SOC:IDX_SOCIOS_MINISTERIO for sort order 18
  BRW1.AddLocator(BRW1::Sort18:Locator)                    ! Browse has a locator for sort order 18
  BRW1::Sort18:Locator.Init(,SOC:IDMINISTERIO,,BRW1)       ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_MINISTERIO , SOC:IDMINISTERIO
  BRW1.AddSortOrder(,SOC:SOCIOS_CENTRO_SALUD)              ! Add the sort order for SOC:SOCIOS_CENTRO_SALUD for sort order 19
  BRW1.AddLocator(BRW1::Sort19:Locator)                    ! Browse has a locator for sort order 19
  BRW1::Sort19:Locator.Init(,SOC:IDCS,,BRW1)               ! Initialize the browse locator using  using key: SOC:SOCIOS_CENTRO_SALUD , SOC:IDCS
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_PROVEEDOR)             ! Add the sort order for SOC:IDX_SOCIOS_PROVEEDOR for sort order 20
  BRW1.AddLocator(BRW1::Sort20:Locator)                    ! Browse has a locator for sort order 20
  BRW1::Sort20:Locator.Init(,SOC:IDPROVEEDOR,,BRW1)        ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_PROVEEDOR , SOC:IDPROVEEDOR
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_TIPO_IVA)               ! Add the sort order for SOC:FK_SOCIOS_TIPO_IVA for sort order 21
  BRW1.AddLocator(BRW1::Sort21:Locator)                    ! Browse has a locator for sort order 21
  BRW1::Sort21:Locator.Init(,SOC:TIPOIVA,1,BRW1)           ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_TIPO_IVA , SOC:TIPOIVA
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_BANCO)                  ! Add the sort order for SOC:FK_SOCIOS_BANCO for sort order 22
  BRW1.AddLocator(BRW1::Sort22:Locator)                    ! Browse has a locator for sort order 22
  BRW1::Sort22:Locator.Init(,SOC:IDBANCO,,BRW1)            ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_BANCO , SOC:IDBANCO
  BRW1.AddSortOrder(,SOC:PK_SOCIOS)                        ! Add the sort order for SOC:PK_SOCIOS for sort order 23
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 23
  BRW1::Sort0:Locator.Init(,SOC:IDSOCIO,,BRW1)             ! Initialize the browse locator using  using key: SOC:PK_SOCIOS , SOC:IDSOCIO
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDZONA,BRW1.Q.SOC:IDZONA)              ! Field SOC:IDZONA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCOBERTURA,BRW1.Q.SOC:IDCOBERTURA)    ! Field SOC:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDLOCALIDAD,BRW1.Q.SOC:IDLOCALIDAD)    ! Field SOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDUSUARIO,BRW1.Q.SOC:IDUSUARIO)        ! Field SOC:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:N_DOCUMENTO,BRW1.Q.SOC:N_DOCUMENTO)    ! Field SOC:N_DOCUMENTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:DIRECCION,BRW1.Q.SOC:DIRECCION)        ! Field SOC:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCIRCULO,BRW1.Q.SOC:IDCIRCULO)        ! Field SOC:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDINSTITUCION,BRW1.Q.SOC:IDINSTITUCION) ! Field SOC:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ID_TIPO_DOC,BRW1.Q.SOC:ID_TIPO_DOC)    ! Field SOC:ID_TIPO_DOC is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ACTA,BRW1.Q.SOC:ACTA)                  ! Field SOC:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA,BRW1.Q.SOC:BAJA)                  ! Field SOC:BAJA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:LIBRO,BRW1.Q.SOC:LIBRO)                ! Field SOC:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NRO_VIEJO,BRW1.Q.SOC:NRO_VIEJO)        ! Field SOC:NRO_VIEJO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:PROVISORIO,BRW1.Q.SOC:PROVISORIO)      ! Field SOC:PROVISORIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:INGRESO,BRW1.Q.SOC:INGRESO)            ! Field SOC:INGRESO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDTIPOTITULO,BRW1.Q.SOC:IDTIPOTITULO)  ! Field SOC:IDTIPOTITULO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDMINISTERIO,BRW1.Q.SOC:IDMINISTERIO)  ! Field SOC:IDMINISTERIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCS,BRW1.Q.SOC:IDCS)                  ! Field SOC:IDCS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDPROVEEDOR,BRW1.Q.SOC:IDPROVEEDOR)    ! Field SOC:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TIPOIVA,BRW1.Q.SOC:TIPOIVA)            ! Field SOC:TIPOIVA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDBANCO,BRW1.Q.SOC:IDBANCO)            ! Field SOC:IDBANCO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSOCIOS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSOCIOS
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSIF CHOICE(?CurrentTab) = 10
    RETURN SELF.SetSort(9,Force)
  ELSIF CHOICE(?CurrentTab) = 11
    RETURN SELF.SetSort(10,Force)
  ELSIF CHOICE(?CurrentTab) = 12
    RETURN SELF.SetSort(11,Force)
  ELSIF CHOICE(?CurrentTab) = 13
    RETURN SELF.SetSort(12,Force)
  ELSIF CHOICE(?CurrentTab) = 14
    RETURN SELF.SetSort(13,Force)
  ELSIF CHOICE(?CurrentTab) = 15
    RETURN SELF.SetSort(14,Force)
  ELSIF CHOICE(?CurrentTab) = 16
    RETURN SELF.SetSort(15,Force)
  ELSIF CHOICE(?CurrentTab) = 17
    RETURN SELF.SetSort(16,Force)
  ELSIF CHOICE(?CurrentTab) = 18
    RETURN SELF.SetSort(17,Force)
  ELSIF CHOICE(?CurrentTab) = 19
    RETURN SELF.SetSort(18,Force)
  ELSIF CHOICE(?CurrentTab) = 20
    RETURN SELF.SetSort(19,Force)
  ELSIF CHOICE(?CurrentTab) = 21
    RETURN SELF.SetSort(20,Force)
  ELSIF CHOICE(?CurrentTab) = 22
    RETURN SELF.SetSort(21,Force)
  ELSIF CHOICE(?CurrentTab) = 23
    RETURN SELF.SetSort(22,Force)
  ELSE
    RETURN SELF.SetSort(23,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

