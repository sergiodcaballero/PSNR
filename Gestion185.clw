

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION185.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION182.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
Liquidacion_reporte_11 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(FACTURA)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,IMM,MDI,SYSTEM,TIMER(1)
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
  GlobalErrors.SetProcedureName('Liquidacion_reporte_11')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:PERIODO',GLO:PERIODO)                          ! Added by: Process
  BIND('GLO:PERIODO_HASTA',GLO:PERIODO_HASTA)              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION_INFORME.Open                          ! File LIQUIDACION_INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Liquidacion_reporte_11',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC:IDSOCIO)
  ThisProcess.AddSortOrder(FAC:FK_FACTURA_SOCIO)
  ThisProcess.SetFilter('FAC:ESTADO = ''''  AND FAC:PERIODO >= GLO:PERIODO  AND FAC:PERIODO <<= GLO:PERIODO_HASTA')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FACTURA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
    Relate:LIQUIDACION_INFORME.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Liquidacion_reporte_11',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  LIQUIDACION_EMAIL_21()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GLO:IDSOCIO = FAC:IDSOCIO
  !!! DISPARA SQL
  MES# = MONTH(FECHA_DESDE)
  PERIODO" = clip(YEAR(FECHA_DESDE)&FORMAT(MES#,@N02))
  MES# = MONTH(FECHA_HASTA)
  PERIODO2" = clip(YEAR(FECHA_HASTA)&FORMAT(MES#,@N02))
  
  RAN:C1 = ''
  RANKING{PROP:SQL} = 'DELETE FROM RANKING'
  RANKING{PROP:SQL} = 'SELECT COUNT(FACTURA.IDSOCIO)FROM FACTURA WHERE FACTURA.estado = ''''  AND  FACTURA.PERIODO > '''&PERIODO"&'''  AND FACTURA.PERIODO < '''&PERIODO2"&'''  AND FACTURA.idsocio = '''&GLO:IDSOCIO&''' GROUP BY FACTURA.IDSOCIO'
  NEXT(RANKING)
  CANTIDAD# = RAN:C1
  
  IF CANTIDAD# > GLO:CANTIDAD_CUOTAS THEN !!! eL CONTROL DE CUOTA  
      LIQINF:IDSOCIO = FAC:IDSOCIO
      GET(LIQUIDACION_INFORME,LIQINF:PK_LIQUIDACION_INFORME)
      IF ERRORCODE() = 35 THEN
          !!! NO ENCONTRO REGISTRO
          SOC:IDSOCIO = FAC:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          LIQINF:NOMBRE =  SOC:NOMBRE
          if  SOC:BAJA = 'NO' and SOC:BAJA_TEMPORARIA = 'NO' then   !!! controla que sea activos
             IF SOC:EMAIL = '' THEN
                  LIQINF:EMAIL  =  GLO:MAILEMP
              ELSE
                  LIQINF:EMAIL  = SOC:EMAIL
              END
              !!!!!!
              LIQINF:MONTO             =  FAC:TOTAL
              LIQINF:DESC_OS           = CANTIDAD#
              LIQINF:DEBITO            =  0
              LIQINF:SEGURO            =  0
              LIQINF:DEBITO_COMISION   =  0
              LIQINF:DEBITO_PAGO_CUOTA =  0
              LIQINF:MONTO_TOTAL       =  0
              !! saca Os
              LIQINF:MENSAJE           =  'Período Adeudado:'&clip(FAC:MES)&'-'&clip(FAC:ANO)&', Monto'&format(FAC:TOTAL,@n$-13.2)&Chr(13)&Chr(10)           !', Monto: $'&LIQ:MONTO_TOTAL&Chr(13)&Chr(10)
              ACCESS:LIQUIDACION_INFORME.INSERT()
         end
      ELSE
          LIQINF:MONTO             = LIQINF:MONTO + FAC:TOTAL
          LIQINF:MENSAJE           = LIQINF:MENSAJE&'Período Adeudado:'&clip(FAC:MES)&'-'&clip(FAC:ANO)&', Monto'&format(FAC:TOTAL,@n$-13.2)&Chr(13)&Chr(10)           !', Monto: $'&LIQ:MONTO_TOTAL&Chr(13)&Chr(10)
          ! LIQINF:MENSAJE           = LIQINF:MENSAJE&clip(FAC:MES)&'-'&clip(FAC:ANO)&','
          ACCESS:LIQUIDACION_INFORME.UPDATE()
      END
  END
  RETURN ReturnValue

