

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION102.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION100.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de SUBCUENTAS
!!! </summary>
ABMSUBCUENTAS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SUBCUENTAS)
                       PROJECT(SUB:IDSUBCUENTA)
                       PROJECT(SUB:DESCRIPCION)
                       PROJECT(SUB:IDCUENTA)
                       PROJECT(SUB:IDFONDO)
                       PROJECT(SUB:CAJA)
                       PROJECT(SUB:INFORME)
                       JOIN(FON:PK_FONDOS,SUB:IDFONDO)
                         PROJECT(FON:NOMBRE_FONDO)
                         PROJECT(FON:IDFONDO)
                       END
                       JOIN(CUE:PK_CUENTAS,SUB:IDCUENTA)
                         PROJECT(CUE:DESCRIPCION)
                         PROJECT(CUE:TIPO)
                         PROJECT(CUE:IDCUENTA)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SUB:IDSUBCUENTA        LIKE(SUB:IDSUBCUENTA)          !List box control field - type derived from field
SUB:DESCRIPCION        LIKE(SUB:DESCRIPCION)          !List box control field - type derived from field
SUB:IDCUENTA           LIKE(SUB:IDCUENTA)             !List box control field - type derived from field
CUE:DESCRIPCION        LIKE(CUE:DESCRIPCION)          !List box control field - type derived from field
CUE:TIPO               LIKE(CUE:TIPO)                 !List box control field - type derived from field
SUB:IDFONDO            LIKE(SUB:IDFONDO)              !List box control field - type derived from field
FON:NOMBRE_FONDO       LIKE(FON:NOMBRE_FONDO)         !List box control field - type derived from field
SUB:CAJA               LIKE(SUB:CAJA)                 !List box control field - type derived from field
SUB:INFORME            LIKE(SUB:INFORME)              !List box control field - type derived from field
FON:IDFONDO            LIKE(FON:IDFONDO)              !Related join file key field - type derived from field
CUE:IDCUENTA           LIKE(CUE:IDCUENTA)             !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de SUBCUENTAS'),AT(,,421,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ABMSUBCUENTAS'),SYSTEM
                       LIST,AT(8,30,408,124),USE(?Browse:1),HVSCROLL,FORMAT('64L(2)|M~IDSUBCUENTA~C(0)@n-7@80L' & |
  '(2)|M~DESCRIPCION~@s30@[37L(2)|M~IDCUENTA~C(0)@n-7@127L(2)|M~DESC CUENTA~C(0)@s30@12' & |
  '6L(2)|M~TIPO~C(0)@s10@](211)|M~CUENTA~[38L(2)|M~IDFONDO~@n-3@120L(2)|M~NOMBRE~@s30@]' & |
  '|M~FONDOS~28L(2)|M~CAJA~@s3@8L(2)|M~INFORME~@s2@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de SUBCUENTAS')
                       BUTTON('&Ver'),AT(206,159,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(259,159,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(312,159,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(365,159,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('E&xportar'),AT(7,179,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,415,172),USE(?CurrentTab)
                         TAB('SUB CUENTA'),USE(?Tab:2)
                         END
                         TAB('CUENTAS'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(363,181,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
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
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  Q7:FieldPar  = '1,2,3,4,5,6,7,8,9,'
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
  ADD(QPar7)   ! 29 Gestion102.clw
 !!!!!
 
 
  FREE(QPar27)
       Qp27:F2N  = 'IDSUBCUENTA'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'DESCRIPCION'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'IDCUENTA'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'DESC CUENTA'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'TIPO'
  Qp27:F2P  = '@s10'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'IDFONDO'
  Qp27:F2P  = '@n-3'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'NOMBRE'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'CAJA'
  Qp27:F2P  = '@s3'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'INFORME'
  Qp27:F2P  = '@s2'
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
  Loc::Titulo7 ='Listado de Sub Cuentas'
 
 SavPath7 = PATH()
  Exportar(Loc::QHlist7,BRW1.Q,QPar7,1,Loc::Titulo7,Evo::Group7)
 IF Not EC::LoadI_7 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath7)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ABMSUBCUENTAS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SUB:IDSUBCUENTA',SUB:IDSUBCUENTA)                  ! Added by: BrowseBox(ABC)
  BIND('FON:NOMBRE_FONDO',FON:NOMBRE_FONDO)                ! Added by: BrowseBox(ABC)
  BIND('FON:IDFONDO',FON:IDFONDO)                          ! Added by: BrowseBox(ABC)
  BIND('CUE:IDCUENTA',CUE:IDCUENTA)                        ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SUBCUENTAS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SUB:FK_SUBCUENTAS)                    ! Add the sort order for SUB:FK_SUBCUENTAS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SUB:IDCUENTA,,BRW1)            ! Initialize the browse locator using  using key: SUB:FK_SUBCUENTAS , SUB:IDCUENTA
  BRW1.AddSortOrder(,SUB:INTEG_113)                        ! Add the sort order for SUB:INTEG_113 for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,SUB:IDSUBCUENTA,,BRW1)         ! Initialize the browse locator using  using key: SUB:INTEG_113 , SUB:IDSUBCUENTA
  BRW1.AddField(SUB:IDSUBCUENTA,BRW1.Q.SUB:IDSUBCUENTA)    ! Field SUB:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:DESCRIPCION,BRW1.Q.SUB:DESCRIPCION)    ! Field SUB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDCUENTA,BRW1.Q.SUB:IDCUENTA)          ! Field SUB:IDCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(CUE:DESCRIPCION,BRW1.Q.CUE:DESCRIPCION)    ! Field CUE:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUE:TIPO,BRW1.Q.CUE:TIPO)                  ! Field CUE:TIPO is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDFONDO,BRW1.Q.SUB:IDFONDO)            ! Field SUB:IDFONDO is a hot field or requires assignment from browse
  BRW1.AddField(FON:NOMBRE_FONDO,BRW1.Q.FON:NOMBRE_FONDO)  ! Field FON:NOMBRE_FONDO is a hot field or requires assignment from browse
  BRW1.AddField(SUB:CAJA,BRW1.Q.SUB:CAJA)                  ! Field SUB:CAJA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:INFORME,BRW1.Q.SUB:INFORME)            ! Field SUB:INFORME is a hot field or requires assignment from browse
  BRW1.AddField(FON:IDFONDO,BRW1.Q.FON:IDFONDO)            ! Field FON:IDFONDO is a hot field or requires assignment from browse
  BRW1.AddField(CUE:IDCUENTA,BRW1.Q.CUE:IDCUENTA)          ! Field CUE:IDCUENTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABMSUBCUENTAS',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSUBCUENTAS
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
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABMSUBCUENTAS',QuickWindow)             ! Save window data to non-volatile store
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
    UpdateSUBCUENTAS
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

