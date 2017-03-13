

   MEMBER('Generar_Cuotas.clw')                            ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GENERAR_CUOTAS001.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! GENERA DETALLE FACTURA POR CUOTA
!!! </summary>
FACTURAR_DETALLE2 PROCEDURE 

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
TakeNoRecords          PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('FACTURAR_DETALLE2')
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
  
  !!! Evolution Consulting FREE Templates Start!!!
    STREAM(FACTURA)
    STREAM(SOCIOS)
    STREAM(SOCIOS)
    STREAM(SERVICIOXSOCIO)
    STREAM(SERVICIOXSOCIO)
    STREAM(SERVICIOS)
    STREAM(SERVICIOS)
    STREAM(TIPO_COBERTURA)
    STREAM(CONTROL_FACTURA)
    STREAM(DETALLE_FACTURA)
    STREAM(COBERTURA)
    STREAM(CONVENIO)
    STREAM(CONVENIO_DETALLE)
  
  !!! Evolution Consulting FREE Templates End!!!
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_DETALLE2',ProgressWindow)         ! Restore window settings from non-volatile store
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
  
  !!! Evolution Consulting FREE Templates Start!!!
    FLUSH(FACTURA)
    FLUSH(SOCIOS)
    FLUSH(SERVICIOXSOCIO)
    FLUSH(SERVICIOS)
    FLUSH(TIPO_COBERTURA)
    FLUSH(CONTROL_FACTURA)
    FLUSH(DETALLE_FACTURA)
    FLUSH(COBERTURA)
    FLUSH(CONVENIO)
    FLUSH(CONVENIO_DETALLE)
  
  !!! Evolution Consulting FREE Templates End!!!
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
    INIMgr.Update('FACTURAR_DETALLE2',ProgressWindow)      ! Save window data to non-volatile store
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
  IF FAC:ESTADO = GLO:ESTADO THEN
      DET:IDFACTURA =  FAC:IDFACTURA
      DET:MES     =    FAC:MES
      DET:ANO     =    FAC:ANO
      DET:PERIODO =    FAC:PERIODO
      ! SACA MONTOS
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
  
  
      !!!!!!  SE SACO PAR AQUE CONVENIO SE COBRE APARTE
      !!  RECORRE CONVENIOS
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
     
  
  
  END
  
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
deuda2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(DEUDA)
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
  GlobalErrors.SetProcedureName('deuda2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:DEUDA.Open                                        ! File DEUDA used by this procedure, so make sure it's RelationManager is open
  Relate:PAIS.Open                                         ! File PAIS used by this procedure, so make sure it's RelationManager is open
  Relate:PERIODO_FACTURA.Open                              ! File PERIODO_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_INSTITUCION.Open                             ! File TIPO_INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('deuda2',ProgressWindow)                    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:DEUDA, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(DEUDA,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO.Close
    Relate:CONTROL_FACTURA.Close
    Relate:DEUDA.Close
    Relate:PAIS.Close
    Relate:PERIODO_FACTURA.Close
    Relate:SOCIOS.Close
    Relate:TIPO_INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('deuda2',ProgressWindow)                 ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !! BUSCO NUERO SOCIO
  GLO:CC = DEU:CC
  SOC:MATRICULA = DEU:MAT
  GLO:MES = 12
  GLO:ANO = 2016
  GET(SOCIOS,SOC:IDX_SOCIOS_MATRICULA)
  IF ERRORCODE() <> 35 THEN
              Glo:IDSOCIO = SOC:IDSOCIO
              LOOP I# = 1 TO GLO:CC
                  GLO:ESTADO = 'SIN DETALLE'
                  GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
                  GLO:IDUSUARIO = 1
                  !! CARGA LA FACTURACION
                  FACTURAR_CABECERA2
                  FACTURAR_DETALLE2
                  !message('socios --> '&Glo:IDSOCIO&', i -->'& I#)
                  if GLO:MES = 1 then 
                      GLO:MES = 12
                      GLO:ANO = GLO:ANO - 1 
                  else 
                      GLO:MES = GLO:MES - 1 
                  end 
                 
                  
               END !! LOOP
  ELSE
      MESSAGE('NO SE ECONTRO EL SOCIO EN LA TABLA SOCIOS')
  END
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

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
      
      COBERTURA" = ''
      !MESSAGE ('EL PERIODO 1:'&PERIODO1#&', EL PERIODO 2:'&PERIODO2#&' 1º VEZ = '&PRIMERA_VEZ")
      !IF PERIODO1# > PERIODO2# OR PRIMERA_VEZ"= 'SI' THEN !! CONTROLA QUE YA NO SE HAYA FACTURADO
          FAC:MES  = GLO:MES
          FAC:ANO = GLO:ANO
          FAC:TOTAL  = 0
          FAC:PERIODO =   GLO:ANO&(FORMAT(GLO:MES,@N02))
          FAC:IDUSUARIO = GLO:IDUSUARIO
          FAC:FECHA =TODAY()
          FAC:HORA = CLOCK()
          FAC:ESTADO = 'SIN DETALLE'
          add(FACTURA)
          
       !END
  end ! fecha baja
  
  PERIODO1# = 0
  PERIODO2# = 0
  PRIMERA_VEZ" = ''
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Frame
!!! Wizard Application for F:\Sistemas\Sis10\PsRN\Psrn.dct
!!! </summary>
Main PROCEDURE 

SQLOpenWindow        WINDOW('Initializing Database'),AT(,,208,26),FONT('Microsoft Sans Serif',8,,FONT:regular),CENTER,GRAY,DOUBLE
                       STRING('This process could take several seconds.'),AT(27,12)
                       IMAGE(Icon:Connect),AT(4,4,23,17)
                       STRING('Please wait while the program connects to the database.'),AT(27,3)
                     END

AppFrame             APPLICATION('Application'),AT(,,505,318),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('WAFRAME.ICO'),MAX,STATUS(-1,80,120,45),SYSTEM,IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&Archivo'),USE(?FileMenu)
                           ITEM('&Configuracion Impresora'),USE(?PrintSetup),MSG('Configuracion Impresora'),STD(STD:PrintSetup)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('&Salir'),USE(?Exit),MSG('Salir de la Aplicacion'),STD(STD:Close)
                         END
                         MENU('&Editar'),USE(?EditMenu)
                           ITEM('Co&rtar'),USE(?Cut),MSG('Corta la seleccion al Clipboard'),STD(STD:Cut)
                           ITEM('&Copiar'),USE(?Copy),MSG('Copia la seleccion al Clipboard'),STD(STD:Copy)
                           ITEM('&Pegar'),USE(?Paste),MSG('Pega desde el Clipboard'),STD(STD:Paste)
                         END
                         MENU('&Browse'),USE(?BrowseMenu)
                           ITEM('Browse the FACTURA file'),USE(?ArchivoFACTURA),MSG('Browse FACTURA')
                           ITEM('deuda'),USE(?ITEM1)
                         END
                         MENU('&Window'),USE(?WindowMenu),STD(STD:WindowList)
                           ITEM('&Vertical'),USE(?Tile),MSG('Vertical'),STD(STD:TileWindow)
                           ITEM('&Cascada'),USE(?Cascade),MSG('Cascada'),STD(STD:CascadeWindow)
                           ITEM('&Organizar Iconos'),USE(?Arrange),MSG('Organizar iconos'),STD(STD:ArrangeIcons)
                         END
                         MENU('&Ayuda'),USE(?HelpMenu)
                           ITEM('&Contenido'),USE(?Helpindex),MSG('Visualiza el contenido del Help'),STD(STD:HelpIndex)
                           ITEM('&Busqueda Help On Line...'),USE(?HelpSearch),STD(STD:HelpSearch)
                           ITEM('C&omo utilizar el Help'),USE(?HelpOnHelp),MSG('Ayuda de como utilizar el Help de ' & |
  'la Aplicacion'),STD(STD:HelpOnHelp)
                         END
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::BrowseMenu ROUTINE                                   ! Code for menu items on ?BrowseMenu
  CASE ACCEPTED()
  OF ?ArchivoFACTURA
    START(ArchivoFACTURA, 050000)
  OF ?ITEM1
    START(deuda2, 25000)
  END
Menu::WindowMenu ROUTINE                                   ! Code for menu items on ?WindowMenu
Menu::HelpMenu ROUTINE                                     ! Code for menu items on ?HelpMenu

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SETCURSOR(Cursor:Wait)
  OPEN(SQLOpenWindow)
  ACCEPT
    IF EVENT() = Event:OpenWindow
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
      POST(EVENT:CloseWindow)
    END
  END
  CLOSE(SQLOpenWindow)
  SETCURSOR()
  SELF.Open(AppFrame)                                      ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Main',AppFrame)                            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
      AppFrame{PROP:TabBarVisible}  = False
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('Main',AppFrame)                         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::BrowseMenu                                  ! Process menu items on ?BrowseMenu menu
      DO Menu::WindowMenu                                  ! Process menu items on ?WindowMenu menu
      DO Menu::HelpMenu                                    ! Process menu items on ?HelpMenu menu
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a USUARIO Record
!!! </summary>
SelectUSUARIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(USUARIO)
                       PROJECT(USU:IDUSUARIO)
                       PROJECT(USU:DESCRIPCION)
                       PROJECT(USU:CONTRASENA)
                       PROJECT(USU:NIVEL)
                       PROJECT(USU:BAJA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
USU:IDUSUARIO          LIKE(USU:IDUSUARIO)            !List box control field - type derived from field
USU:DESCRIPCION        LIKE(USU:DESCRIPCION)          !List box control field - type derived from field
USU:CONTRASENA         LIKE(USU:CONTRASENA)           !List box control field - type derived from field
USU:NIVEL              LIKE(USU:NIVEL)                !List box control field - type derived from field
USU:BAJA               LIKE(USU:BAJA)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a USUARIO Record'),AT(,,340,198),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectUSUARIO'),SYSTEM
                       LIST,AT(8,30,324,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDUSUARIO~C(0)@n-14@80L(' & |
  '2)|M~DESCRIPCION~L(2)@s20@44L(2)|M~CONTRASENA~L(2)@s10@64R(2)|M~NIVEL~C(0)@n-14@80R(' & |
  '2)|M~BAJA~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de USUARIO')
                       BUTTON('&Elegir'),AT(283,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,332,172),USE(?CurrentTab)
                         TAB('PK_USUARIO'),USE(?Tab:2)
                         END
                         TAB('USUARIO_IDX1'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(287,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectUSUARIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('USU:IDUSUARIO',USU:IDUSUARIO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:USUARIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,USU:USUARIO_IDX1)                     ! Add the sort order for USU:USUARIO_IDX1 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,USU:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: USU:USUARIO_IDX1 , USU:DESCRIPCION
  BRW1.AddSortOrder(,USU:PK_USUARIO)                       ! Add the sort order for USU:PK_USUARIO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,USU:IDUSUARIO,,BRW1)           ! Initialize the browse locator using  using key: USU:PK_USUARIO , USU:IDUSUARIO
  BRW1.AddField(USU:IDUSUARIO,BRW1.Q.USU:IDUSUARIO)        ! Field USU:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(USU:DESCRIPCION,BRW1.Q.USU:DESCRIPCION)    ! Field USU:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(USU:CONTRASENA,BRW1.Q.USU:CONTRASENA)      ! Field USU:CONTRASENA is a hot field or requires assignment from browse
  BRW1.AddField(USU:NIVEL,BRW1.Q.USU:NIVEL)                ! Field USU:NIVEL is a hot field or requires assignment from browse
  BRW1.AddField(USU:BAJA,BRW1.Q.USU:BAJA)                  ! Field USU:BAJA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectUSUARIO',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectUSUARIO',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
      END
    END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion FACTURA
!!! </summary>
UpdateFACTURA PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::FAC:Record  LIKE(FAC:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion FACTURA'),AT(,,200,182),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateFACTURA'),SYSTEM
                       SHEET,AT(4,4,192,156),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('IDFACTURA:'),AT(8,20),USE(?FAC:IDFACTURA:Prompt),TRN
                           ENTRY(@n-14),AT(88,20,64,10),USE(FAC:IDFACTURA),RIGHT(1)
                           PROMPT('IDSOCIO:'),AT(8,34),USE(?FAC:IDSOCIO:Prompt),TRN
                           ENTRY(@n-14),AT(88,34,64,10),USE(FAC:IDSOCIO),RIGHT(1)
                           PROMPT('IDUSUARIO:'),AT(8,48),USE(?FAC:IDUSUARIO:Prompt),TRN
                           ENTRY(@n-14),AT(88,48,64,10),USE(FAC:IDUSUARIO),RIGHT(1)
                           PROMPT('MONTOCOBERTURA:'),AT(8,62),USE(?FAC:MONTOCOBERTURA:Prompt),TRN
                           ENTRY(@n-10.2),AT(88,62,48,10),USE(FAC:MONTOCOBERTURA),DECIMAL(12)
                           PROMPT('INTERES:'),AT(8,76),USE(?FAC:INTERES:Prompt),TRN
                           ENTRY(@n-10.2),AT(88,76,48,10),USE(FAC:INTERES),DECIMAL(12)
                           PROMPT('TOTAL:'),AT(8,90),USE(?FAC:TOTAL:Prompt),TRN
                           ENTRY(@n-10.2),AT(88,90,48,10),USE(FAC:TOTAL),DECIMAL(12)
                           PROMPT('MES:'),AT(8,104),USE(?FAC:MES:Prompt),TRN
                           ENTRY(@n-14),AT(88,104,64,10),USE(FAC:MES),RIGHT(1)
                           PROMPT('ANO:'),AT(8,118),USE(?FAC:ANO:Prompt),TRN
                           ENTRY(@n-14),AT(88,118,64,10),USE(FAC:ANO),RIGHT(1)
                           PROMPT('PERIODO:'),AT(8,132),USE(?FAC:PERIODO:Prompt),TRN
                           ENTRY(@s11),AT(88,132,48,10),USE(FAC:PERIODO)
                           PROMPT('FECHA:'),AT(8,146),USE(?FAC:FECHA:Prompt),TRN
                           ENTRY(@d17),AT(88,146,104,10),USE(FAC:FECHA),RIGHT(1)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           PROMPT('HORA:'),AT(8,20),USE(?FAC:HORA:Prompt),TRN
                           ENTRY(@t7),AT(88,20,104,10),USE(FAC:HORA),RIGHT(1)
                           PROMPT('ESTADO:'),AT(8,34),USE(?FAC:ESTADO:Prompt),TRN
                           ENTRY(@s21),AT(88,34,88,10),USE(FAC:ESTADO)
                           PROMPT('DESCUENTOCOBERTURA:'),AT(8,48),USE(?FAC:DESCUENTOCOBERTURA:Prompt),TRN
                           ENTRY(@n-10.2),AT(88,48,48,10),USE(FAC:DESCUENTOCOBERTURA),DECIMAL(12)
                           PROMPT('DESCUENTOESPECIAL:'),AT(8,62),USE(?FAC:DESCUENTOESPECIAL:Prompt),TRN
                           ENTRY(@n-10.2),AT(88,62,48,10),USE(FAC:DESCUENTOESPECIAL),DECIMAL(12)
                           PROMPT('IDPAGO:'),AT(8,76),USE(?FAC:IDPAGO:Prompt),TRN
                           ENTRY(@n-14),AT(88,76,64,10),USE(FAC:IDPAGO),RIGHT(1)
                           PROMPT('IDPAGO LIQ:'),AT(8,90),USE(?FAC:IDPAGO_LIQ:Prompt),TRN
                           ENTRY(@n-14),AT(88,90,64,10),USE(FAC:IDPAGO_LIQ),RIGHT(1)
                         END
                       END
                       BUTTON('&Aceptar'),AT(94,164,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(147,164,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('UpdateFACTURA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FAC:IDFACTURA:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(FAC:Record,History::FAC:Record)
  SELF.AddHistoryField(?FAC:IDFACTURA,1)
  SELF.AddHistoryField(?FAC:IDSOCIO,2)
  SELF.AddHistoryField(?FAC:IDUSUARIO,3)
  SELF.AddHistoryField(?FAC:MONTOCOBERTURA,4)
  SELF.AddHistoryField(?FAC:INTERES,5)
  SELF.AddHistoryField(?FAC:TOTAL,6)
  SELF.AddHistoryField(?FAC:MES,7)
  SELF.AddHistoryField(?FAC:ANO,8)
  SELF.AddHistoryField(?FAC:PERIODO,9)
  SELF.AddHistoryField(?FAC:FECHA,10)
  SELF.AddHistoryField(?FAC:HORA,11)
  SELF.AddHistoryField(?FAC:ESTADO,12)
  SELF.AddHistoryField(?FAC:DESCUENTOCOBERTURA,13)
  SELF.AddHistoryField(?FAC:DESCUENTOESPECIAL,14)
  SELF.AddHistoryField(?FAC:IDPAGO,15)
  SELF.AddHistoryField(?FAC:IDPAGO_LIQ,16)
  SELF.AddUpdateFile(Access:FACTURA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:FACTURA
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
    ?FAC:IDFACTURA{PROP:ReadOnly} = True
    ?FAC:IDSOCIO{PROP:ReadOnly} = True
    ?FAC:IDUSUARIO{PROP:ReadOnly} = True
    ?FAC:MONTOCOBERTURA{PROP:ReadOnly} = True
    ?FAC:INTERES{PROP:ReadOnly} = True
    ?FAC:TOTAL{PROP:ReadOnly} = True
    ?FAC:MES{PROP:ReadOnly} = True
    ?FAC:ANO{PROP:ReadOnly} = True
    ?FAC:PERIODO{PROP:ReadOnly} = True
    ?FAC:FECHA{PROP:ReadOnly} = True
    ?FAC:HORA{PROP:ReadOnly} = True
    ?FAC:ESTADO{PROP:ReadOnly} = True
    ?FAC:DESCUENTOCOBERTURA{PROP:ReadOnly} = True
    ?FAC:DESCUENTOESPECIAL{PROP:ReadOnly} = True
    ?FAC:IDPAGO{PROP:ReadOnly} = True
    ?FAC:IDPAGO_LIQ{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateFACTURA',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateFACTURA',QuickWindow)             ! Save window data to non-volatile store
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
      SelectSOCIOS
      SelectUSUARIO
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


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
    OF ?FAC:IDSOCIO
      SOC:IDSOCIO = FAC:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          FAC:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?FAC:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:FACTURA.TryValidateField(2)                ! Attempt to validate FAC:IDSOCIO in FACTURA
        SELECT(?FAC:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?FAC:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?FAC:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?FAC:IDUSUARIO
      USU:IDUSUARIO = FAC:IDUSUARIO
      IF Access:USUARIO.TryFetch(USU:PK_USUARIO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          FAC:IDUSUARIO = USU:IDUSUARIO
        ELSE
          SELECT(?FAC:IDUSUARIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:FACTURA.TryValidateField(3)                ! Attempt to validate FAC:IDUSUARIO in FACTURA
        SELECT(?FAC:IDUSUARIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?FAC:IDUSUARIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?FAC:IDUSUARIO{PROP:FontColor} = FieldColorQueue.OldColor
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a SOCIOS Record
!!! </summary>
SelectSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:IDZONA)
                       PROJECT(SOC:IDCOBERTURA)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:IDUSUARIO)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:IDCIRCULO)
                       PROJECT(SOC:IDINSTITUCION)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:ACTA)
                       PROJECT(SOC:BAJA)
                       PROJECT(SOC:LIBRO)
                       PROJECT(SOC:NRO_VIEJO)
                       PROJECT(SOC:PROVISORIO)
                       PROJECT(SOC:INGRESO)
                       PROJECT(SOC:IDTIPOTITULO)
                       PROJECT(SOC:IDMINISTERIO)
                       PROJECT(SOC:IDCS)
                       PROJECT(SOC:IDPROVEEDOR)
                       PROJECT(SOC:TIPOIVA)
                       PROJECT(SOC:IDBANCO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:IDZONA             LIKE(SOC:IDZONA)               !List box control field - type derived from field
SOC:IDCOBERTURA        LIKE(SOC:IDCOBERTURA)          !List box control field - type derived from field
SOC:IDLOCALIDAD        LIKE(SOC:IDLOCALIDAD)          !List box control field - type derived from field
SOC:IDUSUARIO          LIKE(SOC:IDUSUARIO)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:N_DOCUMENTO        LIKE(SOC:N_DOCUMENTO)          !List box control field - type derived from field
SOC:DIRECCION          LIKE(SOC:DIRECCION)            !List box control field - type derived from field
SOC:IDCIRCULO          LIKE(SOC:IDCIRCULO)            !Browse key field - type derived from field
SOC:IDINSTITUCION      LIKE(SOC:IDINSTITUCION)        !Browse key field - type derived from field
SOC:ID_TIPO_DOC        LIKE(SOC:ID_TIPO_DOC)          !Browse key field - type derived from field
SOC:ACTA               LIKE(SOC:ACTA)                 !Browse key field - type derived from field
SOC:BAJA               LIKE(SOC:BAJA)                 !Browse key field - type derived from field
SOC:LIBRO              LIKE(SOC:LIBRO)                !Browse key field - type derived from field
SOC:NRO_VIEJO          LIKE(SOC:NRO_VIEJO)            !Browse key field - type derived from field
SOC:PROVISORIO         LIKE(SOC:PROVISORIO)           !Browse key field - type derived from field
SOC:INGRESO            LIKE(SOC:INGRESO)              !Browse key field - type derived from field
SOC:IDTIPOTITULO       LIKE(SOC:IDTIPOTITULO)         !Browse key field - type derived from field
SOC:IDMINISTERIO       LIKE(SOC:IDMINISTERIO)         !Browse key field - type derived from field
SOC:IDCS               LIKE(SOC:IDCS)                 !Browse key field - type derived from field
SOC:IDPROVEEDOR        LIKE(SOC:IDPROVEEDOR)          !Browse key field - type derived from field
SOC:TIPOIVA            LIKE(SOC:TIPOIVA)              !Browse key field - type derived from field
SOC:IDBANCO            LIKE(SOC:IDBANCO)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a SOCIOS Record'),AT(,,358,258),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectSOCIOS'),SYSTEM
                       LIST,AT(8,90,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSOCIO~C(0)@n-14@40R(2)' & |
  '|M~MATRICULA~C(0)@n-5@64R(2)|M~IDZONA~C(0)@n-14@64R(2)|M~IDCOBERTURA~C(0)@n-14@64R(2' & |
  ')|M~IDLOCALIDAD~C(0)@n-14@64R(2)|M~IDUSUARIO~C(0)@n-14@80L(2)|M~NOMBRE~L(2)@s100@64R' & |
  '(2)|M~N DOCUMENTO~C(0)@n-14@80L(2)|M~DIRECCION~L(2)@s100@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de SOCIOS')
                       BUTTON('&Elegir'),AT(301,218,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,232),USE(?CurrentTab)
                         TAB('PK_SOCIOS'),USE(?Tab:2)
                         END
                         TAB('IDX_SOCIOS_DOCUMENTO'),USE(?Tab:3)
                         END
                         TAB('IDX_SOCIOS_MATRICULA'),USE(?Tab:4)
                         END
                         TAB('FK_SOCIOS_CIRCULO'),USE(?Tab:5)
                         END
                         TAB('FK_SOCIOS_COBERTURA'),USE(?Tab:6)
                         END
                         TAB('FK_SOCIOS_INSTITUCION'),USE(?Tab:7)
                         END
                         TAB('FK_SOCIOS_LOCALIDAD'),USE(?Tab:8)
                         END
                         TAB('FK_SOCIOS_TIPO_DOC'),USE(?Tab:9)
                         END
                         TAB('FK_SOCIOS_USUARIO'),USE(?Tab:10)
                         END
                         TAB('FK_SOCIOS_ZONA_VIVENDA'),USE(?Tab:11)
                         END
                         TAB('IDX_SOCIOS_ACTA'),USE(?Tab:12)
                         END
                         TAB('IDX_SOCIOS_BAJA'),USE(?Tab:13)
                         END
                         TAB('IDX_SOCIOS_LIBRO'),USE(?Tab:14)
                         END
                         TAB('IDX_SOCIOS_NOMBRE'),USE(?Tab:15)
                         END
                         TAB('IDX_SOCIOS_N_VIEJO'),USE(?Tab:16)
                         END
                         TAB('IDX_SOCIOS_PROVISORIO'),USE(?Tab:17)
                         END
                         TAB('IDX_SOCIO_INGRESO'),USE(?Tab:18)
                         END
                         TAB('FK_SOCIOS_TIPO_TITULO'),USE(?Tab:19)
                         END
                         TAB('IDX_SOCIOS_MINISTERIO'),USE(?Tab:20)
                         END
                         TAB('SOCIOS_CENTRO_SALUD'),USE(?Tab:21)
                         END
                         TAB('IDX_SOCIOS_PROVEEDOR'),USE(?Tab:22)
                         END
                         TAB('FK_SOCIOS_TIPO_IVA'),USE(?Tab:23)
                         END
                         TAB('FK_SOCIOS_BANCO'),USE(?Tab:24)
                         END
                       END
                       BUTTON('&Salir'),AT(305,240,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,73),USE(?SortOrderList:Prompt)
                       LIST,AT(48,73,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
BRW1::Sort8:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 9
BRW1::Sort9:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 10
BRW1::Sort10:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 11
BRW1::Sort11:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 12
BRW1::Sort12:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 13
BRW1::Sort13:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 14
BRW1::Sort14:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 15
BRW1::Sort15:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 16
BRW1::Sort16:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 17
BRW1::Sort17:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 18
BRW1::Sort18:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 19
BRW1::Sort19:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 20
BRW1::Sort20:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 21
BRW1::Sort21:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 22
BRW1::Sort22:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 23
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
  GlobalErrors.SetProcedureName('SelectSOCIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('SOC:N_DOCUMENTO',SOC:N_DOCUMENTO)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:ID_TIPO_DOC',SOC:ID_TIPO_DOC)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:NRO_VIEJO',SOC:NRO_VIEJO)                      ! Added by: BrowseBox(ABC)
  BIND('SOC:IDBANCO',SOC:IDBANCO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:5{PROP:TEXT},1,1)='&',SUB(?Tab:5{PROP:TEXT},2,LEN(?Tab:5{PROP:TEXT})-1),?Tab:5{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:6{PROP:TEXT},1,1)='&',SUB(?Tab:6{PROP:TEXT},2,LEN(?Tab:6{PROP:TEXT})-1),?Tab:6{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:7{PROP:TEXT},1,1)='&',SUB(?Tab:7{PROP:TEXT},2,LEN(?Tab:7{PROP:TEXT})-1),?Tab:7{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:8{PROP:TEXT},1,1)='&',SUB(?Tab:8{PROP:TEXT},2,LEN(?Tab:8{PROP:TEXT})-1),?Tab:8{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:9{PROP:TEXT},1,1)='&',SUB(?Tab:9{PROP:TEXT},2,LEN(?Tab:9{PROP:TEXT})-1),?Tab:9{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:10{PROP:TEXT},1,1)='&',SUB(?Tab:10{PROP:TEXT},2,LEN(?Tab:10{PROP:TEXT})-1),?Tab:10{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:11{PROP:TEXT},1,1)='&',SUB(?Tab:11{PROP:TEXT},2,LEN(?Tab:11{PROP:TEXT})-1),?Tab:11{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:12{PROP:TEXT},1,1)='&',SUB(?Tab:12{PROP:TEXT},2,LEN(?Tab:12{PROP:TEXT})-1),?Tab:12{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:13{PROP:TEXT},1,1)='&',SUB(?Tab:13{PROP:TEXT},2,LEN(?Tab:13{PROP:TEXT})-1),?Tab:13{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:14{PROP:TEXT},1,1)='&',SUB(?Tab:14{PROP:TEXT},2,LEN(?Tab:14{PROP:TEXT})-1),?Tab:14{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:15{PROP:TEXT},1,1)='&',SUB(?Tab:15{PROP:TEXT},2,LEN(?Tab:15{PROP:TEXT})-1),?Tab:15{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:16{PROP:TEXT},1,1)='&',SUB(?Tab:16{PROP:TEXT},2,LEN(?Tab:16{PROP:TEXT})-1),?Tab:16{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:17{PROP:TEXT},1,1)='&',SUB(?Tab:17{PROP:TEXT},2,LEN(?Tab:17{PROP:TEXT})-1),?Tab:17{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:18{PROP:TEXT},1,1)='&',SUB(?Tab:18{PROP:TEXT},2,LEN(?Tab:18{PROP:TEXT})-1),?Tab:18{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:19{PROP:TEXT},1,1)='&',SUB(?Tab:19{PROP:TEXT},2,LEN(?Tab:19{PROP:TEXT})-1),?Tab:19{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:20{PROP:TEXT},1,1)='&',SUB(?Tab:20{PROP:TEXT},2,LEN(?Tab:20{PROP:TEXT})-1),?Tab:20{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:21{PROP:TEXT},1,1)='&',SUB(?Tab:21{PROP:TEXT},2,LEN(?Tab:21{PROP:TEXT})-1),?Tab:21{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:22{PROP:TEXT},1,1)='&',SUB(?Tab:22{PROP:TEXT},2,LEN(?Tab:22{PROP:TEXT})-1),?Tab:22{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:23{PROP:TEXT},1,1)='&',SUB(?Tab:23{PROP:TEXT},2,LEN(?Tab:23{PROP:TEXT})-1),?Tab:23{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:24{PROP:TEXT},1,1)='&',SUB(?Tab:24{PROP:TEXT},2,LEN(?Tab:24{PROP:TEXT})-1),?Tab:24{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_DOCUMENTO)             ! Add the sort order for SOC:IDX_SOCIOS_DOCUMENTO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SOC:N_DOCUMENTO,,BRW1)         ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_DOCUMENTO , SOC:N_DOCUMENTO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MATRICULA)             ! Add the sort order for SOC:IDX_SOCIOS_MATRICULA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,SOC:MATRICULA,,BRW1)           ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_MATRICULA , SOC:MATRICULA
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_CIRCULO)                ! Add the sort order for SOC:FK_SOCIOS_CIRCULO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,SOC:IDCIRCULO,,BRW1)           ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_CIRCULO , SOC:IDCIRCULO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_COBERTURA)              ! Add the sort order for SOC:FK_SOCIOS_COBERTURA for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,SOC:IDCOBERTURA,,BRW1)         ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_COBERTURA , SOC:IDCOBERTURA
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_INSTITUCION)            ! Add the sort order for SOC:FK_SOCIOS_INSTITUCION for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,SOC:IDINSTITUCION,,BRW1)       ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_INSTITUCION , SOC:IDINSTITUCION
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_LOCALIDAD)              ! Add the sort order for SOC:FK_SOCIOS_LOCALIDAD for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,SOC:IDLOCALIDAD,,BRW1)         ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_LOCALIDAD , SOC:IDLOCALIDAD
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_TIPO_DOC)               ! Add the sort order for SOC:FK_SOCIOS_TIPO_DOC for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,SOC:ID_TIPO_DOC,,BRW1)         ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_TIPO_DOC , SOC:ID_TIPO_DOC
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_USUARIO)                ! Add the sort order for SOC:FK_SOCIOS_USUARIO for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,SOC:IDUSUARIO,,BRW1)           ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_USUARIO , SOC:IDUSUARIO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_ZONA_VIVENDA)           ! Add the sort order for SOC:FK_SOCIOS_ZONA_VIVENDA for sort order 9
  BRW1.AddLocator(BRW1::Sort9:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort9:Locator.Init(,SOC:IDZONA,,BRW1)              ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_ZONA_VIVENDA , SOC:IDZONA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_ACTA)                  ! Add the sort order for SOC:IDX_SOCIOS_ACTA for sort order 10
  BRW1.AddLocator(BRW1::Sort10:Locator)                    ! Browse has a locator for sort order 10
  BRW1::Sort10:Locator.Init(,SOC:ACTA,,BRW1)               ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_ACTA , SOC:ACTA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_BAJA)                  ! Add the sort order for SOC:IDX_SOCIOS_BAJA for sort order 11
  BRW1.AddLocator(BRW1::Sort11:Locator)                    ! Browse has a locator for sort order 11
  BRW1::Sort11:Locator.Init(,SOC:BAJA,,BRW1)               ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_BAJA , SOC:BAJA
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_LIBRO)                 ! Add the sort order for SOC:IDX_SOCIOS_LIBRO for sort order 12
  BRW1.AddLocator(BRW1::Sort12:Locator)                    ! Browse has a locator for sort order 12
  BRW1::Sort12:Locator.Init(,SOC:LIBRO,,BRW1)              ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_LIBRO , SOC:LIBRO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 13
  BRW1.AddLocator(BRW1::Sort13:Locator)                    ! Browse has a locator for sort order 13
  BRW1::Sort13:Locator.Init(,SOC:NOMBRE,,BRW1)             ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_N_VIEJO)               ! Add the sort order for SOC:IDX_SOCIOS_N_VIEJO for sort order 14
  BRW1.AddLocator(BRW1::Sort14:Locator)                    ! Browse has a locator for sort order 14
  BRW1::Sort14:Locator.Init(,SOC:NRO_VIEJO,,BRW1)          ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_N_VIEJO , SOC:NRO_VIEJO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_PROVISORIO)            ! Add the sort order for SOC:IDX_SOCIOS_PROVISORIO for sort order 15
  BRW1.AddLocator(BRW1::Sort15:Locator)                    ! Browse has a locator for sort order 15
  BRW1::Sort15:Locator.Init(,SOC:PROVISORIO,,BRW1)         ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_PROVISORIO , SOC:PROVISORIO
  BRW1.AddSortOrder(,SOC:IDX_SOCIO_INGRESO)                ! Add the sort order for SOC:IDX_SOCIO_INGRESO for sort order 16
  BRW1.AddLocator(BRW1::Sort16:Locator)                    ! Browse has a locator for sort order 16
  BRW1::Sort16:Locator.Init(,SOC:INGRESO,,BRW1)            ! Initialize the browse locator using  using key: SOC:IDX_SOCIO_INGRESO , SOC:INGRESO
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_TIPO_TITULO)            ! Add the sort order for SOC:FK_SOCIOS_TIPO_TITULO for sort order 17
  BRW1.AddLocator(BRW1::Sort17:Locator)                    ! Browse has a locator for sort order 17
  BRW1::Sort17:Locator.Init(,SOC:IDTIPOTITULO,,BRW1)       ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_TIPO_TITULO , SOC:IDTIPOTITULO
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MINISTERIO)            ! Add the sort order for SOC:IDX_SOCIOS_MINISTERIO for sort order 18
  BRW1.AddLocator(BRW1::Sort18:Locator)                    ! Browse has a locator for sort order 18
  BRW1::Sort18:Locator.Init(,SOC:IDMINISTERIO,,BRW1)       ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_MINISTERIO , SOC:IDMINISTERIO
  BRW1.AddSortOrder(,SOC:SOCIOS_CENTRO_SALUD)              ! Add the sort order for SOC:SOCIOS_CENTRO_SALUD for sort order 19
  BRW1.AddLocator(BRW1::Sort19:Locator)                    ! Browse has a locator for sort order 19
  BRW1::Sort19:Locator.Init(,SOC:IDCS,,BRW1)               ! Initialize the browse locator using  using key: SOC:SOCIOS_CENTRO_SALUD , SOC:IDCS
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_PROVEEDOR)             ! Add the sort order for SOC:IDX_SOCIOS_PROVEEDOR for sort order 20
  BRW1.AddLocator(BRW1::Sort20:Locator)                    ! Browse has a locator for sort order 20
  BRW1::Sort20:Locator.Init(,SOC:IDPROVEEDOR,,BRW1)        ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_PROVEEDOR , SOC:IDPROVEEDOR
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_TIPO_IVA)               ! Add the sort order for SOC:FK_SOCIOS_TIPO_IVA for sort order 21
  BRW1.AddLocator(BRW1::Sort21:Locator)                    ! Browse has a locator for sort order 21
  BRW1::Sort21:Locator.Init(,SOC:TIPOIVA,1,BRW1)           ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_TIPO_IVA , SOC:TIPOIVA
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_BANCO)                  ! Add the sort order for SOC:FK_SOCIOS_BANCO for sort order 22
  BRW1.AddLocator(BRW1::Sort22:Locator)                    ! Browse has a locator for sort order 22
  BRW1::Sort22:Locator.Init(,SOC:IDBANCO,,BRW1)            ! Initialize the browse locator using  using key: SOC:FK_SOCIOS_BANCO , SOC:IDBANCO
  BRW1.AddSortOrder(,SOC:PK_SOCIOS)                        ! Add the sort order for SOC:PK_SOCIOS for sort order 23
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 23
  BRW1::Sort0:Locator.Init(,SOC:IDSOCIO,,BRW1)             ! Initialize the browse locator using  using key: SOC:PK_SOCIOS , SOC:IDSOCIO
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDZONA,BRW1.Q.SOC:IDZONA)              ! Field SOC:IDZONA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCOBERTURA,BRW1.Q.SOC:IDCOBERTURA)    ! Field SOC:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDLOCALIDAD,BRW1.Q.SOC:IDLOCALIDAD)    ! Field SOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDUSUARIO,BRW1.Q.SOC:IDUSUARIO)        ! Field SOC:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:N_DOCUMENTO,BRW1.Q.SOC:N_DOCUMENTO)    ! Field SOC:N_DOCUMENTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:DIRECCION,BRW1.Q.SOC:DIRECCION)        ! Field SOC:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCIRCULO,BRW1.Q.SOC:IDCIRCULO)        ! Field SOC:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDINSTITUCION,BRW1.Q.SOC:IDINSTITUCION) ! Field SOC:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ID_TIPO_DOC,BRW1.Q.SOC:ID_TIPO_DOC)    ! Field SOC:ID_TIPO_DOC is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ACTA,BRW1.Q.SOC:ACTA)                  ! Field SOC:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA,BRW1.Q.SOC:BAJA)                  ! Field SOC:BAJA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:LIBRO,BRW1.Q.SOC:LIBRO)                ! Field SOC:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NRO_VIEJO,BRW1.Q.SOC:NRO_VIEJO)        ! Field SOC:NRO_VIEJO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:PROVISORIO,BRW1.Q.SOC:PROVISORIO)      ! Field SOC:PROVISORIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:INGRESO,BRW1.Q.SOC:INGRESO)            ! Field SOC:INGRESO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDTIPOTITULO,BRW1.Q.SOC:IDTIPOTITULO)  ! Field SOC:IDTIPOTITULO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDMINISTERIO,BRW1.Q.SOC:IDMINISTERIO)  ! Field SOC:IDMINISTERIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCS,BRW1.Q.SOC:IDCS)                  ! Field SOC:IDCS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDPROVEEDOR,BRW1.Q.SOC:IDPROVEEDOR)    ! Field SOC:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TIPOIVA,BRW1.Q.SOC:TIPOIVA)            ! Field SOC:TIPOIVA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDBANCO,BRW1.Q.SOC:IDBANCO)            ! Field SOC:IDBANCO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSOCIOS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectSOCIOS',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab:5)
       SELECT(?Tab:6)
       SELECT(?Tab:7)
       SELECT(?Tab:8)
       SELECT(?Tab:9)
       SELECT(?Tab:10)
       SELECT(?Tab:11)
       SELECT(?Tab:12)
       SELECT(?Tab:13)
       SELECT(?Tab:14)
       SELECT(?Tab:15)
       SELECT(?Tab:16)
       SELECT(?Tab:17)
       SELECT(?Tab:18)
       SELECT(?Tab:19)
       SELECT(?Tab:20)
       SELECT(?Tab:21)
       SELECT(?Tab:22)
       SELECT(?Tab:23)
       SELECT(?Tab:24)
      END
    END
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSIF CHOICE(?CurrentTab) = 10
    RETURN SELF.SetSort(9,Force)
  ELSIF CHOICE(?CurrentTab) = 11
    RETURN SELF.SetSort(10,Force)
  ELSIF CHOICE(?CurrentTab) = 12
    RETURN SELF.SetSort(11,Force)
  ELSIF CHOICE(?CurrentTab) = 13
    RETURN SELF.SetSort(12,Force)
  ELSIF CHOICE(?CurrentTab) = 14
    RETURN SELF.SetSort(13,Force)
  ELSIF CHOICE(?CurrentTab) = 15
    RETURN SELF.SetSort(14,Force)
  ELSIF CHOICE(?CurrentTab) = 16
    RETURN SELF.SetSort(15,Force)
  ELSIF CHOICE(?CurrentTab) = 17
    RETURN SELF.SetSort(16,Force)
  ELSIF CHOICE(?CurrentTab) = 18
    RETURN SELF.SetSort(17,Force)
  ELSIF CHOICE(?CurrentTab) = 19
    RETURN SELF.SetSort(18,Force)
  ELSIF CHOICE(?CurrentTab) = 20
    RETURN SELF.SetSort(19,Force)
  ELSIF CHOICE(?CurrentTab) = 21
    RETURN SELF.SetSort(20,Force)
  ELSIF CHOICE(?CurrentTab) = 22
    RETURN SELF.SetSort(21,Force)
  ELSIF CHOICE(?CurrentTab) = 23
    RETURN SELF.SetSort(22,Force)
  ELSE
    RETURN SELF.SetSort(23,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the FACTURA file
!!! </summary>
ArchivoFACTURA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(FACTURA)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                       PROJECT(FAC:IDUSUARIO)
                       PROJECT(FAC:MONTOCOBERTURA)
                       PROJECT(FAC:INTERES)
                       PROJECT(FAC:TOTAL)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:PERIODO)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:FECHA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:IDSOCIO            LIKE(FAC:IDSOCIO)              !List box control field - type derived from field
