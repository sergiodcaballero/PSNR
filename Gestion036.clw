

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION036.INC'),ONCE        !Local module procedure declarations
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de RANKING
!!! </summary>
IMPRIMIR_LIBRO_DIARIO_CUENTA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(RANKING)
                       PROJECT(RAN:C1)
                       PROJECT(RAN:C2)
                       PROJECT(RAN:C3)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RAN:C1                 LIKE(RAN:C1)                   !List box control field - type derived from field
RAN:C2                 LIKE(RAN:C2)                   !List box control field - type derived from field
RAN:C3                 LIKE(RAN:C3)                   !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('INFORME DE LIABRO DIARIO POR FECHA'),AT(,,529,207),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,HLP('IMPRIMIR_CAJA_CUOTAS1'),SYSTEM
                       LIST,AT(8,30,501,142),USE(?Browse:1),HVSCROLL,FORMAT('125L(2)|M~CUENTA~@s30@80L(2)|M~DE' & |
  'BE~@N-13.2@80L(2)|M~HABER~@N-13.2@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de RANKING')
                       SHEET,AT(4,4,519,178),USE(?CurrentTab)
                         TAB('CUENTA'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(473,186,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(62,186,49,14),USE(?Query),LEFT,ICON('SQBE.ICO'),FLAT
                       BUTTON('E&xportar'),AT(5,185,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
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
QBE7                 QueryListClass                        ! QBE List Class. 
QBV7                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  Q6:FieldPar  = '1,2,3,'
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
  ADD(QPar6)   ! 29 Gestion036.clw
 !!!!!
 
 
  FREE(QPar26)
       Qp26:F2N  = 'CUENTA'
  Qp26:F2P  = '@s30'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'DEBE'
  Qp26:F2P  = '@N-10.2'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'HABER'
  Qp26:F2P  = '@N-10.2'
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
  Loc::Titulo6 ='Administrator the RANKING'
 
 SavPath6 = PATH()
  Exportar(Loc::QHlist6,BRW1.Q,QPar6,0,Loc::Titulo6,Evo::Group6)
 IF Not EC::LoadI_6 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath6)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_LIBRO_DIARIO_CUENTA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
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
  QBE7.Init(QBV7, INIMgr,'IMPRIMIR_LIBRO_DIARIO_CUENTA', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,RAN:PK_RANKING)                       ! Add the sort order for RAN:PK_RANKING for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,RAN:C1,,BRW1)                  ! Initialize the browse locator using  using key: RAN:PK_RANKING , RAN:C1
  BRW1.AddField(RAN:C1,BRW1.Q.RAN:C1)                      ! Field RAN:C1 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C2,BRW1.Q.RAN:C2)                      ! Field RAN:C2 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C3,BRW1.Q.RAN:C3)                      ! Field RAN:C3 is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('IMPRIMIR_LIBRO_DIARIO_CUENTA',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
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
    INIMgr.Update('IMPRIMIR_LIBRO_DIARIO_CUENTA',QuickWindow) ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
IMPRIMIR_LIBRODIARIO PROCEDURE 

Window               WINDOW('LISTADO DE LIBRO DIARIO'),AT(,,256,90),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       PROMPT('FECHA DESDE:'),AT(12,8),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(67,8,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(134,9),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(190,9,60,10),USE(FECHA_HASTA),RIGHT(1)
                       BUTTON('&Imprimir X Detalle por SubCuenta'),AT(11,35,97,18),USE(?OkButton),LEFT,ICON(ICON:Print1), |
  DEFAULT,FLAT
                       BUTTON('Imprimir x Cuenta'),AT(148,35,97,18),USE(?Button3),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&SALIR'),AT(103,62,58,22),USE(?CancelButton),LEFT,ICON('SALIR.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_LIBRODIARIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SQL.Open                                          ! File SQL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_LIBRODIARIO',Window)              ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
    Relate:SQL.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_LIBRODIARIO',Window)           ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?OkButton
      !! LIMPIA RANKING
      RANKING {PROP:SQL} =  'DELETE FROM RANKING'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          RETURN LEVEL:BENIGN
      END
    OF ?Button3
      !! LIMPIA RANKING
      RANKING {PROP:SQL} =  'DELETE FROM RANKING'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          RETURN LEVEL:BENIGN
      END
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      GLO:QFDESDE = FORMAT(FECHA_DESDE,@D1)
      GLO:QFHASTA = FORMAT(FECHA_HASTA,@D1)
      
      SQL{PROP:SQL} = ' SELECT CUENTAS.TIPO, cuentas.descripcion, SUBCUENTAS.descripcion, LIBDIARIO.observacion, LIBDIARIO.DEBE, LIBDIARIO.haber, LIBDIARIO.FECHA, FONDOS.nombre_fondo, LIBDIARIO.FONDO, libdiario.sucursal, libdiario.recibo, proveedores.descripcion FROM CUENTAS , subcuentas,  LIBDIARIO, FONDOS, PROVEEDORES WHERE LIBDIARIO.idsubcuenta = SUBCUENTAS.idsubcuenta AND  subcuentas.idfondo = FONDOS.idfondo AND SUBCUENTAS.idcuenta = CUENTAS.idcuenta AND libdiario.idproveedor = proveedores.idproveedor AND LIBDIARIO.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&'''  ORDER BY LIBDIARIO.IDLIBDIARIO, LIBDIARIO.FECHA '
      
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          SELECT(GLO:FECHA_LARGO)
          RETURN LEVEL:BENIGN
      END
      LOOP
          NEXT(SQL)
          IF ERRORCODE() THEN BREAK.
          RAN:C1 = RAN:C1 + 1
          RAN:C2 = SQL:VAR2  !!cUENTA
          RAN:C3 = SQL:VAR3  !! SUB CUENTA
          RAN:C4 = SQL:VAR4   !! OBSERVACION
          RAN:C5 = clip(SQL:VAR5)!! DEBE
          RAN:C6 = CLIP(SQL:VAR6) !! HABER
          RAN:C7 = SQL:VAR7  !! FECHA
          RAN:C8 = SQL:VAR1  !! TIPO CUENTA
          RAN:C9 = SQL:VAR8  !! FONDO
          RAN:C10 = CLIP(SQL:VAR10)&'-'&CLIP(SQL:VAR11) !!  SUCURSAL - RECIBO
          RAN:C11 = SQL:VAR12
          RAN:CANTIDAD = RAN:CANTIDAD + 1
          ADD(RANKING)
          if errorcode() then message(error()).
          
      END
      
      IMPRIMIR_LIBRO_DIARIO_SUBCUENTA()
    OF ?Button3
      ThisWindow.Update()
      GLO:QFDESDE = FORMAT(FECHA_DESDE,@D1)
      GLO:QFHASTA = FORMAT(FECHA_HASTA,@D1)
      
      
      SQL{PROP:SQL} = 'SELECT  CUENTAS.descripcion, SUM(LIBDIARIO.DEBE), SUM(LIBDIARIO.haber) FROM CUENTAS , subcuentas,  LIBDIARIO WHERE LIBDIARIO.idsubcuenta = SUBCUENTAS.idsubcuenta AND   SUBCUENTAS.idcuenta = CUENTAS.idcuenta AND LIBDIARIO.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&'''  GROUP BY CUENTAS.descripcion'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          SELECT(GLO:FECHA_LARGO)
          RETURN LEVEL:BENIGN
      END
      LOOP
          NEXT(SQL)
          IF ERRORCODE() THEN BREAK.
          RAN:C1 = SQL:VAR1
          RAN:C2 = SQL:VAR2
          RAN:C3 = SQL:VAR3
          ADD(RANKING)
          
      END
      
      IMPRIMIR_LIBRO_DIARIO_CUENTA()
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
  ADD(QPar5)   ! 29 Gestion036.clw
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
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
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


!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de RANKING
!!! </summary>
IMPRIMIR_CUENTA_INGRESO PROCEDURE 

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
                       PROJECT(RAN:C1)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RAN:C8                 LIKE(RAN:C8)                   !List box control field - type derived from field
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
QuickWindow          WINDOW('LISTADO POR CUENTA INGRESOS - EGRESOS'),AT(,,454,276),FONT('Arial',8,,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,HLP('IMPRIMIR_CAJA_CUOTAS1'),SYSTEM
                       LIST,AT(8,30,440,200),USE(?Browse:1),HVSCROLL,FORMAT('38L(2)|M~Nº Recibo~@s6@23L(2)|M~S' & |
  'uc~@s3@126L(2)|M~Cuenta~@s30@200L(2)|M~Sub Cuenta~@s50@41L(2)|M~Monto~@N$-12.2@46L(2' & |
  ')|M~Fecha~@s20@200L(2)|M~Observación~@s100@39L(2)|M~Nº~@s6@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de RANKING'),VCR
                       BUTTON('&Filtro'),AT(69,256,49,14),USE(?Query),LEFT,ICON('sqbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(5,256,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,449,247),USE(?CurrentTab)
                         TAB('CUENTA'),USE(?Tab:1)
                         END
                         TAB('SUB CUENTA'),USE(?Tab:2)
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
  Q5:FieldPar  = '1,2,3,4,5,6,7,8,'
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
  ADD(QPar5)   ! 29 Gestion036.clw
 !!!!!
 
 
  FREE(QPar25)
       Qp25:F2N  = 'Nº Recibo'
  Qp25:F2P  = '@s6'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'Suc'
  Qp25:F2P  = '@s3'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'CUENTA'
  Qp25:F2P  = '@s30'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'Sub Cuenta'
  Qp25:F2P  = '@s50'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'Monto'
  Qp25:F2P  = '@N12.2'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'Fecha'
  Qp25:F2P  = '@s10'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'Observacion'
  Qp25:F2P  = '@s100'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'Nº Recibo'
  Qp25:F2P  = '@s5'
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
  Loc::Titulo5 ='Informe de Ingresos - Egresos por Cuenta'
 
 SavPath5 = PATH()
  Exportar(Loc::QHlist5,BRW1.Q,QPar5,1,Loc::Titulo5,Evo::Group5)
 IF Not EC::LoadI_5 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath5)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_CUENTA_INGRESO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
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
  BRW1.AddSortOrder(,RAN:IDX_C4)                           ! Add the sort order for RAN:IDX_C4 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,RAN:C4,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C4 , RAN:C4
  BRW1.AddSortOrder(,RAN:PK_RANKING)                       ! Add the sort order for RAN:PK_RANKING for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,RAN:C1,,BRW1)                  ! Initialize the browse locator using  using key: RAN:PK_RANKING , RAN:C1
  BRW1.AddField(RAN:C8,BRW1.Q.RAN:C8)                      ! Field RAN:C8 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C2,BRW1.Q.RAN:C2)                      ! Field RAN:C2 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C3,BRW1.Q.RAN:C3)                      ! Field RAN:C3 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C4,BRW1.Q.RAN:C4)                      ! Field RAN:C4 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C5,BRW1.Q.RAN:C5)                      ! Field RAN:C5 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C6,BRW1.Q.RAN:C6)                      ! Field RAN:C6 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C7,BRW1.Q.RAN:C7)                      ! Field RAN:C7 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C1,BRW1.Q.RAN:C1)                      ! Field RAN:C1 is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('IMPRIMIR_CUENTA_INGRESO',QuickWindow)      ! Restore window settings from non-volatile store
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
    INIMgr.Update('IMPRIMIR_CUENTA_INGRESO',QuickWindow)   ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
