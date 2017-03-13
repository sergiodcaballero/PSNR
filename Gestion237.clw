

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION237.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION239.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION241.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Ver Pagos
!!! </summary>
Ver_Pagos PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:MonthYear        STRING(30)                            ! 
LOC:Month            BYTE                                  ! 
LOC:Year             SHORT                                 ! 
LOC:Date             LONG                                  ! 
LOC:Button           SHORT                                 ! 
LOC:Day              SHORT                                 ! 
LOC:FirstDay         SHORT                                 ! 
BRW1::View:Browse    VIEW(PAGOS)
                       PROJECT(PAG:IDPAGOS)
                       PROJECT(PAG:IDSOCIO)
                       PROJECT(PAG:IDFACTURA)
                       PROJECT(PAG:SUCURSAL)
                       PROJECT(PAG:IDRECIBO)
                       PROJECT(PAG:MONTO)
                       PROJECT(PAG:FECHA)
                       PROJECT(PAG:HORA)
                       PROJECT(PAG:MES)
                       PROJECT(PAG:ANO)
                       JOIN(FAC:PK_FACTURA,PAG:IDFACTURA)
                         PROJECT(FAC:IDFACTURA)
                         PROJECT(FAC:MES)
                         PROJECT(FAC:ANO)
                         PROJECT(FAC:ESTADO)
                       END
                       JOIN(SOC:PK_SOCIOS,PAG:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAG:IDPAGOS            LIKE(PAG:IDPAGOS)              !List box control field - type derived from field
PAG:IDSOCIO            LIKE(PAG:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAG:IDFACTURA          LIKE(PAG:IDFACTURA)            !List box control field - type derived from field
PAG:SUCURSAL           LIKE(PAG:SUCURSAL)             !List box control field - type derived from field
PAG:IDRECIBO           LIKE(PAG:IDRECIBO)             !List box control field - type derived from field
PAG:MONTO              LIKE(PAG:MONTO)                !List box control field - type derived from field
PAG:FECHA              LIKE(PAG:FECHA)                !List box control field - type derived from field
PAG:HORA               LIKE(PAG:HORA)                 !List box control field - type derived from field
PAG:MES                LIKE(PAG:MES)                  !List box control field - type derived from field
PAG:ANO                LIKE(PAG:ANO)                  !List box control field - type derived from field
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the PAGOS File'),AT(,,508,244),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Ver_Pagos'),SYSTEM
                       LIST,AT(8,47,491,146),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDPAGOS~C(0)@n-14@[34L(2' & |
  ')|M~IDSOCIO~L(0)@n-7@45L(2)|M~MATRICULA~L(0)@n-7@120L(2)|M~NOMBRE~L(0)@s30@]|M~COLEG' & |
  'IADO~64R(2)|M~IDFACTURA~C(0)@n-14@[20L(2)|M~SUC.~@n-4@56L(2)|M~IDRECIBO~C(0)@n-7@](5' & |
  '9)|M~RECIBO~48D(20)|M~MONTO~C(0)@n$-10.2@55L(2)|M~FECHA~C(0)@d17@37L(2)|M~HORA~C(0)@' & |
  't7@16L(2)|M~MES~@s2@20L(2)|M~ANO~@s4@[45L(2)|M~IDFACTURA~@n-7@36L(2)|M~MES FAC~@n-3@' & |
  '37L(2)|M~ANO FAC~@n-5@84L(2)|M~ESTADO FAC~@s21@]|M~DATOS DE LA FACTURA~'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de PAGOS')
                       BUTTON('&Filtro'),AT(9,201,55,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       SHEET,AT(4,4,501,217),USE(?CurrentTab)
                         TAB('PAGOS'),USE(?Tab:2)
                           PROMPT('IDPAGOS:'),AT(74,26),USE(?PAG:IDPAGOS:Prompt)
                           ENTRY(@n-14),AT(124,25,60,10),USE(PAG:IDPAGOS),REQ
                         END
                         TAB('SOCIOS'),USE(?Tab:4)
                           PROMPT('IDSOCIO:'),AT(74,25),USE(?PAG:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(114,25,60,10),USE(PAG:IDSOCIO)
                           BUTTON('...'),AT(175,25,12,12),USE(?CallLookup)
                         END
                         TAB('FECHA'),USE(?Tab:6)
                           PROMPT('FECHA:'),AT(75,25),USE(?PAG:FECHA:Prompt)
                           ENTRY(@d17),AT(109,24,60,10),USE(PAG:FECHA)
                         END
                       END
                       BUTTON('Ordenar Por...'),AT(9,24,59,18),USE(?SortOrderButton),LEFT,MSG('Select the sort Order'), |
  TIP('Select the sort Order')
                       BUTTON('&Salir'),AT(458,225,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('E&xportar'),AT(59,227,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('Imprimir'),AT(7,227,51,14),USE(?Button6),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&Ver'),AT(433,198,58,18),USE(?View),LEFT,ICON('v.ico'),FLAT
                     END

Loc::QHlist2 QUEUE,PRE(QHL2)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar2 QUEUE,PRE(Q2)
FieldPar                 CSTRING(800)
                         END
QPar22 QUEUE,PRE(Qp22)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado2          STRING(100)
Loc::Titulo2          STRING(100)
SavPath2          STRING(2000)
Evo::Group2  GROUP,PRE()
Evo::Procedure2          STRING(100)
Evo::App2          STRING(100)
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

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_2  SHORT
Gol_woI_2 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_2),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_2),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_2),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_2),TRN
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
PrintExBrowse2 ROUTINE

 OPEN(Gol_woI_2)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_2 = BRW1.FileLoaded
 IF Not  EC::LoadI_2
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_2)
 SETCURSOR()
  Evo::App2          = 'Gestion'
  Evo::Procedure2          = GlobalErrors.GetProcedureName()& 2
 
  FREE(QPar2)
  Q2:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,'
  ADD(QPar2)  !!1
  Q2:FieldPar  = ';'
  ADD(QPar2)  !!2
  Q2:FieldPar  = 'Spanish'
  ADD(QPar2)  !!3
  Q2:FieldPar  = ''
  ADD(QPar2)  !!4
  Q2:FieldPar  = true
  ADD(QPar2)  !!5
  Q2:FieldPar  = ''
  ADD(QPar2)  !!6
  Q2:FieldPar  = true
  ADD(QPar2)  !!7
 !!!! Exportaciones
  Q2:FieldPar  = 'HTML|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'EXCEL|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'WORD|'
  Q2:FieldPar  = CLIP( Q2:FieldPar)&'ASCII|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'XML|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'PRT|'
  ADD(QPar2)  !!8
  Q2:FieldPar  = 'All'
  ADD(QPar2)   !.9.
  Q2:FieldPar  = ' 0'
  ADD(QPar2)   !.10
  Q2:FieldPar  = 0
  ADD(QPar2)   !.11
  Q2:FieldPar  = '1'
  ADD(QPar2)   !.12
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.13
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.14
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.15
 
   Q2:FieldPar  = '16'
  ADD(QPar2)   !.16
 
   Q2:FieldPar  = 1
  ADD(QPar2)   !.17
   Q2:FieldPar  = 2
  ADD(QPar2)   !.18
   Q2:FieldPar  = '2'
  ADD(QPar2)   !.19
   Q2:FieldPar  = 12
  ADD(QPar2)   !.20
 
   Q2:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar2)   !.21
 
   Q2:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar2)   !.22
 
   CLEAR(Q2:FieldPar)
  ADD(QPar2)   ! 23 Caracteres Encoding para xml
 
  Q2:FieldPar  = '0'
  ADD(QPar2)   ! 24 Use Open Office
 
   Q2:FieldPar  = 'golmedo'
  ADD(QPar2) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q2:FieldPar  = ' BrowseExport'
  ADD(QPar2)   ! 26  BrowseExport
  Q2:FieldPar  = ' '
  ADD(QPar2)   ! 27  
  Q2:FieldPar  = ' ' 
  ADD(QPar2)   ! 28  
  Q2:FieldPar  = 'BEXPORT' 
  ADD(QPar2)   ! 29 Gestion237.clw
 !!!!!
 
 
  FREE(QPar22)
       Qp22:F2N  = 'IDPAGOS'
  Qp22:F2P  = '@n-14'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'IDSOCIO'
  Qp22:F2P  = '@n-7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'MATRICULA'
  Qp22:F2P  = '@n-7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'NOMBRE'
  Qp22:F2P  = '@s30'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'IDFACTURA'
  Qp22:F2P  = '@n-14'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = '-'
  Qp22:F2P  = '@n-4'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'IDRECIBO'
  Qp22:F2P  = '@n-7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'MONTO'
  Qp22:F2P  = '@n$-10.2'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'FECHA'
  Qp22:F2P  = '@d17'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'HORA'
  Qp22:F2P  = '@t7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'MES'
  Qp22:F2P  = '@s2'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'ANO'
  Qp22:F2P  = '@s4'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'IDFACTURA'
  Qp22:F2P  = '@n-7'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'MES'
  Qp22:F2P  = '@n-3'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'ANO'
  Qp22:F2P  = '@n-5'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'ESTADO'
  Qp22:F2P  = '@s21'
  Qp22:F2T  = '0'
  ADD(QPar22)
  SysRec# = false
  FREE(Loc::QHlist2)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar22,SysRec#)
         QHL2:Id      = SysRec#
         QHL2:Nombre  = Qp22:F2N
         QHL2:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL2:Pict    = Qp22:F2P
         QHL2:Tot    = Qp22:F2T
         ADD(Loc::QHlist2)
      Else
        break
     END
  END
  Loc::Titulo2 ='Pagos'
 
 SavPath2 = PATH()
  Exportar(Loc::QHlist2,BRW1.Q,QPar2,0,Loc::Titulo2,Evo::Group2)
 IF Not EC::LoadI_2 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath2)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Ver_Pagos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PAG:IDPAGOS',PAG:IDPAGOS)                          ! Added by: BrowseBox(ABC)
  BIND('FAC:IDFACTURA',FAC:IDFACTURA)                      ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'Ver_Pagos', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAG:FK_PAGOS_SOCIOS)                  ! Add the sort order for PAG:FK_PAGOS_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?PAG:IDSOCIO,PAG:IDSOCIO,,BRW1) ! Initialize the browse locator using ?PAG:IDSOCIO using key: PAG:FK_PAGOS_SOCIOS , PAG:IDSOCIO
  BRW1.AddSortOrder(,PAG:IDX_FECHA)                        ! Add the sort order for PAG:IDX_FECHA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?PAG:FECHA,PAG:FECHA,,BRW1)     ! Initialize the browse locator using ?PAG:FECHA using key: PAG:IDX_FECHA , PAG:FECHA
  BRW1.AddSortOrder(,PAG:PK_PAGOS)                         ! Add the sort order for PAG:PK_PAGOS for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?PAG:IDPAGOS,PAG:IDPAGOS,,BRW1) ! Initialize the browse locator using ?PAG:IDPAGOS using key: PAG:PK_PAGOS , PAG:IDPAGOS
  BRW1.AddField(PAG:IDPAGOS,BRW1.Q.PAG:IDPAGOS)            ! Field PAG:IDPAGOS is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDSOCIO,BRW1.Q.PAG:IDSOCIO)            ! Field PAG:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDFACTURA,BRW1.Q.PAG:IDFACTURA)        ! Field PAG:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:SUCURSAL,BRW1.Q.PAG:SUCURSAL)          ! Field PAG:SUCURSAL is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDRECIBO,BRW1.Q.PAG:IDRECIBO)          ! Field PAG:IDRECIBO is a hot field or requires assignment from browse
  BRW1.AddField(PAG:MONTO,BRW1.Q.PAG:MONTO)                ! Field PAG:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(PAG:FECHA,BRW1.Q.PAG:FECHA)                ! Field PAG:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:HORA,BRW1.Q.PAG:HORA)                  ! Field PAG:HORA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:MES,BRW1.Q.PAG:MES)                    ! Field PAG:MES is a hot field or requires assignment from browse
  BRW1.AddField(PAG:ANO,BRW1.Q.PAG:ANO)                    ! Field PAG:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ESTADO,BRW1.Q.FAC:ESTADO)              ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Ver_Pagos',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
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
    Relate:PAGOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Ver_Pagos',QuickWindow)                 ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAG:IDSOCIO
      SOC:IDSOCIO = PAG:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAG:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAG:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAG:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?SortOrderButton
      ThisWindow.Update()
      EXECUTE POPUP(|
                    CHOOSE(?CurrentTab{PROP:SELECTED}=1,'+','-')&?Tab:2{PROP:TEXT}&|
                    '|'&CHOOSE(?CurrentTab{PROP:SELECTED}=2,'+','-')&?Tab:4{PROP:TEXT}&|
                    '|'&CHOOSE(?CurrentTab{PROP:SELECTED}=3,'+','-')&?Tab:6{PROP:TEXT}&|
                    '')
       SELECT(?Tab:2)
       SELECT(?Tab:4)
       SELECT(?Tab:6)
      END
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse2
    OF ?Button6
      ThisWindow.Update()
      VER_PAGOS3(BRW1.VIEW{PROP:FILTER},BRW1.VIEW{PROP:ORDER})
      ThisWindow.Reset
    OF ?View
      ThisWindow.Update()
      START(Ver_Pagos2, 25000)
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
  SELF.ViewControl = ?View                                 ! Setup the control used to initiate view only mode


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

