

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION132.INC'),ONCE        !Local module procedure declarations
                     END


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