FAC:IDUSUARIO          LIKE(FAC:IDUSUARIO)            !List box control field - type derived from field
FAC:MONTOCOBERTURA     LIKE(FAC:MONTOCOBERTURA)       !List box control field - type derived from field
FAC:INTERES            LIKE(FAC:INTERES)              !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:PERIODO            LIKE(FAC:PERIODO)              !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !Browse key field - type derived from field
FAC:FECHA              LIKE(FAC:FECHA)                !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the FACTURA file'),AT(,,358,208),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ArchivoFACTURA'),SYSTEM
                       LIST,AT(8,40,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDFACTURA~C(0)@n-14@64R(' & |
  '2)|M~IDSOCIO~C(0)@n-14@64R(2)|M~IDUSUARIO~C(0)@n-14@60D(12)|M~MONTOCOBERTURA~C(0)@n-' & |
  '10.2@48D(16)|M~INTERES~C(0)@n-10.2@48D(20)|M~TOTAL~C(0)@n-10.2@64R(2)|M~MES~C(0)@n-1' & |
  '4@64R(2)|M~ANO~C(0)@n-14@48L(2)|M~PERIODO~L(2)@s11@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de FACTURA')
                       BUTTON('&Ver'),AT(142,168,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,168,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,168,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,168,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,182),USE(?CurrentTab)
                         TAB('PK_FACTURA'),USE(?Tab:2)
                         END
                         TAB('FK_FACTURA_SOCIO'),USE(?Tab:3)
                           BUTTON('Select SOCIOS'),AT(8,168,118,14),USE(?SelectSOCIOS),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                         TAB('FK_FACTURA_USUARIO'),USE(?Tab:4)
                           BUTTON('Select USUARIO'),AT(8,168,118,14),USE(?SelectUSUARIO),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                         TAB('IDX_FACTURA_ANO'),USE(?Tab:5)
                         END
                         TAB('IDX_FACTURA_ESTADO'),USE(?Tab:6)
                         END
                         TAB('IDX_FACTURA_FECHA'),USE(?Tab:7)
                         END
                         TAB('IDX_FACTURA_MES'),USE(?Tab:8)
                         END
                         TAB('IDX_FACTURA_PERIODO'),USE(?Tab:9)
                         END
                         TAB('IDX_FACTURA_TOTAL'),USE(?Tab:10)
                         END
                       END
                       BUTTON('&Salir'),AT(305,190,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,23),USE(?SortOrderList:Prompt)
                       LIST,AT(48,23,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
BRW1::Sort8:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 9
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
  GlobalErrors.SetProcedureName('ArchivoFACTURA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FAC:IDFACTURA',FAC:IDFACTURA)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:FACTURA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:5{PROP:TEXT},1,1)='&',SUB(?Tab:5{PROP:TEXT},2,LEN(?Tab:5{PROP:TEXT})-1),?Tab:5{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:6{PROP:TEXT},1,1)='&',SUB(?Tab:6{PROP:TEXT},2,LEN(?Tab:6{PROP:TEXT})-1),?Tab:6{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:7{PROP:TEXT},1,1)='&',SUB(?Tab:7{PROP:TEXT},2,LEN(?Tab:7{PROP:TEXT})-1),?Tab:7{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:8{PROP:TEXT},1,1)='&',SUB(?Tab:8{PROP:TEXT},2,LEN(?Tab:8{PROP:TEXT})-1),?Tab:8{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:9{PROP:TEXT},1,1)='&',SUB(?Tab:9{PROP:TEXT},2,LEN(?Tab:9{PROP:TEXT})-1),?Tab:9{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:10{PROP:TEXT},1,1)='&',SUB(?Tab:10{PROP:TEXT},2,LEN(?Tab:10{PROP:TEXT})-1),?Tab:10{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,FAC:FK_FACTURA_SOCIO)                 ! Add the sort order for FAC:FK_FACTURA_SOCIO for sort order 1
  BRW1.AddRange(FAC:IDSOCIO,Relate:FACTURA,Relate:SOCIOS)  ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,FAC:FK_FACTURA_USUARIO)               ! Add the sort order for FAC:FK_FACTURA_USUARIO for sort order 2
  BRW1.AddRange(FAC:IDUSUARIO,Relate:FACTURA,Relate:USUARIO) ! Add file relationship range limit for sort order 2
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_ANO)                  ! Add the sort order for FAC:IDX_FACTURA_ANO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,FAC:ANO,,BRW1)                 ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_ANO , FAC:ANO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_ESTADO)               ! Add the sort order for FAC:IDX_FACTURA_ESTADO for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,FAC:ESTADO,,BRW1)              ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_ESTADO , FAC:ESTADO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_FECHA)                ! Add the sort order for FAC:IDX_FACTURA_FECHA for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,FAC:FECHA,,BRW1)               ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_FECHA , FAC:FECHA
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_MES)                  ! Add the sort order for FAC:IDX_FACTURA_MES for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,FAC:MES,,BRW1)                 ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_MES , FAC:MES
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_PERIODO)              ! Add the sort order for FAC:IDX_FACTURA_PERIODO for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,FAC:PERIODO,,BRW1)             ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_PERIODO , FAC:PERIODO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_TOTAL)                ! Add the sort order for FAC:IDX_FACTURA_TOTAL for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,FAC:TOTAL,,BRW1)               ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_TOTAL , FAC:TOTAL
  BRW1.AddSortOrder(,FAC:PK_FACTURA)                       ! Add the sort order for FAC:PK_FACTURA for sort order 9
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort0:Locator.Init(,FAC:IDFACTURA,,BRW1)           ! Initialize the browse locator using  using key: FAC:PK_FACTURA , FAC:IDFACTURA
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDSOCIO,BRW1.Q.FAC:IDSOCIO)            ! Field FAC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDUSUARIO,BRW1.Q.FAC:IDUSUARIO)        ! Field FAC:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MONTOCOBERTURA,BRW1.Q.FAC:MONTOCOBERTURA) ! Field FAC:MONTOCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:INTERES,BRW1.Q.FAC:INTERES)            ! Field FAC:INTERES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:TOTAL,BRW1.Q.FAC:TOTAL)                ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:PERIODO,BRW1.Q.FAC:PERIODO)            ! Field FAC:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ESTADO,BRW1.Q.FAC:ESTADO)              ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:FECHA,BRW1.Q.FAC:FECHA)                ! Field FAC:FECHA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ArchivoFACTURA',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateFACTURA
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FACTURA.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ArchivoFACTURA',QuickWindow)            ! Save window data to non-volatile store
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
    UpdateFACTURA
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


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
    OF ?SelectSOCIOS
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectSOCIOS()
      ThisWindow.Reset
    OF ?SelectUSUARIO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectUSUARIO()
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab:5)
       SELECT(?Tab:6)
       SELECT(?Tab:7)
       SELECT(?Tab:8)
       SELECT(?Tab:9)
       SELECT(?Tab:10)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSE
    RETURN SELF.SetSort(9,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