reporte_cuentas PROCEDURE 

FDCB3::View:FileDropCombo VIEW(CUENTAS)
                       PROJECT(CUE:IDCUENTA)
                       PROJECT(CUE:DESCRIPCION)
                       PROJECT(CUE:TIPO)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CUE:IDCUENTA
CUE:IDCUENTA           LIKE(CUE:IDCUENTA)             !List box control field - type derived from field
CUE:DESCRIPCION        LIKE(CUE:DESCRIPCION)          !List box control field - type derived from field
CUE:TIPO               LIKE(CUE:TIPO)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Window               WINDOW('LISTADO POR CUENTA INGRESOS'),AT(,,256,126),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       PROMPT('FECHA DESDE:'),AT(12,8),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(67,8,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(134,9),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(190,9,60,10),USE(FECHA_HASTA),RIGHT(1)
                       PROMPT('CUENTA INGRESO:'),AT(8,37),USE(?Prompt3)
                       COMBO(@n-14),AT(76,37,165,10),USE(CUE:IDCUENTA),DROP(5),FORMAT('56L(2)|M~IDCUENTA~@n-14' & |
  '@200L(2)|M~DESCRIPCION~@s50@200L(2)|M~TIPO~@s50@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('Imprimir x Cuenta Ingresos'),AT(13,62,97,18),USE(?Button4),LEFT,ICON(ICON:Print1), |
  FLAT
                       BUTTON('Generar x Cuenta Ingresos'),AT(152,62,97,18),USE(?Button3),LEFT,ICON(ICON:NextPage), |
  FLAT
                       BUTTON('&SALIR'),AT(103,91,58,22),USE(?CancelButton),LEFT,ICON('SALIR.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('reporte_cuentas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SQL.Open                                          ! File SQL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('reporte_cuentas',Window)                   ! Restore window settings from non-volatile store
  FDCB3.Init(CUE:IDCUENTA,?CUE:IDCUENTA,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:CUENTAS,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(CUE:PK_CUENTAS)
  FDCB3.SetFilter('CUE:TIPO = ''INGRESO''')
  FDCB3.AddField(CUE:IDCUENTA,FDCB3.Q.CUE:IDCUENTA) !List box control field - type derived from field
  FDCB3.AddField(CUE:DESCRIPCION,FDCB3.Q.CUE:DESCRIPCION) !List box control field - type derived from field
  FDCB3.AddField(CUE:TIPO,FDCB3.Q.CUE:TIPO) !List box control field - type derived from field
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CUENTAS.Close
    Relate:RANKING.Close
    Relate:SQL.Close
  END
  IF SELF.Opened
    INIMgr.Update('reporte_cuentas',Window)                ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?Button4
      GLO:PAGO = CUE:IDCUENTA
    OF ?Button3
      !! LIMPIA RANKING
      RANKING {PROP:SQL} =  'DELETE FROM RANKING'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          RETURN LEVEL:BENIGN
      END
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button4
      ThisWindow.Update()
      imprimir_ingreso()
      ThisWindow.Reset
    OF ?Button3
      ThisWindow.Update()
      GLO:QFDESDE = FORMAT(FECHA_DESDE,@D1)
      GLO:QFHASTA = FORMAT(FECHA_HASTA,@D1)
      cuenta# = clip(CUE:IDCUENTA)
      !SQL{PROP:SQL} = 'SELECT  CUENTAS.descripcion, SUM(LIBDIARIO.DEBE), SUM(LIBDIARIO.haber) FROM CUENTAS , subcuentas,  LIBDIARIO WHERE LIBDIARIO.idsubcuenta = SUBCUENTAS.idsubcuenta AND   SUBCUENTAS.idcuenta = CUENTAS.idcuenta AND LIBDIARIO.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&'''  GROUP BY CUENTAS.descripcion' !!!! and cuentas.idcuenta = '''&CUE:IDCUENTA&'''
      SQL{PROP:SQL} = 'select ingresos.idingreso, ingresos.idrecibo, ingresos.sucursal, cuentas.descripcion , subcuentas.descripcion, ingresos.monto, ingresos.fecha, ingresos.observacion from ingresos,subcuentas,cuentas where ingresos.idsubcuenta = subcuentas.idsubcuenta and  subcuentas.idcuenta =  cuentas.idcuenta   and cuentas.idcuenta = '''&cuenta#&''' and ingresos.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&''' order by ingresos.idingreso'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          SELECT(GLO:FECHA_LARGO)
          RETURN LEVEL:BENIGN
      END
      LOOP
          NEXT(SQL)
          IF ERRORCODE() THEN BREAK.
          RAN:C1 = SQL:VAR1
          RAN:C8 = SQL:VAR2
          RAN:C2 = SQL:VAR3
          RAN:C3 = SQL:VAR4
          RAN:C4 = SQL:VAR5
          RAN:C5 = SQL:VAR6
          RAN:C6 = SQL:VAR7
          RAN:C7 = SQL:VAR8
          ADD(RANKING)
          !if errorcode() then message(error()).
          
      END
      
      IMPRIMIR_CUENTA_INGRESO()
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

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
imprimir_ingreso PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CUENTAS)
                       PROJECT(CUE:DESCRIPCION)
                       PROJECT(CUE:IDCUENTA)
                       JOIN(SUB:FK_SUBCUENTAS,CUE:IDCUENTA)
                         PROJECT(SUB:DESCRIPCION)
                         PROJECT(SUB:IDSUBCUENTA)
                         JOIN(ING:FK_INGRESOS_SUBCUENTA,SUB:IDSUBCUENTA)
                           PROJECT(ING:FECHA)
                           PROJECT(ING:IDRECIBO)
                           PROJECT(ING:MONTO)
                           PROJECT(ING:OBSERVACION)
                           PROJECT(ING:SUCURSAL)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(250,2740,7750,7490),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:bold,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(229,1000,7750,1740),USE(?Header)
                         IMAGE('Logo.jpg'),AT(31,42,2062,1385),USE(?Image1)
                         STRING('Informe de Ingresos por Cuenta'),AT(2344,1156),USE(?String7),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         STRING('Fecha Desde: '),AT(1594,1490),USE(?String8),TRN
                         STRING(@D6),AT(2417,1490),USE(FECHA_DESDE),TRN
                         STRING(@D6),AT(5542,1490),USE(FECHA_HASTA),TRN
                         LINE,AT(10,1687,7656,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Fecha Hasta: '),AT(4760,1490),USE(?String9),TRN
                       END
break1                 BREAK(SUB:IDSUBCUENTA),USE(?BREAK1)
                         HEADER,AT(0,0,,427),USE(?GROUPHEADER1)
                           STRING('Cuenta:'),AT(2958,21),USE(?String13),TRN
                           STRING('Sub Cuenta: '),AT(21,31),USE(?String12),TRN
                           STRING(@s50),AT(760,31),USE(SUB:DESCRIPCION)
                           STRING('Recibo'),AT(63,229),USE(?String15),TRN
                           STRING('Monto'),AT(1917,229),USE(?String16),TRN
                           STRING('Fecha'),AT(3385,229),USE(?String17),TRN
                           STRING('Detalle'),AT(5063,229),USE(?String18),TRN
                           BOX,AT(10,219,7667,198),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(1)
                           STRING(@s50),AT(3469,21),USE(CUE:DESCRIPCION),TRN
                         END
detail1                  DETAIL,AT(0,0,,271),USE(?DETAIL1)
                           STRING(@p####-p),AT(31,10),USE(ING:SUCURSAL),RIGHT(1)
                           STRING(@n-7),AT(396,10),USE(ING:IDRECIBO),RIGHT(1)
                           STRING(@n$12.2),AT(1771,10),USE(ING:MONTO)
                           STRING(@s50),AT(4406,10,3250,177),USE(ING:OBSERVACION)
                           STRING(@d17),AT(3333,10),USE(ING:FECHA)
                           LINE,AT(42,219,7635,0),USE(?Line2),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,292),USE(?GROUPFOOTER1)
                           STRING('Sub Total por Sub Cuenta:'),AT(31,21),USE(?String19),TRN
                           STRING(@n$-12.2),AT(1583,21),USE(ING:MONTO,,?ING:MONTO:2),SUM,RESET(break1)
                           BOX,AT(10,219,7667,52),USE(?Box2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         END
                       END
                       FOOTER,AT(271,10219,7750,635),USE(?Footer)
                         STRING(@n$12.2),AT(4333,31),USE(ING:MONTO,,?ING:MONTO:3),FONT(,,,FONT:bold),SUM,PAGE
                         STRING('Total Egresos por Cuenta: '),AT(2583,21),USE(?String21),FONT(,10,,FONT:bold),TRN
                         LINE,AT(21,312,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(31,396),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2135,396),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5635,396),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(250,1000,7760,10219),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('imprimir_ingreso')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FECHA_DESDE',FECHA_DESDE)                          ! Added by: Report
  BIND('FECHA_HASTA',FECHA_HASTA)                          ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('imprimir_ingreso',ProgressWindow)          ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CUENTAS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CUE:IDCUENTA)
  ThisReport.AddSortOrder(CUE:PK_CUENTAS)
  ThisReport.AddRange(CUE:IDCUENTA,GLO:PAGO)
  ThisReport.SetFilter('(ING:FECHA >= FECHA_DESDE)   AND (ING:FECHA <<=  FECHA_HASTA)')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CUENTAS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('imprimir_ingreso',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagName,'FECHA_DESDE')
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagName,'FECHA_HASTA')
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'SUB:DESCRIPCION')
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'CUE:DESCRIPCION')
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagName,'ING:SUCURSAL')
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagName,'ING:IDRECIBO')
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagName,'ING:MONTO')
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagName,'ING:OBSERVACION')
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagName,'ING:FECHA')
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagName,'ING:MONTO:2')
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagName,'ING:MONTO:3')
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','irimir_egreso','irimir_egreso','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
reporte_cuenta_egreso PROCEDURE 

