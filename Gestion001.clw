

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION011.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION014.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION016.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION017.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION019.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION020.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION022.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION023.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION024.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION025.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION026.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION027.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION028.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION029.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION031.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION032.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION033.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION034.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION035.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION037.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! SEGURIDAD
!!! </summary>
SEGURIDAD PROCEDURE 

LOC1:DESCRIPCION     CSTRING(21)                           ! 
LOC1:PASSWORD        CSTRING(20)                           ! 
LOC1:ENTRO           ULONG                                 ! 
LOC1:OK              SHORT                                 ! 
Window               WINDOW('Seguridad '),AT(,,185,70),FONT('Arial',8,,FONT:regular),CENTER,ICON('id_card.ico'), |
  GRAY,IMM,SYSTEM
                       PROMPT('USUARIO:'),AT(31,9),USE(?LOC:DESCRIPCION:Prompt)
                       ENTRY(@s20),AT(81,8,60,10),USE(LOC1:DESCRIPCION),INS,UPR
                       PROMPT('PASSWORD:'),AT(31,25),USE(?LOC:PASSWORD:Prompt)
                       ENTRY(@s19),AT(81,24,60,10),USE(LOC1:PASSWORD),INS,UPR,PASSWORD,REQ
                       BUTTON('OK'),AT(15,46,60,18),USE(?OkButton),LEFT,ICON('id_card_ok.ico'),DEFAULT,FLAT
                       BUTTON('Cancelar'),AT(107,47,61,17),USE(?CancelButton),LEFT,ICON('id_card_delete.ico'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  RETURN(LOC1:OK)

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
  GlobalErrors.SetProcedureName('SEGURIDAD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LOC:DESCRIPCION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SEGURIDAD',Window)                         ! Restore window settings from non-volatile store
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
    INIMgr.Update('SEGURIDAD',Window)                      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?OkButton
      if LOC1:ENTRO < 3 then
          USU:DESCRIPCION = LOC1:DESCRIPCION
          get(usuario,USU:USUARIO_IDX1)
          if errorcode() = 35 then
              Message('Carga de Usuarioo el Password es  Incorrecto','Seguridad')
              select(?LOC1:DESCRIPCION)
              LOC1:ENTRO = LOC1:ENTRO + 1
              Return Level:Notify
          else
              if USU:CONTRASENA <> LOC1:PASSWORD then
                  Message('Carga de Usuario o el Password es Incorrecto','Seguridad')
                  select(?LOC1:DESCRIPCION)
                  LOC1:ENTRO = LOC1:ENTRO + 1
                  Return Level:Notify
              else
      
                  !Post(event:closewindow)
                  GLO:IDUSUARIO = USU:IDUSUARIO
                  GlO:NIVEL = USU:NIVEL
                  LOC1:OK = TRUE
                  BREAK
              end
          end
      else
          halt(0,'Entrada Icorrecta -- Access Denegado -- ')
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CancelButton
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
      halt(0)
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

!!! <summary>
!!! Generated from procedure template - Frame
!!! Gestion.dct
!!! </summary>
Main PROCEDURE 

SQLOpenWindow        WINDOW('Initializing Database'),AT(,,208,26),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY,DOUBLE
                       STRING('This process could take several seconds.'),AT(27,12)
                       IMAGE(Icon:Connect),AT(4,4,23,17)
                       STRING('Please wait while the program connects to the database.'),AT(27,3)
                     END

AppFrame             APPLICATION('Sistema de Gestión Colegio de Psicologos del Valle Inferior  de Río Negro '), |
  AT(,,537,318),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER,ICON('logo.ico'),MAX,STATUS(-1, |
  80,120,45),SYSTEM,IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&Archivo'),USE(?FileMenu)
                           ITEM('&Configuracion Impresora'),USE(?PrintSetup),MSG('Configuracion Impresora'),STD(STD:PrintSetup)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('&Salir'),USE(?Exit),MSG('Salir de la Aplicacion'),STD(STD:Close)
                         END
                         MENU('&Padrón'),USE(?BrowseMenu)
                           ITEM('Ver Padrón '),USE(?PadrónVERPADRONODONTOLOGOS)
                           ITEM('ABM Padron'),USE(?BrowseSOCIOS),MSG('Browse SOCIOS')
                           ITEM('ABM Consultorios'),USE(?BrowseCONSULTORIO),MSG('Browse CONSULTORIO')
                           ITEM('ABM Trabajos x Socios'),USE(?PadrónABMTRABAJOSXSOCIOS)
                           ITEM('ABM  Curriculum Vitae'),USE(?BrowseCV),MSG('Browse CV')
                           ITEM('ABM Inspector'),USE(?BrowseINSPECTOR),MSG('Browse INSPECTOR')
                           ITEM('ABM  Especialidad por Profesional'),USE(?BrowsePADRONXESPECIALIDAD),MSG('Browse PAD' & |
  'RONXESPECIALIDAD')
                           ITEM('Cancelación de Matrícula Prefesional (Baja)'),USE(?BrowseRENUNCIA),MSG('Browse RENUNCIA')
                           ITEM('ABM  Servicio por Colegiado'),USE(?BrowseSERVICIOXSOCIO),MSG('Browse SERVICIOXSOCIO')
                           ITEM('Comunicación al Colegiado'),USE(?PadrónComunicaciónalOdontologo)
                           ITEM('Cumpleaños'),USE(?PadrónCumpleaños)
                           MENU('Exportar'),USE(?MENU2)
                             ITEM('Datos al Ministerio de Salud'),USE(?PadrónExportarDatosalMinisteriodeSalud),HIDE
                             ITEM('Web'),USE(?ITEM1)
                           END
                         END
                         MENU('&Cuotas'),USE(?Cuotas)
                           MENU('Facturacion'),USE(?CuotasFacturacion)
                             ITEM('Total'),USE(?CuotasFacturacionTotal)
                             ITEM('Individual'),USE(?CuotasFacturacionIndividual)
                             ITEM('Ver Facturas'),USE(?CuotasFacturacionVerFacturas)
                             ITEM('Generar Cupones de Pago'),USE(?CuotasFacturacionGenerarCuponesdePago)
                             MENU('Factura Anual'),USE(?menu1)
                               ITEM('Generar Factura Individual'),USE(?GenerarFacturaIndividual)
                               ITEM('Generar Factura Total'),USE(?GenerarFacturaTotal)
                             END
                           END
                           MENU('Convenios'),USE(?CuotasConvenios)
                             ITEM('Carga de Convenio'),USE(?BrowseCONVENIO),MSG('Browse CONVENIO')
                             ITEM('&Pago'),USE(?CuotasConveniosPago),DISABLE,HIDE
                             ITEM('Cancelación'),USE(?CuotasConveniosRenovación)
                           END
                           MENU('&Pagos'),USE(?CuotasPagos)
                             ITEM('Carga Multicuotas'),USE(?CuotasPagosCargaMulticuotas)
                             ITEM('Cargar Pagos'),USE(?BrowsePAGOS),MSG('Browse PAGOS')
                             ITEM('Ver Pagos'),USE(?CuotasPagosVerPagos)
                             ITEM('Cargar Colegiados  por  Distrito'),USE(?CuotasPagosCargarSociosporCirculo)
                           END
                           ITEM('ABM  Servicios'),USE(?BrowseSERVICIOS),MSG('Browse SERVICIOS')
                           ITEM('Generar Liquidación al Banco'),USE(?CuotasGenerarLiquidaciónalBanco)
                         END
                         MENU('Cer&tificaciones'),USE(?Certificaciones)
                           ITEM('Matricula'),USE(?CertificacionesItem64)
                           ITEM('Imprimir CV'),USE(?CertificacionesImprimirCV)
                           MENU('Consultorios'),USE(?CertificacionesConsultorios2)
                             ITEM('Titulares'),USE(?CertificacionesConsultorios)
                             ITEM('Adherentes'),USE(?CertificacionesConsultoriosAdherentes)
                           END
                         END
                         MENU('Ad&ministración'),USE(?Administración)
                           ITEM('Ingresos'),USE(?AdministraciónIngresos)
                           ITEM('Egresos'),USE(?AdministraciónEgresos)
                           ITEM('ABM Proveedor'),USE(?AdministraciónABMProveedores)
                           ITEM('ABM INFORMES'),USE(?AdministraciónABMINFORMES)
                           MENU('Informes'),USE(?AdministraciónInformes)
                             ITEM('Caja '),USE(?InformesCajaItem67)
                             ITEM('Libro Diaros'),USE(?AdministraciónInformesLibroDiaros)
                             ITEM('Recibos Emitidos - INGRESOS'),USE(?AdministraciónInformesRecivosEmitidos)
                             ITEM('OPA Emitidos - EGRESOS'),USE(?AdministraciónInformesEgresos)
                             ITEM('Informe de Ingresos  por Cuenta'),USE(?AdministraciónInformesInformeporCuenta)
                             ITEM('Informe de Egresos por Cuenta'),USE(?AdministraciónInformesInformedeEgresosporCuenta)
                           END
                         END
                         MENU('&Liquidaciones'),USE(?Liquidaciones)
                           ITEM('Carga Liquidación'),USE(?LiquidacionesCargaLiquidación)
                           ITEM('Presentación a las OS'),USE(?LiquidacionesPresentación)
                           ITEM('Cobro de las OS'),USE(?LiquidacionesPago)
                           ITEM('Pago a Relaizar'),USE(?LiquidacionesPago2),DISABLE,HIDE
                           ITEM('Pago de Liquidación'),USE(?LiquidacionesPagos)
                           ITEM,USE(?SEPARATOR2),SEPARATOR
                           ITEM('ABM Obras Sociales'),USE(?LiquidacionesObrasSociales)
                           ITEM('N&omenclador'),USE(?LiquidacionesNomenclador)
                         END
                         MENU('&Cursos'),USE(?Cursos)
                           ITEM('ABM Cursos'),USE(?CursosABMCursos)
                           ITEM('Inscripción'),USE(?CursosInscripción)
                           ITEM('Pago'),USE(?CursosPago)
                           ITEM,USE(?SEPARATOR3),SEPARATOR
                           MENU('Certificados'),USE(?CursosCer)
                             ITEM('Modulos'),USE(?CursosCertificadosModulos)
                             ITEM('Alumnos'),USE(?CursosCertificadosAlumnos)
                           END
                           ITEM('Importación de Datos Externos'),USE(?CursosImportacióndeDatosExternos)
                           ITEM('Carga Módulos Curso'),USE(?CursosCargaMódulosCurso)
                         END
                         MENU('ME / MS'),USE(?MesadeEntradaSalida)
                           ITEM('Entradas'),USE(?MesadeEntradaSalidaMesadeEntradas)
                           ITEM('Salidas'),USE(?MesadeEntradaSalidaItem118)
                           ITEM,USE(?SEPARATOR4),SEPARATOR
                           ITEM('ABM TIPO'),USE(?MesadeEntradaSalidaABMTIPO)
                           ITEM('ABM DPTOS'),USE(?MesadeEntradaSalidaABMDPTOS)
                           ITEM('ABM ESTADOS'),USE(?MesadeEntradaSalidaABMESTADOS)
                         END
                         MENU('&Informes'),USE(?ReportMenu),MSG('Report data')
                           MENU('Cuotas'),USE(?InformesEtiquetas)
                             MENU('Estado de Deuda Cuotas '),USE(?InformesCuotasEstadodeDeuda)
                               ITEM('Deudas al Día'),USE(?InformesCuotasEstadodeDeudaCuotasDeudasalDía)
                               ITEM('Cant. de Cuotas Adeudadas'),USE(?InformesCuotasEstadodeDeudaCantdeCuotasAdeudada)
                               ITEM('Por Socio'),USE(?InformesCoutasEstadodeDeuda)
                               ITEM('Por Distrito'),USE(?InformesCuotasEstadodeDeudaPorCirculo)
                               ITEM('Total '),USE(?InformesCuotasEstadodeDeudaTotal)
                               ITEM('Estado de Deuda por Email'),USE(?InformesCuotasEstadodeDeudaCuotasEstadodeDeudap)
                             END
                             ITEM('Convenio'),USE(?Reporte:CONVENIO),MSG('Print in record order')
                             ITEM('Conveios Caidos'),USE(?InformesCuotasConveiosCaidos)
                             ITEM('Pagos'),USE(?Reporte:PAGOS),MSG('Print in record order')
                             ITEM('Servicios'),USE(?InformesCuotasServicios)
                           END
                           ITEM('Gestión Informes'),USE(?InformesGestiónInformes)
                           MENU('Liquidaciones'),USE(?InformesLiquidaciones)
                             ITEM('Colegiados por Obra Social'),USE(?InformesLiquidacionesColegiadosporObraSocial)
                           END
                           MENU('Padrón'),USE(?InformesPadrón)
                             ITEM('Etiquetas'),USE(?InformesPadrónEtiquetas)
                             ITEM('Oficina'),USE(?Reporte:CONSULTORIO),MSG('Print in record order')
                             ITEM('Curriculum Vitae'),USE(?Reporte:CV),MSG('Print in record order')
                             ITEM('Inspector'),USE(?Reporte:INSPECTOR),MSG('Print in record order')
                             ITEM('Servicios por Profesional'),USE(?InformesPadrónServiciosporProfesional)
                             ITEM('Especialidad por Profesional'),USE(?InformesPadrónItem62),MSG('Padron por Especialidad')
                             ITEM('Renuncia'),USE(?InformesPadrónRenuncia)
                             ITEM('Por Distrito'),USE(?InformesPadrónLocalidad)
                           END
                           MENU('Otras'),USE(?InformesOtras)
                             ITEM('Cobertura'),USE(?Reporte:COBERTURA),MSG('Print in record order')
                             ITEM('Especialidad'),USE(?Reporte:ESPECIALIDAD),MSG('Print in record order')
                             ITEM('Localidad'),USE(?Reporte:LOCALIDAD),MSG('Print in record order')
                             ITEM('Institución'),USE(?Reporte:INSTITUCION),MSG('Print in record order')
                             ITEM('Log Auditoria'),USE(?InformesOtrasLogAuditoria)
                             ITEM('País'),USE(?Reporte:PAIS),MSG('Print in record order')
                             ITEM('Cupones'),USE(?InformesOtrasCupones)
                             MENU('Tipos'),USE(?InformesOtrasTipos)
                               ITEM('Convenio'),USE(?Reporte:TIPO_CONVENIO),MSG('Print in record order')
                               ITEM('Curso'),USE(?Reporte:TIPO_CURSO),MSG('Print in record order')
                               ITEM('Institución'),USE(?Reporte:TIPO_INSTITUCION),MSG('Print in record order')
                             END
                           END
                         END
                         MENU('&Mantenimientos'),USE(?Mantenimientos)
                           ITEM('Configuración Empresa'),USE(?MantenimientosConfiguracionEmpresa)
                           MENU('Generales'),USE(?MantenimientosGenerales)
                             ITEM('Localidad'),USE(?BrowseLOCALIDAD),MSG('Browse LOCALIDAD')
                             ITEM('País'),USE(?BrowsePAIS),MSG('Browse PAIS')
                             ITEM('Zona Vivienda'),USE(?MantenimientosZONAVIVIENDA)
                             ITEM('Usuarios'),USE(?MantenimientosUSUARIOS)
                           END
                           MENU('Propias'),USE(?MantenimientosPropias)
                             ITEM('Distritos'),USE(?MantenimientosCIRCULOS)
                             ITEM('Cuota'),USE(?BrowseCOBERTURA),MSG('Browse COBERTURA')
                             ITEM('Tipo Cuota'),USE(?MantenimientosPropiasTipoCuota)
                             ITEM('Config. Cuota Anual'),USE(?MantenimientosPropiasConfigCoutaAnual)
                             ITEM('Especialidad'),USE(?BrowseESPECIALIDAD),MSG('Browse ESPECIALIDAD')
                             ITEM('Equipamiento Consultorio'),USE(?MantenimientosEquipos)
                             ITEM('Institución'),USE(?BrowseINSTITUCION),MSG('Browse INSTITUCION')
                             ITEM('Titulo'),USE(?MantenimientosPropiasTITULO)
                             ITEM('ABMTRABAJOS'),USE(?MantenimientosPropiasABMTRABAJOS)
                             MENU('BANCOS'),USE(?MantenimientosPropiasBANCOS2)
                               ITEM('ABM Bancos'),USE(?MantenimientosPropiasBancos)
                               ITEM('ABM CODIGO RESGISTROS'),USE(?MantenimientosPropiasBANCOSABMCODIGORESGISTROS)
                             END
                           END
                           MENU('Finanzas'),USE(?MantenimientosFinanzas)
                             ITEM('Fondos'),USE(?MantenimientosFinanzasFONDOS)
                             ITEM('Cuentas'),USE(?MantenimientosFinanzasCuentas),MSG('Cuentas Contables')
                             ITEM('Subcuentas'),USE(?MantenimientosFinanzasSubcuentas),MSG('Sub Cuentas Contables')
                             ITEM('Bancos'),USE(?MantenimientosFinanzasBancos),MSG('Bancos')
                             ITEM('Forma de Pago'),USE(?MantenimientosFinanzasFormadePago),MSG('Forma de Pago ')
                             ITEM('Caja'),USE(?MantenimientosFinanzasCaja)
                             ITEM('Libro Diario'),USE(?MantenimientosFinanzasLibroDiario)
                           END
                           MENU('Tipos'),USE(?MantenimientosTipos)
                             ITEM('Comprobante'),USE(?MantenimientosTiposComprobante)
                             ITEM('Documento'),USE(?MantenimientosTipoDcoumento)
                             ITEM('Convenio'),USE(?BrowseTIPO_CONVENIO),MSG('Browse TIPO_CONVENIO')
                             ITEM('Curso'),USE(?BrowseTIPO_CURSO),MSG('Browse TIPO_CURSO')
                             ITEM('Institución'),USE(?BrowseTIPO_INSTITUCION),MSG('Browse TIPO_INSTITUCION')
                             ITEM('Proveedor'),USE(?MantenimientosTiposProveedor)
                             ITEM('IVA'),USE(?MantenimientosTiposIVA)
                           END
                         END
                         MENU('&Ayuda'),USE(?HelpMenu)
                           ITEM('&Contenido'),USE(?Helpindex),MSG('Visualiza el contenido del Help'),STD(STD:HelpIndex)
                           ITEM('&Busqueda Help On Line...'),USE(?HelpSearch),STD(STD:HelpSearch)
                           ITEM('Acerca de ....'),USE(?HelpOnHelp),MSG('Ayuda de como utilizar el Help de la Aplicacion'), |
  STD(STD:HelpOnHelp)
                         END
                       END
                       TOOLBAR,AT(0,0,537,16),USE(?Toolbar)
                         BUTTON,AT(4,2,14,14),USE(?Toolbar:Top, Toolbar:Top),ICON('WAVCRFIRST.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'First Page')
                         BUTTON,AT(18,2,14,14),USE(?Toolbar:PageUp, Toolbar:PageUp),ICON('WAVCRPRIOR.ICO'),DISABLE, |
  FLAT,TIP('Go to the Prior Page')
                         BUTTON,AT(32,2,14,14),USE(?Toolbar:Up, Toolbar:Up),ICON('WAVCRUP.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'Prior Record')
                         BUTTON,AT(46,2,14,14),USE(?Toolbar:Locate, Toolbar:Locate),ICON('WAFIND.ICO'),DISABLE,FLAT, |
  TIP('Locate record')
                         BUTTON,AT(60,2,14,14),USE(?Toolbar:Down, Toolbar:Down),ICON('WAVCRDOWN.ICO'),DISABLE,FLAT, |
  TIP('Go to the Next Record')
                         BUTTON,AT(74,2,14,14),USE(?Toolbar:PageDown, Toolbar:PageDown),ICON('WAVCRNEXT.ICO'),DISABLE, |
  FLAT,TIP('Go to the Next Page')
                         BUTTON,AT(88,2,14,14),USE(?Toolbar:Bottom, Toolbar:Bottom),ICON('WAVCRLAST.ICO'),DISABLE,FLAT, |
  TIP('Go to the Last Page')
                         BUTTON,AT(102,2,14,14),USE(?Toolbar:Select, Toolbar:Select),ICON('WAMARK.ICO'),DISABLE,FLAT, |
  TIP('Select This Record')
                         BUTTON,AT(116,2,14,14),USE(?Toolbar:Insert, Toolbar:Insert),ICON('WAINSERT.ICO'),DISABLE,FLAT, |
  TIP('Insert a New Record')
                         BUTTON,AT(130,2,14,14),USE(?Toolbar:Change, Toolbar:Change),ICON('WACHANGE.ICO'),DISABLE,FLAT, |
  TIP('Edit This Record')
                         BUTTON,AT(144,2,14,14),USE(?Toolbar:Delete, Toolbar:Delete),ICON('WADELETE.ICO'),DISABLE,FLAT, |
  TIP('Delete This Record')
                         BUTTON,AT(158,2,14,14),USE(?Toolbar:History, Toolbar:History),ICON('WADITTO.ICO'),DISABLE, |
  FLAT,TIP('Previous value')
                         BUTTON,AT(172,2,14,14),USE(?Toolbar:Help, Toolbar:Help),ICON('WAVCRHELP.ICO'),DISABLE,FLAT, |
  TIP('Get Help')
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Open                   PROCEDURE(),DERIVED
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
Menu::BrowseMenu ROUTINE                                   ! Code for menu items on ?BrowseMenu
  CASE ACCEPTED()
  OF ?PadrónVERPADRONODONTOLOGOS
    START(VER_SOCIOS, 25000)
  OF ?BrowseSOCIOS
    START(BrowseSOCIOS, 050000)
  OF ?BrowseCONSULTORIO
    START(BrowseCONSULTORIO, 050000)
  OF ?PadrónABMTRABAJOSXSOCIOS
    START(ABMTRABAJOSXSOCIOS, 25000)
  OF ?BrowseCV
    START(BrowseCV, 050000)
  OF ?BrowseINSPECTOR
    START(BrowseINSPECTOR, 050000)
  OF ?BrowsePADRONXESPECIALIDAD
    START(BrowsePADRONXESPECIALIDAD, 050000)
  OF ?BrowseRENUNCIA
    START(BrowseRENUNCIA, 050000)
  OF ?BrowseSERVICIOXSOCIO
    START(BrowseSERVICIOXSOCIO, 050000)
  OF ?PadrónComunicaciónalOdontologo
    START(E_MAILS, 25000)
  OF ?PadrónCumpleaños
    START(CUMPLE1, 25000)
  END
Menu::MENU2 ROUTINE                                        ! Code for menu items on ?MENU2
  CASE ACCEPTED()
  OF ?PadrónExportarDatosalMinisteriodeSalud
    START(Export_Ministerio, 25000)
  OF ?ITEM1
    START(Exportar_Web_FROM, 25000)
  END
Menu::Cuotas ROUTINE                                       ! Code for menu items on ?Cuotas
  CASE ACCEPTED()
  OF ?BrowseSERVICIOS
    START(BrowseSERVICIOS, 050000)
  OF ?CuotasGenerarLiquidaciónalBanco
    START(GENERAR_LIQUIDACION, 25000)
  END
Menu::CuotasFacturacion ROUTINE                            ! Code for menu items on ?CuotasFacturacion
  CASE ACCEPTED()
  OF ?CuotasFacturacionTotal
    START(FACTURACION_TOTAL, 25000)
  OF ?CuotasFacturacionIndividual
    START(FACTURACION_INDIVIDUAL, 25000)
  OF ?CuotasFacturacionVerFacturas
    START(VER_FACTURAS, 25000)
  OF ?CuotasFacturacionGenerarCuponesdePago
    START(CUPON_DE_PAGO, 25000)
  END
Menu::menu1 ROUTINE                                        ! Code for menu items on ?menu1
  CASE ACCEPTED()
  OF ?GenerarFacturaIndividual
    START(FACTURA_ANUAL_IND, 25000)
  OF ?GenerarFacturaTotal
    START(FACTURA_ANUAL_TOTAL, 25000)
  END
Menu::CuotasConvenios ROUTINE                              ! Code for menu items on ?CuotasConvenios
  CASE ACCEPTED()
  OF ?BrowseCONVENIO
    START(BrowseCONVENIO, 050000)
  OF ?CuotasConveniosPago
    START(PAGO_CONVENIO, 25000)
  OF ?CuotasConveniosRenovación
    START(CANCELAR_CONVENIO, 25000)
  END
Menu::CuotasPagos ROUTINE                                  ! Code for menu items on ?CuotasPagos
  CASE ACCEPTED()
  OF ?CuotasPagosCargaMulticuotas
    START(PAGOS_AFECTADOS, 25000)
  OF ?BrowsePAGOS
    START(BrowsePAGOS, 050000)
  OF ?CuotasPagosVerPagos
    START(Ver_Pagos, 25000)
  OF ?CuotasPagosCargarSociosporCirculo
    START(ABMPAGOSXCIRCULO, 25000)
  END
Menu::Certificaciones ROUTINE                              ! Code for menu items on ?Certificaciones
  CASE ACCEPTED()
  OF ?CertificacionesItem64
    START(CERTIFICADO_MATRICULA, 25000)
  OF ?CertificacionesImprimirCV
    START(CERTIFICADO_CV, 25000)
  END
Menu::CertificacionesConsultorios2 ROUTINE                 ! Code for menu items on ?CertificacionesConsultorios2
  CASE ACCEPTED()
  OF ?CertificacionesConsultorios
    START(CERTIFICADO_CONSULTORIO, 25000)
  OF ?CertificacionesConsultoriosAdherentes
    START(CERTIFICADO_CONSULTORIO_ADHERENTE, 25000)
  END
Menu::Administración ROUTINE                               ! Code for menu items on ?Administración
  CASE ACCEPTED()
  OF ?AdministraciónIngresos
    START(ABM_INGRESOS, 25000)
  OF ?AdministraciónEgresos
    START(ABM_EGRESOS, 25000)
  OF ?AdministraciónABMProveedores
    START(ABM_PROVEEDOR, 25000)
  OF ?AdministraciónABMINFORMES
    START(ABM_INFORMES, 25000)
  END
Menu::AdministraciónInformes ROUTINE                       ! Code for menu items on ?AdministraciónInformes
  CASE ACCEPTED()
  OF ?InformesCajaItem67
    START(IMPRIMIR_CAJA, 25000)
  OF ?AdministraciónInformesLibroDiaros
    START(IMPRIMIR_LIBRODIARIO, 25000)
  OF ?AdministraciónInformesRecivosEmitidos
    START(RECIBOS_EMITIDOS_WINDOWS, 25000)
  OF ?AdministraciónInformesEgresos
    START(OPA_EMITIDOS_WINDOWS, 25000)
  OF ?AdministraciónInformesInformeporCuenta
    START(reporte_cuentas, 25000)
  OF ?AdministraciónInformesInformedeEgresosporCuenta
    START(reporte_cuenta_egreso, 25000)
  END
Menu::Liquidaciones ROUTINE                                ! Code for menu items on ?Liquidaciones
  CASE ACCEPTED()
  OF ?LiquidacionesCargaLiquidación
    START(LIQUIDACION_CARGA, 25000)
  OF ?LiquidacionesPresentación
    START(LIQUIDACION_PRESENTACION, 25000)
  OF ?LiquidacionesPago
    START(LIQUIDACION_COBRO, 25000)
  OF ?LiquidacionesPago2
    START(LIQUIDACION_PAGO, 25000)
  OF ?LiquidacionesPagos
    START(Pagos_Liquidacion, 25000)
  OF ?LiquidacionesObrasSociales
    START(ABM_OBRAS_SOCIALES, 25000)
  OF ?LiquidacionesNomenclador
    START(Nomenclador, 25000)
  END
Menu::Cursos ROUTINE                                       ! Code for menu items on ?Cursos
  CASE ACCEPTED()
  OF ?CursosABMCursos
    START(CURSOS_ABM, 25000)
  OF ?CursosInscripción
    START(CURSOS_INSCRIPCION, 25000)
  OF ?CursosPago
    START(CURSOS_PAGOS, 25000)
  OF ?CursosImportacióndeDatosExternos
    START(IMPORT_CURSO, 25000)
  OF ?CursosCargaMódulosCurso
    START(Carga_modulos, 25000)
  END
Menu::CursosCer ROUTINE                                    ! Code for menu items on ?CursosCer
  CASE ACCEPTED()
  OF ?CursosCertificadosModulos
    START(Certificados_Cursos, 25000)
  OF ?CursosCertificadosAlumnos
    START(CERTIFICADOXALUMNO, 25000)
  END
Menu::MesadeEntradaSalida ROUTINE                          ! Code for menu items on ?MesadeEntradaSalida
  CASE ACCEPTED()
  OF ?MesadeEntradaSalidaMesadeEntradas
    START(ME, 25000)
  OF ?MesadeEntradaSalidaItem118
    START(MS, 25000)
  OF ?MesadeEntradaSalidaABMTIPO
    START(METIPO, 25000)
  OF ?MesadeEntradaSalidaABMDPTOS
    START(MEDPTOS, 25000)
  OF ?MesadeEntradaSalidaABMESTADOS
    START(MEESTADOS, 25000)
  END
Menu::ReportMenu ROUTINE                                   ! Code for menu items on ?ReportMenu
  CASE ACCEPTED()
  OF ?InformesGestiónInformes
    INFORMES()
  END
Menu::InformesEtiquetas ROUTINE                            ! Code for menu items on ?InformesEtiquetas
  CASE ACCEPTED()
  OF ?Reporte:CONVENIO
    START(Reporte:CONVENIO, 050000)
  OF ?InformesCuotasConveiosCaidos
    START(INFORME_ESTADO_DEUDA_TOTAL_COMBENIOS, 25000)
  OF ?Reporte:PAGOS
    START(Reporte:PAGOS, 050000)
  OF ?InformesCuotasServicios
    Reporte:SERVICIOS()
  END
Menu::InformesCuotasEstadodeDeuda ROUTINE                  ! Code for menu items on ?InformesCuotasEstadodeDeuda
  CASE ACCEPTED()
  OF ?InformesCuotasEstadodeDeudaCuotasDeudasalDía
    START(DEUDAS, 25000)
  OF ?InformesCuotasEstadodeDeudaCantdeCuotasAdeudada
    START(IMPRIMIR_CANTIDAD_DEUDA_SOCIO, 25000)
  OF ?InformesCoutasEstadodeDeuda
    START(INFORME_ESTADO_DEUDA_SOCIO, 25000)
  OF ?InformesCuotasEstadodeDeudaPorCirculo
    START(INFORME_ESTADO_DEUDA_CIRCULO, 25000)
  OF ?InformesCuotasEstadodeDeudaTotal
    START(INFORME_ESTADO_DEUDA_TOTAL, 25000)
  OF ?InformesCuotasEstadodeDeudaCuotasEstadodeDeudap
    START(ESTADO_DEUDA_EMAIL1, 25000)
  END
Menu::InformesLiquidaciones ROUTINE                        ! Code for menu items on ?InformesLiquidaciones
  CASE ACCEPTED()
  OF ?InformesLiquidacionesColegiadosporObraSocial
    START(REPORTE_COLEGIADOxOS, 25000)
  END
Menu::InformesPadrón ROUTINE                               ! Code for menu items on ?InformesPadrón
  CASE ACCEPTED()
  OF ?Reporte:CONSULTORIO
    START(IMPRIMIR_CONSULTORIOS, 050000)
  OF ?Reporte:CV
    START(Reporte:CV, 050000)
  OF ?Reporte:INSPECTOR
    START(Reporte:INSPECTOR, 050000)
  OF ?InformesPadrónServiciosporProfesional
    START(Reporte:SERVICIOXSOCIO, 50000)
  OF ?InformesPadrónItem62
    START(Reporte:PADRONXESPECIALIDAD, 50000)
  OF ?InformesPadrónRenuncia
    START(Reporte:RENUNCIA, 50000)
  OF ?InformesPadrónLocalidad
    START(IMPRIMIR_PADRON_CIRCULO_LOCALIDAD, 25000)
  END
Menu::InformesOtras ROUTINE                                ! Code for menu items on ?InformesOtras
  CASE ACCEPTED()
  OF ?Reporte:COBERTURA
    START(Reporte:COBERTURA, 050000)
  OF ?Reporte:ESPECIALIDAD
    START(Reporte:ESPECIALIDAD, 050000)
  OF ?Reporte:LOCALIDAD
    START(Reporte:LOCALIDAD, 050000)
  OF ?Reporte:INSTITUCION
    START(Reporte:INSTITUCION, 050000)
  OF ?InformesOtrasLogAuditoria
    START(BROWSE_AUDITORIA, 25000)
  OF ?Reporte:PAIS
    START(Reporte:PAIS, 050000)
  OF ?InformesOtrasCupones
    START(CUPON_DE_PAGO3:IMPRIMIR, 25000)
  END
Menu::InformesOtrasTipos ROUTINE                           ! Code for menu items on ?InformesOtrasTipos
  CASE ACCEPTED()
  OF ?Reporte:TIPO_CONVENIO
    START(Reporte:TIPO_CONVENIO, 050000)
  OF ?Reporte:TIPO_CURSO
    START(Reporte:TIPO_CURSO, 050000)
  OF ?Reporte:TIPO_INSTITUCION
    START(Reporte:TIPO_INSTITUCION, 050000)
  END
Menu::Mantenimientos ROUTINE                               ! Code for menu items on ?Mantenimientos
  CASE ACCEPTED()
  OF ?MantenimientosConfiguracionEmpresa
    START(CONF_EMP, 25000)
  END
Menu::MantenimientosGenerales ROUTINE                      ! Code for menu items on ?MantenimientosGenerales
  CASE ACCEPTED()
  OF ?BrowseLOCALIDAD
    START(BrowseLOCALIDAD, 050000)
  OF ?BrowsePAIS
    START(BrowsePAIS, 050000)
  OF ?MantenimientosZONAVIVIENDA
    START(BrowseZONA_VIVIENDA, 25000)
  OF ?MantenimientosUSUARIOS
    START(BrowseUSUARIO, 25000)
  END
Menu::MantenimientosPropias ROUTINE                        ! Code for menu items on ?MantenimientosPropias
  CASE ACCEPTED()
  OF ?MantenimientosCIRCULOS
    START(BrowseCIRCULOS, 25000)
  OF ?BrowseCOBERTURA
    START(BrowseCOBERTURA, 050000)
  OF ?MantenimientosPropiasTipoCuota
    START(ABM_TIPOCUOTA, 25000)
  OF ?MantenimientosPropiasConfigCoutaAnual
    START(ABM_CUOTA_ANUAL, 25000)
  OF ?BrowseESPECIALIDAD
    START(BrowseESPECIALIDAD, 050000)
  OF ?MantenimientosEquipos
    START(ABMEEQUIPOS, 25000)
  OF ?BrowseINSTITUCION
    START(BrowseINSTITUCION, 050000)
  OF ?MantenimientosPropiasTITULO
    START(ABM_TITULO, 25000)
  OF ?MantenimientosPropiasABMTRABAJOS
    START(Trabajos, 25000)
  END
Menu::MantenimientosPropiasBANCOS2 ROUTINE                 ! Code for menu items on ?MantenimientosPropiasBANCOS2
  CASE ACCEPTED()
  OF ?MantenimientosPropiasBancos
    START(ABM_BANCOS, 25000)
  OF ?MantenimientosPropiasBANCOSABMCODIGORESGISTROS
    START(ABM_BANCO_COG_REGISTRO, 25000)
  END
Menu::MantenimientosFinanzas ROUTINE                       ! Code for menu items on ?MantenimientosFinanzas
  CASE ACCEPTED()
  OF ?MantenimientosFinanzasFONDOS
    START(ABM_FONDOS, 25000)
  OF ?MantenimientosFinanzasCuentas
    START(ABMCUENTAS, 25000)
  OF ?MantenimientosFinanzasSubcuentas
    START(ABMSUBCUENTAS, 25000)
  OF ?MantenimientosFinanzasFormadePago
    START(ABM_FORMA_PAGO, 25000)
  END
Menu::MantenimientosTipos ROUTINE                          ! Code for menu items on ?MantenimientosTipos
  CASE ACCEPTED()
  OF ?MantenimientosTiposComprobante
    START(ABM_TIPO_COMPROBANTE, 25000)
  OF ?MantenimientosTipoDcoumento
    START(BrowseTIPO_DOC, 25000)
  OF ?BrowseTIPO_CONVENIO
    START(BrowseTIPO_CONVENIO, 050000)
  OF ?BrowseTIPO_CURSO
    START(BrowseTIPO_CURSO, 050000)
  OF ?BrowseTIPO_INSTITUCION
    START(BrowseTIPO_INSTITUCION, 050000)
  OF ?MantenimientosTiposProveedor
    START(ABM_TIPO_PROVEEDOR, 25000)
  OF ?MantenimientosTiposIVA
    START(ABM_TIPO_IVA, 25000)
  END
Menu::HelpMenu ROUTINE                                     ! Code for menu items on ?HelpMenu
  CASE ACCEPTED()
  OF ?HelpOnHelp
    START(AboutWindow, 25000)
  END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF not SEGURIDAD() THEN Return LEVEL:FATAL.
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
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
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
  OPEN(CONF_EMP)
   SET(CONF_EMP)                   !Top of record set in ORDER sequence
   LOOP                             !Read all records in file
    NEXT(CONF_EMP)                 !read a record sequentially
    GLO:RAZON_SOCIAL = CLIP(COF:RAZON_SOCIAL)
    GLO:CUIT = COF:CUIT
    GLO:DIRECCION = COF:DIRECCION&'-Teléfono: '&COF:TELEFONOS&'-Email: '&COF:EMAIL
    GLO:FIRMA1 = COF:FIRMA1
    GLO:FIRMA2 = COF:FIRMA2
    GLO:FIRMA3 = COF:FIRMA3
    GLO:LEY    = COF:LEY
    GLO:PER_JUR= COF:PER_JUR
    GLO:MAILEMP = COF:EMAIL
    SMTP             =  COF:SMTP
    USUARIO_SMTP     =  COF:USUARIO_SMTP
    PASSWORD_SMTP    =  COF:PASSWORD_SMTP
    SMTP_SEGURO      =  COF:SMTP_SEGURO
    PUERTO           =  COF:PUERTO
    GLO:CANTIDAD_CUOTAS = COF:CONTROL_CUOTA      
    !GLO:LOGO{PROP:ImageBlob} = COF:LOGO{PROP:Handle}
    IF ERRORCODE() THEN BREAK END
    !Process the order
   END
  
  
      AppFrame{PROP:TabBarVisible}  = False
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:CONF_EMP.Close
  END
  IF SELF.Opened
    INIMgr.Update('Main',AppFrame)                         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  INFORMES()


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
    OF ?Toolbar:Top
    OROF ?Toolbar:PageUp
    OROF ?Toolbar:Up
    OROF ?Toolbar:Locate
    OROF ?Toolbar:Down
    OROF ?Toolbar:PageDown
    OROF ?Toolbar:Bottom
    OROF ?Toolbar:Select
    OROF ?Toolbar:Insert
    OROF ?Toolbar:Change
    OROF ?Toolbar:Delete
    OROF ?Toolbar:History
    OROF ?Toolbar:Help
      IF SYSTEM{PROP:Active} <> THREAD()
        POST(EVENT:Accepted,ACCEPTED(),SYSTEM{Prop:Active} )
        CYCLE
      END
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::BrowseMenu                                  ! Process menu items on ?BrowseMenu menu
      DO Menu::MENU2                                       ! Process menu items on ?MENU2 menu
      DO Menu::Cuotas                                      ! Process menu items on ?Cuotas menu
      DO Menu::CuotasFacturacion                           ! Process menu items on ?CuotasFacturacion menu
      DO Menu::menu1                                       ! Process menu items on ?menu1 menu
      DO Menu::CuotasConvenios                             ! Process menu items on ?CuotasConvenios menu
      DO Menu::CuotasPagos                                 ! Process menu items on ?CuotasPagos menu
      DO Menu::Certificaciones                             ! Process menu items on ?Certificaciones menu
      DO Menu::CertificacionesConsultorios2                ! Process menu items on ?CertificacionesConsultorios2 menu
      DO Menu::Administración                              ! Process menu items on ?Administración menu
      DO Menu::AdministraciónInformes                      ! Process menu items on ?AdministraciónInformes menu
      DO Menu::Liquidaciones                               ! Process menu items on ?Liquidaciones menu
      DO Menu::Cursos                                      ! Process menu items on ?Cursos menu
      DO Menu::CursosCer                                   ! Process menu items on ?CursosCer menu
      DO Menu::MesadeEntradaSalida                         ! Process menu items on ?MesadeEntradaSalida menu
      DO Menu::ReportMenu                                  ! Process menu items on ?ReportMenu menu
      DO Menu::InformesEtiquetas                           ! Process menu items on ?InformesEtiquetas menu
      DO Menu::InformesCuotasEstadodeDeuda                 ! Process menu items on ?InformesCuotasEstadodeDeuda menu
      DO Menu::InformesLiquidaciones                       ! Process menu items on ?InformesLiquidaciones menu
      DO Menu::InformesPadrón                              ! Process menu items on ?InformesPadrón menu
      DO Menu::InformesOtras                               ! Process menu items on ?InformesOtras menu
      DO Menu::InformesOtrasTipos                          ! Process menu items on ?InformesOtrasTipos menu
      DO Menu::Mantenimientos                              ! Process menu items on ?Mantenimientos menu
      DO Menu::MantenimientosGenerales                     ! Process menu items on ?MantenimientosGenerales menu
      DO Menu::MantenimientosPropias                       ! Process menu items on ?MantenimientosPropias menu
      DO Menu::MantenimientosPropiasBANCOS2                ! Process menu items on ?MantenimientosPropiasBANCOS2 menu
      DO Menu::MantenimientosFinanzas                      ! Process menu items on ?MantenimientosFinanzas menu
      DO Menu::MantenimientosTipos                         ! Process menu items on ?MantenimientosTipos menu
      DO Menu::HelpMenu                                    ! Process menu items on ?HelpMenu menu
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the TIPO_INSTITUCION File
!!! </summary>
Reporte:TIPO_INSTITUCION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(TIPO_INSTITUCION)
                       PROJECT(TIP4:DESCRIPCION)
                       PROJECT(TIP4:IDTIPO_INSTITUCION)
                     END
ProgressWindow       WINDOW('Reporte de TIPO_INSTITUCION'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('TIPO_INSTITUCION Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  TIPO_INSTITUCION'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif', |
  8,,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         STRING('IDTIPO INSTITUCION'),AT(50,390,3775,170),USE(?HeaderTitle:1),TRN
                         STRING('DESCRIPCION'),AT(3925,390,3775,170),USE(?HeaderTitle:2),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,3775,170),USE(TIP4:IDTIPO_INSTITUCION)
                         STRING(@s50),AT(3925,50,3775,170),USE(TIP4:DESCRIPCION)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_T_INSTITUCION' & |
      '|' & 'IDX_T_INST_DESCRIPCION' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:TIPO_INSTITUCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:TIPO_INSTITUCION.Open                             ! File TIPO_INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:TIPO_INSTITUCION',ProgressWindow)  ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:TIPO_INSTITUCION, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_T_INSTITUCION')) THEN
     ThisReport.AppendOrder('+TIP4:IDTIPO_INSTITUCION')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_T_INST_DESCRIPCION')) THEN
     ThisReport.AppendOrder('+TIP4:DESCRIPCION')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:TIPO_INSTITUCION.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:TIPO_INSTITUCION',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP4:IDTIPO_INSTITUCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP4:IDTIPO_INSTITUCION,RepGen:XML,TargetAttr:TagName,'TIP4:IDTIPO_INSTITUCION')
  SELF.Attribute.Set(?TIP4:IDTIPO_INSTITUCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP4:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP4:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP4:DESCRIPCION')
  SELF.Attribute.Set(?TIP4:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:TIPO_INSTITUCION','Reporte:TIPO_INSTITUCION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the TIPO_CURSO File
!!! </summary>
Reporte:TIPO_CURSO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(TIPO_CURSO)
                       PROJECT(TIP2:DESCRIPCION)
                       PROJECT(TIP2:GRADO)
                       PROJECT(TIP2:ID_TIPO_CURSO)
                     END
ProgressWindow       WINDOW('Reporte de TIPO_CURSO'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('TIPO_CURSO Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  TIPO_CURSO'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif', |
  8,,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2583,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(5166,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         STRING('ID TIPO CURSO'),AT(50,390,2483,170),USE(?HeaderTitle:1),TRN
                         STRING('DESCRIPCION'),AT(2633,390,2483,170),USE(?HeaderTitle:2),TRN
                         STRING('GRADO'),AT(5216,390,2483,170),USE(?HeaderTitle:3),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2583,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(5166,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:3),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,2483,170),USE(TIP2:ID_TIPO_CURSO)
                         STRING(@s50),AT(2633,50,2483,170),USE(TIP2:DESCRIPCION)
                         STRING(@s2),AT(5216,50,2483,170),USE(TIP2:GRADO)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_T_CURSO' & |
      '|' & 'IDX_DESCRIPCION' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:TIPO_CURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:TIPO_CURSO.Open                                   ! File TIPO_CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:TIPO_CURSO',ProgressWindow)        ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:TIPO_CURSO, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_T_CURSO')) THEN
     ThisReport.AppendOrder('+TIP2:ID_TIPO_CURSO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_DESCRIPCION')) THEN
     ThisReport.AppendOrder('+TIP2:DESCRIPCION')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:TIPO_CURSO.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:TIPO_CURSO',ProgressWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagName,'HeaderTitle:3')
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP2:ID_TIPO_CURSO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP2:ID_TIPO_CURSO,RepGen:XML,TargetAttr:TagName,'TIP2:ID_TIPO_CURSO')
  SELF.Attribute.Set(?TIP2:ID_TIPO_CURSO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP2:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP2:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP2:DESCRIPCION')
  SELF.Attribute.Set(?TIP2:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP2:GRADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP2:GRADO,RepGen:XML,TargetAttr:TagName,'TIP2:GRADO')
  SELF.Attribute.Set(?TIP2:GRADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:TIPO_CURSO','Reporte:TIPO_CURSO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the TIPO_CONVENIO File
!!! </summary>
Reporte:TIPO_CONVENIO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(TIPO_CONVENIO)
                       PROJECT(TIP:DESCRIPCION)
                       PROJECT(TIP:IDTIPO_CONVENIO)
                     END
ProgressWindow       WINDOW('Reporte de TIPO_CONVENIO'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('TIPO_CONVENIO Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  TIPO_CONVENIO'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif', |
  8,,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         STRING('IDTIPO CONVENIO'),AT(50,390,3775,170),USE(?HeaderTitle:1),TRN
                         STRING('DESCRIPCION'),AT(3925,390,3775,170),USE(?HeaderTitle:2),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,3775,170),USE(TIP:IDTIPO_CONVENIO)
                         STRING(@s50),AT(3925,50,3775,170),USE(TIP:DESCRIPCION)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_T_CONVENIO' & |
      '|' & 'IDX_TIPO_CONVENIO_DESCRIPCION' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:TIPO_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:TIPO_CONVENIO.Open                                ! File TIPO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:TIPO_CONVENIO',ProgressWindow)     ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:TIPO_CONVENIO, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_T_CONVENIO')) THEN
     ThisReport.AppendOrder('+TIP:IDTIPO_CONVENIO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_TIPO_CONVENIO_DESCRIPCION')) THEN
     ThisReport.AppendOrder('+TIP:DESCRIPCION')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:TIPO_CONVENIO.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:TIPO_CONVENIO',ProgressWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagName,'TIP:IDTIPO_CONVENIO')
  SELF.Attribute.Set(?TIP:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP:DESCRIPCION')
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:TIPO_CONVENIO','Reporte:TIPO_CONVENIO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the PAIS File
!!! </summary>
Reporte:PAIS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(PAIS)
                       PROJECT(PAI:DESCRIPCION)
                       PROJECT(PAI:IDPAIS)
                     END
ProgressWindow       WINDOW('Reporte de PAIS'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('PAIS Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  PAIS'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif',8,,FONT:regular), |
  CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         STRING('IDPAIS'),AT(50,390,3775,170),USE(?HeaderTitle:1),TRN
                         STRING('DESCRIPCION'),AT(3925,390,3775,170),USE(?HeaderTitle:2),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,3775,170),USE(PAI:IDPAIS)
                         STRING(@s20),AT(3925,50,3775,170),USE(PAI:DESCRIPCION)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_PAIS' & |
      '|' & 'IDX_PAIS_DESCRIPCION' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:PAIS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:PAIS.Open                                         ! File PAIS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:PAIS',ProgressWindow)              ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:PAIS, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_PAIS')) THEN
     ThisReport.AppendOrder('+PAI:IDPAIS')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_PAIS_DESCRIPCION')) THEN
     ThisReport.AppendOrder('+PAI:DESCRIPCION')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PAIS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PAIS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:PAIS',ProgressWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAI:IDPAIS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAI:IDPAIS,RepGen:XML,TargetAttr:TagName,'PAI:IDPAIS')
  SELF.Attribute.Set(?PAI:IDPAIS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAI:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAI:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'PAI:DESCRIPCION')
  SELF.Attribute.Set(?PAI:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:PAIS','Reporte:PAIS','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the PAGOS File
!!! </summary>
Reporte:PAGOS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(PAGOS)
                       PROJECT(PAG:ANO)
                       PROJECT(PAG:FECHA)
                       PROJECT(PAG:HORA)
                       PROJECT(PAG:IDFACTURA)
                       PROJECT(PAG:IDPAGOS)
                       PROJECT(PAG:IDRECIBO)
                       PROJECT(PAG:IDSOCIO)
                       PROJECT(PAG:IDUSUARIO)
                       PROJECT(PAG:MES)
                       PROJECT(PAG:MONTO)
                       PROJECT(PAG:PERIODO)
                       PROJECT(PAG:SUCURSAL)
                     END
ProgressWindow       WINDOW('Reporte de PAGOS'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('PAGOS Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  PAGOS'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif',8,,FONT:regular), |
  CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(645,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(1291,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(1937,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         LINE,AT(2583,350,0,250),USE(?HeaderLine:4),COLOR(COLOR:Black)
                         LINE,AT(3229,350,0,250),USE(?HeaderLine:5),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,250),USE(?HeaderLine:6),COLOR(COLOR:Black)
                         LINE,AT(4520,350,0,250),USE(?HeaderLine:7),COLOR(COLOR:Black)
                         LINE,AT(5166,350,0,250),USE(?HeaderLine:8),COLOR(COLOR:Black)
                         LINE,AT(5812,350,0,250),USE(?HeaderLine:9),COLOR(COLOR:Black)
                         LINE,AT(6458,350,0,250),USE(?HeaderLine:10),COLOR(COLOR:Black)
                         LINE,AT(7104,350,0,250),USE(?HeaderLine:11),COLOR(COLOR:Black)
                         STRING('IDPAGOS'),AT(50,390,545,170),USE(?HeaderTitle:1),TRN
                         STRING('IDSOCIO'),AT(695,390,545,170),USE(?HeaderTitle:2),TRN
                         STRING('SUCURSAL'),AT(1341,390,545,170),USE(?HeaderTitle:3),TRN
                         STRING('IDFACTURA'),AT(1987,390,545,170),USE(?HeaderTitle:4),TRN
                         STRING('MONTO'),AT(2633,390,545,170),USE(?HeaderTitle:5),TRN
                         STRING('FECHA'),AT(3279,390,545,170),USE(?HeaderTitle:6),TRN
                         STRING('HORA'),AT(3925,390,545,170),USE(?HeaderTitle:7),TRN
                         STRING('MES'),AT(4570,390,545,170),USE(?HeaderTitle:8),TRN
                         STRING('ANO'),AT(5216,390,545,170),USE(?HeaderTitle:9),TRN
                         STRING('PERIODO'),AT(5862,390,545,170),USE(?HeaderTitle:10),TRN
                         STRING('IDUSUARIO'),AT(6508,390,545,170),USE(?HeaderTitle:11),TRN
                         STRING('IDRECIBO'),AT(7154,390,545,170),USE(?HeaderTitle:12),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(645,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(1291,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(1937,0,0,210),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(2583,0,0,210),USE(?DetailLine:4),COLOR(COLOR:Black)
                         LINE,AT(3229,0,0,210),USE(?DetailLine:5),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,210),USE(?DetailLine:6),COLOR(COLOR:Black)
                         LINE,AT(4520,0,0,210),USE(?DetailLine:7),COLOR(COLOR:Black)
                         LINE,AT(5166,0,0,210),USE(?DetailLine:8),COLOR(COLOR:Black)
                         LINE,AT(5812,0,0,210),USE(?DetailLine:9),COLOR(COLOR:Black)
                         LINE,AT(6458,0,0,210),USE(?DetailLine:10),COLOR(COLOR:Black)
                         LINE,AT(7104,0,0,210),USE(?DetailLine:11),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:12),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,545,170),USE(PAG:IDPAGOS)
                         STRING(@n-14),AT(695,50,545,170),USE(PAG:IDSOCIO)
                         STRING(@n-14),AT(1341,50,545,170),USE(PAG:SUCURSAL)
                         STRING(@n-14),AT(1987,50,545,170),USE(PAG:IDFACTURA)
                         STRING(@n-7.2),AT(2633,50,545,170),USE(PAG:MONTO)
                         STRING(@d17),AT(3279,50,545,170),USE(PAG:FECHA)
                         STRING(@t7),AT(3925,50,545,170),USE(PAG:HORA)
                         STRING(@s2),AT(4570,50,545,170),USE(PAG:MES)
                         STRING(@s4),AT(5216,50,545,170),USE(PAG:ANO)
                         STRING(@n-14),AT(5862,50,545,170),USE(PAG:PERIODO)
                         STRING(@n-14),AT(6508,50,545,170),USE(PAG:IDUSUARIO)
                         STRING(@n-14),AT(7154,50,545,170),USE(PAG:IDRECIBO)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_PAGOS' & |
      '|' & 'FK_PAGOS_SOCIOS' & |
      '|' & 'FK_PAGOS_USUARIO' & |
      '|' & 'IDX_FECHA' & |
      '|' & 'IDX_PERIODO' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:PAGOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:PAGOS',ProgressWindow)             ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:PAGOS, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_PAGOS')) THEN
     ThisReport.AppendOrder('+PAG:IDPAGOS')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_PAGOS_SOCIOS')) THEN
     ThisReport.AppendOrder('+PAG:IDSOCIO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_PAGOS_USUARIO')) THEN
     ThisReport.AppendOrder('+PAG:IDUSUARIO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_FECHA')) THEN
     ThisReport.AppendOrder('+PAG:FECHA')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_PERIODO')) THEN
     ThisReport.AppendOrder('+PAG:PERIODO')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PAGOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PAGOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:PAGOS',ProgressWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagName,'HeaderTitle:3')
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagName,'HeaderTitle:4')
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagName,'HeaderTitle:5')
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagName,'HeaderTitle:6')
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagName,'HeaderTitle:7')
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:8,RepGen:XML,TargetAttr:TagName,'HeaderTitle:8')
  SELF.Attribute.Set(?HeaderTitle:8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:9,RepGen:XML,TargetAttr:TagName,'HeaderTitle:9')
  SELF.Attribute.Set(?HeaderTitle:9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:10,RepGen:XML,TargetAttr:TagName,'HeaderTitle:10')
  SELF.Attribute.Set(?HeaderTitle:10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:11,RepGen:XML,TargetAttr:TagName,'HeaderTitle:11')
  SELF.Attribute.Set(?HeaderTitle:11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:12,RepGen:XML,TargetAttr:TagName,'HeaderTitle:12')
  SELF.Attribute.Set(?HeaderTitle:12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagName,'PAG:IDPAGOS')
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDSOCIO,RepGen:XML,TargetAttr:TagName,'PAG:IDSOCIO')
  SELF.Attribute.Set(?PAG:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:SUCURSAL,RepGen:XML,TargetAttr:TagName,'PAG:SUCURSAL')
  SELF.Attribute.Set(?PAG:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDFACTURA,RepGen:XML,TargetAttr:TagName,'PAG:IDFACTURA')
  SELF.Attribute.Set(?PAG:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:MONTO,RepGen:XML,TargetAttr:TagName,'PAG:MONTO')
  SELF.Attribute.Set(?PAG:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagName,'PAG:FECHA')
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:HORA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:HORA,RepGen:XML,TargetAttr:TagName,'PAG:HORA')
  SELF.Attribute.Set(?PAG:HORA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagName,'PAG:MES')
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagName,'PAG:ANO')
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:PERIODO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:PERIODO,RepGen:XML,TargetAttr:TagName,'PAG:PERIODO')
  SELF.Attribute.Set(?PAG:PERIODO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDUSUARIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDUSUARIO,RepGen:XML,TargetAttr:TagName,'PAG:IDUSUARIO')
  SELF.Attribute.Set(?PAG:IDUSUARIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagName,'PAG:IDRECIBO')
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:PAGOS','Reporte:PAGOS','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the LOCALIDAD File
!!! </summary>
Reporte:LOCALIDAD PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(LOCALIDAD)
                       PROJECT(LOC:CP)
                       PROJECT(LOC:CPNUEVO)
                       PROJECT(LOC:DESCRIPCION)
                       PROJECT(LOC:IDLOCALIDAD)
                       PROJECT(LOC:IDPAIS)
                     END
