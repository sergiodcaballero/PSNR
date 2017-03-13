

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION128.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION127.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION129.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the LIQUIDACION File
!!! </summary>
LIQUIDACION_PAGO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(LIQUIDACION)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:PRESENTADO)
                       PROJECT(LIQ:IDSOCIO)
                       PROJECT(LIQ:PERIODO)
                       PROJECT(LIQ:TIPO_PERIODO)
                       PROJECT(LIQ:MONTO)
                       PROJECT(LIQ:DEBITO)
                       PROJECT(LIQ:COMISION)
                       PROJECT(LIQ:DEBITO_PAGO_CUOTAS)
                       PROJECT(LIQ:MONTO_TOTAL)
                       PROJECT(LIQ:FECHA_CARGA)
                       PROJECT(LIQ:FECHA_PRESENTACION)
                       PROJECT(LIQ:FECHA_PAGO)
                       PROJECT(LIQ:PAGADO)
                       PROJECT(LIQ:IDOS)
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMPRE_CORTO)
                         PROJECT(OBR:IDOS)
                       END
                       JOIN(SOC:PK_SOCIOS,LIQ:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LIQ:IDLIQUIDACION      LIKE(LIQ:IDLIQUIDACION)        !List box control field - type derived from field
LIQ:IDLIQUIDACION_Icon LONG                           !Entry's icon ID
LIQ:MES                LIKE(LIQ:MES)                  !List box control field - type derived from field
LIQ:ANO                LIKE(LIQ:ANO)                  !List box control field - type derived from field
LIQ:PRESENTADO         LIKE(LIQ:PRESENTADO)           !List box control field - type derived from field
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
LIQ:IDSOCIO            LIKE(LIQ:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
LIQ:PERIODO            LIKE(LIQ:PERIODO)              !List box control field - type derived from field
LIQ:TIPO_PERIODO       LIKE(LIQ:TIPO_PERIODO)         !List box control field - type derived from field
LIQ:MONTO              LIKE(LIQ:MONTO)                !List box control field - type derived from field
LIQ:DEBITO             LIKE(LIQ:DEBITO)               !List box control field - type derived from field
LIQ:COMISION           LIKE(LIQ:COMISION)             !List box control field - type derived from field
LIQ:DEBITO_PAGO_CUOTAS LIKE(LIQ:DEBITO_PAGO_CUOTAS)   !List box control field - type derived from field
LIQ:MONTO_TOTAL        LIKE(LIQ:MONTO_TOTAL)          !List box control field - type derived from field
LIQ:FECHA_CARGA        LIKE(LIQ:FECHA_CARGA)          !List box control field - type derived from field
LIQ:FECHA_PRESENTACION LIKE(LIQ:FECHA_PRESENTACION)   !List box control field - type derived from field
LIQ:FECHA_PAGO         LIKE(LIQ:FECHA_PAGO)           !List box control field - type derived from field
LIQ:PAGADO             LIKE(LIQ:PAGADO)               !List box control field - type derived from field
LIQ:IDOS               LIKE(LIQ:IDOS)                 !Browse key field - type derived from field
OBR:IDOS               LIKE(OBR:IDOS)                 !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('LIQUIDACIONES COBRADAS'),AT(,,521,329),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('CARGA_LIQUIDACION'),SYSTEM
                       LIST,AT(8,42,503,239),USE(?Browse:1),HVSCROLL,FORMAT('46L(2)|MI~ID~C(0)@n-7@23L(2)|M~ME' & |
  'S~C(0)@n-3@27L(2)|M~AÑO~C(0)@n-5@55L|M~PRESENTADO~C@s2@120L(2)|M~OBRA SOCIAL~C(0)@s3' & |
  '0@[120L(2)|M~NOMBRE~C(0)@s30@46L(2)|M~IDSOCIO~C(0)@n-7@49L(2)|M~MATRICULA~C(0)@n-5@]' & |
  '|M~Colegiado~32L(2)|M~PERIODO~@s6@80L(2)|M~TIPO PERIODO~@s30@[36L(1)|M~PRESENTADO~D(' & |
  '14)@n-10.2@40L(1)|M~DEBITO~C(0)@n10.2@40L(1)|M~COMISION COL~C(0)@n10.2@40L(1)|M~PAG ' & |
  'CUOTAS~D(14)@n10.2@48L(1)|M~MONTO A COBRAR~C(0)@N9.2@](231)|M~MONTOS~[62L(2)|M~FECHA' & |
  ' CARGA~C(0)@d17@93L(2)|M~FECHA PRESENTACION~C(0)@d17@40L(2)|M~FECHA PAGO~C(0)@d17@](' & |
  '222)|M~FECHAS~8R(2)|M~PAGADO~C(0)@s2@'),FROM(Queue:Browse:1),IMM,MSG('Administrador ' & |
  'de LIQUIDACION')
                       BUTTON('&Elegir'),AT(253,288,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(306,288,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('E&xportar'),AT(56,310,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(5,310,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       SHEET,AT(4,4,515,302),USE(?CurrentTab)
                         TAB('LIQUIDACION SIN PAGAR '),USE(?Tab:1)
                           BUTTON('Generar Diskette de Pago por Banco'),AT(11,286,103,17),USE(?Button7),LEFT,ICON(ICON:Save), |
  FLAT
                           BUTTON('&Cargar el Pago Manual'),AT(403,287,105,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                         END
                         TAB('LIQUIDACIONES PAGADAS'),USE(?Tab:2)
                         END
                         TAB('OBRA SOCIAL'),USE(?Tab:3)
                         END
                         TAB('PERIODO'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Salir'),AT(473,315,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist8 QUEUE,PRE(QHL8)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar8 QUEUE,PRE(Q8)
FieldPar                 CSTRING(800)
                         END
QPar28 QUEUE,PRE(Qp28)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado8          STRING(100)
Loc::Titulo8          STRING(100)
SavPath8          STRING(2000)
Evo::Group8  GROUP,PRE()
Evo::Procedure8          STRING(100)
Evo::App8          STRING(100)
Evo::NroPage          LONG
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

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_8  SHORT
Gol_woI_8 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_8),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_8),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_8),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_8),TRN
       END
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
PrintExBrowse8 ROUTINE

 OPEN(Gol_woI_8)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_8 = BRW1.FileLoaded
 IF Not  EC::LoadI_8
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_8)
 SETCURSOR()
  Evo::App8          = 'Gestion'
  Evo::Procedure8          = GlobalErrors.GetProcedureName()& 8
 
  FREE(QPar8)
  Q8:FieldPar  = '1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,'
  ADD(QPar8)  !!1
  Q8:FieldPar  = ';'
  ADD(QPar8)  !!2
  Q8:FieldPar  = 'Spanish'
  ADD(QPar8)  !!3
  Q8:FieldPar  = ''
  ADD(QPar8)  !!4
  Q8:FieldPar  = true
  ADD(QPar8)  !!5
  Q8:FieldPar  = ''
  ADD(QPar8)  !!6
  Q8:FieldPar  = true
  ADD(QPar8)  !!7
 !!!! Exportaciones
  Q8:FieldPar  = 'HTML|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'EXCEL|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'WORD|'
  Q8:FieldPar  = CLIP( Q8:FieldPar)&'ASCII|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'XML|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'PRT|'
  ADD(QPar8)  !!8
  Q8:FieldPar  = 'All'
  ADD(QPar8)   !.9.
  Q8:FieldPar  = ' 0'
  ADD(QPar8)   !.10
  Q8:FieldPar  = 0
  ADD(QPar8)   !.11
  Q8:FieldPar  = '1'
  ADD(QPar8)   !.12
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.13
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.14
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.15
 
   Q8:FieldPar  = '16'
  ADD(QPar8)   !.16
 
   Q8:FieldPar  = 1
  ADD(QPar8)   !.17
   Q8:FieldPar  = 2
  ADD(QPar8)   !.18
   Q8:FieldPar  = '2'
  ADD(QPar8)   !.19
   Q8:FieldPar  = 12
  ADD(QPar8)   !.20
 
   Q8:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar8)   !.21
 
   Q8:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar8)   !.22
 
   CLEAR(Q8:FieldPar)
  ADD(QPar8)   ! 23 Caracteres Encoding para xml
 
  Q8:FieldPar  = '0'
  ADD(QPar8)   ! 24 Use Open Office
 
   Q8:FieldPar  = 'golmedo'
  ADD(QPar8) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q8:FieldPar  = ' BrowseExport'
  ADD(QPar8)   ! 26  BrowseExport
  Q8:FieldPar  = ' '
  ADD(QPar8)   ! 27  
  Q8:FieldPar  = ' ' 
  ADD(QPar8)   ! 28  
  Q8:FieldPar  = 'BEXPORT' 
  ADD(QPar8)   ! 29 Gestion128.clw
 !!!!!
 
 
  FREE(QPar28)
       Qp28:F2N  = 'ID'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MES'
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'ANO'
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PRESENTADO'
  Qp28:F2P  = '@s2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'NOMPRE CORTO'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'NOMBRE'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDSOCIO'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MATRICULA'
  Qp28:F2P  = '@n-5'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PERIODO'
  Qp28:F2P  = '@s6'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'TIPO PERIODO'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MONTO'
  Qp28:F2P  = '@n-7.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'DEBITO'
  Qp28:F2P  = '@n10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'COMISION COL'
  Qp28:F2P  = '@n10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PAG CUOTAS'
  Qp28:F2P  = '@n10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MONTO A COBRAR'
  Qp28:F2P  = '@n12.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA CARGA'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA PRESENTACION'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA PAGO'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PAGADO'
  Qp28:F2P  = '@s2'
  Qp28:F2T  = '0'
  ADD(QPar28)
  SysRec# = false
  FREE(Loc::QHlist8)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar28,SysRec#)
         QHL8:Id      = SysRec#
         QHL8:Nombre  = Qp28:F2N
         QHL8:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL8:Pict    = Qp28:F2P
         QHL8:Tot    = Qp28:F2T
         ADD(Loc::QHlist8)
      Else
        break
     END
  END
  Loc::Titulo8 ='Administrator the LIQUIDACION'
 
 SavPath8 = PATH()
  Exportar(Loc::QHlist8,BRW1.Q,QPar8,0,Loc::Titulo8,Evo::Group8)
 IF Not EC::LoadI_8 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath8)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LIQUIDACION_PAGO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('LIQ:TIPO_PERIODO',LIQ:TIPO_PERIODO)                ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_CARGA',LIQ:FECHA_CARGA)                  ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_PRESENTACION',LIQ:FECHA_PRESENTACION)    ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_PAGO',LIQ:FECHA_PAGO)                    ! Added by: BrowseBox(ABC)
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LIQUIDACION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE9.Init(QBV9, INIMgr,'CARGA_LIQUIDACION', GlobalErrors)
  QBE9.QkSupport = True
  QBE9.QkMenuIcon = 'QkQBE.ico'
  QBE9.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,LIQ:PK_LIQUIDACION)                   ! Add the sort order for LIQ:PK_LIQUIDACION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,LIQ:IDLIQUIDACION,,BRW1)       ! Initialize the browse locator using  using key: LIQ:PK_LIQUIDACION , LIQ:IDLIQUIDACION
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:COBRADO = ''SI''  AND LIQ:PAGADO = ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:FK_LIQUIDACION_OS)                ! Add the sort order for LIQ:FK_LIQUIDACION_OS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,LIQ:IDOS,,BRW1)                ! Initialize the browse locator using  using key: LIQ:FK_LIQUIDACION_OS , LIQ:IDOS
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:PAGADO = '''')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:IDX_LIQUIDACION_PERIODO)          ! Add the sort order for LIQ:IDX_LIQUIDACION_PERIODO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,LIQ:PERIODO,,BRW1)             ! Initialize the browse locator using  using key: LIQ:IDX_LIQUIDACION_PERIODO , LIQ:PERIODO
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:PAGADO = '''')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:PK_LIQUIDACION)                   ! Add the sort order for LIQ:PK_LIQUIDACION for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,LIQ:IDLIQUIDACION,,BRW1)       ! Initialize the browse locator using  using key: LIQ:PK_LIQUIDACION , LIQ:IDLIQUIDACION
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:COBRADO = ''SI''  AND LIQ:PAGADO = ''NO'')') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~POSTED2.ICO'
  BRW1.AddField(LIQ:IDLIQUIDACION,BRW1.Q.LIQ:IDLIQUIDACION) ! Field LIQ:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:MES,BRW1.Q.LIQ:MES)                    ! Field LIQ:MES is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:ANO,BRW1.Q.LIQ:ANO)                    ! Field LIQ:ANO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PRESENTADO,BRW1.Q.LIQ:PRESENTADO)      ! Field LIQ:PRESENTADO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMPRE_CORTO,BRW1.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:IDSOCIO,BRW1.Q.LIQ:IDSOCIO)            ! Field LIQ:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PERIODO,BRW1.Q.LIQ:PERIODO)            ! Field LIQ:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:TIPO_PERIODO,BRW1.Q.LIQ:TIPO_PERIODO)  ! Field LIQ:TIPO_PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:MONTO,BRW1.Q.LIQ:MONTO)                ! Field LIQ:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:DEBITO,BRW1.Q.LIQ:DEBITO)              ! Field LIQ:DEBITO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:COMISION,BRW1.Q.LIQ:COMISION)          ! Field LIQ:COMISION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:DEBITO_PAGO_CUOTAS,BRW1.Q.LIQ:DEBITO_PAGO_CUOTAS) ! Field LIQ:DEBITO_PAGO_CUOTAS is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:MONTO_TOTAL,BRW1.Q.LIQ:MONTO_TOTAL)    ! Field LIQ:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_CARGA,BRW1.Q.LIQ:FECHA_CARGA)    ! Field LIQ:FECHA_CARGA is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_PRESENTACION,BRW1.Q.LIQ:FECHA_PRESENTACION) ! Field LIQ:FECHA_PRESENTACION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_PAGO,BRW1.Q.LIQ:FECHA_PAGO)      ! Field LIQ:FECHA_PAGO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PAGADO,BRW1.Q.LIQ:PAGADO)              ! Field LIQ:PAGADO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:IDOS,BRW1.Q.LIQ:IDOS)                  ! Field LIQ:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(OBR:IDOS,BRW1.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_PAGO',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE9,1)
  BRW1.AskProcedure = 1                                    ! Will call: LIQUIDACION_PAGO_FORM
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_PAGO',QuickWindow)          ! Save window data to non-volatile store
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
    LIQUIDACION_PAGO_FORM
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse8
    OF ?Button7
      ThisWindow.Update()
      START(GENERAR_DISKETTE, 25000)
      ThisWindow.Reset
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
    SELF.ChangeControl=?Change:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


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
  
  IF (LIQ:PRESENTADO = 'SI' AND LIQ:PAGADO = 'SI')
    SELF.Q.LIQ:IDLIQUIDACION_Icon = 1                      ! Set icon from icon list
  ELSE
    SELF.Q.LIQ:IDLIQUIDACION_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