FDCB3::View:FileDropCombo VIEW(CUENTAS)
                       PROJECT(CUE:IDCUENTA)
                       PROJECT(CUE:DESCRIPCION)
                       PROJECT(CUE:TIPO)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CUE:IDCUENTA
CUE:IDCUENTA           LIKE(CUE:IDCUENTA)             !List box control field - type derived from field
CUE:DESCRIPCION        LIKE(CUE:DESCRIPCION)          !List box control field - type derived from field
CUE:TIPO               LIKE(CUE:TIPO)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Window               WINDOW('LISTADO POR CUENTA EGRESOS'),AT(,,256,126),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       PROMPT('FECHA DESDE:'),AT(12,8),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(67,8,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(134,9),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(190,9,60,10),USE(FECHA_HASTA),RIGHT(1)
                       PROMPT('CUENTA EGRESOS:'),AT(8,37),USE(?Prompt3)
                       COMBO(@n-14),AT(76,37,165,10),USE(CUE:IDCUENTA),DROP(5),FORMAT('56L(2)|M~IDCUENTA~@n-14' & |
  '@200L(2)|M~DESCRIPCION~@s50@200L(2)|M~TIPO~@s50@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('Exportar  x Cuenta Egresos'),AT(153,62,99,18),USE(?Button3),LEFT,ICON(ICON:NextPage), |
  FLAT
                       BUTTON('Imprimit x Cuenta Egresos'),AT(13,62,99,18),USE(?Button4),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&SALIR'),AT(103,91,58,22),USE(?CancelButton),LEFT,ICON('SALIR.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB3                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('reporte_cuenta_egreso')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SQL.Open                                          ! File SQL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('reporte_cuenta_egreso',Window)             ! Restore window settings from non-volatile store
  FDCB3.Init(CUE:IDCUENTA,?CUE:IDCUENTA,Queue:FileDropCombo.ViewPosition,FDCB3::View:FileDropCombo,Queue:FileDropCombo,Relate:CUENTAS,ThisWindow,GlobalErrors,0,1,0)
  FDCB3.Q &= Queue:FileDropCombo
  FDCB3.AddSortOrder(CUE:PK_CUENTAS)
  FDCB3.SetFilter('CUE:TIPO = ''EGRESO''')
  FDCB3.AddField(CUE:IDCUENTA,FDCB3.Q.CUE:IDCUENTA) !List box control field - type derived from field
  FDCB3.AddField(CUE:DESCRIPCION,FDCB3.Q.CUE:DESCRIPCION) !List box control field - type derived from field
  FDCB3.AddField(CUE:TIPO,FDCB3.Q.CUE:TIPO) !List box control field - type derived from field
  ThisWindow.AddItem(FDCB3.WindowComponent)
  FDCB3.DefaultFill = 0
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CUENTAS.Close
    Relate:RANKING.Close
    Relate:SQL.Close
  END
  IF SELF.Opened
    INIMgr.Update('reporte_cuenta_egreso',Window)          ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?Button3
      !! LIMPIA RANKING
      RANKING {PROP:SQL} =  'DELETE FROM RANKING'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          RETURN LEVEL:BENIGN
      END
    OF ?Button4
      GLO:PAGO = CUE:IDCUENTA
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button3
      ThisWindow.Update()
      GLO:QFDESDE = FORMAT(FECHA_DESDE,@D1)
      GLO:QFHASTA = FORMAT(FECHA_HASTA,@D1)
      cuenta# = clip(CUE:IDCUENTA)
      !SQL{PROP:SQL} = 'SELECT  CUENTAS.descripcion, SUM(LIBDIARIO.DEBE), SUM(LIBDIARIO.haber) FROM CUENTAS , subcuentas,  LIBDIARIO WHERE LIBDIARIO.idsubcuenta = SUBCUENTAS.idsubcuenta AND   SUBCUENTAS.idcuenta = CUENTAS.idcuenta AND LIBDIARIO.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&'''  GROUP BY CUENTAS.descripcion' !!!! and cuentas.idcuenta = '''&CUE:IDCUENTA&'''
      SQL{PROP:SQL} = 'select gastos.idgastos, gastos.idrecibo, gastos.sucursal, cuentas.descripcion , subcuentas.descripcion, gastos.monto, gastos.fecha, gastos.observacion from gastos,subcuentas,cuentas where cuentas.idcuenta = subcuentas.idcuenta and subcuentas.idsubcuenta = gastos.idsubcuenta   and cuentas.idcuenta = '''&cuenta#&''' and gastos.fecha between '''&GLO:QFDESDE&''' AND '''&GLO:QFHASTA&''' order by gastos.idgastos'
      IF ERRORCODE() THEN
          MESSAGE(FILEERROR())
          SELECT(GLO:FECHA_LARGO)
          RETURN LEVEL:BENIGN
      END
      LOOP
          NEXT(SQL)
          IF ERRORCODE() THEN BREAK.
          RAN:C1 = SQL:VAR1
          RAN:C8 = SQL:VAR2
          RAN:C2 = SQL:VAR3
          RAN:C3 = SQL:VAR4
          RAN:C4 = SQL:VAR5
          RAN:C5 = SQL:VAR6
          RAN:C6 = SQL:VAR7
          RAN:C7 = SQL:VAR8
          ADD(RANKING)
          !if errorcode() then message(error()).
          
      END
      
      IMPRIMIR_CUENTA_INGRESO()
    OF ?Button4
      ThisWindow.Update()
      imprimir_egreso()
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

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
imprimir_egreso PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CUENTAS)
                       PROJECT(CUE:DESCRIPCION)
                       PROJECT(CUE:IDCUENTA)
                       JOIN(SUB:FK_SUBCUENTAS,CUE:IDCUENTA)
                         PROJECT(SUB:DESCRIPCION)
                         PROJECT(SUB:IDSUBCUENTA)
                         JOIN(GAS:FK_GASTOS_SUBCUENTA,SUB:IDSUBCUENTA)
                           PROJECT(GAS:FECHA)
                           PROJECT(GAS:IDRECIBO)
                           PROJECT(GAS:MONTO)
                           PROJECT(GAS:OBSERVACION)
                           PROJECT(GAS:SUCURSAL)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(250,2740,7750,7490),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:bold,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(229,1000,7750,1740),USE(?Header)
                         IMAGE('Logo.jpg'),AT(10,10,2115,1406),USE(?Image1)
                         STRING('Informe de Egresos por Cuenta '),AT(2344,1156),USE(?String7),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         STRING('Fecha Desde: '),AT(1594,1490),USE(?String8),TRN
                         STRING(@D6),AT(2417,1490),USE(FECHA_DESDE),TRN
                         STRING(@D6),AT(5542,1490),USE(FECHA_HASTA),TRN
                         LINE,AT(10,1687,7656,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Fecha Hasta: '),AT(4760,1490),USE(?String9),TRN
                       END
break1                 BREAK(SUB:IDSUBCUENTA),USE(?BREAK1)
                         HEADER,AT(0,0,,427),USE(?GROUPHEADER1)
                           STRING('Cuenta:'),AT(2958,21),USE(?String13),TRN
                           STRING('Sub Cuenta: '),AT(21,31),USE(?String12),TRN
                           STRING(@s50),AT(760,31),USE(SUB:DESCRIPCION)
                           STRING('Recibo'),AT(63,229),USE(?String15),TRN
                           STRING('Monto'),AT(1917,229),USE(?String16),TRN
                           STRING('Fecha'),AT(3385,229),USE(?String17),TRN
                           STRING('Detalle'),AT(5063,229),USE(?String18),TRN
                           BOX,AT(10,219,7667,198),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(1)
                           STRING(@s50),AT(3469,21),USE(CUE:DESCRIPCION),TRN
                         END
detail1                  DETAIL,AT(0,0,,271),USE(?DETAIL1)
                           STRING(@P###-P),AT(10,10),USE(GAS:SUCURSAL),RIGHT(1)
                           STRING(@n-14),AT(354,10),USE(GAS:IDRECIBO),RIGHT(1)
                           STRING(@n$-12.2),AT(2083,10),USE(GAS:MONTO)
                           STRING(@d17),AT(3292,10),USE(GAS:FECHA)
                           STRING(@s50),AT(4417,10,3240,177),USE(GAS:OBSERVACION)
                           LINE,AT(42,219,7635,0),USE(?Line2),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,292),USE(?GROUPFOOTER1)
                           STRING(@n$-12.2),AT(1563,10),USE(GAS:MONTO,,?GAS:MONTO:2),SUM,RESET(break1)
                           STRING('Sub Total por Sub Cuenta:'),AT(31,21),USE(?String19),TRN
                           BOX,AT(10,219,7667,52),USE(?Box2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         END
                       END
                       FOOTER,AT(271,10219,7750,1000),USE(?Footer)
                         STRING('Total Egresos por Cuenta: '),AT(2542,21),USE(?String21),FONT(,10,,FONT:bold),TRN
                         STRING(@n$-12.2),AT(4323,21),USE(GAS:MONTO,,?GAS:MONTO:3),FONT(,10,,FONT:bold),SUM,PAGE
                         LINE,AT(21,312,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(31,396),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2135,396),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5635,396),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(250,1000,7760,10219),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('imprimir_egreso')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FECHA_DESDE',FECHA_DESDE)                          ! Added by: Report
  BIND('FECHA_HASTA',FECHA_HASTA)                          ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('imprimir_egreso',ProgressWindow)           ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CUENTAS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CUE:IDCUENTA)
  ThisReport.AddSortOrder(CUE:PK_CUENTAS)
  ThisReport.AddRange(CUE:IDCUENTA,GLO:PAGO)
  ThisReport.SetFilter('(GAS:FECHA >= FECHA_DESDE)   AND (GAS:FECHA <<=  FECHA_HASTA)')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CUENTAS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('imprimir_egreso',ProgressWindow)        ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagName,'FECHA_DESDE')
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagName,'FECHA_HASTA')
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'SUB:DESCRIPCION')
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'CUE:DESCRIPCION')
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:SUCURSAL,RepGen:XML,TargetAttr:TagName,'GAS:SUCURSAL')
  SELF.Attribute.Set(?GAS:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:IDRECIBO,RepGen:XML,TargetAttr:TagName,'GAS:IDRECIBO')
  SELF.Attribute.Set(?GAS:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagName,'GAS:MONTO')
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagName,'GAS:FECHA')
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagName,'GAS:OBSERVACION')
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:MONTO:2,RepGen:XML,TargetAttr:TagName,'GAS:MONTO:2')
  SELF.Attribute.Set(?GAS:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:MONTO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:MONTO:3,RepGen:XML,TargetAttr:TagName,'GAS:MONTO:3')
  SELF.Attribute.Set(?GAS:MONTO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','irimir_egreso','irimir_egreso','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_RECIBOS_EMITIDOS21 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(GASTOS)
                       PROJECT(GAS:FECHA)
                       PROJECT(GAS:IDRECIBO)
                       PROJECT(GAS:LETRA)
                       PROJECT(GAS:MONTO)
                       PROJECT(GAS:OBSERVACION)
                       PROJECT(GAS:SUCURSAL)
                       PROJECT(GAS:IDTIPO_COMPROBANTE)
                       PROJECT(GAS:IDSUBCUENTA)
                       PROJECT(GAS:IDPROVEEDOR)
                       JOIN(TIPCOM:PK_TIPO_COMPROBANTE,GAS:IDTIPO_COMPROBANTE)
                         PROJECT(TIPCOM:DESCRIPCION)
                       END
                       JOIN(SUB:INTEG_113,GAS:IDSUBCUENTA)
                       END
                       JOIN(PRO2:PK_PROVEEDOR,GAS:IDPROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(229,1833,7740,8146),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(219,458,7771,1385),USE(?Header)
                         IMAGE('Logo.JPG'),AT(10,21,1771,1094),USE(?Image1)
                         STRING('ORDENES DE PAGO  EMITIDAS - GASTOS '),AT(1844,677),USE(?String7),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         STRING(@D6),AT(4990,938),USE(FECHA_HASTA),RIGHT(1)
                         LINE,AT(0,1146,7813,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('Fecha'),AT(2177,1177),USE(?String14),TRN
                         STRING('Proveedor'),AT(3094,1177),USE(?String13),TRN
                         STRING('Detalle'),AT(5500,1177),USE(?String15),TRN
                         STRING('Nº Recibo'),AT(208,1177),USE(?String12),TRN
                         STRING('Monto'),AT(7188,1177),USE(?String16),TRN
                         STRING('Tipo'),AT(1656,1177),USE(?String23),TRN
                         LINE,AT(0,1354,7813,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha Desde: '),AT(2188,938),USE(?String8),TRN
                         STRING('Fecha Hasta:'),AT(4260,938),USE(?String9),TRN
                         STRING(@D6),AT(2906,938),USE(FECHA_DESDE),RIGHT(1)
                       END
Detail                 DETAIL,AT(0,0,,240),USE(?Detail),FONT('Arial',8,,FONT:regular)
                         STRING(@s50),AT(2708,0,1885,208),USE(PRO2:DESCRIPCION)
                         STRING(@n$-10.2),AT(7115,21),USE(GAS:MONTO)
                         STRING(@s2),AT(1240,21),USE(GAS:LETRA)
                         STRING(@d17),AT(2052,21),USE(GAS:FECHA)
                         STRING(@P####-P),AT(0,21),USE(GAS:SUCURSAL),RIGHT(1)
                         STRING(@n-14),AT(385,21),USE(GAS:IDRECIBO),RIGHT(1)
                         STRING(@s8),AT(1458,21),USE(TIPCOM:DESCRIPCION)
                         STRING(@s50),AT(4635,21,2385,177),USE(GAS:OBSERVACION)
                         LINE,AT(10,208,7719,0),USE(?Line1),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(240,9990,7740,1000),USE(?Footer)
                         STRING('Total Gasto en Periodo:'),AT(2240,10),USE(?String20),TRN
                         STRING(@n$-13.2),AT(3458,10),USE(GAS:MONTO,,?GAS:MONTO:2),SUM
                         LINE,AT(0,208,7708,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(0,313),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(3583,313),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(6771,313),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(240,469,7750,10521),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
Open                   PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

!Comienzo Codigo CW Templates
!------------------------------------------------------------------------------------------------------------
?Exportarword  EQUATE(-1025)

QHList QUEUE,PRE(QHL)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
TextColor             SHORT
TextBack             SHORT
TextFont               STRING(20)
TextFontSize      SHORT
FTextColor             SHORT
FTextBack             SHORT
FTextFont               STRING(20)
FTextFontSize      SHORT
                         END
Titulo                     STRING(100)
QPAR QUEUE,PRE(Q)
FieldPar                 CSTRING(200)
                         END
evo::any     ANY
evo::envio   CSTRING(5000)
evo::path    CSTRING(5000)

Evo::Group  GROUP,PRE()
Evo::Aplication STRING(100)
Evo::Procedure STRING(100)
Evo::Html   BYTE
Evo::xls   BYTE
Evo::doc  BYTE
Evo::Ascii BYTE
Evo::xml   BYTE
Evo:typexport STRING(10)
   END


EVO:QDatos               QUEUE,PRE(QDat)
Col1                       CSTRING(100)
Col2                       CSTRING(100)
Col3                       CSTRING(100)
Col4                       CSTRING(100)
Col5                       CSTRING(100)
Col6                       CSTRING(100)
Col7                       CSTRING(100)
Col8                       CSTRING(100)
Col9                       CSTRING(100)
Col10                      CSTRING(100)
Col11                      CSTRING(100)
Col12                      CSTRING(100)
Col13                      CSTRING(100)
Col14                      CSTRING(100)
Col15                      CSTRING(100)
Col16                      CSTRING(100)
Col17                      CSTRING(100)
Col18                      CSTRING(100)
Col19                      CSTRING(100)
Col20                      CSTRING(100)
Col21                      CSTRING(100)
Col22                      CSTRING(100)
Col23                      CSTRING(100)
Col24                      CSTRING(100)
Col25                      CSTRING(100)
Col26                      CSTRING(100)
Col27                      CSTRING(100)
Col28                      CSTRING(100)
Col29                      CSTRING(100)
Col30                      CSTRING(100)
Col31                      CSTRING(100)
Col32                      CSTRING(100)
Col33                      CSTRING(100)
Col34                      CSTRING(100)
Col35                      CSTRING(100)
Col36                      CSTRING(100)
Col37                      CSTRING(100)
Col38                      CSTRING(100)
Col39                      CSTRING(100)
Col40                      CSTRING(100)
Col41                      CSTRING(100)
Col42                      CSTRING(100)
Col43                      CSTRING(100)
Col44                      CSTRING(100)
Col45                      CSTRING(100)
Col46                      CSTRING(100)
Col47                      CSTRING(100)
Col48                      CSTRING(100)
Col49                      CSTRING(100)
Col50                      CSTRING(100)
 END
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
QCargaExport ROUTINE
!Comienzo Codigo CW Templates
!------------------------------------------------------------------------------------------------------------
             Evo::Any &= WHAT(EVO:QDatos,1)
             Evo::Any  = FECHA_HASTA
             Evo::Any &= WHAT(EVO:QDatos,2)
             Evo::Any  = FECHA_DESDE
             Evo::Any &= WHAT(EVO:QDatos,3)
             Evo::Any  = PRO2:DESCRIPCION
             Evo::Any &= WHAT(EVO:QDatos,4)
             Evo::Any  = GAS:MONTO
             Evo::Any &= WHAT(EVO:QDatos,5)
             Evo::Any  = GAS:LETRA
             Evo::Any &= WHAT(EVO:QDatos,6)
             Evo::Any  = GAS:FECHA
             Evo::Any &= WHAT(EVO:QDatos,7)
             Evo::Any  = GAS:SUCURSAL
             Evo::Any &= WHAT(EVO:QDatos,8)
             Evo::Any  = GAS:IDRECIBO
             Evo::Any &= WHAT(EVO:QDatos,9)
             Evo::Any  = TIPCOM:DESCRIPCION
             Evo::Any &= WHAT(EVO:QDatos,10)
             Evo::Any  = GAS:OBSERVACION
             Evo::Any &= WHAT(EVO:QDatos,11)
             Evo::Any  = GAS:MONTO
        ADD(EVO:QDatos)
        ASSERT (NOT ErrorCode())
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------
CargaParametros ROUTINE
        FREE(QHList)
           QHL:Id      = 1
           QHL:Nombre  = 'FECHA_HASTA'
           QHL:Longitud= 100
           QHL:Pict    = '@d6'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 2
           QHL:Nombre  = 'FECHA_DESDE'
           QHL:Longitud= 100
           QHL:Pict    = '@d6'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 3
           QHL:Nombre  = 'DESCRIPCION'
           QHL:Longitud= 100
           QHL:Pict    = '@s50'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 4
           QHL:Nombre  = 'MONTO'
           QHL:Longitud= 100
           QHL:Pict    = '@n-13.2'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 5
           QHL:Nombre  = ''
           QHL:Longitud= 100
           QHL:Pict    = ''
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 6
           QHL:Nombre  = 'FECHA'
           QHL:Longitud= 100
           QHL:Pict    = '@d17'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 7
           QHL:Nombre  = 'SUCURSAL'
           QHL:Longitud= 100
           QHL:Pict    = '@n-14'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 8
           QHL:Nombre  = 'IDRECIBO'
           QHL:Longitud= 100
           QHL:Pict    = '@n-14'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 9
           QHL:Nombre  = ''
           QHL:Longitud= 100
           QHL:Pict    = ''
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 10
           QHL:Nombre  = 'OBSERVACION'
           QHL:Longitud= 100
           QHL:Pict    = '@s50'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 11
           QHL:Nombre  = 'MONTO'
           QHL:Longitud= 100
           QHL:Pict    = '@n-13.2'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        FREE(QPar)
        Q:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,'
        ADD(QPar)!.1.
        Q:FieldPar  = ';'
        ADD(QPar)!.2.
        Q:FieldPar  = 'Spanish'
        ADD(QPar)!.3.
        Q:FieldPar  = ''
        ADD(QPar)!.4.
        Q:FieldPar  = true
        ADD(QPar)!.5.
        Q:FieldPar  = ''
        ADD(QPar)!.6.
        Q:FieldPar  = 11
        ADD(QPar)!.7.
        Q:FieldPar  = 'FREE'
        ADD(QPar)   !.8.
        Titulo = 'Recibos Emitidos '
        Q:FieldPar  = 'REPORT'
        ADD(QPar)   !.9.
        Q:FieldPar  = 1 !Order
         ADD(QPar)   !.10
         Q:FieldPar  = 0
         ADD(QPar)   !.11
         Q:FieldPar  = '1'
         ADD(QPar)   !.12

         Q:FieldPar  = ''
         ADD(QPar)   !.13

         Q:FieldPar  = ''
         ADD(QPar)   !.14

         Q:FieldPar  = ''
         ADD(QPar)   !.15

         Q:FieldPar  = '16'
        ADD(QPar)   !.16

        Q:FieldPar  =  1
        ADD(QPar)   !.17.
        Q:FieldPar  =  2
        ADD(QPar)   !.18.
        Q:FieldPar  =  '2'
        ADD(QPar)   !.19.
        Q:FieldPar  =  12
        ADD(QPar)   !.20.
        Q:FieldPar  = 0 !Exporta a excel sin borrar
        ADD(QPar)     !.21
        Q:FieldPar  = 0         !Nro Pag. Desde Report (BExp)
        ADD(QPar)     !.22
        Q:FieldPar  = 0
        ADD(QPar)     !.23 Caracteres Encoding para xml
        Q:FieldPar  = 1
        ADD(QPar)      !24
        Q:FieldPar  = '13021968'
        ADD(QPar)     !.25
  !---------------------------------------------------------------------------------------------
!!Registration 
        Q:FieldPar  = ' ReportExport'
        ADD(QPar)   ! 26  
        Q:FieldPar  =  ' '
        ADD(QPar)   ! 27  
        Q:FieldPar  =  ' ' 
        ADD(QPar)   ! 28  
        Q:FieldPar  =  'REXPORT' 
        ADD(QPar)   ! 29 Gestion036.clw
        
        !.30 en adelante
      ! 30 en adelante

!!! Parametros Grupo
        Evo::Aplication          = 'Gestion'
        Evo::Procedure          = GlobalErrors.GetProcedureName()& 7
        Evo::Html   = 0
        Evo::xls   = 1
        Evo::doc   = 1
        Evo::xml   = 0
        Evo::Ascii   = 0
        Evo:typexport = 'All'


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_RECIBOS_EMITIDOS21')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_RECIBOS_EMITIDOS21',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:GASTOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GAS:FECHA)
  ThisReport.AddSortOrder(GAS:IDX_GASTOS_FECHA)
  ThisReport.AddRange(GAS:FECHA,FECHA_DESDE,FECHA_HASTA)
  ThisReport.AppendOrder('GAS:SUCURSAL,GAS:IDRECIBO')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:GASTOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
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
    INIMgr.Update('IMPRIMIR_RECIBOS_EMITIDOS21',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagName,'FECHA_HASTA')
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagName,'FECHA_DESDE')
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'PRO2:DESCRIPCION')
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagName,'GAS:MONTO')
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:LETRA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:LETRA,RepGen:XML,TargetAttr:TagName,'GAS:LETRA')
  SELF.Attribute.Set(?GAS:LETRA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagName,'GAS:FECHA')
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:SUCURSAL,RepGen:XML,TargetAttr:TagName,'GAS:SUCURSAL')
  SELF.Attribute.Set(?GAS:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:IDRECIBO,RepGen:XML,TargetAttr:TagName,'GAS:IDRECIBO')
  SELF.Attribute.Set(?GAS:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIPCOM:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIPCOM:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIPCOM:DESCRIPCION')
  SELF.Attribute.Set(?TIPCOM:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagName,'GAS:OBSERVACION')
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:MONTO:2,RepGen:XML,TargetAttr:TagName,'GAS:MONTO:2')
  SELF.Attribute.Set(?GAS:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
   Do QCargaExport
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  !Comienzo Codigo CW Templates
  !------------------------------------------------------------------------------------------------------------
    CREATE(?Exportarword,CREATE:Item)
    ?Exportarword{PROP:Use} = LASTFIELD()+300
    ?Exportarword{PROP:Text} = 'Exportacion'
    UNHIDE(?Exportarword)
  !Fin Codigo  CW Templates
  !------------------------------------------------------------------------------------------------------------


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  CASE EVENT()
    OF EVENT:Accepted
      CASE FIELD()
        OF ?Exportarword
  !Comienzo Codigo CW Templates
  !------------------------------------------------------------------------------------------------------------
          Do CargaParametros
              evo::path  = PATH()
              EcRptExport(QHList,EVO:QDatos,QPar,0,Titulo,Evo::Group)
              SETPATH(evo::path)
      END!CASE
  END!CASE
  RETURN Level:Benign
  !Fin Codigo  CW Templates
  !------------------------------------------------------------------------------------------------------------
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_RECIBOS_EMITIDOS2','IMPRIMIR_RECIBOS_EMITIDOS2','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
OPA_EMITIDOS_WINDOWS PROCEDURE 

Window               WINDOW('LISTADO DE OPA EMITIDOS'),AT(,,256,90),FONT('MS Sans Serif',8,,FONT:regular),CENTER, |
  GRAY
                       PROMPT('FECHA DESDE:'),AT(12,8),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(67,8,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(134,9),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(190,9,60,10),USE(FECHA_HASTA),RIGHT(1)
                       BUTTON('Imprimir '),AT(99,36,58,22),USE(?Button2),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&SALIR'),AT(103,62,58,22),USE(?CancelButton),LEFT,ICON('SALIR.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('OPA_EMITIDOS_WINDOWS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SQL.Open                                          ! File SQL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('OPA_EMITIDOS_WINDOWS',Window)              ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
    Relate:SQL.Close
  END
  IF SELF.Opened
    INIMgr.Update('OPA_EMITIDOS_WINDOWS',Window)           ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button2
      ThisWindow.Update()
      START(IMPRIMIR_RECIBOS_EMITIDOS21, 25000)
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