ProgressWindow       WINDOW('Reporte de LOCALIDAD'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('LOCALIDAD Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  LOCALIDAD'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif',8, |
  ,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(1550,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(3100,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(4650,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         LINE,AT(6200,350,0,250),USE(?HeaderLine:4),COLOR(COLOR:Black)
                         STRING('IDLOCALIDAD'),AT(50,390,1450,170),USE(?HeaderTitle:1),TRN
                         STRING('DESCRIPCION'),AT(1600,390,1450,170),USE(?HeaderTitle:2),TRN
                         STRING('CP'),AT(3150,390,1450,170),USE(?HeaderTitle:3),TRN
                         STRING('CPNUEVO'),AT(4700,390,1450,170),USE(?HeaderTitle:4),TRN
                         STRING('IDPAIS'),AT(6250,390,1450,170),USE(?HeaderTitle:5),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(1550,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(3100,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(4650,0,0,210),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(6200,0,0,210),USE(?DetailLine:4),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:5),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,1450,170),USE(LOC:IDLOCALIDAD)
                         STRING(@s20),AT(1600,50,1450,170),USE(LOC:DESCRIPCION)
                         STRING(@n-14),AT(3150,50,1450,170),USE(LOC:CP)
                         STRING(@s20),AT(4700,50,1450,170),USE(LOC:CPNUEVO)
                         STRING(@n-14),AT(6250,50,1450,170),USE(LOC:IDPAIS)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_LOCALIDAD' & |
      '|' & 'FK_LOCALIDAD_PAIS' & |
      '|' & 'KEY_CP' & |
      '|' & 'NOMBRE' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:LOCALIDAD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:LOCALIDAD',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:LOCALIDAD, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_LOCALIDAD')) THEN
     ThisReport.AppendOrder('+LOC:IDLOCALIDAD')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_LOCALIDAD_PAIS')) THEN
     ThisReport.AppendOrder('+LOC:IDPAIS')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('KEY_CP')) THEN
     ThisReport.AppendOrder('+LOC:CP')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('NOMBRE')) THEN
     ThisReport.AppendOrder('+LOC:DESCRIPCION')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:LOCALIDAD.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LOCALIDAD.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:LOCALIDAD',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagName,'HeaderTitle:3')
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagName,'HeaderTitle:4')
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagName,'HeaderTitle:5')
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:IDLOCALIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:IDLOCALIDAD,RepGen:XML,TargetAttr:TagName,'LOC:IDLOCALIDAD')
  SELF.Attribute.Set(?LOC:IDLOCALIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagName,'LOC:CP')
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:CPNUEVO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:CPNUEVO,RepGen:XML,TargetAttr:TagName,'LOC:CPNUEVO')
  SELF.Attribute.Set(?LOC:CPNUEVO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:IDPAIS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:IDPAIS,RepGen:XML,TargetAttr:TagName,'LOC:IDPAIS')
  SELF.Attribute.Set(?LOC:IDPAIS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:LOCALIDAD','Reporte:LOCALIDAD','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the INSTITUCION File
!!! </summary>
Reporte:INSTITUCION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(INSTITUCION)
                       PROJECT(INS2:DIRECCION)
                       PROJECT(INS2:E_MAIL)
                       PROJECT(INS2:IDINSTITUCION)
                       PROJECT(INS2:IDLOCALIDAD)
                       PROJECT(INS2:IDTIPO_INSTITUCION)
                       PROJECT(INS2:NOMBRE)
                       PROJECT(INS2:TELEFONO)
                     END
ProgressWindow       WINDOW('Reporte de INSTITUCION'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('INSTITUCION Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  INSTITUCION'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif', |
  8,,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(1107,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(2214,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(3321,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         LINE,AT(4428,350,0,250),USE(?HeaderLine:4),COLOR(COLOR:Black)
                         LINE,AT(5535,350,0,250),USE(?HeaderLine:5),COLOR(COLOR:Black)
                         LINE,AT(6642,350,0,250),USE(?HeaderLine:6),COLOR(COLOR:Black)
                         STRING('IDINSTITUCION'),AT(50,390,1007,170),USE(?HeaderTitle:1),TRN
                         STRING('IDTIPO INSTITUCION'),AT(1157,390,1007,170),USE(?HeaderTitle:2),TRN
                         STRING('IDLOCALIDAD'),AT(2264,390,1007,170),USE(?HeaderTitle:3),TRN
                         STRING('NOMBRE'),AT(3371,390,1007,170),USE(?HeaderTitle:4),TRN
                         STRING('DIRECCION'),AT(4478,390,1007,170),USE(?HeaderTitle:5),TRN
                         STRING('TELEFONO'),AT(5585,390,1007,170),USE(?HeaderTitle:6),TRN
                         STRING('E MAIL'),AT(6692,390,1007,170),USE(?HeaderTitle:7),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(1107,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(2214,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(3321,0,0,210),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(4428,0,0,210),USE(?DetailLine:4),COLOR(COLOR:Black)
                         LINE,AT(5535,0,0,210),USE(?DetailLine:5),COLOR(COLOR:Black)
                         LINE,AT(6642,0,0,210),USE(?DetailLine:6),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:7),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,1007,170),USE(INS2:IDINSTITUCION)
                         STRING(@n-14),AT(1157,50,1007,170),USE(INS2:IDTIPO_INSTITUCION)
                         STRING(@n-14),AT(2264,50,1007,170),USE(INS2:IDLOCALIDAD)
                         STRING(@s50),AT(3371,50,1007,170),USE(INS2:NOMBRE)
                         STRING(@s50),AT(4478,50,1007,170),USE(INS2:DIRECCION)
                         STRING(@s20),AT(5585,50,1007,170),USE(INS2:TELEFONO)
                         STRING(@s50),AT(6692,50,1007,170),USE(INS2:E_MAIL)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_INSTITUCION' & |
      '|' & 'FK_INSTITUCION_LOCALIDAD' & |
      '|' & 'FK_INSTITUCION_TIPO' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:INSTITUCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:INSTITUCION',ProgressWindow)       ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:INSTITUCION, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_INSTITUCION')) THEN
     ThisReport.AppendOrder('+INS2:IDINSTITUCION')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_INSTITUCION_LOCALIDAD')) THEN
     ThisReport.AppendOrder('+INS2:IDLOCALIDAD')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_INSTITUCION_TIPO')) THEN
     ThisReport.AppendOrder('+INS2:IDTIPO_INSTITUCION')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:INSTITUCION.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:INSTITUCION',ProgressWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagName,'HeaderTitle:3')
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagName,'HeaderTitle:4')
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagName,'HeaderTitle:5')
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagName,'HeaderTitle:6')
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagName,'HeaderTitle:7')
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:IDINSTITUCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:IDINSTITUCION,RepGen:XML,TargetAttr:TagName,'INS2:IDINSTITUCION')
  SELF.Attribute.Set(?INS2:IDINSTITUCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:IDTIPO_INSTITUCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:IDTIPO_INSTITUCION,RepGen:XML,TargetAttr:TagName,'INS2:IDTIPO_INSTITUCION')
  SELF.Attribute.Set(?INS2:IDTIPO_INSTITUCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:IDLOCALIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:IDLOCALIDAD,RepGen:XML,TargetAttr:TagName,'INS2:IDLOCALIDAD')
  SELF.Attribute.Set(?INS2:IDLOCALIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagName,'INS2:NOMBRE')
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:DIRECCION,RepGen:XML,TargetAttr:TagName,'INS2:DIRECCION')
  SELF.Attribute.Set(?INS2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:TELEFONO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:TELEFONO,RepGen:XML,TargetAttr:TagName,'INS2:TELEFONO')
  SELF.Attribute.Set(?INS2:TELEFONO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:E_MAIL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:E_MAIL,RepGen:XML,TargetAttr:TagName,'INS2:E_MAIL')
  SELF.Attribute.Set(?INS2:E_MAIL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:INSTITUCION','Reporte:INSTITUCION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the INSPECTOR File
!!! </summary>
Reporte:INSPECTOR PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(INSPECTOR)
                       PROJECT(INS:IDINSPECTOR)
                       PROJECT(INS:IDSOCIO)
                     END
ProgressWindow       WINDOW('Reporte de INSPECTOR'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('INSPECTOR Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  INSPECTOR'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif',8, |
  ,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         STRING('IDINSPECTOR'),AT(50,390,3775,170),USE(?HeaderTitle:1),TRN
                         STRING('IDSOCIO'),AT(3925,390,3775,170),USE(?HeaderTitle:2),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,3775,170),USE(INS:IDINSPECTOR)
                         STRING(@n-14),AT(3925,50,3775,170),USE(INS:IDSOCIO)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_INSPECTOR' & |
      '|' & 'FK_INSPECTOR_SOCIOS' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:INSPECTOR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:INSPECTOR.Open                                    ! File INSPECTOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:INSPECTOR',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:INSPECTOR, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_INSPECTOR')) THEN
     ThisReport.AppendOrder('+INS:IDINSPECTOR')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_INSPECTOR_SOCIOS')) THEN
     ThisReport.AppendOrder('+INS:IDSOCIO')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:INSPECTOR.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INSPECTOR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:INSPECTOR',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS:IDINSPECTOR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS:IDINSPECTOR,RepGen:XML,TargetAttr:TagName,'INS:IDINSPECTOR')
  SELF.Attribute.Set(?INS:IDINSPECTOR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS:IDSOCIO,RepGen:XML,TargetAttr:TagName,'INS:IDSOCIO')
  SELF.Attribute.Set(?INS:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:INSPECTOR','Reporte:INSPECTOR','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

