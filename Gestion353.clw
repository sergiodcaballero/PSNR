

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION353.INC'),ONCE        !Local module procedure declarations
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de RANKING
!!! </summary>
IMPRIMIR_LIBRO_DIARIO_SUBCUENTA PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:ESTADO           REAL                                  ! 
BRW1::View:Browse    VIEW(RANKING)
                       PROJECT(RAN:C8)
                       PROJECT(RAN:C2)
                       PROJECT(RAN:C3)
                       PROJECT(RAN:C4)
                       PROJECT(RAN:C5)
                       PROJECT(RAN:C6)
                       PROJECT(RAN:C7)
                       PROJECT(RAN:C9)
                       PROJECT(RAN:C10)
                       PROJECT(RAN:C11)
                       PROJECT(RAN:CANTIDAD)
                       PROJECT(RAN:C1)
                       PROJECT(RAN:IMPORTE)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RAN:C8                 LIKE(RAN:C8)                   !List box control field - type derived from field
RAN:C2                 LIKE(RAN:C2)                   !List box control field - type derived from field
RAN:C3                 LIKE(RAN:C3)                   !List box control field - type derived from field
RAN:C4                 LIKE(RAN:C4)                   !List box control field - type derived from field
RAN:C5                 LIKE(RAN:C5)                   !List box control field - type derived from field
RAN:C6                 LIKE(RAN:C6)                   !List box control field - type derived from field
RAN:C7                 LIKE(RAN:C7)                   !List box control field - type derived from field
RAN:C9                 LIKE(RAN:C9)                   !List box control field - type derived from field
RAN:C10                LIKE(RAN:C10)                  !List box control field - type derived from field
RAN:C11                LIKE(RAN:C11)                  !List box control field - type derived from field
RAN:CANTIDAD           LIKE(RAN:CANTIDAD)             !List box control field - type derived from field
RAN:C1                 LIKE(RAN:C1)                   !Primary key field - type derived from field
RAN:IMPORTE            LIKE(RAN:IMPORTE)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('INFORME DE LIABRO DIARIO POR FECHA'),AT(,,454,276),FONT('Arial',8,,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,HLP('IMPRIMIR_CAJA_CUOTAS1'),SYSTEM
                       LIST,AT(8,30,440,200),USE(?Browse:1),HVSCROLL,FORMAT('46L(2)|M~TIPO CUENTA~@s50@80L(2)|' & |
  'M~CUENTA~@s50@80L(2)|M~SUB CUENTA~@s50@80L(2)|M~OBSERV.~@s50@57L(2)|M~DEBE~@N13.2@53' & |
  'L(2)|M~HABER~@N13.2@46L(2)|M~FECHA~@s10@85L(2)|M~FONDO~@s20@85L(2)|M~RECIBO~@s20@200' & |
  'L(2)|M~COLEGIADO - PROVEEDOR~@s50@56R(2)|M~N TRANSAC~L@n-14@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de RANKING'),VCR
                       BUTTON('&Filtro'),AT(69,256,49,14),USE(?Query),LEFT,ICON('sqbe.ico'),FLAT
                       PROMPT('ESTADO:'),AT(185,236),USE(?LOC:ESTADO:Prompt)
                       STRING(@n$-14.2),AT(225,235,68,10),USE(LOC:ESTADO),DECIMAL(14)
                       BUTTON('E&xportar'),AT(5,256,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,449,247),USE(?CurrentTab)
                         TAB('CONTABLE'),USE(?Tab:2)
                         END
                         TAB('CUENTA'),USE(?Tab:3)
                         END
                         TAB('SUBCUENTA'),USE(?Tab:4)
                         END
                         TAB('OBSERVACION'),USE(?Tab:5)
                         END
                       END
                       BUTTON('&Salir'),AT(381,258,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist5 QUEUE,PRE(QHL5)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar5 QUEUE,PRE(Q5)
FieldPar                 CSTRING(800)
                         END
QPar25 QUEUE,PRE(Qp25)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado5          STRING(100)
Loc::Titulo5          STRING(100)
SavPath5          STRING(2000)
Evo::Group5  GROUP,PRE()
Evo::Procedure5          STRING(100)
Evo::App5          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE6                 QueryListClass                        ! QBE List Class. 
QBV6                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_5  SHORT
Gol_woI_5 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_5),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_5),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_5),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_5),TRN
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
PrintExBrowse5 ROUTINE

 OPEN(Gol_woI_5)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_5 = BRW1.FileLoaded
 IF Not  EC::LoadI_5
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_5)
 SETCURSOR()
  Evo::App5          = 'Gestion'
  Evo::Procedure5          = GlobalErrors.GetProcedureName()& 5
 
  FREE(QPar5)
  Q5:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,'
  ADD(QPar5)  !!1
  Q5:FieldPar  = ';'
  ADD(QPar5)  !!2
  Q5:FieldPar  = 'Spanish'
  ADD(QPar5)  !!3
  Q5:FieldPar  = ''
  ADD(QPar5)  !!4
  Q5:FieldPar  = true
  ADD(QPar5)  !!5
  Q5:FieldPar  = ''
  ADD(QPar5)  !!6
  Q5:FieldPar  = true
  ADD(QPar5)  !!7
 !!!! Exportaciones
  Q5:FieldPar  = 'HTML|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'EXCEL|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'WORD|'
  Q5:FieldPar  = CLIP( Q5:FieldPar)&'ASCII|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'XML|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'PRT|'
  ADD(QPar5)  !!8
  Q5:FieldPar  = 'All'
  ADD(QPar5)   !.9.
  Q5:FieldPar  = ' 0'
  ADD(QPar5)   !.10
  Q5:FieldPar  = 0
  ADD(QPar5)   !.11
  Q5:FieldPar  = '1'
  ADD(QPar5)   !.12
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.13
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.14
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.15
 
   Q5:FieldPar  = '16'
  ADD(QPar5)   !.16
 
   Q5:FieldPar  = 1
  ADD(QPar5)   !.17
   Q5:FieldPar  = 2
  ADD(QPar5)   !.18
   Q5:FieldPar  = '2'
  ADD(QPar5)   !.19
   Q5:FieldPar  = 12
  ADD(QPar5)   !.20
 
   Q5:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar5)   !.21
 
   Q5:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar5)   !.22
 
   CLEAR(Q5:FieldPar)
  ADD(QPar5)   ! 23 Caracteres Encoding para xml
 
  Q5:FieldPar  = '0'
  ADD(QPar5)   ! 24 Use Open Office
 
   Q5:FieldPar  = 'golmedo'
  ADD(QPar5) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q5:FieldPar  = ' BrowseExport'
  ADD(QPar5)   ! 26  BrowseExport
  Q5:FieldPar  = ' '
  ADD(QPar5)   ! 27  
  Q5:FieldPar  = ' ' 
  ADD(QPar5)   ! 28  
  Q5:FieldPar  = 'BEXPORT' 
  ADD(QPar5)   ! 29 Gestion353.clw
 !!!!!
 
 
  FREE(QPar25)
       Qp25:F2N  = 'TIPO CUENTA'
  Qp25:F2P  = '@s50'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'CUENTA'
  Qp25:F2P  = '@s50'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'SUB CUENTA'
  Qp25:F2P  = '@s50'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'OBSERV.'
  Qp25:F2P  = '@s50'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'DEBE'
  Qp25:F2P  = '@N13.2'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'HABER'
  Qp25:F2P  = '@N13.2'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'FECHA'
  Qp25:F2P  = '@s10'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'FONDO'
  Qp25:F2P  = '@s20'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'RECIBO'
  Qp25:F2P  = '@s20'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'COLEGIADO - PROVEEDOR'
  Qp25:F2P  = '@s50'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'N TRANSAC'
  Qp25:F2P  = '@n-14'
  Qp25:F2T  = '0'
  ADD(QPar25)
  SysRec# = false
  FREE(Loc::QHlist5)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar25,SysRec#)
         QHL5:Id      = SysRec#
         QHL5:Nombre  = Qp25:F2N
         QHL5:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL5:Pict    = Qp25:F2P
         QHL5:Tot    = Qp25:F2T
         ADD(Loc::QHlist5)
      Else
        break
     END
  END
  Loc::Titulo5 ='Colegio de Profesionales de  Enfermería -- Libro Diario'
 
 SavPath5 = PATH()
  Exportar(Loc::QHlist5,BRW1.Q,QPar5,1,Loc::Titulo5,Evo::Group5)
 IF Not EC::LoadI_5 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath5)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_LIBRO_DIARIO_SUBCUENTA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:RANKING,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE6.Init(QBV6, INIMgr,'IMPRIMIR_LIBRO_DIARIO_SUBCUENTA', GlobalErrors)
  QBE6.QkSupport = True
  QBE6.QkMenuIcon = 'QkQBE.ico'
  QBE6.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,RAN:IDX_C2)                           ! Add the sort order for RAN:IDX_C2 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,RAN:C2,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C2 , RAN:C2
  BRW1.AddSortOrder(,RAN:IDX_C3)                           ! Add the sort order for RAN:IDX_C3 for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,RAN:C3,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C3 , RAN:C3
  BRW1.AddSortOrder(,RAN:IDX_C4)                           ! Add the sort order for RAN:IDX_C4 for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,RAN:C4,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C4 , RAN:C4
  BRW1.AddSortOrder(,RAN:IDX_C5)                           ! Add the sort order for RAN:IDX_C5 for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,RAN:C5,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C5 , RAN:C5
  BRW1.AddSortOrder(,RAN:IDX_CANTIDAD)                     ! Add the sort order for RAN:IDX_CANTIDAD for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,RAN:CANTIDAD,,BRW1)            ! Initialize the browse locator using  using key: RAN:IDX_CANTIDAD , RAN:CANTIDAD
  BRW1.AddSortOrder(,RAN:IDX_IMPORTE)                      ! Add the sort order for RAN:IDX_IMPORTE for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,RAN:IMPORTE,,BRW1)             ! Initialize the browse locator using  using key: RAN:IDX_IMPORTE , RAN:IMPORTE
  BRW1.AddSortOrder(,RAN:IDX_CANTIDAD)                     ! Add the sort order for RAN:IDX_CANTIDAD for sort order 7
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort0:Locator.Init(,RAN:CANTIDAD,,BRW1)            ! Initialize the browse locator using  using key: RAN:IDX_CANTIDAD , RAN:CANTIDAD
  BRW1.AddField(RAN:C8,BRW1.Q.RAN:C8)                      ! Field RAN:C8 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C2,BRW1.Q.RAN:C2)                      ! Field RAN:C2 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C3,BRW1.Q.RAN:C3)                      ! Field RAN:C3 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C4,BRW1.Q.RAN:C4)                      ! Field RAN:C4 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C5,BRW1.Q.RAN:C5)                      ! Field RAN:C5 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C6,BRW1.Q.RAN:C6)                      ! Field RAN:C6 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C7,BRW1.Q.RAN:C7)                      ! Field RAN:C7 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C9,BRW1.Q.RAN:C9)                      ! Field RAN:C9 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C10,BRW1.Q.RAN:C10)                    ! Field RAN:C10 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C11,BRW1.Q.RAN:C11)                    ! Field RAN:C11 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:CANTIDAD,BRW1.Q.RAN:CANTIDAD)          ! Field RAN:CANTIDAD is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C1,BRW1.Q.RAN:C1)                      ! Field RAN:C1 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:IMPORTE,BRW1.Q.RAN:IMPORTE)            ! Field RAN:IMPORTE is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('IMPRIMIR_LIBRO_DIARIO_SUBCUENTA',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE6,1)
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
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_LIBRO_DIARIO_SUBCUENTA',QuickWindow) ! Save window data to non-volatile store
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse5
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


BRW1.ResetFromView PROCEDURE

LOC:ESTADO:Cnt       LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:RANKING.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC:ESTADO:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:ESTADO = LOC:ESTADO:Cnt
  PARENT.ResetFromView
  Relate:RANKING.SetQuickScan(0)
  SETCURSOR()


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
  ELSE
    RETURN SELF.SetSort(7,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

