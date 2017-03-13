

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION261.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION260.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION262.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
CUPON_DE_PAGO2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(RANKING)
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
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          ProcessClass                          ! Process Manager
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
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOGOUT(1,RANKING,SOCIOS,CONTROl_FACTURA)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUPON_DE_PAGO2',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:RANKING, ?Progress:PctText, Progress:Thermometer, ProgressMgr, RAN:C1)
  ThisProcess.AddSortOrder(RAN:PK_RANKING)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='GENERA FACTURACION'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(RANKING,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONTROL_FACTURA.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO2',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  COMMIT
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GLO:IDSOCIO = RAN:C1
  
  if GLO:IDSOLICITUD =  GLO:IDSOCIO then
      !message('se cargo el mismo')
  else
      GLO:IDSOLICITUD =  GLO:IDSOCIO
  
  
      CON3:IDSOCIO = GLO:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          !MESSAGE ('NO ENCONTRO COLTROL DE FACTURA FINAL')
          !SELECT(?GLO:IDSOCIO)
          !CYCLE
      ELSE
          GLO:MES     = CON3:MES
          GLO:ANO     = CON3:ANO
          IF CON3:MES = 12 THEN
             GLO:MES = 1
             GLO:ANO = GLO:ANO + 1
          ELSE
             GLO:MES = GLO:MES + 1
         END
      END
  
      GLO:ESTADO = 'SIN DETALLE'
      GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
  
  
      !!! LLAMA A LOS PROCEDIMIENTO DE FACTURACION
      FACTURAR_CABECERA_CUPON
  
      FACTURAR_DETALLE_CUPON
  
      !!!GUARDA PERIODO FACTURA ACTUAL
      GLO:MES = 0
      GLO:ANO = 0
      GLO:PERIODO = ''
      GLO:IDSOCIO = 0
  
  END
  RETURN ReturnValue

