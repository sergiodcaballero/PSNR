

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION186.INC'),ONCE        !Local module procedure declarations
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the RANKING File
!!! </summary>
DEUDA3 PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(RANKING)
                       PROJECT(RAN:C2)
                       PROJECT(RAN:C3)
                       PROJECT(RAN:C4)
                       PROJECT(RAN:C5)
                       PROJECT(RAN:C6)
                       PROJECT(RAN:C7)
                       PROJECT(RAN:C1)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RAN:C2                 LIKE(RAN:C2)                   !List box control field - type derived from field
RAN:C3                 LIKE(RAN:C3)                   !List box control field - type derived from field
RAN:C4                 LIKE(RAN:C4)                   !List box control field - type derived from field
RAN:C5                 LIKE(RAN:C5)                   !List box control field - type derived from field
RAN:C6                 LIKE(RAN:C6)                   !List box control field - type derived from field
RAN:C7                 LIKE(RAN:C7)                   !List box control field - type derived from field
RAN:C1                 LIKE(RAN:C1)                   !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Estado de Deuda de los Colegiados'),AT(,,449,305),FONT('Arial',8,,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('DEUDA3'),SYSTEM
                       LIST,AT(6,39,434,231),USE(?Browse:1),HVSCROLL,FORMAT('25L(2)|M~MAT~@s5@168L(2)|M~NOMBRE' & |
  '~@s50@80C(2)|M~CANTIDAD CUOTAS~L@N3@60C(2)|M~MONTO CUOTA~L@N$-12.1@89C(2)|M~CUOTAS C' & |
  'ONV A PAGAR~L@N3@89C(2)|M~MONTO CONV A PAGAR~L@N$-12.1@80L(2)|M~IDSOCIO~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de RANKING'),VCR
                       BUTTON('&Filtro'),AT(5,281,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(51,282,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,441,273),USE(?CurrentTab)
                         TAB('NOMBRE'),USE(?Tab:1)
                           PROMPT('NOMBRE:'),AT(7,24),USE(?RAN:C3:Prompt)
                           ENTRY(@s50),AT(36,23,235,10),USE(RAN:C3)
                         END
                         TAB('MATRICULA'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(398,287,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist6 QUEUE,PRE(QHL6)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar6 QUEUE,PRE(Q6)
FieldPar                 CSTRING(800)
                         END
QPar26 QUEUE,PRE(Qp26)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado6          STRING(100)
Loc::Titulo6          STRING(100)
SavPath6          STRING(2000)
Evo::Group6  GROUP,PRE()
Evo::Procedure6          STRING(100)
Evo::App6          STRING(100)
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
QBE5                 QueryListClass                        ! QBE List Class. 
QBV5                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_6  SHORT
Gol_woI_6 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_6),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_6),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_6),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_6),TRN
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
PrintExBrowse6 ROUTINE

 OPEN(Gol_woI_6)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_6 = BRW1.FileLoaded
 IF Not  EC::LoadI_6
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_6)
 SETCURSOR()
  Evo::App6          = 'Gestion'
  Evo::Procedure6          = GlobalErrors.GetProcedureName()& 6
 
  FREE(QPar6)
  Q6:FieldPar  = '1,2,3,4,5,6,7,'
  ADD(QPar6)  !!1
  Q6:FieldPar  = ';'
  ADD(QPar6)  !!2
  Q6:FieldPar  = 'Spanish'
  ADD(QPar6)  !!3
  Q6:FieldPar  = ''
  ADD(QPar6)  !!4
  Q6:FieldPar  = true
  ADD(QPar6)  !!5
  Q6:FieldPar  = ''
  ADD(QPar6)  !!6
  Q6:FieldPar  = true
  ADD(QPar6)  !!7
 !!!! Exportaciones
  Q6:FieldPar  = 'HTML|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'EXCEL|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'WORD|'
  Q6:FieldPar  = CLIP( Q6:FieldPar)&'ASCII|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'XML|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'PRT|'
  ADD(QPar6)  !!8
  Q6:FieldPar  = 'All'
  ADD(QPar6)   !.9.
  Q6:FieldPar  = ' 0'
  ADD(QPar6)   !.10
  Q6:FieldPar  = 0
  ADD(QPar6)   !.11
  Q6:FieldPar  = '1'
  ADD(QPar6)   !.12
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.13
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.14
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.15
 
   Q6:FieldPar  = '16'
  ADD(QPar6)   !.16
 
   Q6:FieldPar  = 1
  ADD(QPar6)   !.17
   Q6:FieldPar  = 2
  ADD(QPar6)   !.18
   Q6:FieldPar  = '2'
  ADD(QPar6)   !.19
   Q6:FieldPar  = 12
  ADD(QPar6)   !.20
 
   Q6:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar6)   !.21
 
   Q6:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar6)   !.22
 
   CLEAR(Q6:FieldPar)
  ADD(QPar6)   ! 23 Caracteres Encoding para xml
 
  Q6:FieldPar  = '0'
  ADD(QPar6)   ! 24 Use Open Office
 
   Q6:FieldPar  = 'golmedo'
  ADD(QPar6) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q6:FieldPar  = ' BrowseExport'
  ADD(QPar6)   ! 26  BrowseExport
  Q6:FieldPar  = ' '
  ADD(QPar6)   ! 27  
  Q6:FieldPar  = ' ' 
  ADD(QPar6)   ! 28  
  Q6:FieldPar  = 'BEXPORT' 
  ADD(QPar6)   ! 29 Gestion186.clw
 !!!!!
 
 
  FREE(QPar26)
       Qp26:F2N  = 'MAT'
  Qp26:F2P  = '@s5'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'NOMBRE'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'DIR LABORAL'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'TE LABORAL'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'SOCIAL'
  Qp26:F2P  = '@N2'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'CONVENIO CAIDO'
  Qp26:F2P  = '@s2'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'IDSOCIO'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
  SysRec# = false
  FREE(Loc::QHlist6)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar26,SysRec#)
         QHL6:Id      = SysRec#
         QHL6:Nombre  = Qp26:F2N
         QHL6:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL6:Pict    = Qp26:F2P
         QHL6:Tot    = Qp26:F2T
         ADD(Loc::QHlist6)
      Else
        break
     END
  END
  Loc::Titulo6 ='LISTADO DE ESTADO DE DEUDA DE COLEGIADOS '
 
 SavPath6 = PATH()
  Exportar(Loc::QHlist6,BRW1.Q,QPar6,0,Loc::Titulo6,Evo::Group6)
 IF Not EC::LoadI_6 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath6)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('DEUDA3')
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
  QBE5.Init(QBV5, INIMgr,'DEUDA3', GlobalErrors)
  QBE5.QkSupport = True
  QBE5.QkMenuIcon = 'QkQBE.ico'
  QBE5.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,RAN:IDX_C2)                           ! Add the sort order for RAN:IDX_C2 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,RAN:C2,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C2 , RAN:C2
  BRW1.AddSortOrder(,RAN:IDX_C3)                           ! Add the sort order for RAN:IDX_C3 for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?RAN:C3,RAN:C3,,BRW1)           ! Initialize the browse locator using ?RAN:C3 using key: RAN:IDX_C3 , RAN:C3
  BRW1.AddField(RAN:C2,BRW1.Q.RAN:C2)                      ! Field RAN:C2 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C3,BRW1.Q.RAN:C3)                      ! Field RAN:C3 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C4,BRW1.Q.RAN:C4)                      ! Field RAN:C4 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C5,BRW1.Q.RAN:C5)                      ! Field RAN:C5 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C6,BRW1.Q.RAN:C6)                      ! Field RAN:C6 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C7,BRW1.Q.RAN:C7)                      ! Field RAN:C7 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C1,BRW1.Q.RAN:C1)                      ! Field RAN:C1 is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('DEUDA3',QuickWindow)                       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE5,1)
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
    INIMgr.Update('DEUDA3',QuickWindow)                    ! Save window data to non-volatile store
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
       Do PrintExBrowse6
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

