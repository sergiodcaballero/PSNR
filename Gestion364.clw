

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION364.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION362.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION365.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de INGRESOS
!!! </summary>
ABM_EGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(GASTOS)
                       PROJECT(GAS:IDGASTOS)
                       PROJECT(GAS:LETRA)
                       PROJECT(GAS:SUCURSAL)
                       PROJECT(GAS:IDRECIBO)
                       PROJECT(GAS:MONTO)
                       PROJECT(GAS:IDSUBCUENTA)
                       PROJECT(GAS:OBSERVACION)
                       PROJECT(GAS:FECHA)
                       PROJECT(GAS:HORA)
                       PROJECT(GAS:IDPROVEEDOR)
                       PROJECT(GAS:IDTIPO_COMPROBANTE)
                       JOIN(PRO2:PK_PROVEEDOR,GAS:IDPROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:IDPROVEEDOR)
                       END
                       JOIN(TIPCOM:PK_TIPO_COMPROBANTE,GAS:IDTIPO_COMPROBANTE)
                         PROJECT(TIPCOM:DESCRIPCION)
                         PROJECT(TIPCOM:IDTIPO_COMPROBANTE)
                       END
                       JOIN(SUB:INTEG_113,GAS:IDSUBCUENTA)
                         PROJECT(SUB:DESCRIPCION)
                         PROJECT(SUB:IDSUBCUENTA)
                         PROJECT(SUB:IDCUENTA)
                         JOIN(CUE:PK_CUENTAS,SUB:IDCUENTA)
                           PROJECT(CUE:DESCRIPCION)
                           PROJECT(CUE:TIPO)
                           PROJECT(CUE:IDCUENTA)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GAS:IDGASTOS           LIKE(GAS:IDGASTOS)             !List box control field - type derived from field
