

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION126.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION119.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION120.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PAGOS_LIQUIDACION File
!!! </summary>
Pagos_Liquidacion PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PAGOS_LIQUIDACION)
                       PROJECT(PAGL:IDPAGOS)
                       PROJECT(PAGL:IDSOCIO)
                       PROJECT(PAGL:FECHA)
                       PROJECT(PAGL:SOCIOS_LIQUIDACION)
                       PROJECT(PAGL:MONTO_FACTURA)
                       PROJECT(PAGL:MONTO)
                       PROJECT(PAGL:DEBITO)
                       PROJECT(PAGL:CUOTA)
                       PROJECT(PAGL:SEGURO)
                       PROJECT(PAGL:GASTOS_ADM)
                       PROJECT(PAGL:MONTO_IMP_CHEQUE)
                       JOIN(SOC:PK_SOCIOS,PAGL:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAGL:IDPAGOS           LIKE(PAGL:IDPAGOS)             !List box control field - type derived from field
PAGL:IDSOCIO           LIKE(PAGL:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAGL:FECHA             LIKE(PAGL:FECHA)               !List box control field - type derived from field
PAGL:SOCIOS_LIQUIDACION LIKE(PAGL:SOCIOS_LIQUIDACION) !List box control field - type derived from field
PAGL:MONTO_FACTURA     LIKE(PAGL:MONTO_FACTURA)       !List box control field - type derived from field
PAGL:MONTO             LIKE(PAGL:MONTO)               !List box control field - type derived from field
PAGL:DEBITO            LIKE(PAGL:DEBITO)              !List box control field - type derived from field
PAGL:CUOTA             LIKE(PAGL:CUOTA)               !List box control field - type derived from field
PAGL:SEGURO            LIKE(PAGL:SEGURO)              !List box control field - type derived from field
PAGL:GASTOS_ADM        LIKE(PAGL:GASTOS_ADM)          !List box control field - type derived from field
PAGL:MONTO_IMP_CHEQUE  LIKE(PAGL:MONTO_IMP_CHEQUE)    !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(LIQUIDACION)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:IDPAGO_LIQUIDACION)
                       PROJECT(LIQ:IDOS)
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMBRE)
                         PROJECT(OBR:IDOS)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
