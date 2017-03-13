

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION255.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
FACTURAR_DETALLE PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                       PROJECT(FAC:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
                         JOIN(SER2:FK_SERVICIOXSOCIO_SOCIOS,SOC:IDSOCIO)
                           PROJECT(SER2:IDSERVICIOS)
                           JOIN(SER:PK_SERVICIOS,SER2:IDSERVICIOS)
                           END
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('FACTURAR_DETALLE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_FACTURA.Open                              ! File DETALLE_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_COBERTURA.Open                               ! File TIPO_COBERTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_DETALLE',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, 0)
  ThisProcess.AddSortOrder(FAC:IDX_FACTURA_ESTADO)
  ThisProcess.AddRange(FAC:ESTADO,GLO:ESTADO)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}='FACTURANDO DETALLE'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SEND(SOCIOS,'QUICKSCAN=on')
  SEND(SERVICIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:CONVENIO.Close
    Relate:CONVENIO_DETALLE.Close
    Relate:DETALLE_FACTURA.Close
    Relate:FACTURA.Close
    Relate:TIPO_COBERTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURAR_DETALLE',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF FAC:ESTADO = GLO:ESTADO THEN
      DET:IDFACTURA =  FAC:IDFACTURA
      DET:MES     =    FAC:MES
      DET:ANO     =    FAC:ANO
      DET:PERIODO =    FAC:PERIODO
      ! SACA MONTOS
      !! 1º BUSCA SOCIO
      SOC:IDSOCIO = FAC:IDSOCIO
      ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
      FECHA_ALTA# = SOC:FECHA_ALTA
      !!!  RECORRE COBERTURA POR SOCIOS
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      GET(COBERTURA,COB:PK_COBERTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO COBERTURA')
      ELSE
          DET:CONCEPTO = COB:DESCRIPCION
          DET:MONTO    = COB:MONTO 
          MONTO_FACTURA$ = MONTO_FACTURA$ + COB:MONTO
          !! BUSCO TIPO DE COBERTURA
          TIPC:IDCOBERTURA  = COB:IDCOBERTURA
          SET(TIPC:FK_TIPO_COBERTURA_1,TIPC:FK_TIPO_COBERTURA_1)
          LOOP
              IF ACCESS:TIPO_COBERTURA.NEXT() THEN BREAK.
              IF TIPC:IDCOBERTURA  <> COB:IDCOBERTURA THEN BREAK.
              EDADMAX# = TIPC:ANO_MAX + 1
              EDADMIN# = TIPC:ANO_MIN
              FECHA_DESDE = DATE(MONTH(TODAY()),DAY(TODAY()+1),YEAR(TODAY()) - EDADMAX#)
              FECHA_HASTA = DATE(MONTH(TODAY()),DAY(TODAY()),YEAR(TODAY()) - EDADMIN#)
              !MESSAGE('FECHA ALTA -->'&FORMAT(FECHA_ALTA#,@D6)&', FECHA DESDE -->'&FECHA_DESDE&', FECHA HASTA -->'&FECHA_HASTA)
              IF FECHA_ALTA# >=FECHA_DESDE AND FECHA_ALTA#<=FECHA_HASTA THEN
                  DET:MONTO = DET:MONTO + TIPC:DIFERENCIA_MONTO
                  MONTO_FACTURA$ = MONTO_FACTURA$ + TIPC:DIFERENCIA_MONTO
              END
          END !! LOOP
  
          ADD(DETALLE_FACTURA)
          IF ERRORCODE() THEN
              MESSAGE('NO GRABO COBERTURA')
          END
      END
  
      !!!
      !!! RECORRE SERVICIOS POR SOCIOS
      SER2:IDSOCIO = SOC:IDSOCIO
      Set(SER2:FK_SERVICIOXSOCIO_SOCIOS,SER2:FK_SERVICIOXSOCIO_SOCIOS)
      LOOP
          IF ACCESS:SERVICIOxSOCIO.NEXT() THEN BREAK.
          IF (SER2:IDSOCIO <> SOC:IDSOCIO) THEN BREAK.
          !!!BUSCO EL SERVICIO
          SER:IDSERVICIOS = SER2:IDSERVICIOS
          GET (SERVICIOS,SER:PK_SERVICIOS)
          IF ERRORCODE() = 35 THEN
                 MESSAGE('NO ENCONTRO EL SERVICIO')
          ELSE
                   DET:CONCEPTO = SER:DESCRIPCION
                   DET:MONTO    = SER:MONTO - SER:DESCUENTO
                   MONTO_FACTURA$ = MONTO_FACTURA$ + (SER:MONTO - SER:DESCUENTO)
                   ADD(DETALLE_FACTURA)
                   IF ERRORCODE() THEN
                       MESSAGE('NO GRABO SERVICIO')
                  END
         END
      END !! LOOP
  
  
      !!!!!!! SACADO PARA QUE CONVENIO SE PAGUE APARTE..
      !!!  RECORRE CONVENIOS
      CON5:IDSOCIO     = FAC:IDSOCIO
      CON5:PERIODO     = FAC:PERIODO
      SET(CON5:IDX_CONVENIO_DETALLE_SOCIO,CON5:IDX_CONVENIO_DETALLE_SOCIO)
      LOOP
          IF ACCESS:CONVENIO_DETALLE.NEXT() THEN BREAK.
          IF (CON5:IDSOCIO <> FAC:IDSOCIO) OR (CON5:PERIODO  <> FAC:PERIODO) THEN BREAK.
           IF CON5:IDSOCIO     = FAC:IDSOCIO AND CON5:PERIODO     = FAC:PERIODO AND CON5:CANCELADO = '' THEN
              DET:CONCEPTO = 'CONVENIO '&CON5:IDSOLICITUD&' '&CON5:OBSERVACION
              DET:MONTO    = CON5:MONTO_CUOTA
              MONTO_FACTURA$ = MONTO_FACTURA$ + CON5:MONTO_CUOTA
              ADD(DETALLE_FACTURA)
              IF ERRORCODE() THEN
                  MESSAGE('NO GRABO CONVENIO')
              END
              CON5:CANCELADO = 'SI'
              PUT(CONVENIO_DETALLE)
              !!!BUSCA CANCELACION EN TABLA CONVENIO
              IF CON5:DEUDA_INICIAL <= 0.1 THEN
                  CON4:IDSOLICITUD =  CON5:IDSOLICITUD
                  GET (CONVENIO,CON4:PK_CONVENIO)
                  IF ERRORCODE() = 35 THEN
                      MESSAGE('NO ENCONTRO EL CONVENIO')
                  ELSE
                     CON4:CANCELADO = 'SI'
                     CON4:FECHA_CANCELADO = TODAY()
                     PUT(CONVENIO)
                  END
              END
           ELSE
              MESSAGE('ERROR EN FACTURACION AVISE A AL ENCARGADO DEL SISTEMA')
           END
      END ! LOOP
  
      !!!
  
      !!! CARGA LA FACTURA
      FAC:ESTADO = ''
      FAC:TOTAL =  MONTO_FACTURA$
      PUT(FACTURA)
      CONTADOR$ = 0
      ! CONTROLA SI ES LA 1º VEZ QUE SE CARGA LA FACTURA
      CON3:IDSOCIO = FAC:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO CONTROL DE FACTURA FINAL')
      ELSE
          CON3:MES = FAC:MES
          CON3:ANO = FAC:ANO
          CON3:PEDIODO = FAC:ANO&(FORMAT(FAC:MES,@N02))
          PUT(CONTROL_FACTURA)
      END
  
  
  END
  
   SOC:IDSOCIO = FAC:IDSOCIO
   GET (SOCIOS,SOC:PK_SOCIOS)
   IF ERRORCODE() = 35 THEN
      MESSAGE ('NO ENCONTRO SOCIO')
   ELSE
      SOC:CANTIDAD = SOC:CANTIDAD +1 
      PUT(SOCIOS)
   END
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

