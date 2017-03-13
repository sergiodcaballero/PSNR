

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION329.INC'),ONCE        !Local module procedure declarations
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de FACTURA_CONVENIO
!!! </summary>
Cuotas_canceladas PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD         LONG                                  ! 
LOC:TOTAL            REAL                                  ! 
BRW1::View:Browse    VIEW(FACTURA_CONVENIO)
                       PROJECT(FACXCONV:IDCONVENIO)
                       PROJECT(FACXCONV:IDFACTURA)
                       JOIN(CON4:PK_CONVENIO,FACXCONV:IDCONVENIO)
                         PROJECT(CON4:FECHA)
                         PROJECT(CON4:IDSOLICITUD)
                       END
                       JOIN(FAC:PK_FACTURA,FACXCONV:IDFACTURA)
                         PROJECT(FAC:MES)
                         PROJECT(FAC:ANO)
                         PROJECT(FAC:TOTAL)
                         PROJECT(FAC:IDFACTURA)
                         PROJECT(FAC:IDSOCIO)
                         JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
                           PROJECT(SOC:MATRICULA)
                           PROJECT(SOC:NOMBRE)
                           PROJECT(SOC:IDSOCIO)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FACXCONV:IDCONVENIO    LIKE(FACXCONV:IDCONVENIO)      !List box control field - type derived from field
CON4:FECHA             LIKE(CON4:FECHA)               !List box control field - type derived from field
FACXCONV:IDFACTURA     LIKE(FACXCONV:IDFACTURA)       !List box control field - type derived from field
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !Related join file key field - type derived from field
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de FACTURA_CONVENIO'),AT(,,340,207),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Cuotas_canceladas'),SYSTEM
                       LIST,AT(8,30,322,121),USE(?Browse:1),HVSCROLL,FORMAT('49L(2)|M~MATRICULA~C(0)@n-5@166L(' & |
  '2)|M~NOMBRE~C(0)@s40@29L(2)|M~MES~C(0)@n-3@25L(2)|M~AÑO~C(0)@n-5@52L(1)|M~TOTAL~C(0)' & |
  '@n$-12.2@35L(2)|M~Nº CONV~C(0)@n-7@40L(2)|M~FECHA CON~C(0)@d17@64L(2)|M~IDFACTURA~C(0)@n-7@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de FACTURA_CONVENIO')
                       BUTTON('E&xportar'),AT(6,191,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,331,186),USE(?CurrentTab)
                         TAB('CONVENIO'),USE(?Tab:2)
                           PROMPT('CANTIDAD:'),AT(11,159),USE(?LOC:CANTIDAD:Prompt)
                           ENTRY(@n-14),AT(61,158,60,10),USE(LOC:CANTIDAD),RIGHT(1),DISABLE,TRN
                           PROMPT('TOTAL:'),AT(12,173),USE(?LOC:TOTAL:Prompt)
                           ENTRY(@n$-12.2),AT(62,172,60,10),USE(LOC:TOTAL),DISABLE,TRN
                         END
                       END
                       BUTTON('&Salir'),AT(162,191,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  ADD(QPar5)   ! 29 Gestion329.clw
 !!!!!
 
 
  FREE(QPar25)
       Qp25:F2N  = 'MATRICULA'
  Qp25:F2P  = '@n-5'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'NOMBRE'
  Qp25:F2P  = '@s40'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'MES'
  Qp25:F2P  = '@n-3'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'AÑO'
  Qp25:F2P  = '@n-5'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'TOTAL'
  Qp25:F2P  = '@n$-12.2'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'IDCONV'
  Qp25:F2P  = '@n-7'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'FECHA CON'
  Qp25:F2P  = '@d17'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'IDFACTURA'
  Qp25:F2P  = '@n-7'
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
  Loc::Titulo5 ='Facturas con Convenio'
 
 SavPath5 = PATH()
  Exportar(Loc::QHlist5,BRW1.Q,QPar5,0,Loc::Titulo5,Evo::Group5)
 IF Not EC::LoadI_5 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath5)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Cuotas_canceladas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
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
  Relate:FACTURA_CONVENIO.Open                             ! File FACTURA_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:FACTURA_CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,FACXCONV:PK_FACTURA_CONVENIO)         ! Add the sort order for FACXCONV:PK_FACTURA_CONVENIO for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,FACXCONV:IDFACTURA,,BRW1)      ! Initialize the browse locator using  using key: FACXCONV:PK_FACTURA_CONVENIO , FACXCONV:IDFACTURA
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:TOTAL,BRW1.Q.FAC:TOTAL)                ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(FACXCONV:IDCONVENIO,BRW1.Q.FACXCONV:IDCONVENIO) ! Field FACXCONV:IDCONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(CON4:FECHA,BRW1.Q.CON4:FECHA)              ! Field CON4:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(FACXCONV:IDFACTURA,BRW1.Q.FACXCONV:IDFACTURA) ! Field FACXCONV:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cuotas_canceladas',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:FACTURA_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cuotas_canceladas',QuickWindow)         ! Save window data to non-volatile store
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

LOC:CANTIDAD:Cnt     LONG                                  ! Count variable for browse totals
LOC:TOTAL:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:FACTURA_CONVENIO.SetQuickScan(1)
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
    LOC:CANTIDAD:Cnt += 1
    LOC:TOTAL:Sum += FAC:TOTAL
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD = LOC:CANTIDAD:Cnt
  LOC:TOTAL = LOC:TOTAL:Sum
  PARENT.ResetFromView
  Relate:FACTURA_CONVENIO.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