LIQ:IDLIQUIDACION      LIKE(LIQ:IDLIQUIDACION)        !List box control field - type derived from field
LIQ:MES                LIKE(LIQ:MES)                  !List box control field - type derived from field
LIQ:ANO                LIKE(LIQ:ANO)                  !List box control field - type derived from field
OBR:NOMBRE             LIKE(OBR:NOMBRE)               !List box control field - type derived from field
LIQ:IDPAGO_LIQUIDACION LIKE(LIQ:IDPAGO_LIQUIDACION)   !List box control field - type derived from field
OBR:IDOS               LIKE(OBR:IDOS)                 !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Cargar Pagos Liquidación de Obras Sociales'),AT(,,367,288),FONT('Arial',8,COLOR:Black, |
  FONT:bold),RESIZE,CENTER,GRAY,IMM,MDI,HLP('Pagos_Liquidacion'),SYSTEM
                       BUTTON('&Filtro'),AT(95,158,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       LIST,AT(8,37,342,118),USE(?Browse:1),HVSCROLL,FORMAT('33L(2)|M~ID~C(0)@n-7@34L(2)|M~IDS' & |
  'OCIO~C(0)@n-5@120L(2)|M~NOMBRE~C(0)@s30@53R(2)|M~FECHA~C(0)@d17@56R(2)|M~SOCIOS LIQU' & |
  'IDACION~C(0)@n-14@[46D(1)|M~MONTO LIQ~C(0)@n-7.2@76L(1)|M~MONTO PAGADO~C(0)@n$-10.2@' & |
  '40L(1)|M~DEBITO~C(0)@n$-10.2@40L(1)|M~CUOTA~C(0)@n$-10.2@40L(1)|M~SEGURO~C(0)@n$-10.' & |
  '2@40L(1)|M~GASTOS ADM~C(0)@n$-10.2@40L(1)|M~MONTO IMP CHEQUE~C(0)@n$-10.2@]|M~DETALLE~'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de PAGOS_LIQUIDACION'),VCR
                       BUTTON('&Ver'),AT(220,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Cargar un Pago'),AT(281,158,71,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       GROUP('Liquidaciones Pagadas '),AT(7,174,350,86),USE(?Group1),BOXED
                         LIST,AT(11,187,341,69),USE(?List),HVSCROLL,FORMAT('28L|M~ID~L(2)@n-7@21L|M~MES~L(2)@n-3' & |
  '@23L|M~ANO~L(2)@n-5@400L|M~OBRA SOCIAL~L(2)@s100@56L|M~IDPAGO LIQUIDACION~L(2)@n-5@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records'),VCR
                       END
                       SHEET,AT(3,4,361,262),USE(?CurrentTab)
                         TAB('Id'),USE(?Tab:2)
                         END
                         TAB('Socio'),USE(?Tab2)
                           PROMPT('IDSOCIO:'),AT(10,24),USE(?PAGL:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(40,24,60,10),USE(PAGL:IDSOCIO),RIGHT(1)
                         END
                       END
                       BUTTON('E&xportar'),AT(156,158,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Salir'),AT(312,269,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('Re Imprimir Liq.'),AT(9,158,74,14),USE(?Button6),LEFT,ICON(ICON:Print1),FLAT
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  Q9:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,'
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
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'EXCEL|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'WORD|'
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
  ADD(QPar9)   ! 29 Gestion126.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = 'ID'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDSOCIO'
  Qp29:F2P  = '@n-5'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'NOMBRE'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'SOCIOS LIQUIDACION'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO LIQ'
  Qp29:F2P  = '@n-7.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO PAGADO'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DEBITO'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CUOTA'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'SEGURO'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'GASTOS ADM'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO IMP CHEQUE'
  Qp29:F2P  = '@n$-10.2'
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
  Loc::Titulo9 ='Informe de Pagos de Liquidación'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,1,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Pagos_Liquidacion')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Query
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PAGL:IDPAGOS',PAGL:IDPAGOS)                        ! Added by: BrowseBox(ABC)
  BIND('PAGL:MONTO_FACTURA',PAGL:MONTO_FACTURA)            ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
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
  Relate:PAGOS_LIQUIDACION.Open                            ! File PAGOS_LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGOS_LIQUIDACION,SELF) ! Initialize the browse manager
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:LIQUIDACION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'Pagos_Liquidacion', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAGL:FK_PAGOS_LIQUIDACION_SOCIOS)     ! Add the sort order for PAGL:FK_PAGOS_LIQUIDACION_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?PAGL:IDSOCIO,PAGL:IDSOCIO,,BRW1) ! Initialize the browse locator using ?PAGL:IDSOCIO using key: PAGL:FK_PAGOS_LIQUIDACION_SOCIOS , PAGL:IDSOCIO
  BRW1.AddSortOrder(,PAGL:PK_PAGOS_LIQUIDACION)            ! Add the sort order for PAGL:PK_PAGOS_LIQUIDACION for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,PAGL:IDPAGOS,,BRW1)            ! Initialize the browse locator using  using key: PAGL:PK_PAGOS_LIQUIDACION , PAGL:IDPAGOS
  BRW1.AddField(PAGL:IDPAGOS,BRW1.Q.PAGL:IDPAGOS)          ! Field PAGL:IDPAGOS is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:IDSOCIO,BRW1.Q.PAGL:IDSOCIO)          ! Field PAGL:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:FECHA,BRW1.Q.PAGL:FECHA)              ! Field PAGL:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:SOCIOS_LIQUIDACION,BRW1.Q.PAGL:SOCIOS_LIQUIDACION) ! Field PAGL:SOCIOS_LIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:MONTO_FACTURA,BRW1.Q.PAGL:MONTO_FACTURA) ! Field PAGL:MONTO_FACTURA is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:MONTO,BRW1.Q.PAGL:MONTO)              ! Field PAGL:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:DEBITO,BRW1.Q.PAGL:DEBITO)            ! Field PAGL:DEBITO is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:CUOTA,BRW1.Q.PAGL:CUOTA)              ! Field PAGL:CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:SEGURO,BRW1.Q.PAGL:SEGURO)            ! Field PAGL:SEGURO is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:GASTOS_ADM,BRW1.Q.PAGL:GASTOS_ADM)    ! Field PAGL:GASTOS_ADM is a hot field or requires assignment from browse
  BRW1.AddField(PAGL:MONTO_IMP_CHEQUE,BRW1.Q.PAGL:MONTO_IMP_CHEQUE) ! Field PAGL:MONTO_IMP_CHEQUE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse
  BRW7.RetainRow = 0
  BRW7.AddSortOrder(,LIQ:IDX_LIQUIDACION_PAGO)             ! Add the sort order for LIQ:IDX_LIQUIDACION_PAGO for sort order 1
  BRW7.AddRange(LIQ:IDPAGO_LIQUIDACION,Relate:LIQUIDACION,Relate:PAGOS_LIQUIDACION) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,LIQ:IDPAGO_LIQUIDACION,1,BRW7) ! Initialize the browse locator using  using key: LIQ:IDX_LIQUIDACION_PAGO , LIQ:IDPAGO_LIQUIDACION
  BRW7.AppendOrder('liq:IDLIQUIDACION')                    ! Append an additional sort order
  BRW7.AddField(LIQ:IDLIQUIDACION,BRW7.Q.LIQ:IDLIQUIDACION) ! Field LIQ:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW7.AddField(LIQ:MES,BRW7.Q.LIQ:MES)                    ! Field LIQ:MES is a hot field or requires assignment from browse
  BRW7.AddField(LIQ:ANO,BRW7.Q.LIQ:ANO)                    ! Field LIQ:ANO is a hot field or requires assignment from browse
  BRW7.AddField(OBR:NOMBRE,BRW7.Q.OBR:NOMBRE)              ! Field OBR:NOMBRE is a hot field or requires assignment from browse
  BRW7.AddField(LIQ:IDPAGO_LIQUIDACION,BRW7.Q.LIQ:IDPAGO_LIQUIDACION) ! Field LIQ:IDPAGO_LIQUIDACION is a hot field or requires assignment from browse
  BRW7.AddField(OBR:IDOS,BRW7.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Pagos_Liquidacion',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_PAGOS_LIQUIDACION
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:PAGOS_LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('Pagos_Liquidacion',QuickWindow)         ! Save window data to non-volatile store
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
    Formulario_PAGOS_LIQUIDACION
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
    OF ?Button6
      GLO:PAGO = PAGL:IDPAGOS
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
    OF ?Button6
      ThisWindow.Update()
      IMPRIMIR_PAGO_LIQUIDACION()
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

