

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('GESTION203.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
Exportar_Web PROCEDURE 

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
  GlobalErrors.SetProcedureName('Exportar_Web')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:PADRON_WEB.Open                                   ! File PADRON_WEB used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Exportar_Web',ProgressWindow)              ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:NOMBRE)
  ThisProcess.AddSortOrder(SOC:IDX_SOCIOS_NOMBRE)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
      pad2:MATRICULA          =  'MATRICULA'
      pad2:NOMBRE             =  'NOMBRE'
      PAD2:TELEFONO_LABORAL    =  'TELEFONO'
      PAD2:DIRECCION_LABORAL   =  'DIRECCION'
      !!! BUSCO LOCALIDAD
      LOC:IDLOCALIDAD  = SOC:IDLOCALIDAD
      ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
      PAD2:COD_TEL    =   'COD. TELEF'
      PAD2:LOCALIDAD  =   'LOCALIDAD'
      ACCESS:PADRON_WEB.INSERT()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
    Relate:LOCALIDAD.Close
    Relate:PADRON_WEB.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Exportar_Web',ProgressWindow)           ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF SOC:CANTIDAD <= GLO:CANTIDAD_CUOTAS AND SOC:BAJA = 'NO' AND SOC:BAJA_TEMPORARIA = 'NO' THEN
      pad2:MATRICULA          =  SOC:MATRICULA
      pad2:NOMBRE             =  SOC:NOMBRE
       !!!!!
      PAD2:TELEFONO_LABORAL    = ''
      PAD2:DIRECCION_LABORAL   = ''
      PAD2:COD_TEL    = '' 
      PAD2:LOCALIDAD  = ''
      CON2:IDSOCIO = SOC:IDSOCIO
      set(CON2:FK_CONSULTORIO_SOCIOS,CON2:FK_CONSULTORIO_SOCIOS)
      LOOP
          if access:CONSULTORIO.next() then break.
          if CON2:IDSOCIO <> SOC:IDSOCIO then break.
          if CON2:ACTIVO = 'SI' then 
              PAD2:TELEFONO_LABORAL    =  CON2:TELEFONO
              PAD2:DIRECCION_LABORAL   =  CON2:DIRECCION
              !!! BUSCO LOCALIDAD
              LOC:IDLOCALIDAD  = CON2:IDLOCALIDAD
              ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
              PAD2:COD_TEL    =   LOC:COD_TELEFONICO
              PAD2:LOCALIDAD  =   LOC:DESCRIPCION
              ACCESS:PADRON_WEB.INSERT()
         end      
      END
      !!! dirección adherente 
      CON1:IDSOCIO = SOC:IDSOCIO
      set(CON1:FK_CONSULTRIO_ADHERENTE_SOCIO,CON1:FK_CONSULTRIO_ADHERENTE_SOCIO)
      LOOP
          if access:CONSULTRIO_ADHERENTE.next() then break.
          if CON1:IDSOCIO <> SOC:IDSOCIO then break.
          !! busco consultorio 
          CON2:IDCONSULTORIO = CON1:IDCONSULTORIO
          access:CONSULTORIO.tryfetch(CON2:PK_CONSULTORIO)
          if CON2:ACTIVO = 'SI' then 
              PAD2:TELEFONO_LABORAL    =  CON2:TELEFONO
              PAD2:DIRECCION_LABORAL   =  CON2:DIRECCION
              !!! BUSCO LOCALIDAD
              LOC:IDLOCALIDAD  = CON2:IDLOCALIDAD
              ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
              PAD2:COD_TEL    =   LOC:COD_TELEFONICO
              PAD2:LOCALIDAD  =   LOC:DESCRIPCION
              ACCESS:PADRON_WEB.INSERT()
          end     
      end
      !!! SI NO POSEE DATOS DE CONSULTORIO SE CARGA LOS DATOS LABORALES 
      if PAD2:LOCALIDAD  = '' then
          LOC:IDLOCALIDAD  = SOC:IDLOCALIDAD
          ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
          PAD2:COD_TEL    =   LOC:COD_TELEFONICO
          PAD2:LOCALIDAD  =   LOC:DESCRIPCION
          PAD2:TELEFONO_LABORAL    = SOC:TELEFONO_LABORAL
          PAD2:DIRECCION_LABORAL   = SOC:DIRECCION_LABORAL
          ACCESS:PADRON_WEB.INSERT()
      END     
  END
  
  
  RETURN ReturnValue

