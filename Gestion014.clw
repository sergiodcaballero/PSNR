

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION014.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION015.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
LIQUIDACION_GENERAR_CONTROL_CBU PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(LIQUIDACION)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('LIQUIDACION_GENERAR_CONTROL_CBU')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo:IDOS',Glo:IDOS)                                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LIQUIDACION_GENERAR_CONTROL_CBU',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LIQ:PERIODO)
  ThisProcess.AddSortOrder(LIQ:IDX_LIQUIDACION_PERIODO)
  ThisProcess.AddRange(LIQ:PERIODO,GLO:PERIODO)
  ThisProcess.SetFilter('LIQ:IDOS=  Glo:IDOS  AND LIQ:COBRADO = ''SI'' AND LIQ:PAGADO = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(LIQUIDACION,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_GENERAR_CONTROL_CBU',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  IF GLO:ESTADO = 'ERROR'THEN
      IMPRIMIR_RANKING
  ELSE
      GLO:PRIMERA = ''
      GLO:MONTO = 0
      GENERAR_DISKETTE_3
  END
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  SOC:IDSOCIO = LIQ:IDSOCIO
  ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
  IF SOC:CBU = 0 THEN
      RAN:C1   = SOC:IDSOCIO
      RAN:C2   = SOC:NOMBRE
      RAN:C3   = 'NO POSEE CBU'
      GLO:ESTADO = 'ERROR'
      ACCESS:RANKING.INSERT()
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
GENERAR_DISKETTE_3 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:DNI              STRING(13)                            ! 
LOC:NOMBRE           STRING(30)                            ! 
H1                   STRING(159)                           ! 
H2                   STRING(139)                           ! 
H3                   STRING(20)                            ! 
Process:View         VIEW(LIQUIDACION)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('GENERAR_DISKETTE_3')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo:IDOS',Glo:IDOS)                                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACIONXSOCIO.Open                            ! File LIQUIDACIONXSOCIO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION_DISKETTE.Open                         ! File LIQUIDACION_DISKETTE used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GENERAR_DISKETTE_3',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LIQ:PERIODO)
  ThisProcess.AddSortOrder(LIQ:IDX_LIQUIDACION_PERIODO)
  ThisProcess.AddRange(LIQ:PERIODO,GLO:PERIODO)
  ThisProcess.SetFilter('LIQ:IDOS=  Glo:IDOS  AND LIQ:COBRADO = ''SI'' AND LIQ:PAGADO = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}='GENERANDO DISKETTE'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(LIQUIDACION,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FONDOS.Close
    Relate:LIBDIARIO.Close
    Relate:LIQUIDACION.Close
    Relate:LIQUIDACIONXSOCIO.Close
    Relate:LIQUIDACION_DISKETTE.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_DISKETTE_3',ProgressWindow)     ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  CAM" = PATH()
  MESSAGE('EL PROCESO SE HA REALIZADO CORRECTAMENTE | EL ARCHIVO GENERADO SE ENCUENTRA | '&CAM")
  
  
  !!! DESCONTAR DE LA CUENTA BANCO LA TRANSACCIÓN ....
  ! BANCO - $ TOTAL
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF GLO:PRIMERA = '' THEN !! SOLO CARGA LA CABECERA LA 1º VEZ
      DIA# = DAY(FECHA_DESDE)
      DIA1# = FORMAT(DIA#,@N02)
      MES# = MONTH(FECHA_DESDE)
  
      IF GLO:TIPO = 'N' THEN
          GLO:TIPO='0'
      ELSE
          GLO:TIPO ='1'
      END
      !! CARGO CABECERA
      MAC:COLUMNA = '02'&ALL('',159)
      ACCESS:LIQUIDACION_DISKETTE.INSERT()
      !CARGO HEADER 2
      MAC:COLUMNA = '1'&GLO:CODIGO_BANCO&GLO:SUBEMPRESA&DIA1#&FORMAT(MES#,@N02)&'01'&GLO:TIPO&'00000S'&ALL('',139)
      ACCESS:LIQUIDACION_DISKETTE.INSERT()
      GLO:PRIMERA = 'NO'
  END
  SOC:IDSOCIO = LIQ:IDSOCIO
  ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
  CBU" = SOC:CBU
  LOC:DNI = SOC:N_DOCUMENTO
  LOC:NOMBRE = SOC:NOMBRE
  !FECHAP1# =  FECHA_DESDE -1
  !FECHAP# = FORMAT(FECHAP1# ,@D12)!!! agregado el 30/03/2010
  FECHAP# = FORMAT(FECHA_DESDE,@D12)!!! agregado el 30/03/2010
  !message(FECHAP#)
  FECHALIQ# = FORMAT(TODAY(),@D12)
  !! CARGO HEADER 2
  MAC:COLUMNA = '2'&FORMAT(GLO:CODIGO_BANCO,@N03)&FORMAT(GLO:SUBEMPRESA,@N05)&FORMAT(LIQ:IDSOCIO,@N07)&'4'&'001'&SOC:CBU&' '&FECHAP#&FORMAT(LIQ:MONTO_TOTAL,@N011v2)&'S'&'01'&'  '&'00'&LOC:DNI&LOC:NOMBRE&'000000000000'&'          '&'00000'&FECHALIQ#&ALL('',21)
  GLO:MONTO = GLO:MONTO + LIQ:MONTO_TOTAL
  ACCESS:LIQUIDACION_DISKETTE.INSERT()
  
  !! PONER PAGADO EN LIQUIDACION
  LIQ:PAGADO  = 'SI'
  LIQ:FECHA_PAGO = today()
  PUT(LIQUIDACION)
  !!
  
  
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
LIQUIDACION_GENERAR_CONTROL_CBU_2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(LIQUIDACION)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('LIQUIDACION_GENERAR_CONTROL_CBU_2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo:IDOS',Glo:IDOS)                                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LIQUIDACION_GENERAR_CONTROL_CBU_2',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LIQ:PERIODO)
  ThisProcess.AddSortOrder(LIQ:IDX_LIQUIDACION_PERIODO)
  ThisProcess.AddRange(LIQ:PERIODO,GLO:PERIODO)
  ThisProcess.SetFilter('LIQ:IDOS=  Glo:IDOS  AND LIQ:COBRADO = ''SI'' AND LIQ:PAGADO = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='SIMULACION'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(LIQUIDACION,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_GENERAR_CONTROL_CBU_2',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  IF GLO:ESTADO = 'ERROR'THEN
      IMPRIMIR_RANKING
  ELSE
      GLO:PRIMERA = ''
      GENERAR_DISKETTE_SIMULA
  END
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  SOC:IDSOCIO = LIQ:IDSOCIO
  ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
  IF SOC:CBU = 0 THEN
      RAN:C1   = SOC:IDSOCIO
      RAN:C2   = SOC:NOMBRE
      RAN:C3   = 'NO POSEE CBU'
      GLO:ESTADO = 'ERROR'
      ACCESS:RANKING.INSERT()
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
GENERAR_DISKETTE_SIMULA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:DNI              STRING(13)                            ! 
LOC:NOMBRE           STRING(30)                            ! 
H1                   STRING(159)                           ! 
H2                   STRING(139)                           ! 
H3                   STRING(20)                            ! 
Process:View         VIEW(LIQUIDACION)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('GENERAR_DISKETTE_SIMULA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo:IDOS',Glo:IDOS)                                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACIONXSOCIO.Open                            ! File LIQUIDACIONXSOCIO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION_DISKETTE.Open                         ! File LIQUIDACION_DISKETTE used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GENERAR_DISKETTE_SIMULA',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LIQ:PERIODO)
  ThisProcess.AddSortOrder(LIQ:IDX_LIQUIDACION_PERIODO)
  ThisProcess.AddRange(LIQ:PERIODO,GLO:PERIODO)
  ThisProcess.SetFilter('LIQ:IDOS=  Glo:IDOS  AND LIQ:COBRADO = ''SI'' AND LIQ:PAGADO = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='Genera Simulador'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(LIQUIDACION,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
    Relate:LIQUIDACIONXSOCIO.Close
    Relate:LIQUIDACION_DISKETTE.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_DISKETTE_SIMULA',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  CAM" = PATH()
  MESSAGE('SE HA REALIZADO LA SIMULACION CORRECTAMENTE | EL ARCHIVO GENERADO SE ENCUENTRA EN -->'&CAM")
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF GLO:PRIMERA = '' THEN !! SOLO CARGA LA CABECERA LA 1º VEZ
      DIA# = DAY(FECHA_DESDE)
      DIA1# = FORMAT(DIA#,@N02)
      MES# = MONTH(FECHA_DESDE)
  
      IF GLO:TIPO = 'N' THEN
          GLO:TIPO='0'
      ELSE
          GLO:TIPO ='1'
      END
      !! CARGO CABECERA
      MAC:COLUMNA = '02'&'SIMULACION'
      ACCESS:LIQUIDACION_DISKETTE.INSERT()
      !CARGO HEADER 2
      MAC:COLUMNA = '1'&GLO:CODIGO_BANCO&GLO:SUBEMPRESA&DIA1#&FORMAT(MES#,@N02)&'01'&GLO:TIPO&'00000S'&ALL('*',139)
      ACCESS:LIQUIDACION_DISKETTE.INSERT()
      GLO:PRIMERA = 'NO'
  END
  SOC:IDSOCIO = LIQ:IDSOCIO
  ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
  CBU" = SOC:CBU
  LOC:DNI = SOC:N_DOCUMENTO
  LOC:NOMBRE = SOC:NOMBRE
  FECHAP# = FORMAT(FECHA_DESDE,@D12)
  FECHALIQ# = FORMAT(TODAY(),@D12)
  !! CARGO HEADER 2
  MAC:COLUMNA = '2'&FORMAT(GLO:CODIGO_BANCO,@N03)&FORMAT(GLO:SUBEMPRESA,@N05)&FORMAT(LIQ:IDSOCIO,@N07)&'4'&'001'&SOC:CBU&' '&FECHAP#&FORMAT(LIQ:MONTO_TOTAL,@N011v2)&'S'&'01'&'  '&'00'&LOC:DNI&LOC:NOMBRE&'000000000000'&'          '&'00000'&FECHALIQ#&ALL('*',21)
  ACCESS:LIQUIDACION_DISKETTE.INSERT()
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion LIQUIDACION
!!! </summary>
LIQUIDACION_COBRO_FORM PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::LIQ:Record  LIKE(LIQ:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion LIQUIDACION'),AT(,,245,199),FONT('Arial',8,,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('LIQUIDACION_COBRO_FORM'),SYSTEM
                       PROMPT('IDLIQUIDACION:'),AT(5,7),USE(?LIQ:IDLIQUIDACION:Prompt),TRN
                       ENTRY(@n-7),AT(68,7,40,10),USE(LIQ:IDLIQUIDACION),LEFT,DISABLE,REQ
                       PROMPT('IDSOCIO:'),AT(5,21),USE(?LIQ:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(68,21,41,10),USE(LIQ:IDSOCIO),DISABLE
                       STRING(@s30),AT(117,20),USE(SOC:NOMBRE)
                       PROMPT('IDOS:'),AT(5,35),USE(?LIQ:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(68,35,42,10),USE(LIQ:IDOS),DISABLE
                       STRING(@s30),AT(116,36),USE(OBR:NOMPRE_CORTO)
                       PROMPT('MES:'),AT(5,49),USE(?LIQ:MES:Prompt),TRN
                       SPIN(@n-14),AT(68,49,41,10),USE(LIQ:MES),DISABLE,RANGE(1,12)
                       PROMPT('ANO:'),AT(119,53),USE(?LIQ:ANO:Prompt),TRN
                       SPIN(@n-14),AT(139,51,41,10),USE(LIQ:ANO),DISABLE,RANGE(2009,2999)
                       LINE,AT(0,66,249,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('Monto Presentado a Cobro:'),AT(2,71),USE(?Prompt18)
                       STRING(@n$-12.2),AT(98,70),USE(LIQ:MONTO)
                       STRING(@n$-12.2),AT(86,136),USE(LIQ:MONTO_PAGADO,,?LIQ:MONTO_PAGADO:2)
                       PROMPT('Débito de la OS.:'),AT(2,86),USE(?LIQ:DEBITO:Prompt),TRN
                       ENTRY(@n$-10.2),AT(99,85,44,10),USE(LIQ:DEBITO),DECIMAL(14)
                       STRING(@n10.2),AT(205,148),USE(LIQ:COMISION,,?LIQ:COMISION:2)
                       STRING(@n$-10.2),AT(86,149),USE(LIQ:DEBITO_COMISION)
                       PROMPT('Débito por Comisión:'),AT(0,151),USE(?Prompt16)
                       PROMPT('% Comision'),AT(161,148),USE(?Prompt13)
                       PROMPT('Neto Total a Liquidado:'),AT(0,163),USE(?Prompt14),FONT(,12,,FONT:bold)
                       STRING(@n$-10.2),AT(111,162),USE(LIQ:MONTO_TOTAL),FONT(,12,,FONT:bold)
                       LINE,AT(0,178,240,0),USE(?Line4),COLOR(COLOR:Black)
                       BUTTON('Calcular Liquidación'),AT(60,108,117,24),USE(?Button3),LEFT,ICON('currency_dollar.ico'), |
  FLAT
                       LINE,AT(1,133,244,0),USE(?Line3),COLOR(COLOR:Black)
                       LINE,AT(0,104,245,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('Monto Pagado por la OS.'),AT(0,136),USE(?Prompt17)
                       BUTTON('&Aceptar'),AT(136,183,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(191,183,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  CASE SELF.Request
  OF ChangeRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & LIQ:IDLIQUIDACION & ')' ! Append status message to window title text
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LIQUIDACION_COBRO_FORM')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LIQ:IDLIQUIDACION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(LIQ:Record,History::LIQ:Record)
  SELF.AddHistoryField(?LIQ:IDLIQUIDACION,1)
  SELF.AddHistoryField(?LIQ:IDSOCIO,2)
  SELF.AddHistoryField(?LIQ:IDOS,3)
  SELF.AddHistoryField(?LIQ:MES,4)
  SELF.AddHistoryField(?LIQ:ANO,5)
  SELF.AddHistoryField(?LIQ:MONTO,8)
  SELF.AddHistoryField(?LIQ:MONTO_PAGADO:2,13)
  SELF.AddHistoryField(?LIQ:DEBITO,15)
  SELF.AddHistoryField(?LIQ:COMISION:2,16)
  SELF.AddHistoryField(?LIQ:DEBITO_COMISION,18)
  SELF.AddHistoryField(?LIQ:MONTO_TOTAL,21)
  SELF.AddUpdateFile(Access:LIQUIDACION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:FORMA_PAGO.Open                                   ! File FORMA_PAGO used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACIONXSOCIO.Open                            ! File LIQUIDACIONXSOCIO used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:LIQUIDACION
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?LIQ:IDLIQUIDACION{PROP:ReadOnly} = True
    ?LIQ:IDSOCIO{PROP:ReadOnly} = True
    ?LIQ:IDOS{PROP:ReadOnly} = True
    ?LIQ:MONTO{PROP:ReadOnly} = True
    ?LIQ:DEBITO{PROP:ReadOnly} = True
    ?LIQ:MONTO_TOTAL{PROP:ReadOnly} = True
    DISABLE(?Button3)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_COBRO_FORM',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
    Relate:CONF_EMP.Close
    Relate:CUENTAS.Close
    Relate:FACTURA.Close
    Relate:FONDOS.Close
    Relate:FORMA_PAGO.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:LIQUIDACION.Close
    Relate:LIQUIDACIONXSOCIO.Close
    Relate:OBRA_SOCIAL.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_COBRO_FORM',QuickWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  OBR:IDOS = LIQ:IDOS                                      ! Assign linking field value
  Access:OBRA_SOCIAL.Fetch(OBR:PK_OBRA_SOCIAL)
  SOC:IDSOCIO = LIQ:IDSOCIO                                ! Assign linking field value
  Access:SOCIOS.Fetch(SOC:PK_SOCIOS)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
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
      SelectOBRA_SOCIAL
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
    CASE ACCEPTED()
    OF ?Button3
      !!! BUSCO % DE LIQUIDACION EN TABLA
      COF:RAZON_SOCIAL = GLO:RAZON_SOCIAL
      ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
      LIQ:COMISION = COF:PORCENTAJE_LIQUIDACION
      COMISION$ = LIQ:COMISION / 100
      
      
      
      !!! CALCULO EL DEBITO POR LA CANTIDAD DE CUOTAS.- BUSCO EN FACUTRAS IMPAGAS LA CANTIDAD QUE SE CARGO Y LAS SUMO
      IF LIQ:CANTIDAD_CUOTAS_PAGADAS > 0 THEN
          I# = 0
          FAC:IDSOCIO = LIQ:IDSOCIO
          SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
          LOOP
              IF ACCESS:FACTURA.NEXT() THEN BREAK.
              IF FAC:IDSOCIO <> LIQ:IDSOCIO THEN BREAK.
              IF FAC:ESTADO = '' THEN
                  LIQ:DEBITO_PAGO_CUOTAS = LIQ:DEBITO_PAGO_CUOTAS + FAC:TOTAL
                  I# = I# +1
               END
               IF I# = LIQ:CANTIDAD_CUOTAS_PAGADAS THEN     
                  BREAK
               END
          END
      
          IF I# <> LIQ:CANTIDAD_CUOTAS_PAGADAS THEN
              MESSAGE('La cantidad de Cuotas a descontar es Mayor a la cantidad de Cuotas adeudadas | Se descuenta '&i#&' cuotas')
              LIQ:CANTIDAD_CUOTAS_PAGADAS = I# !! SI EL SOCIO NO POSEE LA CANTIDAD SE REEMPLAZA POR LA NUEVA
          end
      END
      
      !!!!!!
      
      LIQ:DEBITO_COMISION = LIQ:MONTO * COMISION$
      LIQ:MONTO_PAGADO =  LIQ:MONTO - (LIQ:DEBITO + LIQ:DEBITO_COMISION)
      LIQ:MONTO_TOTAL = LIQ:MONTO - (LIQ:DEBITO + LIQ:DEBITO_COMISION + LIQ:DEBITO_PAGO_CUOTAS) !! este ultimo no se ocupa en este caso. Se liquida en el total
      enable  (?OK)
      disable (?LIQ:DEBITO)
      disable (?Button3)
      THISWINDOW.RESET(1)
      
       
      
      
      
    OF ?OK
      LIQ:COBRADO = 'SI'
      LIQ:FECHA_COBRO = today()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LIQ:IDSOCIO
      SOC:IDSOCIO = LIQ:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          LIQ:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?LIQ:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION.TryValidateField(2)            ! Attempt to validate LIQ:IDSOCIO in LIQUIDACION
        SELECT(?LIQ:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:IDOS
      OBR:IDOS = LIQ:IDOS
      IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          LIQ:IDOS = OBR:IDOS
        ELSE
          SELECT(?LIQ:IDOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:LIQUIDACION.TryValidateField(3)            ! Attempt to validate LIQ:IDOS in LIQUIDACION
        SELECT(?LIQ:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:MES
      IF Access:LIQUIDACION.TryValidateField(4)            ! Attempt to validate LIQ:MES in LIQUIDACION
        SELECT(?LIQ:MES)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:MES
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:MES{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?LIQ:ANO
      IF Access:LIQUIDACION.TryValidateField(5)            ! Attempt to validate LIQ:ANO in LIQUIDACION
        SELECT(?LIQ:ANO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?LIQ:ANO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?LIQ:ANO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
  If  Self.Request=CHANGERecord AND SELF.RESPONSE = RequestCompleted Then
      !! CARGO LA LIQUIDACION EN EL TOTAL POR SOCIO
      LXSOC:IDSOCIO    = LIQ:IDSOCIO
      LXSOC:PERIODO    = LIQ:PERIODO
      GET(LIQUIDACIONXSOCIO,LXSOC:PK_LIQUIDACIONXSOCIO)
      IF ERRORCODE() = 35 THEN
          LXSOC:IDSOCIO           =  LIQ:IDSOCIO
          LXSOC:MES               =  LIQ:MES
          LXSOC:ANO               =  LIQ:ANO
          LXSOC:PERIODO           =  LIQ:PERIODO
          LXSOC:MONTO             =  LIQ:MONTO
          LXSOC:MONTO_PAGADO      =  LIQ:MONTO_PAGADO
          LXSOC:DEBITO            =  LIQ:DEBITO
          LXSOC:COMISION          =  LIQ:COMISION
          LXSOC:CANTIDAD          =  LIQ:CANTIDAD
          LXSOC:DEBITO_COMISION   =  LIQ:DEBITO_COMISION
          LXSOC:MONTO_TOTAL       =  LIQ:MONTO_TOTAL
          ACCESS:LIQUIDACIONXSOCIO.INSERT()
       ELSE
          LXSOC:MONTO             =  LIQ:MONTO  + LXSOC:MONTO
          LXSOC:MONTO_PAGADO      =  LIQ:MONTO_PAGADO  + LXSOC:MONTO_PAGADO
          LXSOC:DEBITO            =  LIQ:DEBITO        + LXSOC:DEBITO
          LXSOC:CANTIDAD          =  LIQ:CANTIDAD      + LXSOC:CANTIDAD
          LXSOC:DEBITO_COMISION   =  LIQ:DEBITO_COMISION + LXSOC:DEBITO_COMISION
          LXSOC:MONTO_TOTAL       =  LIQ:MONTO_TOTAL     +  LXSOC:MONTO_TOTAL
          ACCESS:LIQUIDACIONXSOCIO.update()
  
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the LIQUIDACION File
!!! </summary>
LIQUIDACION_COBRO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(LIQUIDACION)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:PRESENTADO)
                       PROJECT(LIQ:COBRADO)
                       PROJECT(LIQ:IDSOCIO)
                       PROJECT(LIQ:IDOS)
                       PROJECT(LIQ:PERIODO)
                       PROJECT(LIQ:TIPO_PERIODO)
                       PROJECT(LIQ:MONTO)
                       PROJECT(LIQ:DEBITO)
                       PROJECT(LIQ:COMISION)
                       PROJECT(LIQ:FECHA_CARGA)
                       PROJECT(LIQ:FECHA_PRESENTACION)
                       PROJECT(LIQ:FECHA_PAGO)
                       PROJECT(LIQ:PAGADO)
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMPRE_CORTO)
                         PROJECT(OBR:IDOS)
                       END
                       JOIN(SOC:PK_SOCIOS,LIQ:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LIQ:IDLIQUIDACION      LIKE(LIQ:IDLIQUIDACION)        !List box control field - type derived from field
LIQ:IDLIQUIDACION_Icon LONG                           !Entry's icon ID
LIQ:MES                LIKE(LIQ:MES)                  !List box control field - type derived from field
LIQ:ANO                LIKE(LIQ:ANO)                  !List box control field - type derived from field
LIQ:PRESENTADO         LIKE(LIQ:PRESENTADO)           !List box control field - type derived from field
LIQ:COBRADO            LIKE(LIQ:COBRADO)              !List box control field - type derived from field
LIQ:IDSOCIO            LIKE(LIQ:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
LIQ:IDOS               LIKE(LIQ:IDOS)                 !List box control field - type derived from field
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
LIQ:PERIODO            LIKE(LIQ:PERIODO)              !List box control field - type derived from field
LIQ:TIPO_PERIODO       LIKE(LIQ:TIPO_PERIODO)         !List box control field - type derived from field
LIQ:MONTO              LIKE(LIQ:MONTO)                !List box control field - type derived from field
LIQ:DEBITO             LIKE(LIQ:DEBITO)               !List box control field - type derived from field
LIQ:COMISION           LIKE(LIQ:COMISION)             !List box control field - type derived from field
LIQ:FECHA_CARGA        LIKE(LIQ:FECHA_CARGA)          !List box control field - type derived from field
LIQ:FECHA_PRESENTACION LIKE(LIQ:FECHA_PRESENTACION)   !List box control field - type derived from field
LIQ:FECHA_PAGO         LIKE(LIQ:FECHA_PAGO)           !List box control field - type derived from field
LIQ:PAGADO             LIKE(LIQ:PAGADO)               !List box control field - type derived from field
OBR:IDOS               LIKE(OBR:IDOS)                 !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('CARGA DE LIQUIDACION'),AT(,,521,329),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('CARGA_LIQUIDACION'),SYSTEM
                       LIST,AT(8,42,503,239),USE(?Browse:1),HVSCROLL,FORMAT('46L(2)|MI~ID~C(0)@n-7@23L(2)|M~ME' & |
  'S~C(0)@n-3@27L(2)|M~AÑO~C(0)@n-5@55L|M~PRESENTADO~C@s2@64L|M~COBRADO~@s2@[46L(2)|M~I' & |
  'DSOCIO~C(0)@n-7@49L(2)|M~MATRICULA~C(0)@n-5@120L(2)|M~NOMBRE~C(0)@s30@]|M~Colegiado~' & |
  '[20L(2)|M~IDOS~C(0)@n-3@120R(2)|M~NOMPRE CORTO~C(0)@s30@]|M~OBRA SOCIAL~32L(2)|M~PER' & |
  'IODO~@s6@80L(2)|M~TIPO PERIODO~@s30@[54L(1)|M~PRESENTADO~@n$-10.2@46L(1)|M~DEBITO~L(' & |
  '0)@n$-10.2@40L(1)|M~COMISION COL~L(0)@n$-10.2@](156)|M~MONTOS~[62L(2)|M~FECHA CARGA~' & |
  'C(0)@d17@93L(2)|M~FECHA PRESENTACION~C(0)@d17@40L(2)|M~FECHA PAGO~C(0)@d17@](222)|M~' & |
  'FECHAS~8R(2)|M~PAGADO~C(0)@s2@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de LIQUIDACION')
                       BUTTON('&Elegir'),AT(253,288,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(306,288,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Cargar el Cobro'),AT(369,288,92,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('E&xportar'),AT(56,310,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(5,310,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       SHEET,AT(4,4,515,302),USE(?CurrentTab)
                         TAB('Pendientes de Cobro'),USE(?Tab:1)
                         END
                         TAB('Por Colegiado'),USE(?Tab:2)
                         END
                         TAB('Por Obra Social'),USE(?Tab:3)
                         END
                         TAB('Por Periodo'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Salir'),AT(473,315,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
QBE9                 QueryFormClass                        ! QBE List Class. 
QBV9                 QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  Q8:FieldPar  = '1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,'
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
  ADD(QPar8)   ! 29 Gestion014.clw
 !!!!!
 
 
  FREE(QPar28)
       Qp28:F2N  = 'ID'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MES'
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'ANO'
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PRESENTADO'
  Qp28:F2P  = '@s2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'COBRADO'
  Qp28:F2P  = '@s2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDSOCIO'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MATRICULA'
  Qp28:F2P  = '@n-5'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'NOMBRE'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDOS'
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'NOMPRE CORTO'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PERIODO'
  Qp28:F2P  = '@s6'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'TIPO PERIODO'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MONTO'
  Qp28:F2P  = '@n-7.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'DEBITO'
  Qp28:F2P  = '@n10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'COMISION COL'
  Qp28:F2P  = '@n10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA CARGA'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA PRESENTACION'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA PAGO'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'PAGADO'
  Qp28:F2P  = '@s2'
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
  Loc::Titulo8 ='Administrator the LIQUIDACION'
 
 SavPath8 = PATH()
  Exportar(Loc::QHlist8,BRW1.Q,QPar8,0,Loc::Titulo8,Evo::Group8)
 IF Not EC::LoadI_8 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath8)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LIQUIDACION_COBRO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('LIQ:TIPO_PERIODO',LIQ:TIPO_PERIODO)                ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_CARGA',LIQ:FECHA_CARGA)                  ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_PRESENTACION',LIQ:FECHA_PRESENTACION)    ! Added by: BrowseBox(ABC)
  BIND('LIQ:FECHA_PAGO',LIQ:FECHA_PAGO)                    ! Added by: BrowseBox(ABC)
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LIQUIDACION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE9.Init(QBV9, INIMgr,'CARGA_LIQUIDACION', GlobalErrors)
  QBE9.QkSupport = True
  QBE9.QkMenuIcon = 'QkQBE.ico'
  QBE9.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,LIQ:FK_LIQUIDACION_SOCIO)             ! Add the sort order for LIQ:FK_LIQUIDACION_SOCIO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,LIQ:IDSOCIO,,BRW1)             ! Initialize the browse locator using  using key: LIQ:FK_LIQUIDACION_SOCIO , LIQ:IDSOCIO
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:PAGADO = ''NO'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:FK_LIQUIDACION_OS)                ! Add the sort order for LIQ:FK_LIQUIDACION_OS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,LIQ:IDOS,,BRW1)                ! Initialize the browse locator using  using key: LIQ:FK_LIQUIDACION_OS , LIQ:IDOS
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:PAGADO = ''NO'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:IDX_LIQUIDACION_PERIODO)          ! Add the sort order for LIQ:IDX_LIQUIDACION_PERIODO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,LIQ:PERIODO,,BRW1)             ! Initialize the browse locator using  using key: LIQ:IDX_LIQUIDACION_PERIODO , LIQ:PERIODO
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:PAGADO = ''NO'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,LIQ:PK_LIQUIDACION)                   ! Add the sort order for LIQ:PK_LIQUIDACION for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,LIQ:IDLIQUIDACION,,BRW1)       ! Initialize the browse locator using  using key: LIQ:PK_LIQUIDACION , LIQ:IDLIQUIDACION
  BRW1.SetFilter('(LIQ:PRESENTADO = ''SI''  AND LIQ:COBRADO = ''NO'')') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~Aceptar.ICO'
  ?Browse:1{PROP:IconList,2} = '~POSTED2.ICO'
  BRW1.AddField(LIQ:IDLIQUIDACION,BRW1.Q.LIQ:IDLIQUIDACION) ! Field LIQ:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:MES,BRW1.Q.LIQ:MES)                    ! Field LIQ:MES is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:ANO,BRW1.Q.LIQ:ANO)                    ! Field LIQ:ANO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PRESENTADO,BRW1.Q.LIQ:PRESENTADO)      ! Field LIQ:PRESENTADO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:COBRADO,BRW1.Q.LIQ:COBRADO)            ! Field LIQ:COBRADO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:IDSOCIO,BRW1.Q.LIQ:IDSOCIO)            ! Field LIQ:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:IDOS,BRW1.Q.LIQ:IDOS)                  ! Field LIQ:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMPRE_CORTO,BRW1.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PERIODO,BRW1.Q.LIQ:PERIODO)            ! Field LIQ:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:TIPO_PERIODO,BRW1.Q.LIQ:TIPO_PERIODO)  ! Field LIQ:TIPO_PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:MONTO,BRW1.Q.LIQ:MONTO)                ! Field LIQ:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:DEBITO,BRW1.Q.LIQ:DEBITO)              ! Field LIQ:DEBITO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:COMISION,BRW1.Q.LIQ:COMISION)          ! Field LIQ:COMISION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_CARGA,BRW1.Q.LIQ:FECHA_CARGA)    ! Field LIQ:FECHA_CARGA is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_PRESENTACION,BRW1.Q.LIQ:FECHA_PRESENTACION) ! Field LIQ:FECHA_PRESENTACION is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:FECHA_PAGO,BRW1.Q.LIQ:FECHA_PAGO)      ! Field LIQ:FECHA_PAGO is a hot field or requires assignment from browse
  BRW1.AddField(LIQ:PAGADO,BRW1.Q.LIQ:PAGADO)              ! Field LIQ:PAGADO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:IDOS,BRW1.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_COBRO',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE9,1)
  BRW1.AskProcedure = 1                                    ! Will call: LIQUIDACION_COBRO_FORM
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
    Relate:LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_COBRO',QuickWindow)         ! Save window data to non-volatile store
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
    LIQUIDACION_COBRO_FORM
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.ChangeControl=?Change:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (LIQ:PRESENTADO = 'SI' AND LIQ:PAGADO = '')
    SELF.Q.LIQ:IDLIQUIDACION_Icon = 1                      ! Set icon from icon list
  ELSIF (LIQ:PRESENTADO = 'SI' AND LIQ:PAGADO = 'SI')
    SELF.Q.LIQ:IDLIQUIDACION_Icon = 2                      ! Set icon from icon list
  ELSE
    SELF.Q.LIQ:IDLIQUIDACION_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion OBRA_SOCIAL
!!! </summary>
UpdateOBRA_SOCIAL PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::OBR:Record  LIKE(OBR:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion OBRA SOCIAL'),AT(,,271,190),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateOBRA_SOCIAL'),SYSTEM
                       ENTRY(@s100),AT(58,4,204,10),USE(OBR:NOMBRE),UPR
                       ENTRY(@s30),AT(68,18,124,10),USE(OBR:NOMPRE_CORTO),UPR
                       ENTRY(@s50),AT(58,32,204,10),USE(OBR:DIRECCION),UPR
                       ENTRY(@s30),AT(59,46,124,10),USE(OBR:TELEFONO)
                       ENTRY(@p##-########-##p),AT(59,60,64,10),USE(OBR:CUIT)
                       ENTRY(@s50),AT(58,74,204,10),USE(OBR:EMAIL)
                       ENTRY(@n-14),AT(59,88,51,10),USE(OBR:IDLOCALIDAD)
                       ENTRY(@s2),AT(88,102,40,10),USE(OBR:PRONTO_PAGO)
                       BUTTON('&Aceptar'),AT(172,170,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(220,170,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('NOMBRE:'),AT(3,4),USE(?OBR:NOMBRE:Prompt),TRN
                       PROMPT('NOMPRE CORTO:'),AT(3,18),USE(?OBR:NOMPRE_CORTO:Prompt),TRN
                       PROMPT('DIRECCION:'),AT(3,32),USE(?OBR:DIRECCION:Prompt),TRN
                       PROMPT('TELEFONO:'),AT(3,46),USE(?OBR:TELEFONO:Prompt),TRN
                       PROMPT('CUIT:'),AT(3,60),USE(?OBR:CUIT:Prompt),TRN
                       PROMPT('EMAIL:'),AT(3,74),USE(?OBR:EMAIL:Prompt),TRN
                       PROMPT('IDLOCALIDAD:'),AT(3,88),USE(?OBR:IDLOCALIDAD:Prompt),TRN
                       PROMPT('PRONTO PAGO (SI-NO):'),AT(4,102),USE(?OBR:PRONTO_PAGO:Prompt),TRN
                       LINE,AT(0,122,271,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('FECHA BAJA:'),AT(1,127),USE(?OBR:FECHA_BAJA:Prompt)
                       ENTRY(@d17),AT(51,126,70,10),USE(OBR:FECHA_BAJA)
                       BUTTON('...'),AT(112,86,12,12),USE(?CallLookup)
                       PROMPT('OBSERVACION:'),AT(1,146),USE(?OBR:OBSERVACION:Prompt)
                       ENTRY(@s101),AT(57,145,204,10),USE(OBR:OBSERVACION)
                       LINE,AT(1,165,269,0),USE(?Line2),COLOR(COLOR:Black)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOBRA_SOCIAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OBR:NOMBRE
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(OBR:Record,History::OBR:Record)
  SELF.AddHistoryField(?OBR:NOMBRE,2)
  SELF.AddHistoryField(?OBR:NOMPRE_CORTO,3)
  SELF.AddHistoryField(?OBR:DIRECCION,4)
  SELF.AddHistoryField(?OBR:TELEFONO,5)
  SELF.AddHistoryField(?OBR:CUIT,6)
  SELF.AddHistoryField(?OBR:EMAIL,7)
  SELF.AddHistoryField(?OBR:IDLOCALIDAD,8)
  SELF.AddHistoryField(?OBR:PRONTO_PAGO,9)
  SELF.AddHistoryField(?OBR:FECHA_BAJA,10)
  SELF.AddHistoryField(?OBR:OBSERVACION,11)
  SELF.AddUpdateFile(Access:OBRA_SOCIAL)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:OBRA_SOCIAL
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?OBR:NOMBRE{PROP:ReadOnly} = True
    ?OBR:NOMPRE_CORTO{PROP:ReadOnly} = True
    ?OBR:DIRECCION{PROP:ReadOnly} = True
    ?OBR:TELEFONO{PROP:ReadOnly} = True
    ?OBR:CUIT{PROP:ReadOnly} = True
    ?OBR:EMAIL{PROP:ReadOnly} = True
    ?OBR:IDLOCALIDAD{PROP:ReadOnly} = True
    ?OBR:PRONTO_PAGO{PROP:ReadOnly} = True
    ?OBR:FECHA_BAJA{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?OBR:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateOBRA_SOCIAL',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LOCALIDAD.Close
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOBRA_SOCIAL',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    SelectLOCALIDAD
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
    OF ?OBR:IDLOCALIDAD
      IF OBR:IDLOCALIDAD OR ?OBR:IDLOCALIDAD{PROP:Req}
        LOC:IDLOCALIDAD = OBR:IDLOCALIDAD
        IF Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            OBR:IDLOCALIDAD = LOC:IDLOCALIDAD
          ELSE
            SELECT(?OBR:IDLOCALIDAD)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CallLookup
      ThisWindow.Update()
      LOC:IDLOCALIDAD = OBR:IDLOCALIDAD
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        OBR:IDLOCALIDAD = LOC:IDLOCALIDAD
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the OBRA_SOCIAL File
!!! </summary>
ABM_OBRAS_SOCIALES PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(OBRA_SOCIAL)
                       PROJECT(OBR:IDOS)
                       PROJECT(OBR:NOMPRE_CORTO)
                       PROJECT(OBR:NOMBRE)
                       PROJECT(OBR:DIRECCION)
                       PROJECT(OBR:TELEFONO)
                       PROJECT(OBR:CUIT)
                       PROJECT(OBR:EMAIL)
                       PROJECT(OBR:PRONTO_PAGO)
                       PROJECT(OBR:FECHA_BAJA)
                       PROJECT(OBR:OBSERVACION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
OBR:IDOS               LIKE(OBR:IDOS)                 !List box control field - type derived from field
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
OBR:NOMBRE             LIKE(OBR:NOMBRE)               !List box control field - type derived from field
OBR:DIRECCION          LIKE(OBR:DIRECCION)            !List box control field - type derived from field
OBR:TELEFONO           LIKE(OBR:TELEFONO)             !List box control field - type derived from field
OBR:CUIT               LIKE(OBR:CUIT)                 !List box control field - type derived from field
OBR:EMAIL              LIKE(OBR:EMAIL)                !List box control field - type derived from field
OBR:PRONTO_PAGO        LIKE(OBR:PRONTO_PAGO)          !List box control field - type derived from field
OBR:FECHA_BAJA         LIKE(OBR:FECHA_BAJA)           !List box control field - type derived from field
OBR:OBSERVACION        LIKE(OBR:OBSERVACION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Archivo Obras Sociales'),AT(,,522,316),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ABM_OBRAS_SOCIALES'),SYSTEM
                       LIST,AT(7,39,499,202),USE(?Browse:1),HVSCROLL,FORMAT('36L(2)|M~IDOS~C(0)@n-7@80L(2)|M~S' & |
  'IGLAS~@s30@147L(2)|M~NOMBRE~@s50@80L(2)|M~DIRECCION~@s50@80L(2)|M~TELEFONO~@s30@64R(' & |
  '2)|M~CUIT~C(0)@n-14@80L(2)|M~EMAIL~@s50@48L(2)|M~PRONTO PAGO~@s2@40L(2)|M~FECHA BAJA' & |
  '~@d17@404L(2)|M~OBSERVACION~@s101@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de ' & |
  'OBRA_SOCIAL')
                       BUTTON('&Elegir'),AT(249,258,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(301,258,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(355,258,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(407,258,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(461,258,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('Nomenclador por Obra Social'),AT(256,282,124,14),USE(?Button9),LEFT,ICON(ICON:Copy), |
  FLAT
                       SHEET,AT(3,0,514,278),USE(?CurrentTab)
                         TAB('SIGLAS'),USE(?Tab:1)
                           PROMPT('NOMPRE CORTO:'),AT(9,20),USE(?NOMPRE_CORTO:Prompt)
                           ENTRY(@s30),AT(75,20,239,10),USE(OBR:NOMPRE_CORTO)
                         END
                         TAB('NOMBRE OS'),USE(?Tab:2)
                           PROMPT('NOMBRE:'),AT(7,18),USE(?NOMBRE:Prompt)
                           ENTRY(@s50),AT(44,17,239,10),USE(OBR:NOMBRE),UPR
                         END
                         TAB('Nº OS'),USE(?Tab:3)
                           PROMPT('IDOS:'),AT(6,21),USE(?IDOS:Prompt)
                           ENTRY(@n-14),AT(34,20,43,10),USE(OBR:IDOS),REQ
                         END
                       END
                       BUTTON('Planes por Obra Social'),AT(141,282,111,14),USE(?BrowseOS_PLANES),LEFT,ICON(ICON:Application), |
  FLAT,MSG('Ver Hijo'),TIP('Ver Hijio')
                       BUTTON('Socios por Obra Social'),AT(2,282,113,14),USE(?BrowseSOCIOSXOS),LEFT,ICON('SSEC_USR.ICO'), |
  FLAT,MSG('Ver Hijo'),TIP('Ver Hijio')
                       BUTTON('&Salir'),AT(473,297,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
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
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('ABM_OBRAS_SOCIALES')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('OBR:PRONTO_PAGO',OBR:PRONTO_PAGO)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:OBRA_SOCIAL,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,OBR:IDX_OBRA_SOCIAL_NOMBRE)           ! Add the sort order for OBR:IDX_OBRA_SOCIAL_NOMBRE for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,OBR:NOMBRE,,BRW1)              ! Initialize the browse locator using  using key: OBR:IDX_OBRA_SOCIAL_NOMBRE , OBR:NOMBRE
  BRW1.AddSortOrder(,OBR:PK_OBRA_SOCIAL)                   ! Add the sort order for OBR:PK_OBRA_SOCIAL for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,OBR:IDOS,,BRW1)                ! Initialize the browse locator using  using key: OBR:PK_OBRA_SOCIAL , OBR:IDOS
  BRW1.AddSortOrder(,OBR:IDX_OBRA_SOCIAL_NOM_CORTO)        ! Add the sort order for OBR:IDX_OBRA_SOCIAL_NOM_CORTO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,OBR:NOMPRE_CORTO,,BRW1)        ! Initialize the browse locator using  using key: OBR:IDX_OBRA_SOCIAL_NOM_CORTO , OBR:NOMPRE_CORTO
  BRW1.AddField(OBR:IDOS,BRW1.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMPRE_CORTO,BRW1.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMBRE,BRW1.Q.OBR:NOMBRE)              ! Field OBR:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(OBR:DIRECCION,BRW1.Q.OBR:DIRECCION)        ! Field OBR:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(OBR:TELEFONO,BRW1.Q.OBR:TELEFONO)          ! Field OBR:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:CUIT,BRW1.Q.OBR:CUIT)                  ! Field OBR:CUIT is a hot field or requires assignment from browse
  BRW1.AddField(OBR:EMAIL,BRW1.Q.OBR:EMAIL)                ! Field OBR:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(OBR:PRONTO_PAGO,BRW1.Q.OBR:PRONTO_PAGO)    ! Field OBR:PRONTO_PAGO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:FECHA_BAJA,BRW1.Q.OBR:FECHA_BAJA)      ! Field OBR:FECHA_BAJA is a hot field or requires assignment from browse
  BRW1.AddField(OBR:OBSERVACION,BRW1.Q.OBR:OBSERVACION)    ! Field OBR:OBSERVACION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_OBRAS_SOCIALES',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateOBRA_SOCIAL
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_OBRAS_SOCIALES',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateOBRA_SOCIAL
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
    OF ?Button9
      ThisWindow.Update()
      NomencladorXOS()
      ThisWindow.Reset
    OF ?BrowseOS_PLANES
      ThisWindow.Update()
      BrowseOS_PLANESByOS_:FK_OS_PLANES_OS()
      ThisWindow.Reset
    OF ?BrowseSOCIOSXOS
      ThisWindow.Update()
      BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS()
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


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

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion NOMENCLADORXOS
!!! </summary>
Formulario_NOMENCLADORXOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::NOM2:Record LIKE(NOM2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion NOMENCLADORXOS'),AT(,,334,70),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Formulario_NOMENCLADORXOS'),SYSTEM
                       PROMPT('IDOS:'),AT(2,1),USE(?NOM2:IDOS:Prompt),TRN
                       ENTRY(@n-14),AT(66,1,31,10),USE(NOM2:IDOS),DISABLE
                       PROMPT('IDNOMENCLADOR:'),AT(2,15),USE(?NOM2:IDNOMENCLADOR:Prompt),TRN
                       ENTRY(@n-14),AT(66,15,32,10),USE(NOM2:IDNOMENCLADOR)
                       BUTTON('...'),AT(101,14,12,12),USE(?CallLookup)
                       ENTRY(@P##.##.##P),AT(115,15,40,10),USE(NOM:CODIGO),TRN
                       PROMPT('VALOR ACTUAL:'),AT(2,29),USE(?NOM2:VALOR:Prompt),TRN
                       ENTRY(@n-7.2),AT(66,29,40,10),USE(NOM2:VALOR)
                       PROMPT('VALOR ANTERIOR:'),AT(114,29),USE(?NOM2:VALOR_ANTERIOR:Prompt)
                       ENTRY(@n-7.2),AT(182,29,40,10),USE(NOM2:VALOR_ANTERIOR)
                       LINE,AT(2,47,332,0),USE(?Line1),COLOR(COLOR:Black)
                       ENTRY(@s100),AT(159,15,169,10),USE(NOM:DESCRIPCION),TRN
                       BUTTON('&Aceptar'),AT(110,53,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(163,53,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Formulario_NOMENCLADORXOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?NOM2:IDOS:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(NOM2:Record,History::NOM2:Record)
  SELF.AddHistoryField(?NOM2:IDOS,1)
  SELF.AddHistoryField(?NOM2:IDNOMENCLADOR,2)
  SELF.AddHistoryField(?NOM2:VALOR,3)
  SELF.AddHistoryField(?NOM2:VALOR_ANTERIOR,4)
  SELF.AddUpdateFile(Access:NOMENCLADORXOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:NOMENCLADOR.Open                                  ! File NOMENCLADOR used by this procedure, so make sure it's RelationManager is open
  Relate:NOMENCLADORXOS.Open                               ! File NOMENCLADORXOS used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:NOMENCLADORXOS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?NOM2:IDOS{PROP:ReadOnly} = True
    ?NOM2:IDNOMENCLADOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?NOM:CODIGO{PROP:ReadOnly} = True
    ?NOM2:VALOR{PROP:ReadOnly} = True
    ?NOM2:VALOR_ANTERIOR{PROP:ReadOnly} = True
    ?NOM:DESCRIPCION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Formulario_NOMENCLADORXOS',QuickWindow)    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:NOMENCLADOR.Close
    Relate:NOMENCLADORXOS.Close
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_NOMENCLADORXOS',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
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
      SelectOBRA_SOCIAL
      SelectNOMENCLADOR
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
    OF ?NOM2:IDOS
      OBR:IDOS = NOM2:IDOS
      IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          NOM2:IDOS = OBR:IDOS
        ELSE
          SELECT(?NOM2:IDOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:NOMENCLADORXOS.TryValidateField(1)         ! Attempt to validate NOM2:IDOS in NOMENCLADORXOS
        SELECT(?NOM2:IDOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?NOM2:IDOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?NOM2:IDOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?NOM2:IDNOMENCLADOR
      NOM:IDNOMENCLADOR = NOM2:IDNOMENCLADOR
      IF Access:NOMENCLADOR.TryFetch(NOM:PK_NOMENCLADOR)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          NOM2:IDNOMENCLADOR = NOM:IDNOMENCLADOR
        ELSE
          SELECT(?NOM2:IDNOMENCLADOR)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:NOMENCLADORXOS.TryValidateField(2)         ! Attempt to validate NOM2:IDNOMENCLADOR in NOMENCLADORXOS
        SELECT(?NOM2:IDNOMENCLADOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?NOM2:IDNOMENCLADOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?NOM2:IDNOMENCLADOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      NOM:IDNOMENCLADOR = NOM2:IDNOMENCLADOR
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        NOM2:IDNOMENCLADOR = NOM:IDNOMENCLADOR
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a NOMENCLADOR Record
!!! </summary>
SelectNOMENCLADOR PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(NOMENCLADOR)
                       PROJECT(NOM:IDNOMENCLADOR)
                       PROJECT(NOM:CODIGO)
                       PROJECT(NOM:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
NOM:IDNOMENCLADOR      LIKE(NOM:IDNOMENCLADOR)        !List box control field - type derived from field
NOM:CODIGO             LIKE(NOM:CODIGO)               !List box control field - type derived from field
NOM:DESCRIPCION        LIKE(NOM:DESCRIPCION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a NOMENCLADOR Record'),AT(,,216,208),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectNOMENCLADOR'),SYSTEM
                       LIST,AT(8,40,200,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDNOMENCLADOR~C(0)@n-14@' & |
  '64R(2)|M~CODIGO~C(0)@n-14@80L(2)|M~DESCRIPCION~L(2)@s100@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de NOMENCLADOR')
                       BUTTON('&Elegir'),AT(159,168,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,208,182),USE(?CurrentTab)
                         TAB('DESCRIPCION'),USE(?Tab:2)
                           PROMPT('DESCRIPCION:'),AT(13,23),USE(?DESCRIPCION:Prompt)
                           ENTRY(@s100),AT(63,22,119,10),USE(NOM:DESCRIPCION)
                         END
                         TAB('CODIGO'),USE(?Tab:3)
                           PROMPT('CODIGO:'),AT(11,27),USE(?CODIGO:Prompt)
                           ENTRY(@n-14),AT(61,26,119,10),USE(NOM:CODIGO)
                         END
                       END
                       BUTTON('&Salir'),AT(163,190,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('SelectNOMENCLADOR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('NOM:IDNOMENCLADOR',NOM:IDNOMENCLADOR)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:NOMENCLADOR.Open                                  ! File NOMENCLADOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:NOMENCLADOR,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,NOM:IDX_NOMENCLADOR_CODIGO)           ! Add the sort order for NOM:IDX_NOMENCLADOR_CODIGO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?NOM:CODIGO,NOM:CODIGO,,BRW1)   ! Initialize the browse locator using ?NOM:CODIGO using key: NOM:IDX_NOMENCLADOR_CODIGO , NOM:CODIGO
  BRW1.AddSortOrder(,NOM:IDX_NOMENCLADOR_CODIGO)           ! Add the sort order for NOM:IDX_NOMENCLADOR_CODIGO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?NOM:CODIGO,NOM:CODIGO,,BRW1)   ! Initialize the browse locator using ?NOM:CODIGO using key: NOM:IDX_NOMENCLADOR_CODIGO , NOM:CODIGO
  BRW1.AddField(NOM:IDNOMENCLADOR,BRW1.Q.NOM:IDNOMENCLADOR) ! Field NOM:IDNOMENCLADOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM:CODIGO,BRW1.Q.NOM:CODIGO)              ! Field NOM:CODIGO is a hot field or requires assignment from browse
  BRW1.AddField(NOM:DESCRIPCION,BRW1.Q.NOM:DESCRIPCION)    ! Field NOM:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectNOMENCLADOR',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:NOMENCLADOR.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectNOMENCLADOR',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


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

