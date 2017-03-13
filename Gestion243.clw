

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION243.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION034.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION242.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PAGOSXCIRCULO File
!!! </summary>
ABMPAGOSXCIRCULO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PAGOSXCIRCULO)
                       PROJECT(PAG1:IDSOCIO)
                       PROJECT(PAG1:IDCIRCULO)
                       JOIN(SOC:PK_SOCIOS,PAG1:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                       JOIN(CIR:PK_CIRCULO,PAG1:IDCIRCULO)
                         PROJECT(CIR:DESCRIPCION)
                         PROJECT(CIR:IDCIRCULO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAG1:IDSOCIO           LIKE(PAG1:IDSOCIO)             !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAG1:IDCIRCULO         LIKE(PAG1:IDCIRCULO)           !List box control field - type derived from field
CIR:DESCRIPCION        LIKE(CIR:DESCRIPCION)          !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
CIR:IDCIRCULO          LIKE(CIR:IDCIRCULO)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the PAGOS X  DISTRITO '),AT(,,421,208),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ABMPAGOSXCIRCULO'),SYSTEM
                       LIST,AT(8,40,406,124),USE(?Browse:1),HVSCROLL,FORMAT('[39L(2)|M~IDSOCIO~C(0)@n-7@47L(2)' & |
  '|M~MATRICULA~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@](212)|M~COLEGIADO~[21L(2)|M~IDC~C(0' & |
  ')@n-3@200L(2)|M~DESCRIPCION~C(0)@s50@]|M~DESTRITO~'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de PAGOSXCIRCULO'),VCR
                       BUTTON('&Ver'),AT(205,167,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(259,167,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(311,167,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(365,167,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('E&xportar'),AT(7,190,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,415,182),USE(?CurrentTab)
                         TAB('PAGOS X DISTRITO'),USE(?Tab:2)
                         END
                         TAB('SOCIO'),USE(?Tab:3)
                           PROMPT('IDSOCIO:'),AT(8,25),USE(?PAG1:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(58,24,60,10),USE(PAG1:IDSOCIO),RIGHT(1)
                           BUTTON('...'),AT(117,22,12,12),USE(?CallLookup:2)
                         END
                         TAB('DISTRITO'),USE(?Tab:4)
                           PROMPT('ID DISTRITO:'),AT(8,25),USE(?PAG1:IDCIRCULO:Prompt)
                           ENTRY(@n-14),AT(57,24,60,10),USE(PAG1:IDCIRCULO),RIGHT(1)
                           BUTTON('...'),AT(119,23,12,12),USE(?CallLookup)
                         END
                       END
                       BUTTON('&Salir'),AT(360,190,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(9,167,49,14),USE(?Query),LEFT,ICON('q.ico'),FLAT
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  Q8:FieldPar  = '1,2,3,4,5,'
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
  ADD(QPar8)   ! 29 Gestion243.clw
 !!!!!
 
 
  FREE(QPar28)
       Qp28:F2N  = 'IDSOCIO'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MATRICULA'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'NOMBRE'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDC'
  Qp28:F2P  = '@n-3'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'DESCRIPCION'
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
  Loc::Titulo8 ='Administrator the PAGOSXCIRCULO'
 
 SavPath8 = PATH()
  Exportar(Loc::QHlist8,BRW1.Q,QPar8,0,Loc::Titulo8,Evo::Group8)
 IF Not EC::LoadI_8 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath8)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ABMPAGOSXCIRCULO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('CIR:IDCIRCULO',CIR:IDCIRCULO)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PAGOSXCIRCULO.Open                                ! File PAGOSXCIRCULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGOSXCIRCULO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'ABMPAGOSXCIRCULO', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAG1:FK_PAGOSXCIRCULO_SOCIO)          ! Add the sort order for PAG1:FK_PAGOSXCIRCULO_SOCIO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,PAG1:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: PAG1:FK_PAGOSXCIRCULO_SOCIO , PAG1:IDSOCIO
  BRW1.AddSortOrder(,PAG1:FK_PAGOSXCIRCULO_CIRCULO)        ! Add the sort order for PAG1:FK_PAGOSXCIRCULO_CIRCULO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,PAG1:IDCIRCULO,,BRW1)          ! Initialize the browse locator using  using key: PAG1:FK_PAGOSXCIRCULO_CIRCULO , PAG1:IDCIRCULO
  BRW1.AddSortOrder(,PAG1:PK_PAGOSXCIRCULO)                ! Add the sort order for PAG1:PK_PAGOSXCIRCULO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,PAG1:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: PAG1:PK_PAGOSXCIRCULO , PAG1:IDSOCIO
  BRW1.AddField(PAG1:IDSOCIO,BRW1.Q.PAG1:IDSOCIO)          ! Field PAG1:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAG1:IDCIRCULO,BRW1.Q.PAG1:IDCIRCULO)      ! Field PAG1:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(CIR:DESCRIPCION,BRW1.Q.CIR:DESCRIPCION)    ! Field CIR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CIR:IDCIRCULO,BRW1.Q.CIR:IDCIRCULO)        ! Field CIR:IDCIRCULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABMPAGOSXCIRCULO',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AskProcedure = 3                                    ! Will call: UpdatePAGOSXCIRCULO
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
    Relate:PAGOSXCIRCULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABMPAGOSXCIRCULO',QuickWindow)          ! Save window data to non-volatile store
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
    EXECUTE Number
      SelectSOCIOS
      SelectCIRCULO
      UpdatePAGOSXCIRCULO
    END
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
    OF ?PAG1:IDSOCIO
      PAG1:IDSOCIO = PAG1:IDSOCIO
      IF Access:PAGOSXCIRCULO.TryFetch(PAG1:FK_PAGOSXCIRCULO_SOCIO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG1:IDSOCIO = PAG1:IDSOCIO
        ELSE
          SELECT(?PAG1:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      PAG1:IDSOCIO = PAG1:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAG1:IDSOCIO = PAG1:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?PAG1:IDCIRCULO
      PAG1:IDCIRCULO = PAG1:IDCIRCULO
      IF Access:PAGOSXCIRCULO.TryFetch(PAG1:FK_PAGOSXCIRCULO_CIRCULO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PAG1:IDCIRCULO = PAG1:IDCIRCULO
        ELSE
          SELECT(?PAG1:IDCIRCULO)
          CYCLE
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      PAG1:IDCIRCULO = PAG1:IDCIRCULO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAG1:IDCIRCULO = PAG1:IDCIRCULO
      END
      ThisWindow.Reset(1)
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
  ELSE
    RETURN SELF.SetSort(3,Force)
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

