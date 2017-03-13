

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION058.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION056.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION057.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION059.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION060.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION062.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de ME
!!! </summary>
ME PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(ME)
                       PROJECT(ME:ME)
                       PROJECT(ME:FECHA)
                       PROJECT(ME:NUMERO)
                       PROJECT(ME:ORIGEN)
                       PROJECT(ME:CONTENIDO)
                       PROJECT(ME:ACTIVO)
                       PROJECT(ME:IDDPTO)
                       PROJECT(ME:IDESTADO)
                       PROJECT(ME:IDTIPO)
                       JOIN(MED:PK_MEDPTO,ME:IDDPTO)
                         PROJECT(MED:DESCRIPCION)
                         PROJECT(MED:IDDPTO)
                       END
                       JOIN(MET:PK_METIPO,ME:IDTIPO)
                         PROJECT(MET:DESCRIPCION)
                         PROJECT(MET:IDTIPO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ME:ME                  LIKE(ME:ME)                    !List box control field - type derived from field
ME:FECHA               LIKE(ME:FECHA)                 !List box control field - type derived from field
ME:NUMERO              LIKE(ME:NUMERO)                !List box control field - type derived from field
MET:DESCRIPCION        LIKE(MET:DESCRIPCION)          !List box control field - type derived from field
ME:ORIGEN              LIKE(ME:ORIGEN)                !List box control field - type derived from field
ME:CONTENIDO           LIKE(ME:CONTENIDO)             !List box control field - type derived from field
ME:ACTIVO              LIKE(ME:ACTIVO)                !List box control field - type derived from field
MED:DESCRIPCION        LIKE(MED:DESCRIPCION)          !List box control field - type derived from field
ME:IDDPTO              LIKE(ME:IDDPTO)                !Browse key field - type derived from field
ME:IDESTADO            LIKE(ME:IDESTADO)              !Browse key field - type derived from field
ME:IDTIPO              LIKE(ME:IDTIPO)                !Browse key field - type derived from field
MED:IDDPTO             LIKE(MED:IDDPTO)               !Related join file key field - type derived from field
MET:IDTIPO             LIKE(MET:IDTIPO)               !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de ME'),AT(,,453,294),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('ME'),SYSTEM
                       LIST,AT(8,30,431,215),USE(?Browse:1),HVSCROLL,FORMAT('36R(2)|M~ME~C(0)@n-7@80R(2)|M~FEC' & |
  'HA~C(0)@d17@80L(2)|M~NUMERO~@s50@87L(2)|M~TIPO~@s20@80L(2)|M~ORIGEN~@s100@80L(2)|M~C' & |
  'ONTENIDO~@s100@28L(2)|M~ACTIVO~@s2@200L(2)|M~DPTO ACTUAL~@s50@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de ME'),VCR
                       BUTTON('&Ver'),AT(290,251,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(343,251,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(396,251,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(309,272,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('E&xportar'),AT(5,275,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('Imprimir Ingresos'),AT(67,275,85,16),USE(?Button10),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,4,444,266),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:1)
                         END
                         TAB('DPTO'),USE(?Tab:3)
                           BUTTON('Select MEDPTO'),AT(10,250,118,14),USE(?SelectMEDPTO),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                         TAB('ESTADO'),USE(?Tab:4)
                           BUTTON('Select MEESTADO'),AT(9,249,118,14),USE(?SelectMEESTADO),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('TIPO'),USE(?Tab:2)
                           BUTTON('Select METIPO'),AT(9,249,118,14),USE(?SelectMETIPO),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                       END
                       BUTTON('&Salir'),AT(402,278,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(11,251,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                     END

Loc::QHlist7 QUEUE,PRE(QHL7)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar7 QUEUE,PRE(Q7)
FieldPar                 CSTRING(800)
                         END
QPar27 QUEUE,PRE(Qp27)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado7          STRING(100)
Loc::Titulo7          STRING(100)
SavPath7          STRING(2000)
Evo::Group7  GROUP,PRE()
Evo::Procedure7          STRING(100)
Evo::App7          STRING(100)
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_7  SHORT
Gol_woI_7 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_7),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_7),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_7),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_7),TRN
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
PrintExBrowse7 ROUTINE

 OPEN(Gol_woI_7)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_7 = BRW1.FileLoaded
 IF Not  EC::LoadI_7
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_7)
 SETCURSOR()
  Evo::App7          = 'Gestion'
  Evo::Procedure7          = GlobalErrors.GetProcedureName()& 7
 
  FREE(QPar7)
  Q7:FieldPar  = '1,2,3,4,5,6,7,8,'
  ADD(QPar7)  !!1
  Q7:FieldPar  = ';'
  ADD(QPar7)  !!2
  Q7:FieldPar  = 'Spanish'
  ADD(QPar7)  !!3
  Q7:FieldPar  = ''
  ADD(QPar7)  !!4
  Q7:FieldPar  = true
  ADD(QPar7)  !!5
  Q7:FieldPar  = ''
  ADD(QPar7)  !!6
  Q7:FieldPar  = true
  ADD(QPar7)  !!7
 !!!! Exportaciones
  Q7:FieldPar  = 'HTML|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'EXCEL|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'WORD|'
  Q7:FieldPar  = CLIP( Q7:FieldPar)&'ASCII|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'XML|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'PRT|'
  ADD(QPar7)  !!8
  Q7:FieldPar  = 'All'
  ADD(QPar7)   !.9.
  Q7:FieldPar  = ' 0'
  ADD(QPar7)   !.10
  Q7:FieldPar  = 0
  ADD(QPar7)   !.11
  Q7:FieldPar  = '1'
  ADD(QPar7)   !.12
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.13
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.14
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.15
 
   Q7:FieldPar  = '16'
  ADD(QPar7)   !.16
 
   Q7:FieldPar  = 1
  ADD(QPar7)   !.17
   Q7:FieldPar  = 2
  ADD(QPar7)   !.18
   Q7:FieldPar  = '2'
  ADD(QPar7)   !.19
   Q7:FieldPar  = 12
  ADD(QPar7)   !.20
 
   Q7:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar7)   !.21
 
   Q7:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar7)   !.22
 
   CLEAR(Q7:FieldPar)
  ADD(QPar7)   ! 23 Caracteres Encoding para xml
 
  Q7:FieldPar  = '0'
  ADD(QPar7)   ! 24 Use Open Office
 
   Q7:FieldPar  = 'golmedo'
  ADD(QPar7) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q7:FieldPar  = ' BrowseExport'
  ADD(QPar7)   ! 26  BrowseExport
  Q7:FieldPar  = ' '
  ADD(QPar7)   ! 27  
  Q7:FieldPar  = ' ' 
  ADD(QPar7)   ! 28  
  Q7:FieldPar  = 'BEXPORT' 
  ADD(QPar7)   ! 29 Gestion058.clw
 !!!!!
 
 
  FREE(QPar27)
       Qp27:F2N  = 'ME'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'FECHA'
  Qp27:F2P  = '@d17'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'NUMERO'
  Qp27:F2P  = '@s50'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'TIPO'
  Qp27:F2P  = '@s20'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'ORIGEN'
  Qp27:F2P  = '@s100'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'CONTENIDO'
  Qp27:F2P  = '@s100'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'ACTIVO'
  Qp27:F2P  = '@s2'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'DPTO ACTUAL'
  Qp27:F2P  = '@s50'
  Qp27:F2T  = '0'
  ADD(QPar27)
  SysRec# = false
  FREE(Loc::QHlist7)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar27,SysRec#)
         QHL7:Id      = SysRec#
         QHL7:Nombre  = Qp27:F2N
         QHL7:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL7:Pict    = Qp27:F2P
         QHL7:Tot    = Qp27:F2T
         ADD(Loc::QHlist7)
      Else
        break
     END
  END
  Loc::Titulo7 ='Administrator the ME'
 
 SavPath7 = PATH()
  Exportar(Loc::QHlist7,BRW1.Q,QPar7,0,Loc::Titulo7,Evo::Group7)
 IF Not EC::LoadI_7 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath7)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ME')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('ME:ME',ME:ME)                                      ! Added by: BrowseBox(ABC)
  BIND('MED:IDDPTO',MED:IDDPTO)                            ! Added by: BrowseBox(ABC)
  BIND('MET:IDTIPO',MET:IDTIPO)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:ME.Open                                           ! File ME used by this procedure, so make sure it's RelationManager is open
  Relate:MEDPTO.Open                                       ! File MEDPTO used by this procedure, so make sure it's RelationManager is open
  Relate:MEESTADO.Open                                     ! File MEESTADO used by this procedure, so make sure it's RelationManager is open
  Relate:METIPO.Open                                       ! File METIPO used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ME,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'ME', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,ME:FK_ME_DPTO)                        ! Add the sort order for ME:FK_ME_DPTO for sort order 1
  BRW1.AddRange(ME:IDDPTO,Relate:ME,Relate:MEDPTO)         ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,ME:FK_ME_ESTADO)                      ! Add the sort order for ME:FK_ME_ESTADO for sort order 2
  BRW1.AddRange(ME:IDESTADO,Relate:ME,Relate:MEESTADO)     ! Add file relationship range limit for sort order 2
  BRW1.AddSortOrder(,ME:FK_ME_TIPO)                        ! Add the sort order for ME:FK_ME_TIPO for sort order 3
  BRW1.AddRange(ME:IDTIPO,Relate:ME,Relate:METIPO)         ! Add file relationship range limit for sort order 3
  BRW1.AddSortOrder(,ME:PK_ME)                             ! Add the sort order for ME:PK_ME for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,ME:ME,,BRW1)                   ! Initialize the browse locator using  using key: ME:PK_ME , ME:ME
  BRW1.AddField(ME:ME,BRW1.Q.ME:ME)                        ! Field ME:ME is a hot field or requires assignment from browse
  BRW1.AddField(ME:FECHA,BRW1.Q.ME:FECHA)                  ! Field ME:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(ME:NUMERO,BRW1.Q.ME:NUMERO)                ! Field ME:NUMERO is a hot field or requires assignment from browse
  BRW1.AddField(MET:DESCRIPCION,BRW1.Q.MET:DESCRIPCION)    ! Field MET:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(ME:ORIGEN,BRW1.Q.ME:ORIGEN)                ! Field ME:ORIGEN is a hot field or requires assignment from browse
  BRW1.AddField(ME:CONTENIDO,BRW1.Q.ME:CONTENIDO)          ! Field ME:CONTENIDO is a hot field or requires assignment from browse
  BRW1.AddField(ME:ACTIVO,BRW1.Q.ME:ACTIVO)                ! Field ME:ACTIVO is a hot field or requires assignment from browse
  BRW1.AddField(MED:DESCRIPCION,BRW1.Q.MED:DESCRIPCION)    ! Field MED:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(ME:IDDPTO,BRW1.Q.ME:IDDPTO)                ! Field ME:IDDPTO is a hot field or requires assignment from browse
  BRW1.AddField(ME:IDESTADO,BRW1.Q.ME:IDESTADO)            ! Field ME:IDESTADO is a hot field or requires assignment from browse
  BRW1.AddField(ME:IDTIPO,BRW1.Q.ME:IDTIPO)                ! Field ME:IDTIPO is a hot field or requires assignment from browse
  BRW1.AddField(MED:IDDPTO,BRW1.Q.MED:IDDPTO)              ! Field MED:IDDPTO is a hot field or requires assignment from browse
  BRW1.AddField(MET:IDTIPO,BRW1.Q.MET:IDTIPO)              ! Field MET:IDTIPO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ME',QuickWindow)                           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_ME
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
    Relate:ME.Close
    Relate:MEDPTO.Close
    Relate:MEESTADO.Close
    Relate:METIPO.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ME',QuickWindow)                        ! Save window data to non-volatile store
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
    Formulario_ME
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
       Do PrintExBrowse7
    OF ?Button10
      ThisWindow.Update()
      START(ME_imprimir_ingreso, 25000)
      ThisWindow.Reset
    OF ?SelectMEDPTO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectMEDPTO()
      ThisWindow.Reset
    OF ?SelectMEESTADO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectMEESTADO()
      ThisWindow.Reset
    OF ?SelectMETIPO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectMETIPO()
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

