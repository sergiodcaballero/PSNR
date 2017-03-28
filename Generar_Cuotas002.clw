

   MEMBER('Generar_Cuotas.clw')                            ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GENERAR_CUOTAS002.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! GENERA FACTURA POR CUOTA
!!! </summary>
FACTURAR_CABECERA2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
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
TakeNoRecords          PROCEDURE(),DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('FACTURAR_CABECERA2')
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
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  
  !!! Evolution Consulting FREE Templates Start!!!
    STREAM(SOCIOS)
    STREAM(CONTROL_FACTURA)
    STREAM(COBERTURA)
    STREAM(FACTURA)
  
  !!! Evolution Consulting FREE Templates End!!!
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_CABECERA2',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ThisProcess.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='FACTURANDO CABECERA'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  
  !!! Evolution Consulting FREE Templates Start!!!
    FLUSH(SOCIOS)
    FLUSH(CONTROL_FACTURA)
    FLUSH(COBERTURA)
    FLUSH(FACTURA)
  
  !!! Evolution Consulting FREE Templates End!!!
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURAR_CABECERA2',ProgressWindow)     ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  iF SOC:BAJA_TEMPORARIA = 'NO' AND SOC:BAJA = 'NO' THEN
      !!!  RECORRE COBERTURA POR SOCIOS
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      GET(COBERTURA,COB:PK_COBERTURA)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO COBERTURA')
      ELSE
          IF COB:FORMA_PAGO = 'ANUAL' THEN
              COBERTURA" = 'ANUAL'
          END
          FAC:DESCUENTOCOBERTURA = COB:DESCUENTO
          FAC:INTERES = COB:INTERES
      END
  
      FAC:IDSOCIO = SOC:IDSOCIO
      FAC:DESCUENTOESPECIAL  = SOC:DESCUENTO
      ! CONTROLA SI ES LA 1º VEZ QUE SE CARGA LA FACTURA
      PERIODO1# = GLO:PERIODO
      CON3:IDSOCIO = SOC:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          CON3:MES = GLO:MES
          CON3:ANO = GLO:ANO
          CON3:PEDIODO = CON3:ANO&(FORMAT(CON3:MES,@N02))
          PRIMERA_VEZ" = 'SI'
          ADD(CONTROL_FACTURA)
          IF ERRORCODE() THEN MESSAGE(ERROR()).
          
      ELSE
  
          IF  CON3:ANO =  GLO:ANO THEN
               GLO:MES = CON3:MES
               GLO:ANO = CON3:ANO
               PERIODO2# = CON3:PEDIODO
               IF CON3:MES = '1' THEN
                  GLO:MES = 12
                  GLO:ANO = GLO:ANO - 1
               ELSE
                   GLO:MES = GLO:MES - 1
               END
          ELSE
              GLO:MES = 12
             
          END
      END
      COBERTURA" = ''
      !MESSAGE ('EL PERIODO 1:'&PERIODO1#&', EL PERIODO 2:'&PERIODO2#&' 1º VEZ = '&PRIMERA_VEZ")
      IF PERIODO1# > PERIODO2# OR PRIMERA_VEZ"= 'SI' THEN !! CONTROLA QUE YA NO SE HAYA FACTURADO
          FAC:MES  = GLO:MES
          FAC:ANO = GLO:ANO
          FAC:TOTAL  = 0
          FAC:PERIODO =   GLO:ANO&(FORMAT(GLO:MES,@N02))
          FAC:IDUSUARIO = GLO:IDUSUARIO
          FAC:FECHA =TODAY()
          FAC:HORA = CLOCK()
          FAC:ESTADO = 'SIN DETALLE'
          add(FACTURA)
          
       END
  end ! fecha baja
  
  PERIODO1# = 0
  PERIODO2# = 0
  PRIMERA_VEZ" = ''
  RETURN ReturnValue

