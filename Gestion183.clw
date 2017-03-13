

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION183.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION182.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
Liquidacion_reporte_111 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SEGURO_FACTURA)
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

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('Liquidacion_reporte_111')
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
  Relate:LIQUIDACION_INFORME.Open                          ! File LIQUIDACION_INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SEGURO.Open                                       ! File SEGURO used by this procedure, so make sure it's RelationManager is open
  Relate:SEGURO_FACTURA.Open                               ! File SEGURO_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Liquidacion_reporte_111',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:SEGURO_FACTURA, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('SEG5:ESTADO = ''''  AND SEG5:PERIODO >= GLO:PERIODO  AND SEG5:PERIODO <<= GLO:PERIODO_HASTA')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SEGURO_FACTURA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION_INFORME.Close
    Relate:RANKING.Close
    Relate:SEGURO.Close
    Relate:SEGURO_FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Liquidacion_reporte_111',ProgressWindow) ! Save window data to non-volatile store
  END
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
  GLO:IDSOCIO = SEG5:IDSOCIO
  !!! DISPARA SQL
  MES# = MONTH(FECHA_DESDE)
  PERIODO" = clip(YEAR(FECHA_DESDE)&FORMAT(MES#,@N02))
  MES# = MONTH(FECHA_HASTA)
  PERIODO2" = clip(YEAR(FECHA_HASTA)&FORMAT(MES#,@N02))
  
  RAN:C1 = ''
  RANKING{PROP:SQL} = 'DELETE FROM RANKING'
  RANKING{PROP:SQL} = 'SELECT COUNT(seguro_FACTURA.IDSOCIO)FROM seguro_FACTURA WHERE seguro_FACTURA.estado = ''''  AND  seguro_FACTURA.PERIODO > '''&PERIODO"&'''  AND seguro_FACTURA.PERIODO < '''&PERIODO2"&'''  AND seguro_FACTURA.idsocio = '''&GLO:IDSOCIO&''' GROUP BY seguro_FACTURA.IDSOCIO'
  NEXT(RANKING)
  CANTIDAD# = RAN:C1
  
  IF CANTIDAD# > 1 THEN !!! eL CONTROL DE CUOTA  
      LIQINF:IDSOCIO = SEG5:IDSOCIO
      GET(LIQUIDACION_INFORME,LIQINF:PK_LIQUIDACION_INFORME)
      IF ERRORCODE() = 35 THEN
          !!! NO ENCONTRO REGISTRO
          SOC:IDSOCIO = SEG5:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          LIQINF:NOMBRE =  SOC:NOMBRE
          if  SOC:BAJA = 'NO' and SOC:BAJA_TEMPORARIA = 'NO' then   !!! controla que sea activos
             IF SOC:EMAIL = '' THEN
                  LIQINF:EMAIL  =  GLO:MAILEMP
              ELSE
                  LIQINF:EMAIL  = SOC:EMAIL
              END
              !!!! busco si estas activo.- 
              SEG:IDSOCIO = SOC:IDSOCIO
              ACCESS:SEGURO.TRYFETCH(SEG:FK_SEGURO_SOCIOS)
              IF SEG:BAJA = 'NO' THEN 
                  !!!!!!
                  LIQINF:MONTO             =  SEG5:TOTAL
                  LIQINF:DESC_OS           = CANTIDAD#
                  LIQINF:DEBITO            =  0
                  LIQINF:SEGURO            =  0
                  LIQINF:DEBITO_COMISION   =  0
                  LIQINF:DEBITO_PAGO_CUOTA =  0
                  LIQINF:MONTO_TOTAL       =  0
                  !! saca Os
                  LIQINF:MENSAJE           =  'Período Adeudado Seguro:'&clip(SEG5:MES)&'-'&clip(SEG5:ANO)&', Monto'&format(SEG5:TOTAL,@n$-13.2)&Chr(13)&Chr(10)           !', Monto: $'&LIQ:MONTO_TOTAL&Chr(13)&Chr(10)
                  ACCESS:LIQUIDACION_INFORME.INSERT()
              END     
         end
      ELSE
          LIQINF:MONTO             = LIQINF:MONTO + SEG5:TOTAL
          LIQINF:MENSAJE           = LIQINF:MENSAJE&'Período Adeudado Seguro:'&clip(SEG5:MES)&'-'&clip(SEG5:ANO)&', Monto'&format(SEG5:TOTAL,@n$-13.2)&Chr(13)&Chr(10)           !', Monto: $'&LIQ:MONTO_TOTAL&Chr(13)&Chr(10)
          
          ACCESS:LIQUIDACION_INFORME.UPDATE()
      END
  END
  REPORTE_LARGO = 'EMAILSEGURO'
  RETURN ReturnValue

