

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION208.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION124.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION207.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
GENERAR_FACTURA_ANUAL PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
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
  GlobalErrors.SetProcedureName('GENERAR_FACTURA_ANUAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS_FACTURA.Open                             ! File INGRESOS_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GENERAR_FACTURA_ANUAL',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:INGRESOS_FACTURA.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_FACTURA_ANUAL',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !!!
  IF SOC:BAJA = 'NO' AND SOC:BAJA_TEMPORARIA = 'NO' THEN 
      ING2:IDSOCIO        = SOC:IDSOCIO
      ING2:IDSUBCUENTA    = 1
      ING2:OBSERVACION    = GLO:CARGA_sTRING
      !!
      !!! busco el monto y sumo el total 
      mes$ = month(today())
      ano$ = year(today())
      !! Calculo la cantidad de meses
      cant_mes$ = 13 - mes$
      !!! busco el monto y sumo el total 
      COB:IDCOBERTURA = 1 
      ACCESS:COBERTURA.TryFetch(COB:PK_COBERTURA)
      ING2:MONTO = COB:MONTO * cant_mes$
      !!!!   
      ING2:FECHA        = TODAY() 
      ING2:HORA         =CLOCK() 
      ING2:MES          = MONTH(TODAY())
      ING2:ANO        = YEAR(TODAY())
      ING2:PERIODO    = ING2:ANO&FORMAT(ING2:MES,@N02)
      ING2:IDUSUARIO  = GLO:IDUSUARIO
      ING2:MES_HASTA  = 12
      !!!! LLAMA A CARGAR ID RECIBO     
      GLO:RECIBO  = GLO:RECIBO + 1
      CARGAR_RECIBO
      
      !!!!!!!!!!!!!!11
      ING2:SUCURSAL       = GLO:SUCURSAL
      ING2:IDRECIBO       = GLO:RECIBO           
      
      Add(INGRESOS_FACTURA) 
      if errorcode() then
          MESSAGE(error())
      else 
          !!! imprimir Recibo
          !! SACA ULTIMO NUMERO
          RAN:C1 = ''
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          RANKING{PROP:SQL} = 'SELECT COUNT(ingresos_factura.idingreso_fac)FROM ingresos_FACTURA'
          NEXT(RANKING)
          CANTIDAD# = RAN:C1
          GLO:PAGO = CANTIDAD# 
          IMPRIMIR_PAGO_ANUAL
      end 
  end     
  RETURN ReturnValue