TIPCOM:DESCRIPCION     LIKE(TIPCOM:DESCRIPCION)       !List box control field - type derived from field
GAS:LETRA              LIKE(GAS:LETRA)                !List box control field - type derived from field
GAS:SUCURSAL           LIKE(GAS:SUCURSAL)             !List box control field - type derived from field
GAS:IDRECIBO           LIKE(GAS:IDRECIBO)             !List box control field - type derived from field
GAS:MONTO              LIKE(GAS:MONTO)                !List box control field - type derived from field
GAS:IDSUBCUENTA        LIKE(GAS:IDSUBCUENTA)          !List box control field - type derived from field
SUB:DESCRIPCION        LIKE(SUB:DESCRIPCION)          !List box control field - type derived from field
CUE:DESCRIPCION        LIKE(CUE:DESCRIPCION)          !List box control field - type derived from field
CUE:TIPO               LIKE(CUE:TIPO)                 !List box control field - type derived from field
GAS:OBSERVACION        LIKE(GAS:OBSERVACION)          !List box control field - type derived from field
GAS:FECHA              LIKE(GAS:FECHA)                !List box control field - type derived from field
GAS:HORA               LIKE(GAS:HORA)                 !List box control field - type derived from field
GAS:IDPROVEEDOR        LIKE(GAS:IDPROVEEDOR)          !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
TIPCOM:IDTIPO_COMPROBANTE LIKE(TIPCOM:IDTIPO_COMPROBANTE) !Related join file key field - type derived from field
SUB:IDSUBCUENTA        LIKE(SUB:IDSUBCUENTA)          !Related join file key field - type derived from field
CUE:IDCUENTA           LIKE(CUE:IDCUENTA)             !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de Egresos'),AT(,,529,273),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ABM_INGRESOS'),SYSTEM
                       LIST,AT(8,36,506,180),USE(?Browse:1),HVSCROLL,FORMAT('43L(2)|M~IDGASTOS~C(0)@n-7@80L(2)' & |
  '|M~COMPROBANTE~@s20@30L(2)|M~LETRA~@s2@26L(2)|M~SUC~@P####-P@56L(2)|M~RECIBO~@n-14@4' & |
  '0L|M~MONTO~C@n$-13.2@56L(2)|M~IDSC~C(0)@n-7@127L(2)|M~SUBCUENTA~C(0)@s30@130L(2)|M~C' & |
  'UENTA~C(0)@s30@44L(2)|M~TIPO~C(0)@s10@200L(2)|M~OBSERVACION~@s50@40L(2)|M~FECHA~C(0)' & |
  '@d17@20L(2)|M~HORA~C(0)@t7@[56L(2)|M~IDP~C(0)@n-5@200L(2)|M~DESC PROV~C(0)@s50@]|M~PROVEEDOR~'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de INGRESOS'),VCR
                       BUTTON('&Ver'),AT(416,223,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(468,223,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Filtro'),AT(2,247,68,18),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(77,247,68,18),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('Anular OPA'),AT(332,222,58,18),USE(?Button6),LEFT,ICON(ICON:Cross),FLAT
                       SHEET,AT(0,0,521,243),USE(?CurrentTab)
                         TAB('Egresos'),USE(?Tab:1)
                         END
                         TAB('Egresos Sub Cuenta'),USE(?Tab:2)
                         END
                         TAB('Fecha Egreso'),USE(?Tab:3)
                           PROMPT('FECHA:'),AT(9,20),USE(?GAS:FECHA:Prompt)
                           ENTRY(@d17),AT(43,20,60,10),USE(GAS:FECHA)
                         END
                       END
                       BUTTON('&Salir'),AT(479,257,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
QBE7                 QueryListClass                        ! QBE List Class. 
QBV7                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
AskRecord              PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  Q8:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,'
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
  ADD(QPar8)   ! 29 Gestion364.clw
 !!!!!
 
 
  FREE(QPar28)
       Qp28:F2N  = 'IDGASTOS'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'COMPROBANTE'
  Qp28:F2P  = '@s20'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'LETRA'
  Qp28:F2P  = '@s2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = ''
  Qp28:F2P  = '@P####-P'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = ''
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MONTO'
  Qp28:F2P  = '@n$-10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDSC'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'SUBCUENTA'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'CUENTA'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'TIPO'
  Qp28:F2P  = '@s10'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'OBSERVACION'
  Qp28:F2P  = '@s50'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'HORA'
  Qp28:F2P  = '@t7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDP'
  Qp28:F2P  = '@n-5'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'DESC PROV'
  Qp28:F2P  = '@s50'
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
  Loc::Titulo8 ='Administrator the INGRESOS'
 
 SavPath8 = PATH()
  Exportar(Loc::QHlist8,BRW1.Q,QPar8,0,Loc::Titulo8,Evo::Group8)
 IF Not EC::LoadI_8 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath8)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ABM_EGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIPCOM:IDTIPO_COMPROBANTE',TIPCOM:IDTIPO_COMPROBANTE) ! Added by: BrowseBox(ABC)
  BIND('SUB:IDSUBCUENTA',SUB:IDSUBCUENTA)                  ! Added by: BrowseBox(ABC)
  BIND('CUE:IDCUENTA',CUE:IDCUENTA)                        ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GASTOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'ABM_INGRESOS', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,GAS:FK_GASTOS_SUBCUENTA)              ! Add the sort order for GAS:FK_GASTOS_SUBCUENTA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GAS:IDSUBCUENTA,,BRW1)         ! Initialize the browse locator using  using key: GAS:FK_GASTOS_SUBCUENTA , GAS:IDSUBCUENTA
  BRW1.AddSortOrder(,GAS:IDX_GASTOS_FECHA)                 ! Add the sort order for GAS:IDX_GASTOS_FECHA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?GAS:FECHA,GAS:FECHA,,BRW1)     ! Initialize the browse locator using ?GAS:FECHA using key: GAS:IDX_GASTOS_FECHA , GAS:FECHA
  BRW1.AddSortOrder(,GAS:PK_GASTOS)                        ! Add the sort order for GAS:PK_GASTOS for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,GAS:IDGASTOS,,BRW1)            ! Initialize the browse locator using  using key: GAS:PK_GASTOS , GAS:IDGASTOS
  BRW1.AddField(GAS:IDGASTOS,BRW1.Q.GAS:IDGASTOS)          ! Field GAS:IDGASTOS is a hot field or requires assignment from browse
  BRW1.AddField(TIPCOM:DESCRIPCION,BRW1.Q.TIPCOM:DESCRIPCION) ! Field TIPCOM:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(GAS:LETRA,BRW1.Q.GAS:LETRA)                ! Field GAS:LETRA is a hot field or requires assignment from browse
  BRW1.AddField(GAS:SUCURSAL,BRW1.Q.GAS:SUCURSAL)          ! Field GAS:SUCURSAL is a hot field or requires assignment from browse
  BRW1.AddField(GAS:IDRECIBO,BRW1.Q.GAS:IDRECIBO)          ! Field GAS:IDRECIBO is a hot field or requires assignment from browse
  BRW1.AddField(GAS:MONTO,BRW1.Q.GAS:MONTO)                ! Field GAS:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(GAS:IDSUBCUENTA,BRW1.Q.GAS:IDSUBCUENTA)    ! Field GAS:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:DESCRIPCION,BRW1.Q.SUB:DESCRIPCION)    ! Field SUB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUE:DESCRIPCION,BRW1.Q.CUE:DESCRIPCION)    ! Field CUE:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUE:TIPO,BRW1.Q.CUE:TIPO)                  ! Field CUE:TIPO is a hot field or requires assignment from browse
  BRW1.AddField(GAS:OBSERVACION,BRW1.Q.GAS:OBSERVACION)    ! Field GAS:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(GAS:FECHA,BRW1.Q.GAS:FECHA)                ! Field GAS:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(GAS:HORA,BRW1.Q.GAS:HORA)                  ! Field GAS:HORA is a hot field or requires assignment from browse
  BRW1.AddField(GAS:IDPROVEEDOR,BRW1.Q.GAS:IDPROVEEDOR)    ! Field GAS:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(TIPCOM:IDTIPO_COMPROBANTE,BRW1.Q.TIPCOM:IDTIPO_COMPROBANTE) ! Field TIPCOM:IDTIPO_COMPROBANTE is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDSUBCUENTA,BRW1.Q.SUB:IDSUBCUENTA)    ! Field SUB:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(CUE:IDCUENTA,BRW1.Q.CUE:IDCUENTA)          ! Field CUE:IDCUENTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_EGRESOS',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateEGRESOS
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
  IF GLO:NIVEL < 5 THEN
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
    Relate:GASTOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_EGRESOS',QuickWindow)               ! Save window data to non-volatile store
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
    UpdateEGRESOS
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
    OF ?Button6
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      ANULAR_GASTOS()
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


BRW1.AskRecord PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = InsertRecord
      BEEP
      MESSAGE('ATENCION: SE VA A DAR ALTA ','ALTA',ICON:EXCLAMATION)
  ELSIF Request = ChangeRecord
      BEEP
      MESSAGE('ATENCION: SE VA A ACTUALIZAR ','CAMBIO',ICON:EXCLAMATION)
  ELSIF Request = DeleteRecord
      BEEP
      MESSAGE('ATENCION: SE VA A DAR DE BAJA ','BAJA',ICON:EXCLAMATION)
  END
  ReturnValue = PARENT.AskRecord(Request)
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
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

