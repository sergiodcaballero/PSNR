

   MEMBER('TRANS_NOMBRE.clw')                              ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('TRANS_NOMBRE002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('TRANS_NOMBRE003.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Lista del Archivo  SOCIOS
!!! </summary>
ListaSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:APELLIDO)
                       PROJECT(SOC:NOMBRES)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:ACTA)
                       PROJECT(SOC:BAJA)
                       PROJECT(SOC:LIBRO)
                       PROJECT(SOC:NRO_VIEJO)
                       PROJECT(SOC:IDPROVEEDOR)
                       PROJECT(SOC:PROVISORIO)
                       PROJECT(SOC:INGRESO)
                       PROJECT(SOC:IDCIRCULO)
                       PROJECT(SOC:IDCOBERTURA)
                       PROJECT(SOC:IDINSTITUCION)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:TIPOIVA)
                       PROJECT(SOC:IDUSUARIO)
                       PROJECT(SOC:IDZONA)
                       PROJECT(SOC:N_DOCUMENTO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:APELLIDO           LIKE(SOC:APELLIDO)             !List box control field - type derived from field
SOC:NOMBRES            LIKE(SOC:NOMBRES)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !Browse key field - type derived from field
SOC:ACTA               LIKE(SOC:ACTA)                 !Browse key field - type derived from field
SOC:BAJA               LIKE(SOC:BAJA)                 !Browse key field - type derived from field
SOC:LIBRO              LIKE(SOC:LIBRO)                !Browse key field - type derived from field
SOC:NRO_VIEJO          LIKE(SOC:NRO_VIEJO)            !Browse key field - type derived from field
SOC:IDPROVEEDOR        LIKE(SOC:IDPROVEEDOR)          !Browse key field - type derived from field
SOC:PROVISORIO         LIKE(SOC:PROVISORIO)           !Browse key field - type derived from field
SOC:INGRESO            LIKE(SOC:INGRESO)              !Browse key field - type derived from field
SOC:IDCIRCULO          LIKE(SOC:IDCIRCULO)            !Browse key field - type derived from field
SOC:IDCOBERTURA        LIKE(SOC:IDCOBERTURA)          !Browse key field - type derived from field
SOC:IDINSTITUCION      LIKE(SOC:IDINSTITUCION)        !Browse key field - type derived from field
SOC:IDLOCALIDAD        LIKE(SOC:IDLOCALIDAD)          !Browse key field - type derived from field
SOC:ID_TIPO_DOC        LIKE(SOC:ID_TIPO_DOC)          !Browse key field - type derived from field
SOC:TIPOIVA            LIKE(SOC:TIPOIVA)              !Browse key field - type derived from field
SOC:IDUSUARIO          LIKE(SOC:IDUSUARIO)            !Browse key field - type derived from field
SOC:IDZONA             LIKE(SOC:IDZONA)               !Browse key field - type derived from field
SOC:N_DOCUMENTO        LIKE(SOC:N_DOCUMENTO)          !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Lista del Archivo  SOCIOS'),AT(,,358,238),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ListaSOCIOS'),SYSTEM
                       LIST,AT(8,70,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSOCIO~C(0)@n-14@80L(2)' & |
  '|M~NOMBRE~@s50@95L(2)|M~APELLIDO~@s50@200L(2)|M~NOMBRES~@s50@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de SOCIOS')
                       BUTTON('&Ver'),AT(142,198,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,198,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,198,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,198,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,212),USE(?CurrentTab)
                         TAB('IDX_SOCIOS_DOCUMENTO'),USE(?Tab:2)
                         END
                         TAB('IDX_SOCIOS_MATRICULA'),USE(?Tab:3)
                         END
                         TAB('PK_SOCIOS'),USE(?Tab:4)
                         END
                         TAB('IDX_SOCIOS_ACTA'),USE(?Tab:5)
                         END
                         TAB('IDX_SOCIOS_BAJA'),USE(?Tab:6)
                         END
                         TAB('IDX_SOCIOS_LIBRO'),USE(?Tab:7)
                         END
                         TAB('IDX_SOCIOS_NOMBRE'),USE(?Tab:8)
                         END
                         TAB('IDX_SOCIOS_N_VIEJO'),USE(?Tab:9)
                         END
                         TAB('IDX_SOCIOS_PROVEEDOR'),USE(?Tab:10)
                         END
                         TAB('IDX_SOCIOS_PROVISORIO'),USE(?Tab:11)
                         END
                         TAB('IDX_SOCIO_INGRESO'),USE(?Tab:12)
                         END
                         TAB('FK_SOCIOS_CIRCULO'),USE(?Tab:13)
                         END
                         TAB('FK_SOCIOS_COBERTURA'),USE(?Tab:14)
                         END
                         TAB('FK_SOCIOS_INSTITUCION'),USE(?Tab:15)
                         END
                         TAB('FK_SOCIOS_LOCALIDAD'),USE(?Tab:16)
                         END
                         TAB('FK_SOCIOS_TIPO_DOC'),USE(?Tab:17)
                         END
                         TAB('FK_SOCIOS_TIPO_IVA'),USE(?Tab:18)
                         END
                         TAB('FK_SOCIOS_USUARIO'),USE(?Tab:19)
                         END
                         TAB('FK_SOCIOS_ZONA_VIVENDA'),USE(?Tab:20)
                         END
                         TAB('INTEG_173'),USE(?Tab:21)
                         END
                       END
                       BUTTON('&Salir'),AT(305,220,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,53),USE(?SortOrderList:Prompt)
                       LIST,AT(48,53,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('ListaSOCIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC:NRO_VIEJO',SOC:NRO_VIEJO)                      ! Added by: BrowseBox(ABC)
  BIND('SOC:ID_TIPO_DOC',SOC:ID_TIPO_DOC)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:N_DOCUMENTO',SOC:N_DOCUMENTO)                  ! Added by: BrowseBox(ABC)
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
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:5{PROP:TEXT},1,1)='&',SUB(?Tab:5{PROP:TEXT},2,LEN(?Tab:5{PROP:TEXT})-1),?Tab:5{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:6{PROP:TEXT},1,1)='&',SUB(?Tab:6{PROP:TEXT},2,LEN(?Tab:6{PROP:TEXT})-1),?Tab:6{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:7{PROP:TEXT},1,1)='&',SUB(?Tab:7{PROP:TEXT},2,LEN(?Tab:7{PROP:TEXT})-1),?Tab:7{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:8{PROP:TEXT},1,1)='&',SUB(?Tab:8{PROP:TEXT},2,LEN(?Tab:8{PROP:TEXT})-1),?Tab:8{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:9{PROP:TEXT},1,1)='&',SUB(?Tab:9{PROP:TEXT},2,LEN(?Tab:9{PROP:TEXT})-1),?Tab:9{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:10{PROP:TEXT},1,1)='&',SUB(?Tab:10{PROP:TEXT},2,LEN(?Tab:10{PROP:TEXT})-1),?Tab:10{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:11{PROP:TEXT},1,1)='&',SUB(?Tab:11{PROP:TEXT},2,LEN(?Tab:11{PROP:TEXT})-1),?Tab:11{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:12{PROP:TEXT},1,1)='&',SUB(?Tab:12{PROP:TEXT},2,LEN(?Tab:12{PROP:TEXT})-1),?Tab:12{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:13{PROP:TEXT},1,1)='&',SUB(?Tab:13{PROP:TEXT},2,LEN(?Tab:13{PROP:TEXT})-1),?Tab:13{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:14{PROP:TEXT},1,1)='&',SUB(?Tab:14{PROP:TEXT},2,LEN(?Tab:14{PROP:TEXT})-1),?Tab:14{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:15{PROP:TEXT},1,1)='&',SUB(?Tab:15{PROP:TEXT},2,LEN(?Tab:15{PROP:TEXT})-1),?Tab:15{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:16{PROP:TEXT},1,1)='&',SUB(?Tab:16{PROP:TEXT},2,LEN(?Tab:16{PROP:TEXT})-1),?Tab:16{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:17{PROP:TEXT},1,1)='&',SUB(?Tab:17{PROP:TEXT},2,LEN(?Tab:17{PROP:TEXT})-1),?Tab:17{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:18{PROP:TEXT},1,1)='&',SUB(?Tab:18{PROP:TEXT},2,LEN(?Tab:18{PROP:TEXT})-1),?Tab:18{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:19{PROP:TEXT},1,1)='&',SUB(?Tab:19{PROP:TEXT},2,LEN(?Tab:19{PROP:TEXT})-1),?Tab:19{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:20{PROP:TEXT},1,1)='&',SUB(?Tab:20{PROP:TEXT},2,LEN(?Tab:20{PROP:TEXT})-1),?Tab:20{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:21{PROP:TEXT},1,1)='&',SUB(?Tab:21{PROP:TEXT},2,LEN(?Tab:21{PROP:TEXT})-1),?Tab:21{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MATRICULA)             ! Add the sort order for SOC:IDX_SOCIOS_MATRICULA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SOC:MATRICULA,,BRW1)           ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_MATRICULA , SOC:MATRICULA
  BRW1.AddSortOrder(,SOC:PK_SOCIOS)                        ! Add the sort order for SOC:PK_SOCIOS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,SOC:IDSOCIO,,BRW1)             ! Initialize the browse locator using  using key: SOC:PK_SOCIOS , SOC:IDSOCIO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_ACTA)                  ! Add the sort order for SOC:IDX_SOCIOS_ACTA for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,SOC:ACTA,,BRW1)                ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_ACTA , SOC:ACTA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_BAJA)                  ! Add the sort order for SOC:IDX_SOCIOS_BAJA for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,SOC:BAJA,,BRW1)                ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_BAJA , SOC:BAJA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_LIBRO)                 ! Add the sort order for SOC:IDX_SOCIOS_LIBRO for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,SOC:LIBRO,,BRW1)               ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_LIBRO , SOC:LIBRO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,SOC:NOMBRE,,BRW1)              ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_N_VIEJO)               ! Add the sort order for SOC:IDX_SOCIOS_N_VIEJO for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,SOC:NRO_VIEJO,,BRW1)           ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_N_VIEJO , SOC:NRO_VIEJO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_PROVEEDOR)             ! Add the sort order for SOC:IDX_SOCIOS_PROVEEDOR for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,SOC:IDPROVEEDOR,,BRW1)         ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_PROVEEDOR , SOC:IDPROVEEDOR
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_PROVISORIO)            ! Add the sort order for SOC:IDX_SOCIOS_PROVISORIO for sort order 9
  BRW1.AddLocator(BRW1::Sort9:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort9:Locator.Init(,SOC:PROVISORIO,,BRW1)          ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_PROVISORIO , SOC:PROVISORIO
  BRW1.AddSortOrder(,SOC:IDX_SOCIO_INGRESO)                ! Add the sort order for SOC:IDX_SOCIO_INGRESO for sort order 10
  BRW1.AddLocator(BRW1::Sort10:Locator)                    ! Browse has a locator for sort order 10
  BRW1::Sort10:Locator.Init(,SOC:INGRESO,,BRW1)            ! Initialize the browse locator using  using key: SOC:IDX_SOCIO_INGRESO , SOC:INGRESO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_CIRCULO)                ! Add the sort order for SOC:FK_SOCIOS_CIRCULO for sort order 11
  BRW1.AddLocator(BRW1::Sort11:Locator)                    ! Browse has a locator for sort order 11
  BRW1::Sort11:Locator.Init(,SOC:IDCIRCULO,,BRW1)          ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_CIRCULO , SOC:IDCIRCULO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_COBERTURA)              ! Add the sort order for SOC:FK_SOCIOS_COBERTURA for sort order 12
  BRW1.AddLocator(BRW1::Sort12:Locator)                    ! Browse has a locator for sort order 12
  BRW1::Sort12:Locator.Init(,SOC:IDCOBERTURA,,BRW1)        ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_COBERTURA , SOC:IDCOBERTURA
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_INSTITUCION)            ! Add the sort order for SOC:FK_SOCIOS_INSTITUCION for sort order 13
  BRW1.AddLocator(BRW1::Sort13:Locator)                    ! Browse has a locator for sort order 13
  BRW1::Sort13:Locator.Init(,SOC:IDINSTITUCION,,BRW1)      ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_INSTITUCION , SOC:IDINSTITUCION
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_LOCALIDAD)              ! Add the sort order for SOC:FK_SOCIOS_LOCALIDAD for sort order 14
  BRW1.AddLocator(BRW1::Sort14:Locator)                    ! Browse has a locator for sort order 14
  BRW1::Sort14:Locator.Init(,SOC:IDLOCALIDAD,,BRW1)        ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_LOCALIDAD , SOC:IDLOCALIDAD
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_TIPO_DOC)               ! Add the sort order for SOC:FK_SOCIOS_TIPO_DOC for sort order 15
  BRW1.AddLocator(BRW1::Sort15:Locator)                    ! Browse has a locator for sort order 15
  BRW1::Sort15:Locator.Init(,SOC:ID_TIPO_DOC,,BRW1)        ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_TIPO_DOC , SOC:ID_TIPO_DOC
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_TIPO_IVA)               ! Add the sort order for SOC:FK_SOCIOS_TIPO_IVA for sort order 16
  BRW1.AddLocator(BRW1::Sort16:Locator)                    ! Browse has a locator for sort order 16
  BRW1::Sort16:Locator.Init(,SOC:TIPOIVA,,BRW1)            ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_TIPO_IVA , SOC:TIPOIVA
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_USUARIO)                ! Add the sort order for SOC:FK_SOCIOS_USUARIO for sort order 17
  BRW1.AddLocator(BRW1::Sort17:Locator)                    ! Browse has a locator for sort order 17
  BRW1::Sort17:Locator.Init(,SOC:IDUSUARIO,,BRW1)          ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_USUARIO , SOC:IDUSUARIO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_ZONA_VIVENDA)           ! Add the sort order for SOC:FK_SOCIOS_ZONA_VIVENDA for sort order 18
  BRW1.AddLocator(BRW1::Sort18:Locator)                    ! Browse has a locator for sort order 18
  BRW1::Sort18:Locator.Init(,SOC:IDZONA,,BRW1)             ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_ZONA_VIVENDA , SOC:IDZONA
  BRW1.AddSortOrder(,SOC:INTEG_173)                        ! Add the sort order for SOC:INTEG_173 for sort order 19
  BRW1.AddLocator(BRW1::Sort19:Locator)                    ! Browse has a locator for sort order 19
  BRW1::Sort19:Locator.Init(,SOC:IDUSUARIO,,BRW1)          ! Initialize the browse locator using  using key: SOC:INTEG_173 , SOC:IDUSUARIO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_DOCUMENTO)             ! Add the sort order for SOC:IDX_SOCIOS_DOCUMENTO for sort order 20
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 20
  BRW1::Sort0:Locator.Init(,SOC:N_DOCUMENTO,,BRW1)         ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_DOCUMENTO , SOC:N_DOCUMENTO
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:APELLIDO,BRW1.Q.SOC:APELLIDO)          ! Field SOC:APELLIDO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRES,BRW1.Q.SOC:NOMBRES)            ! Field SOC:NOMBRES is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ACTA,BRW1.Q.SOC:ACTA)                  ! Field SOC:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA,BRW1.Q.SOC:BAJA)                  ! Field SOC:BAJA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:LIBRO,BRW1.Q.SOC:LIBRO)                ! Field SOC:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NRO_VIEJO,BRW1.Q.SOC:NRO_VIEJO)        ! Field SOC:NRO_VIEJO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDPROVEEDOR,BRW1.Q.SOC:IDPROVEEDOR)    ! Field SOC:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(SOC:PROVISORIO,BRW1.Q.SOC:PROVISORIO)      ! Field SOC:PROVISORIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:INGRESO,BRW1.Q.SOC:INGRESO)            ! Field SOC:INGRESO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCIRCULO,BRW1.Q.SOC:IDCIRCULO)        ! Field SOC:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCOBERTURA,BRW1.Q.SOC:IDCOBERTURA)    ! Field SOC:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDINSTITUCION,BRW1.Q.SOC:IDINSTITUCION) ! Field SOC:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDLOCALIDAD,BRW1.Q.SOC:IDLOCALIDAD)    ! Field SOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ID_TIPO_DOC,BRW1.Q.SOC:ID_TIPO_DOC)    ! Field SOC:ID_TIPO_DOC is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TIPOIVA,BRW1.Q.SOC:TIPOIVA)            ! Field SOC:TIPOIVA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDUSUARIO,BRW1.Q.SOC:IDUSUARIO)        ! Field SOC:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDZONA,BRW1.Q.SOC:IDZONA)              ! Field SOC:IDZONA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:N_DOCUMENTO,BRW1.Q.SOC:N_DOCUMENTO)    ! Field SOC:N_DOCUMENTO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ListaSOCIOS',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: ActualizarSOCIOS
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
    INIMgr.Update('ListaSOCIOS',QuickWindow)               ! Save window data to non-volatile store
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
    ActualizarSOCIOS
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


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
       SELECT(?Tab:4)
       SELECT(?Tab:5)
       SELECT(?Tab:6)
       SELECT(?Tab:7)
       SELECT(?Tab:8)
       SELECT(?Tab:9)
       SELECT(?Tab:10)
       SELECT(?Tab:11)
       SELECT(?Tab:12)
       SELECT(?Tab:13)
       SELECT(?Tab:14)
       SELECT(?Tab:15)
       SELECT(?Tab:16)
       SELECT(?Tab:17)
       SELECT(?Tab:18)
       SELECT(?Tab:19)
       SELECT(?Tab:20)
       SELECT(?Tab:21)
      END
    END
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
  ELSE
    RETURN SELF.SetSort(20,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

