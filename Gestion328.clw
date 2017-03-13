

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION328.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION323.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION324.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION329.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONVENIO File
!!! </summary>
BrowseCONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONVENIO)
                       PROJECT(CON4:IDSOLICITUD)
                       PROJECT(CON4:IDSOCIO)
                       PROJECT(CON4:IDTIPO_CONVENIO)
                       PROJECT(CON4:MONTO_TOTAL)
                       PROJECT(CON4:CANTIDAD_CUOTAS)
                       PROJECT(CON4:MONTO_CUOTA)
                       PROJECT(CON4:GASTOS_ADMINISTRATIVOS)
                       PROJECT(CON4:FECHA)
                       PROJECT(CON4:CANCELADO)
                       PROJECT(CON4:PERIODO)
                       JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                         PROJECT(TIP:DESCRIPCION)
                         PROJECT(TIP:IDTIPO_CONVENIO)
                       END
                       JOIN(SOC:PK_SOCIOS,CON4:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !List box control field - type derived from field
CON4:IDSOCIO           LIKE(CON4:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
CON4:IDTIPO_CONVENIO   LIKE(CON4:IDTIPO_CONVENIO)     !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
CON4:MONTO_TOTAL       LIKE(CON4:MONTO_TOTAL)         !List box control field - type derived from field
CON4:CANTIDAD_CUOTAS   LIKE(CON4:CANTIDAD_CUOTAS)     !List box control field - type derived from field
CON4:MONTO_CUOTA       LIKE(CON4:MONTO_CUOTA)         !List box control field - type derived from field
CON4:GASTOS_ADMINISTRATIVOS LIKE(CON4:GASTOS_ADMINISTRATIVOS) !List box control field - type derived from field
CON4:FECHA             LIKE(CON4:FECHA)               !List box control field - type derived from field
CON4:CANCELADO         LIKE(CON4:CANCELADO)           !List box control field - type derived from field
CON4:PERIODO           LIKE(CON4:PERIODO)             !Browse key field - type derived from field
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CONVENIO File'),AT(,,529,198),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseCONVENIO'),SYSTEM
                       LIST,AT(8,30,516,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSOLICITUD~C(0)@n-14@[3' & |
  '4L(2)|M~IDSOCIO~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@56L(2)|M~MATRI~C(0)@n-5@](184)|M~' & |
  'COLEGIADO~[25L(2)|M~IDTC~C(0)@n-5@200L(2)|M~DESCRIPCION~C(0)@s30@](150)|M~TIPO~56L(2' & |
  ')|M~MONTO DEUDA~C(0)@n$-10.2@64L(2)|M~CANT CUOTAS~C(0)@n-3@57L(2)|M~MONTO CUOTA~C(0)' & |
  '@n$-10.2@56L(2)|M~GASTOS ADM~C(0)@n$-10.2@80L(2)|M~FECHA~C(0)@d17@8L(2)|M~CANCELADO~C(0)@s2@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de CONVENIO'),VCR
                       BUTTON('&Ver'),AT(423,159,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(476,159,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,524,172),USE(?CurrentTab)
                         TAB('CONVENIO'),USE(?Tab:2)
                         END
                         TAB('SOCIOS'),USE(?Tab:3)
                         END
                         TAB('TIPO'),USE(?Tab:4)
                         END
                         TAB('PERIODO'),USE(?Tab:5)
                         END
                       END
                       BUTTON('&Salir'),AT(478,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(5,182,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(58,181,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Imprimir Convenio'),AT(117,181,79,14),USE(?Button8),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('Cuotas Canceladas en Convenio'),AT(190,179,113,17),USE(?Button9),LEFT,ICON(ICON:Hand), |
  FLAT
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  ADD(QPar9)   ! 29 Gestion328.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = 'IDSOLICITUD'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDSOCIO'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'NOMBRE'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MATRI'
  Qp29:F2P  = '@n-5'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDTC'
  Qp29:F2P  = '@n-5'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DESCRIPCION'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO TOTAL'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CANTIDAD CUOTAS'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO CUOTA'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'GASTOS ADMINISTRATIVOS'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CANCELADO'
  Qp29:F2P  = '@s2'
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
  Loc::Titulo9 ='CONVENIO'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,0,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseCONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON4:IDTIPO_CONVENIO',CON4:IDTIPO_CONVENIO)        ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_TOTAL',CON4:MONTO_TOTAL)                ! Added by: BrowseBox(ABC)
  BIND('CON4:CANTIDAD_CUOTAS',CON4:CANTIDAD_CUOTAS)        ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_CUOTA',CON4:MONTO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('CON4:GASTOS_ADMINISTRATIVOS',CON4:GASTOS_ADMINISTRATIVOS) ! Added by: BrowseBox(ABC)
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:5{PROP:TEXT},1,1)='&',SUB(?Tab:5{PROP:TEXT},2,LEN(?Tab:5{PROP:TEXT})-1),?Tab:5{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'BrowseCONVENIO', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON4:FK_CONVENIO_SOCIOS)              ! Add the sort order for CON4:FK_CONVENIO_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CON4:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON4:FK_CONVENIO_SOCIOS , CON4:IDSOCIO
  BRW1.AddSortOrder(,CON4:FK_CONVENIO_TIPO)                ! Add the sort order for CON4:FK_CONVENIO_TIPO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CON4:IDTIPO_CONVENIO,,BRW1)    ! Initialize the browse locator using  using key: CON4:FK_CONVENIO_TIPO , CON4:IDTIPO_CONVENIO
  BRW1.AddSortOrder(,CON4:IDX_CONVENCIO_PERIODO)           ! Add the sort order for CON4:IDX_CONVENCIO_PERIODO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CON4:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON4:IDX_CONVENCIO_PERIODO , CON4:IDSOCIO
  BRW1.AddSortOrder(,CON4:PK_CONVENIO)                     ! Add the sort order for CON4:PK_CONVENIO for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,CON4:IDSOLICITUD,,BRW1)        ! Initialize the browse locator using  using key: CON4:PK_CONVENIO , CON4:IDSOLICITUD
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOCIO,BRW1.Q.CON4:IDSOCIO)          ! Field CON4:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDTIPO_CONVENIO,BRW1.Q.CON4:IDTIPO_CONVENIO) ! Field CON4:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_TOTAL,BRW1.Q.CON4:MONTO_TOTAL)  ! Field CON4:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CON4:CANTIDAD_CUOTAS,BRW1.Q.CON4:CANTIDAD_CUOTAS) ! Field CON4:CANTIDAD_CUOTAS is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_CUOTA,BRW1.Q.CON4:MONTO_CUOTA)  ! Field CON4:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:GASTOS_ADMINISTRATIVOS,BRW1.Q.CON4:GASTOS_ADMINISTRATIVOS) ! Field CON4:GASTOS_ADMINISTRATIVOS is a hot field or requires assignment from browse
  BRW1.AddField(CON4:FECHA,BRW1.Q.CON4:FECHA)              ! Field CON4:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:CANCELADO,BRW1.Q.CON4:CANCELADO)      ! Field CON4:CANCELADO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:PERIODO,BRW1.Q.CON4:PERIODO)          ! Field CON4:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCONVENIO',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCONVENIO
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
    Relate:CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCONVENIO',QuickWindow)            ! Save window data to non-volatile store
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
    UpdateCONVENIO
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
    OF ?Button8
      GLO:IDSOLICITUD = CON4:IDSOLICITUD
    OF ?Button9
      GLO:IDSOLICITUD = CON4:IDSOLICITUD
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
    OF ?Button8
      ThisWindow.Update()
      IMPRIMIR_CONVENIO()
    OF ?Button9
      ThisWindow.Update()
      START(Cuotas_canceladas, 25000)
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab:5)
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

