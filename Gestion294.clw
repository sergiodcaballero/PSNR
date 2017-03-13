

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION294.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CERTIFICADO_ALTA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:ACTA)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:FECHA_ALTA)
                       PROJECT(SOC:FECHA_EGRESO)
                       PROJECT(SOC:FECHA_NACIMIENTO)
                       PROJECT(SOC:FECHA_TITULO)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:LIBRO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:TELEFONO)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:IDINSTITUCION)
                       PROJECT(SOC:IDCIRCULO)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:IDCOBERTURA)
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                         PROJECT(TIP3:DESCRIPCION)
                       END
                       JOIN(INS2:PK_INSTITUCION,SOC:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                       END
                       JOIN(CIR:PK_CIRCULO,SOC:IDCIRCULO)
                       END
                       JOIN(LOC:PK_LOCALIDAD,SOC:IDLOCALIDAD)
                         PROJECT(LOC:CP)
                         PROJECT(LOC:DESCRIPCION)
                       END
                       JOIN(COB:PK_COBERTURA,SOC:IDCOBERTURA)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2375,6250,7313),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:bold,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1396),USE(?Header)
                         IMAGE('logo.jpg'),AT(31,31,1521,1052),USE(?Image1)
                         BOX,AT(5146,42,1042,1042),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('CERTIFICADO DE MATRICULACION'),AT(2073,1156),USE(?String1),FONT(,12,,FONT:bold+FONT:underline), |
  TRN
                         LINE,AT(52,1104,6188,0),USE(?Line9),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,3677),USE(?Detail)
                         STRING(@s20),AT(4021,2260),USE(SOC:ACTA,,?SOC:ACTA:2)
                         LINE,AT(10,2458,6229,0),USE(?Line8),COLOR(COLOR:Black)
                         STRING('Aclaración del Colegiado:.{51}'),AT(83,3323),USE(?String49),TRN
                         STRING('Firma del Colegiado:.{52}'),AT(3396,3354),USE(?String48),TRN
                         STRING(@n-14),AT(417,2260),USE(SOC:LIBRO)
                         STRING(@d17),AT(979,2031),USE(SOC:FECHA_TITULO)
                         STRING(@s30),AT(3698,42,2365,198),USE(SOC:NOMBRE),FONT(,10)
                         LINE,AT(0,260,6240,0),USE(?Line7),COLOR(COLOR:Black)
                         STRING(@d17),AT(1135,760),USE(SOC:FECHA_NACIMIENTO)
                         STRING('Fecha Nacimiento:'),AT(10,760),USE(?String33),TRN
                         STRING(@s20),AT(1740,542),USE(LOC:DESCRIPCION)
                         STRING(@n-5),AT(365,542),USE(LOC:CP)
                         STRING('Tipo y Nº de Documento:'),AT(10,333),USE(?String28),TRN
                         STRING(@s7),AT(2708,42),USE(SOC:MATRICULA),FONT(,10)
                         STRING('Matrícula:'),AT(1917,42),USE(?String27),FONT(,10),TRN
                         STRING(@s14),AT(1823,333),USE(SOC:N_DOCUMENTO)
                         STRING(@s5),AT(1458,333),USE(TIP3:DESCRIPCION)
                         STRING('Dirección:'),AT(2854,333),USE(?String29),TRN
                         STRING(@s30),AT(4313,542),USE(SOC:TELEFONO)
                         STRING('Teléfono Particular:'),AT(3146,542),USE(?String32),TRN
                         STRING(@d17),AT(885,1490),USE(SOC:FECHA_ALTA)
                         STRING(@s100),AT(3479,333),USE(SOC:DIRECCION)
                         STRING('CP:'),AT(10,542),USE(?String30),TRN
                         STRING('Localidad:'),AT(1021,542),USE(?String31),TRN
                         STRING(@s50),AT(1104,1000),USE(SOC:DIRECCION_LABORAL)
                         STRING(@s30),AT(4313,1000),USE(SOC:TELEFONO_LABORAL)
                         STRING(@d17),AT(5615,1802),USE(SOC:FECHA_EGRESO),FONT('Arial',8,,FONT:bold,CHARSET:ANSI)
                         STRING('Fecha de Titulo:'),AT(31,2021),USE(?String39),TRN
                         LINE,AT(10,2229,6229,0),USE(?Line5),COLOR(COLOR:Black)
                         STRING('Libro:'),AT(10,2260),USE(?String41),TRN
                         STRING('Resolución:'),AT(3240,2260),USE(?String46),TRN
                         LINE,AT(10,1427,6229,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('Fecha de  Alta:'),AT(10,1490),USE(?String38),TRN
                         LINE,AT(42,1719,6208,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('Fecha de Egreso: '),AT(4573,1802),USE(?String44),TRN
                         STRING(@s50),AT(1406,1792,3146,198),USE(INS2:NOMBRE)
                         STRING('Título Expendido por :'),AT(10,1802),USE(?String45),TRN
                         STRING(@s50),AT(2344,760,2958,177),USE(SOC:EMAIL)
                         LINE,AT(10,948,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Dirección Laboral:'),AT(10,1000),USE(?String35),TRN
                         STRING('Teléfono Laboral:'),AT(3302,1000),USE(?String36),TRN
                         STRING('e-mail:'),AT(1875,760),USE(?String34),TRN
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         LINE,AT(10,0,7271,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,83),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,83),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,83),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
                     END

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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_ALTA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_ALTA',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisReport.AddSortOrder(SOC:PK_SOCIOS)
  ThisReport.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
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
    INIMgr.Update('IMPRIMIR_CERTIFICADO_ALTA',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:ACTA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:ACTA:2,RepGen:XML,TargetAttr:TagName,'SOC:ACTA:2')
  SELF.Attribute.Set(?SOC:ACTA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagName,'String49')
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagName,'String48')
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagName,'SOC:LIBRO')
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_TITULO')
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_NACIMIENTO')
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagName,'String33')
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagName,'LOC:CP')
  SELF.Attribute.Set(?LOC:CP,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'SOC:N_DOCUMENTO')
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP3:DESCRIPCION')
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO')
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_ALTA')
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION_LABORAL')
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO_LABORAL')
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_EGRESO')
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String41,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String41,RepGen:XML,TargetAttr:TagName,'String41')
  SELF.Attribute.Set(?String41,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagName,'String46')
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagName,'String44')
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagName,'INS2:NOMBRE')
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagName,'SOC:EMAIL')
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_ALTA','IMPRIMIR_CERTIFICADO_ALTA','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

